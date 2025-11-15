/**
 * Script to apply data quality fixes documented in data-quality-fixes.md
 *
 * This script reads groups from 04-data-quality/ and applies the following fixes:
 * 1. Name corrections (fix spelling/accents)
 * 2. Address fixes (correct phone-as-address issues)
 * 3. Location drops (remove outdated/unverifiable locations)
 * 4. Location updates (update addresses/schedules)
 * 5. Location additions (add new verified locations)
 * 6. Group splits (split Academias into regional groups)
 * 7. Group merges (combine duplicates)
 *
 * Outputs corrected data to 05-fixes-applied/ for re-geocoding
 */

import fs from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

interface Leader {
  title: string | null;
  nickname: string | null;
  name: string | null;
}

interface MainContact {
  name: string | null;
  email: string | null;
  phone: string | null;
}

interface Location {
  name: string | null;
  address: string;
  schedule: string | null;
  contactPerson: string | null;
  email: string | null;
  phone: string | null;
  rawText: string;
  geocodeMetadata?: any;
  geoJsonFeature?: any;
}

interface Group {
  name: string;
  website: string;
  leader: Leader;
  mainContact: MainContact;
  sources: any[];
  locations: Location[];
}

/**
 * Apply all data quality fixes to the groups
 */
async function applyFixes(inputDir: string, outputDir: string): Promise<void> {
  // Create output directory
  await fs.mkdir(outputDir, { recursive: true });

  // Read all batch files
  const files = await fs.readdir(inputDir);
  const batchFiles = files.filter((f) => f.startsWith('batch-') && f.endsWith('.json'));

  let totalGroupsProcessed = 0;
  const totalGroupsFixed = 0;
  const fixLog: string[] = [];

  // Track which duplicates we've already processed
  const processedDuplicates = new Set<string>();

  for (const file of batchFiles) {
    const filePath = path.join(inputDir, file);
    const content = await fs.readFile(filePath, 'utf-8');
    const groups: Group[] = JSON.parse(content);

    const fixedGroups: Group[] = [];

    for (const group of groups) {
      totalGroupsProcessed++;
      const fixed = applyGroupFixes(group, fixLog, processedDuplicates);

      // Skip if group was deleted as part of a merge/split
      if (fixed) {
        fixedGroups.push(fixed);
      }
    }

    // Add new groups created from splits
    const newGroups = createSplitGroups(groups, fixLog);
    fixedGroups.push(...newGroups);

    // Write fixed groups to output
    await fs.writeFile(path.join(outputDir, file), JSON.stringify(fixedGroups, null, 2));
  }

  // Write fix log
  await fs.writeFile(path.join(outputDir, 'fix-log.txt'), fixLog.join('\n'));

  console.log(`\n✅ Fixes applied:`);
  console.log(`   Total groups processed: ${totalGroupsProcessed}`);
  console.log(`   Groups with fixes: ${totalGroupsFixed}`);
  console.log(`   See ${outputDir}/fix-log.txt for details`);
}

/**
 * Apply fixes to individual group
 */
function applyGroupFixes(group: Group, log: string[], processedDuplicates: Set<string>): Group | null {
  const website = group.website;
  const name = group.name;

  // FIX #1: Grupo Negaça Capoeira
  if (website === 'http://www.capoeiracambridge.co.uk/' && name.includes('Negaca')) {
    log.push(`\nFIX #1: Grupo Negaça Capoeira`);
    group.name = 'Grupo Negaça Capoeira';
    log.push(`  ✓ Fixed name: "Grupo Negaca Capoeira" → "Grupo Negaça Capoeira"`);

    // Fix Stapleford location
    const staplefordIdx = group.locations.findIndex(
      (loc) => loc.address.includes('Stapleford') || loc.address.includes('CB22 5BQ')
    );
    if (staplefordIdx !== -1) {
      group.locations[staplefordIdx].address = '69 Gog Magog Way, Cambridge CB22 5BQ';
      // Clear geocoding data so it gets re-geocoded
      delete group.locations[staplefordIdx].geocodeMetadata;
      delete group.locations[staplefordIdx].geoJsonFeature;
      log.push(`  ✓ Fixed Stapleford address for re-geocoding`);
    }

    return group;
  }

  // FIX #2: Mundo Capoeira Ireland
  if (website === 'http://www.capoeiraireland.com/') {
    log.push(`\nFIX #2: Mundo Capoeira Ireland`);

    // Drop outdated locations
    const locationsToKeep = ['Charlemont'];
    group.locations = group.locations.filter((loc) => {
      const keep = locationsToKeep.some((keyword) => loc.address.includes(keyword) || loc.name?.includes(keyword));
      if (!keep) {
        log.push(`  ✗ Dropped location: ${loc.address}`);
      }
      return keep;
    });

    // Update Charlemont location
    const charlemontIdx = group.locations.findIndex((loc) => loc.address.includes('Charlemont'));
    if (charlemontIdx !== -1) {
      group.locations[charlemontIdx].address =
        "Core 3, St Kevins, French Mullen House, Charlemont St, Saint Kevin's, Dublin 2, D02 Y993";
      group.locations[charlemontIdx].schedule =
        'Tue 7:00pm-9:00pm; Sat 10:45am-11:45am (Kids); Sat 11:45am-1:15pm (Adults)';
      delete group.locations[charlemontIdx].geocodeMetadata;
      delete group.locations[charlemontIdx].geoJsonFeature;
      log.push(`  ✓ Updated Charlemont location`);
    }

    // Add new locations
    const newLocations: Partial<Location>[] = [
      {
        name: 'ALSAA Sports Centre',
        address: 'Old Airport Rd, Toberbunny, Co. Dublin, K67 YV06',
        schedule: 'Mon 6:00pm-7:00pm (Kids); Mon 7:00pm-8:00pm (Adults)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText:
          'ALSAA Sports Centre\nOld Airport Rd, Toberbunny, Co. Dublin, K67 YV06\nMon 6:00pm-7:00pm (Kids); Mon 7:00pm-8:00pm (Adults)',
      },
      {
        name: 'IMAAL HALL',
        address: '1, Upper Stephen St., Dunlavin Upper, Dunlavin, West Wicklow, Co. Wicklow W91N8H7',
        schedule: 'Tue 4:00pm-5:00pm (Kids & Adults)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText:
          'IMAAL HALL\n1, Upper Stephen St., Dunlavin Upper, Dunlavin, West Wicklow, Co. Wicklow W91N8H7\nTue 4:00pm-5:00pm (Kids & Adults)',
      },
      {
        name: 'SPOTLIGHT STUDIOS "The Anchorage"',
        address: 'North Quay, Wicklow, A67 XR58',
        schedule: 'Wed 6:30pm-7:30pm (Kids); Wed 7:30pm-8:30pm (Adults)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText:
          'SPOTLIGHT STUDIOS "The Anchorage"\nNorth Quay, Wicklow, A67 XR58\nWed 6:30pm-7:30pm (Kids); Wed 7:30pm-8:30pm (Adults)',
      },
    ];

    group.locations.push(...(newLocations as Location[]));
    log.push(`  ✓ Added ${newLocations.length} new locations`);

    return group;
  }

  // FIX #3: Grupo Senzala North East
  if (website === 'http://www.groupsenzala.co.uk/' && name.includes('Senzela')) {
    log.push(`\nFIX #3: Grupo Senzala North East`);
    group.name = 'Grupo Senzala North East';
    log.push(`  ✓ Fixed name: "Grupo Senzela" → "Grupo Senzala North East"`);

    // Keep only Heaton location, drop Durham and Dance City
    const heatonLoc = group.locations.find((loc) => loc.address.includes('Heaton') || loc.address.includes('Trewhitt'));

    if (heatonLoc) {
      heatonLoc.schedule = 'Tue 7:00pm-8:30pm (with music practice 7:00pm-7:30pm)';
      group.locations = [heatonLoc];
      log.push(`  ✓ Kept Heaton location, updated schedule`);
      log.push(`  ✗ Dropped Durham and Dance City locations`);
    }

    // Add new locations
    const newLocations: Partial<Location>[] = [
      {
        name: 'Aria Art and Movement CIC',
        address: "St Mark's Church, Wentworth Terrace, Sunderland, SR4 7AD",
        schedule: 'Mon 7:30pm-8:30pm (Children 6+ and Adults)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText:
          "Aria Art and Movement CIC\nSt Mark's Church, Wentworth Terrace, Sunderland, SR4 7AD\nMon 7:30pm-8:30pm (Children 6+ and Adults)",
      },
      {
        name: 'Brancepeth Village Hall',
        address: 'The Village, Brancepeth, Durham, DH7 8DD',
        schedule: 'Sun 10:00am-11:00am (Kids); Sun 11:00am-12:00pm (All Levels)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText:
          'Brancepeth Village Hall\nThe Village, Brancepeth, Durham, DH7 8DD\nSun 10:00am-11:00am (Kids); Sun 11:00am-12:00pm (All Levels)',
      },
    ];

    group.locations.push(...(newLocations as Location[]));
    log.push(`  ✓ Added ${newLocations.length} new locations`);

    return group;
  }

  // FIX #4: Centro Cultural Senzala London
  if (website === 'http://senzala-london.co.uk') {
    log.push(`\nFIX #4: Centro Cultural Senzala London`);
    group.name = 'Centro Cultural Senzala London';
    log.push(`  ✓ Fixed name: "Group Senzala" → "Centro Cultural Senzala London"`);

    // Drop all old locations
    group.locations = [];
    log.push(`  ✗ Dropped all outdated locations (Hertfordshire and old London)`);

    // Add all new London locations
    const newLocations: Partial<Location>[] = [
      {
        name: 'National Audit Office (Victoria)',
        address: '157-197 Buckingham Palace Road, London, SW1W 9SP',
        schedule: 'Mon 5:30pm (Mixed); Wed 5:30pm (Mixed)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText:
          'National Audit Office (Victoria)\n157-197 Buckingham Palace Road, London, SW1W 9SP\nMon 5:30pm (Mixed); Wed 5:30pm (Mixed)',
      },
      {
        name: 'Artizan Community Centre (Liverpool Street)',
        address: '1 Artizan St, London, E1 7AF',
        schedule: 'Mon 7:15pm-8:15pm (Mixed)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText: 'Artizan Community Centre (Liverpool Street)\n1 Artizan St, London, E1 7AF\nMon 7:15pm-8:15pm (Mixed)',
      },
      {
        name: 'And Soul Sanctuary (Shoreditch)',
        address: '114 Cheshire Street, London, E2 6EJ',
        schedule: 'Tue 12pm-1pm (Beginners); Sun 12:30pm-1:30pm (Beginners)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText:
          'And Soul Sanctuary (Shoreditch)\n114 Cheshire Street, London, E2 6EJ\nTue 12pm-1pm (Beginners); Sun 12:30pm-1:30pm (Beginners)',
      },
      {
        name: 'The Upper Room (Camden)',
        address: '8 Greenland Street, London, NW1 0ND',
        schedule: 'Tue 7pm-8:30pm (Mixed); Sat 1:30pm-3pm (Mixed)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText:
          'The Upper Room (Camden)\n8 Greenland Street, London, NW1 0ND\nTue 7pm-8:30pm (Mixed); Sat 1:30pm-3pm (Mixed)',
      },
      {
        name: 'Cecil Sharp House (Camden)',
        address: "2 Regent's Park Road, London, NW1 7AY",
        schedule: 'Thu 6:30pm-7:30pm (Beginners); Thu 7:30pm-9:30pm (Mixed)',
        contactPerson: null,
        email: null,
        phone: null,
        rawText:
          "Cecil Sharp House (Camden)\n2 Regent's Park Road, London, NW1 7AY\nThu 6:30pm-7:30pm (Beginners); Thu 7:30pm-9:30pm (Mixed)",
      },
    ];

    group.locations = newLocations as Location[];
    log.push(`  ✓ Added ${newLocations.length} new London locations`);

    return group;
  }

  // FIX #5: Capoeira Science
  if (website === 'http://www.capoeirascience.co.uk/') {
    log.push(`\nFIX #5: Capoeira Science`);

    // Fix main contact phone
    if (group.mainContact.phone === '283-291') {
      group.mainContact.phone = '07853611496';
      log.push(`  ✓ Fixed main contact phone: "283-291" → "07853611496"`);
    }

    // Keep only Wandsworth Road location
    const wandsworthLoc = group.locations.find(
      (loc) => loc.address.includes('Wandsworth Road') || loc.address.includes('283-291')
    );

    if (wandsworthLoc) {
      group.locations = [wandsworthLoc];
      log.push(`  ✓ Kept Wandsworth Road location`);
      log.push(`  ✗ Dropped duplicate Surrey location`);
    }

    return group;
  }

  // FIX #6: Beira-Mar Capoeira - DELETE (will be split into 4 groups)
  if (website === 'http://www.gbantu.com' && name === 'Beira-Mar Capoeira') {
    log.push(`\nFIX #6: Beira-Mar Capoeira`);
    log.push(`  ✗ Deleted (will be split into 4 regional groups)`);
    return null; // Delete this group
  }

  // FIX #7: Capoeira IJEXÁ - Merge duplicates
  if (website.includes('capoeiraijexa.com') || website.includes('ijexa.com')) {
    const duplicateKey = 'IJEXA_MERGE';

    // Only process the first occurrence, delete the rest
    if (processedDuplicates.has(duplicateKey)) {
      log.push(`\nFIX #7: Capoeira IJEXÁ - Deleting duplicate`);
      return null; // Delete this duplicate
    }

    processedDuplicates.add(duplicateKey);
    log.push(`\nFIX #7: Capoeira IJEXÁ`);

    // Use the canonical form
    group.name = 'Capoeira IJEXÁ';
    group.website = 'http://www.capoeiraijexa.com';

    // Update leader
    group.leader = {
      title: 'mestre',
      nickname: 'Urubu Malandro',
      name: null,
    };

    // Update main contact
    group.mainContact = {
      name: null,
      email: 'info@capoeiraijexa.com',
      phone: '(415) 506-9624',
    };

    // Drop all old locations
    group.locations = [];
    log.push(`  ✗ Dropped all outdated locations`);

    // Add new locations
    const newLocations: Partial<Location>[] = [
      {
        name: 'Smuin Center, San Francisco',
        address: '1830 17th St., San Francisco, California',
        schedule: 'Wed 7pm',
        contactPerson: 'Mestre Urubu Malandro',
        email: 'urubumalandro@gmail.com',
        phone: '(415) 506-9624',
        rawText:
          'Smuin Center, San Francisco\n1830 17th St., San Francisco, California\nWed 7pm\nMestre Urubu Malandro\n(415) 506-9624',
      },
      {
        name: 'Circus Center, San Francisco',
        address: '755 Frederick St., San Francisco, California',
        schedule: 'Fri 5:30pm (5th-12th grade)',
        contactPerson: 'Professor Chumbinho',
        email: 'jarrelp@gmail.com',
        phone: '(415) 350-2222',
        rawText:
          'Circus Center, San Francisco\n755 Frederick St., San Francisco, California\nFri 5:30pm (5th-12th grade)\nProfessor Chumbinho\n(415) 350-2222',
      },
      {
        name: 'Raul Castillo Martial Arts Academy, Half Moon Bay',
        address: 'Half Moon Bay, California',
        schedule: 'Wed 7pm',
        contactPerson: 'Contramestre Montanha',
        email: 'rgmolyneaux@gmail.com',
        phone: '(650) 483-7743',
        rawText:
          'Raul Castillo Martial Arts Academy, Half Moon Bay\nHalf Moon Bay, California\nWed 7pm\nContramestre Montanha\n(650) 483-7743\nNOTE: Need to search for full address',
      },
      {
        name: 'Thrive Jiu Jitsu, Pacifica',
        address: 'Pacifica, California',
        schedule: 'Mon 6:30pm',
        contactPerson: 'Contramestre Montanha',
        email: 'rgmolyneaux@gmail.com',
        phone: '(650) 483-7743',
        rawText:
          'Thrive Jiu Jitsu, Pacifica\nPacifica, California\nMon 6:30pm\nContramestre Montanha\n(650) 483-7743\nNOTE: Need to search for full address',
      },
    ];

    group.locations = newLocations as Location[];
    log.push(`  ✓ Merged duplicates, updated leader and contact info`);
    log.push(`  ✓ Added ${newLocations.length} new Bay Area locations`);

    return group;
  }

  // FIX #8: Motumbaxé Capoeira
  if (website === 'http://www.motumbaxecapoeira.com') {
    log.push(`\nFIX #8: Motumbaxé Capoeira`);

    // Keep only Brooklyn location
    const brooklynLoc = group.locations.find(
      (loc) => loc.address.includes('76 Nevins') || loc.address.includes('Brooklyn')
    );

    if (brooklynLoc) {
      group.locations = [brooklynLoc];
      log.push(`  ✓ Kept Brooklyn location (76 Nevins St)`);
      log.push(`  ✗ Dropped 3 outdated locations (CT and VA)`);
    }

    return group;
  }

  // FIX #9: Vai Capoeira
  if (website === 'https://www.vaicapoeira.org') {
    log.push(`\nFIX #9: Vai Capoeira`);

    // Fix phone-as-address location
    const phoneAsAddressIdx = group.locations.findIndex((loc) => loc.address.includes('646.379.4468'));

    if (phoneAsAddressIdx !== -1) {
      group.locations[phoneAsAddressIdx].address = 'Lincoln Terrace Park, Crown Heights, Brooklyn, NY';
      delete group.locations[phoneAsAddressIdx].geocodeMetadata;
      delete group.locations[phoneAsAddressIdx].geoJsonFeature;
      log.push(`  ✓ Fixed phone-as-address: "646.379.4468" → "Lincoln Terrace Park, Crown Heights, Brooklyn, NY"`);
    }

    return group;
  }

  // FIX #10: Carioca Capoeira - DELETE (will be split into 3 groups)
  if (website === 'http://www.cariocacapoeira.com' && name === 'Carioca Capoeira') {
    log.push(`\nFIX #10: Carioca Capoeira`);
    log.push(`  ✗ Deleted (will be split into 3 regional groups)`);
    return null; // Delete this group
  }

  return group;
}

/**
 * Create new groups from splits (Beira-Mar and Carioca)
 */
function createSplitGroups(originalGroups: Group[], log: string[]): Group[] {
  const newGroups: Group[] = [];

  // Check if we have Beira-Mar to split
  const beiraMarGroup = originalGroups.find(
    (g) => g.website === 'http://www.gbantu.com' && g.name === 'Beira-Mar Capoeira'
  );

  if (beiraMarGroup) {
    log.push(`\nCREATING BEIRA-MAR SPLIT GROUPS:`);

    // Group A: Florida
    newGroups.push({
      name: 'Beira-Mar Capoeira Florida',
      website: 'http://www.gbantu.com',
      leader: {
        title: 'contra-mestre',
        nickname: 'Bundo',
        name: null,
      },
      mainContact: beiraMarGroup.mainContact,
      sources: beiraMarGroup.sources,
      locations: [
        {
          name: 'Peak Physiques, Jacksonville, FL',
          address: '11048 Baymeadows Rd Unit 4, Jacksonville, FL',
          schedule: 'Mon/Wed/Fri 6:00-7:00 PM (Kids); Mon/Wed/Fri 7:00-8:00 PM (Adults)',
          contactPerson: 'Contra-Mestre Bundo',
          email: null,
          phone: null,
          rawText:
            'Peak Physiques, Jacksonville, FL\n11048 Baymeadows Rd Unit 4, Jacksonville, FL\nMon/Wed/Fri 6:00-7:00 PM (Kids); Mon/Wed/Fri 7:00-8:00 PM (Adults)',
        },
        {
          name: 'J Renaissance 4:13 Boxing & Fitness, Jacksonville, FL',
          address: '8802 Corporate Square Ct Suite 404, Jacksonville, FL',
          schedule: 'Sat 10:15-11:00 AM (Kids, Adults welcomed)',
          contactPerson: 'Contra-Mestre Bundo',
          email: null,
          phone: null,
          rawText:
            'J Renaissance 4:13 Boxing & Fitness, Jacksonville, FL\n8802 Corporate Square Ct Suite 404, Jacksonville, FL\nSat 10:15-11:00 AM (Kids, Adults welcomed)',
        },
      ],
    });
    log.push(`  ✓ Created "Beira-Mar Capoeira Florida" (2 locations)`);

    // Group B: Kentucky (keep existing locations)
    const kentuckyLocations = beiraMarGroup.locations.map((loc) => ({ ...loc }));
    newGroups.push({
      name: 'Beira-Mar Capoeira Kentucky',
      website: 'http://www.gbantu.com',
      leader: {
        title: null,
        nickname: 'Gafanhoto',
        name: 'Stan Marshall',
      },
      mainContact: {
        name: null,
        email: beiraMarGroup.mainContact.email,
        phone: '[502] 229-9182',
      },
      sources: beiraMarGroup.sources,
      locations: kentuckyLocations,
    });
    log.push(`  ✓ Created "Beira-Mar Capoeira Kentucky" (${kentuckyLocations.length} locations)`);

    // Group C: Colorado
    newGroups.push({
      name: 'Beira-Mar Capoeira Colorado',
      website: 'http://www.gbantu.com',
      leader: {
        title: null,
        nickname: 'Perna de Pau',
        name: 'Tim Roberts',
      },
      mainContact: beiraMarGroup.mainContact,
      sources: beiraMarGroup.sources,
      locations: [
        {
          name: 'Mountain Beast MMA & Fitness, Granby, CO',
          address: '62713 U.S. Highway 40, Granby, CO 80446',
          schedule: 'Wed/Fri 7:00-8:30 PM (Kids and Adults)',
          contactPerson: 'Perna de Pau (Tim Roberts)',
          email: null,
          phone: null,
          rawText:
            'Mountain Beast MMA & Fitness, Granby, CO\n62713 U.S. Highway 40, Granby, CO 80446\nWed/Fri 7:00-8:30 PM (Kids and Adults)',
        },
      ],
    });
    log.push(`  ✓ Created "Beira-Mar Capoeira Colorado" (1 location)`);

    // Group D: Daejeon
    newGroups.push({
      name: 'Beira-Mar Capoeira Daejeon',
      website: 'http://www.gbantu.com',
      leader: {
        title: null,
        nickname: 'Capitão',
        name: 'Carter Peyton',
      },
      mainContact: beiraMarGroup.mainContact,
      sources: beiraMarGroup.sources,
      locations: [
        {
          name: 'Wolpyeong Station, Daejeon, South Korea',
          address: 'Park across from Wolpyeong Station / Indoor if inclement weather, Daejeon, South Korea',
          schedule: 'Sun 6:00-7:00 PM',
          contactPerson: 'Capitão (Carter Peyton)',
          email: null,
          phone: null,
          rawText:
            'Wolpyeong Station, Daejeon, South Korea\nPark across from Wolpyeong Station / Indoor if inclement weather, Daejeon, South Korea\nSun 6:00-7:00 PM',
        },
      ],
    });
    log.push(`  ✓ Created "Beira-Mar Capoeira Daejeon" (1 location)`);
  }

  // Check if we have Carioca to split
  const cariocaGroup = originalGroups.find(
    (g) => g.website === 'http://www.cariocacapoeira.com' && g.name === 'Carioca Capoeira'
  );

  if (cariocaGroup) {
    log.push(`\nCREATING CARIOCA SPLIT GROUPS:`);

    // Group A: NYC
    const nycLocations = cariocaGroup.locations.filter(
      (loc) => loc.address.includes('445 East 69th') || loc.address.includes('41-20 Queens Boulevard')
    );

    newGroups.push({
      name: 'Carioca Capoeira (New York City)',
      website: 'http://www.cariocacapoeira.com',
      leader: {
        title: 'mestre',
        nickname: 'Carioca',
        name: 'Carlos da Silva Borge',
      },
      mainContact: {
        name: null,
        email: 'cariocanyc@yahoo.com',
        phone: '718-309-7605',
      },
      sources: cariocaGroup.sources,
      locations: nycLocations.map((loc) => {
        // Update schedules based on fresh website data
        if (loc.address.includes('445 East 69th')) {
          return {
            ...loc,
            schedule: 'Tue 7-9pm; Sat 12-2pm',
          };
        } else if (loc.address.includes('41-20 Queens Boulevard')) {
          return {
            ...loc,
            schedule: 'Fri 7:30-9pm',
          };
        }
        return loc;
      }),
    });
    log.push(`  ✓ Created "Carioca Capoeira (New York City)" (${nycLocations.length} locations)`);

    // Group B: Charleston
    newGroups.push({
      name: 'Carioca Capoeira (Charleston)',
      website: 'https://capoeiracharleston.com/',
      leader: {
        title: null,
        nickname: null,
        name: null,
      },
      mainContact: {
        name: null,
        email: null,
        phone: null,
      },
      sources: cariocaGroup.sources,
      locations: [
        {
          name: 'Arthur Christopher Community Center',
          address: 'Downtown Charleston, SC',
          schedule: 'Tue & Thu 6:30pm',
          contactPerson: null,
          email: null,
          phone: null,
          rawText:
            'Arthur Christopher Community Center\nDowntown Charleston, SC\nTue & Thu 6:30pm\nNOTE: Need to search for full address',
        },
        {
          name: 'Hampton Park Gazebo',
          address: 'Hampton Park, Charleston, SC',
          schedule: 'Sat 10:30am',
          contactPerson: null,
          email: null,
          phone: null,
          rawText:
            'Hampton Park Gazebo\nHampton Park, Charleston, SC\nSat 10:30am\nNOTE: Need to search for full address',
        },
      ],
    });
    log.push(`  ✓ Created "Carioca Capoeira (Charleston)" (2 locations)`);

    // Group C: Miami
    newGroups.push({
      name: 'Carioca Capoeira (Miami)',
      website: 'https://oceanlifestudios.com/our-classes/capoeira-miami-beach/',
      leader: {
        title: null,
        nickname: null,
        name: null,
      },
      mainContact: {
        name: null,
        email: null,
        phone: null,
      },
      sources: cariocaGroup.sources,
      locations: [
        {
          name: 'Ocean Life Studio',
          address: '7123 N Miami Avenue, Miami, FL 33150',
          schedule: null,
          contactPerson: null,
          email: null,
          phone: null,
          rawText: 'Ocean Life Studio\n7123 N Miami Avenue, Miami, FL 33150\nNOTE: Check website for schedule',
        },
      ],
    });
    log.push(`  ✓ Created "Carioca Capoeira (Miami)" (1 location)`);
  }

  return newGroups;
}

// Run the script
const inputDir = path.join(__dirname, '../out/04-data-quality');
const outputDir = path.join(__dirname, '../out/05-fixes-applied');

applyFixes(inputDir, outputDir)
  .then(() => {
    console.log('\n✅ All fixes applied successfully!');
    console.log(`\nNext steps:`);
    console.log(`1. Review ${outputDir}/fix-log.txt`);
    console.log(
      `2. Re-run geocoding: pnpm tsx scripts/03-geocode-locations.ts --input 05-fixes-applied --output 06-final`
    );
    console.log(`3. Generate SQL import from 06-final data`);
  })
  .catch((error) => {
    console.error('❌ Error applying fixes:', error);
    process.exit(1);
  });
