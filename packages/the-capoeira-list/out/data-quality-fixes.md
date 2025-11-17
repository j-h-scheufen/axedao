# Data Quality Fixes Tracking

This document tracks data quality issues found during manual review and what actions to take.

## Fix Types
- **NAME_FIX**: Correct spelling/accent in group name
- **ADDRESS_FIX**: Extract correct address from rawText or correct geocoding
- **DROP_LOCATION**: Remove location that can't be verified
- **RE_GEOCODE**: Re-run geocoding with corrected address

---

## 1. Grupo Negaça Capoeira
**Website**: http://www.capoeiracambridge.co.uk/

### Issues:
- **NAME_FIX**: "Grupo Negaca Capoeira" → "Grupo Negaça Capoeira" (add accent)
- **ADDRESS_FIX**: Stapleford location geocoded to wrong area (Nottinghamshire instead of near Cambridge)
  - Current: Stapleford, CB22 5BQ, UK → Nottinghamshire (52.93, -1.27)
  - Should be: Near Cambridge (rawText shows "69 Gog Magog Way, Cambridge CB22 5BQ")
  - Action: **RE_GEOCODE** with full address from rawText

### Verified Locations (keep as-is):
- ✅ Arbury Community Centre - Campkin Rd, Cambridge, CB4 2LD
- ✅ 28th Scout Hut - Flamsteed Road, Cambridge, CB1 3QU (matches website)
- ✅ Golden Acre Community Centre - Long Horse Croft, Saffron Walden, CB11 4BL

### Website mentions but not found in data:
- GRANTA PARK - **DROP_LOCATION** (no specific address found)
- CAMBOURNE - **DROP_LOCATION** (no specific address found)

### Actions:
1. Fix group name spelling (add ç accent)
2. Re-geocode Stapleford location with full address: "69 Gog Magog Way, Cambridge CB22 5BQ"

---

## 2. Mundo Capoeira Ireland
**Website**: http://www.capoeiraireland.com/

### Issues:
- **DUPLICATE_GROUP**: Two separate groups exist with same website (should be merged):
  1. "Mundo Capoeira Ireland" (batch-02.json) - 3 locations
  2. "Mundo Capoeira Ireland - Athlone" (batch-05.json) - 1 location
- **OUTDATED_DATA**: Current data from 12/31/19, fresh website data shows different locations
- **ADDRESS_FIX**: Charlemont location needs full address update

### Current Data (OLD - from 12/31/19):
1. ❌ **DROP**: Byrne Hall - Synge Street, Dublin 8 (no longer on website)
2. ⚠️ **UPDATE**: Charlemont Community Resource Centre - Charlemont Street, Dublin 2
   - Current address: "Charlemont Street, Dublin 2, Ireland"
   - New address: "Core 3, St Kevins, French Mullen House, Charlemont St, Saint Kevin's, Dublin 2, D02 Y993"
   - Update schedule: "Sat 12:00-2:00pm" → "Tue 7:00pm-9:00pm; Sat 10:45am-11:45am (Kids); Sat 11:45am-1:15pm (Adults)"
3. ❌ **DROP**: Swan Leisure - Rathmines Square (no longer on website)
4. ❌ **DROP**: Monksland Community Centre - Athlone (no longer on website)

### New Locations (ADD - from fresh website data):
1. ✅ **ADD**: ALSAA Sports Centre
   - Address: Old Airport Rd, Toberbunny, Co. Dublin, K67 YV06
   - Schedule: Mon 6:00pm-7:00pm (Kids); Mon 7:00pm-8:00pm (Adults)

2. ✅ **ADD**: IMAAL HALL
   - Address: 1, Upper Stephen St., Dunlavin Upper, Dunlavin, West Wicklow, Co. Wicklow W91N8H7
   - Schedule: Tue 4:00pm-5:00pm (Kids & Adults)

3. ✅ **ADD**: SPOTLIGHT STUDIOS "The Anchorage"
   - Address: North Quay, Wicklow, A67 XR58
   - Schedule: Wed 6:30pm-7:30pm (Kids); Wed 7:30pm-8:30pm (Adults)

### Actions:
1. Merge "Mundo Capoeira Ireland - Athlone" into "Mundo Capoeira Ireland" (same website/leader)
2. Drop 3 outdated locations (Byrne Hall, Swan Leisure, Monksland)
3. Update Charlemont location with full address and new schedule
4. Add 3 new locations (ALSAA, IMAAL HALL, SPOTLIGHT STUDIOS) with full addresses and schedules
5. **RE_GEOCODE** all 4 locations with new/updated addresses

---

## 3. Grupo Senzala North East
**Website**: http://www.groupsenzala.co.uk/

### Issues:
- **NAME_FIX**: "Grupo Senzela" → "Grupo Senzala North East" (spelling + clarification)
- **OUTDATED_DATA**: Current data has 3 locations, website shows 3 different locations

### Current Data (OLD):
1. ❌ **DROP**: Vane Tempest Hall - Maynard's Row Gilesgate Durham DH1 1QF (no longer on website)
2. ⚠️ **UPDATE**: Heaton Community Centre - Trewhitt Road, Heaton, Newcastle Upon Tyne NE6 5DY
   - Current schedule: "Tues 7:00-9:30pm"
   - New schedule: "Tue 7:00pm-8:30pm (with music practice 7:00pm-7:30pm)"
3. ❌ **DROP**: Dance City - Temple Street, Newcastle Upon Tyne, NE1 4BR (no longer on website)

### New Locations (ADD - from fresh website data):
1. ✅ **ADD**: Aria Art and Movement CIC
   - Full Address: St Mark's Church, Wentworth Terrace, Sunderland, SR4 7AD
   - Schedule: Mon 7:30pm-8:30pm (Children 6+ and Adults)

2. ✅ **ADD**: Brancepeth Village Hall
   - Full Address: The Village, Brancepeth, Durham, DH7 8DD
   - Schedule: Sun 10:00am-11:00am (Kids); Sun 11:00am-12:00pm (All Levels)

### Actions:
1. Fix group name: "Grupo Senzela" → "Grupo Senzala North East"
2. Drop 2 outdated locations (Vane Tempest Hall, Dance City)
3. Update Heaton Community Centre schedule
4. Add 2 new locations (Aria Art and Movement CIC, Brancepeth Village Hall)
5. **RE_GEOCODE** the 2 new locations

---

## 4. Centro Cultural Senzala London
**Website**: http://senzala-london.co.uk

### Issues:
- **NAME_FIX**: "Group Senzala" → "Centro Cultural Senzala London"
- **OUTDATED_DATA**: Current data from 2/4/20, all locations are outdated
- **WRONG_GEOCODE**: Artizan location geocoded to wrong address (Drummond Crescent instead of Artizan St)
- **LOCATION_FOCUS_CHANGE**: Old data had Hertfordshire locations, new data is all London

### Current Data (OLD - from 2/4/20):
1. ❌ **DROP**: Fitness First - St Albans, AL3 5DQ (no longer on website, outside London)
2. ❌ **DROP**: Hatfield University - de Havilland Campus, Hatfield, AL10 9EU (no longer on website, outside London)
3. ❌ **DROP**: Hutton Hall - College Lane, Hatfield, AL10 9AB (no longer on website, outside London)
4. ❌ **DROP**: Artizan Community Centre - 1 Drummond Crescent, London, NW1 1LY (wrong geocoding, outdated schedule)
   - Note: rawText mentions correct address "1 Artizan St, Spitalfields, London E1 7AF" but was geocoded incorrectly

### New Locations (ADD - from fresh website data):
1. ✅ **ADD**: National Audit Office (Victoria)
   - Address: 157-197 Buckingham Palace Road, London, SW1W 9SP
   - Schedule: Mon 5:30pm (Mixed); Wed 5:30pm (Mixed)

2. ✅ **ADD**: Artizan Community Centre (Liverpool Street)
   - Address: 1 Artizan St, London, E1 7AF
   - Schedule: Mon 7:15pm-8:15pm (Mixed)

3. ✅ **ADD**: And Soul Sanctuary (Shoreditch)
   - Address: 114 Cheshire Street, London, E2 6EJ
   - Schedule: Tue 12pm-1pm (Beginners); Sun 12:30pm-1:30pm (Beginners)

4. ✅ **ADD**: The Upper Room (Camden)
   - Address: 8 Greenland Street, London, NW1 0ND
   - Schedule: Tue 7pm-8:30pm (Mixed); Sat 1:30pm-3pm (Mixed)

5. ✅ **ADD**: Cecil Sharp House (Camden)
   - Address: 2 Regent's Park Road, London, NW1 7AY
   - Schedule: Thu 6:30pm-7:30pm (Beginners); Thu 7:30pm-9:30pm (Mixed)

### Actions:
1. Fix group name: "Group Senzala" → "Centro Cultural Senzala London"
2. Drop all 4 outdated locations
3. Add 5 new London locations with full addresses and schedules
4. **RE_GEOCODE** all 5 new locations

---

## 5. Capoeira Science
**Website**: http://www.capoeirascience.co.uk/

### Issues:
- **PHONE_ERROR**: Main contact phone "283-291" extracted incorrectly from street address
- **DUPLICATE_LOCATION**: Two location records both point to same Wandsworth Road address
- **VAGUE_LOCATIONS**: Website only mentions general areas, no specific addresses for North London or West Croydon

### Current Data (OLD - from 2/28/2020):
1. ✅ **KEEP**: Wandsworth Road - 283-291 Wandsworth Road, London (SW8 3JE)
   - This is the "South-West London" location mentioned on website
   - Geocoded correctly (Vauxhall/Stockwell area)

2. ❌ **DROP**: Surrey location (duplicate)
   - Same Wandsworth Road address, mislabeled as separate location

### Fresh Website Data:
- Locations mentioned: "South-West London, North London, West Croydon (Private classes only)"
- Email: info@capoeirascience.co.uk ✅ (matches)
- Phone: 07853611496 ❌ (current data has incorrect "283-291" from address parsing)

### Analysis:
- **South-West London** = Wandsworth Road location ✅ MATCHES
- **North London** = No specific address on website, cannot add
- **West Croydon (Private)** = No specific address on website, private classes only, cannot add

### Actions:
1. Fix main contact phone: "283-291" → "07853611496"
2. Drop duplicate "Surrey location" record
3. Keep only the Wandsworth Road location (the only verifiable address)
4. Note: North London and West Croydon locations cannot be added without specific addresses

---

## 6. Beira-Mar Capoeira → SPLIT INTO 4 REGIONAL GROUPS
**Website**: http://www.gbantu.com

### Issues:
- **ORGANIZATION_STRUCTURE**: This is an Academia with regional branches led by different teachers
- **DATA_MODEL_LIMITATION**: Current data model doesn't support Academia concept
- **INCORRECT_GROUPING**: All locations grouped under one leader (Gafanhoto), but Florida is led by Contra-Mestre Bundo

### Current Data (OLD):
**Single Group**: "Beira-Mar Capoeira"
- Leader: Gafanhoto (Stan Marshall) - Actually only leads Kentucky
- 2 locations (both Kentucky):
  1. Freestyle Fitness - Louisville, KY ✅ (matches website)
  2. Eastern Kentucky University - Richmond, KY ✅ (matches website)

### Fresh Website Data Shows 4 Regional Branches:

#### **Group A: Beira-Mar Capoeira Florida**
- Leader: Contra-Mestre Bundo (title: "contra-mestre", nickname: "Bundo")
- Website: http://www.gbantu.com
- Note: "United States Capoeira Beira-Mar Headquarters"

**Locations (2):**
1. Peak Physiques, Jacksonville, FL
   - Address: 11048 Baymeadows Rd Unit 4, Jacksonville, FL
   - Schedule: Mon/Wed/Fri 6:00-7:00 PM (Kids); Mon/Wed/Fri 7:00-8:00 PM (Adults)

2. J Renaissance 4:13 Boxing & Fitness, Jacksonville, FL
   - Address: 8802 Corporate Square Ct Suite 404, Jacksonville, FL
   - Schedule: Sat 10:15-11:00 AM (Kids, Adults welcomed)

#### **Group B: Beira-Mar Capoeira Kentucky**
- Leader: Gafanhoto (Stan Marshall) (title: null, nickname: "Gafanhoto", name: "Stan Marshall")
- Website: http://www.gbantu.com
- Main Contact Phone: [502] 229-9182

**Locations (2):**
1. Freestyle Fitness, Louisville, KY
   - Address: 1860 Mellwood Ave # 277, Louisville, KY 40206 ✅ (already in data)
   - Teacher: Gafanhoto (Stan Marshall)
   - Schedule: Tue/Thu 8:00-10:00 PM (Kids and Adults)

2. Eastern Kentucky University, Richmond, KY
   - Address: Begley Stadium Rm 113 off Lancaster Ave., Richmond, KY ✅ (already in data)
   - Teacher: Jaco (Jacob Woosley)
   - Schedule: Mon 6:00-8:45 PM (Students and Adults)
   - Note: Please inquire about training outside of campus semesters

#### **Group C: Beira-Mar Capoeira Colorado**
- Leader: Perna de Pau (Tim Roberts) (title: null, nickname: "Perna de Pau", name: "Tim Roberts")
- Website: http://www.gbantu.com
- Note: "Newly established in Grand County / Winter Park area"

**Locations (1):**
1. Mountain Beast MMA & Fitness, Granby, CO
   - Address: 62713 U.S. Highway 40, Granby, CO 80446
   - Schedule: Wed/Fri 7:00-8:30 PM (Kids and Adults)

#### **Group D: Beira-Mar Capoeira Daejeon**
- Leader: Capitão (Carter Peyton) (title: null, nickname: "Capitão", name: "Carter Peyton")
- Website: http://www.gbantu.com
- Location: South Korea

**Locations (1):**
1. Wolpyeong Station, Daejeon, South Korea
   - Address: Park across from Wolpyeong Station / Indoor if inclement weather, Daejeon, South Korea
   - Schedule: Sun 6:00-7:00 PM

### Actions:
1. **DELETE** the current single "Beira-Mar Capoeira" group
2. **CREATE** 4 new regional groups:
   - "Beira-Mar Capoeira Florida" (Contra-Mestre Bundo) - 2 locations
   - "Beira-Mar Capoeira Kentucky" (Gafanhoto) - 2 locations
   - "Beira-Mar Capoeira Colorado" (Perna de Pau) - 1 location
   - "Beira-Mar Capoeira Daejeon" (Capitão) - 1 location
3. **RE_GEOCODE** 4 new Florida/Colorado/South Korea locations
4. **UPDATE** Kentucky locations with correct detailed addresses from website

---

## 7. Capoeira IJEXÁ → MERGE & UPDATE
**Website**: http://www.capoeiraijexa.com / https://www.ijexa.com

### Issues:
- **DUPLICATE_GROUPS**: 3 separate groups exist with same website/leader
  1. "Placer and El Dorado Counties" (capoeiraijexa.com) - Placerville
  2. "Capoeira IJEXÁ" (capoeiraijexa.com) - Sacramento
  3. "Capoeira IJEXÁ" (ijexa.com) - San Francisco
- **OUTDATED_DATA**: All locations from 2017, no longer on current website
- **PHONE_ERROR**: Phone "2095" extracted from street address (2095 Harrison St)

### Current Data (OLD - from 7/17/17 and 7/31/17):
1. ❌ **DROP**: Gold Country Martial Arts Center - Placerville, CA (no longer on website)
2. ❌ **DROP**: Brazilian Center - 2420 N St, Sacramento, CA (no longer on website)
3. ❌ **DROP**: Harrison Street / Project Commotion - 2095 Harrison St, San Francisco (no longer on website)

### Fresh Website Data (NEW - from https://www.ijexa.com):
**Leader**: Mestre Urubu Malandro (title: "mestre", nickname: "Urubu Malandro")
**Main Contact**: info@capoeiraijexa.com, (415) 506-9624

**Locations (4):**
1. ✅ **ADD**: Smuin Center, San Francisco
   - Teacher: Mestre Urubu Malandro
   - Address: 1830 17th St., San Francisco, California
   - Schedule: Wed 7pm
   - Phone: (415) 506-9624
   - Email: urubumalandro@gmail.com

2. ✅ **ADD**: Circus Center, San Francisco
   - Teacher: Professor Chumbinho
   - Address: 755 Frederick St., San Francisco, California
   - Schedule: Fri 5:30pm (5th-12th grade)
   - Phone: (415) 350-2222
   - Email: jarrelp@gmail.com

3. ✅ **ADD**: Raul Castillo Martial Arts Academy, Half Moon Bay
   - Teacher: Contramestre Montanha
   - Address: Half Moon Bay, California (need to search for full address)
   - Schedule: Wed 7pm
   - Phone: (650) 483-7743
   - Email: rgmolyneaux@gmail.com

4. ✅ **ADD**: Thrive Jiu Jitsu, Pacifica
   - Teacher: Contramestre Montanha
   - Address: Pacifica, California (need to search for "Thrive Jiu Jitsu Pacifica" full address)
   - Schedule: Mon 6:30pm
   - Phone: (650) 483-7743
   - Email: rgmolyneaux@gmail.com

### Actions:
1. **MERGE** 3 duplicate groups into single "Capoeira IJEXÁ"
2. Update leader to Mestre Urubu Malandro
3. Update main contact: email info@capoeiraijexa.com, phone (415) 506-9624
4. Drop all 3 outdated locations (Placerville, Sacramento, Harrison St SF)
5. Add 4 new Bay Area locations
6. **SEARCH** for full addresses: Raul Castillo Martial Arts (Half Moon Bay) and Thrive Jiu Jitsu (Pacifica)
7. **RE_GEOCODE** all 4 new locations

---

## 8. Motumbaxé Capoeira
**Website**: http://www.motumbaxecapoeira.com

### Issues:
- **OUTDATED_LOCATIONS**: 3 out of 4 locations no longer on current website
- **INCOMPLETE_INFO**: Website mentions "main location" but only provides one address

### Current Data (OLD - from 5/6/19):
1. ❌ **DROP**: Sudor Taino - 635 New Park Avenue, West Hartford, CT 06110 (no longer on website)
2. ❌ **DROP**: Studio8sixty - 224 Farmington Avenue, Hartford, CT 06105 (no longer on website)
3. ✅ **KEEP**: Nevins Street - 76 Nevins Street, Brooklyn, NY 11217 (matches website)
4. ❌ **DROP**: Pies Fitness Yoga Studio - 531 N. Howard St., Alexandria, VA 22304 (no longer on website)

### Fresh Website Data:
- Only verifiable address: **76 Nevins St, Brooklyn, NY 11217, USA** ✅
- Note: Website mentions "classes at main location" but doesn't provide other addresses

### Actions:
1. Drop 3 outdated locations (2 in Connecticut, 1 in Virginia)
2. Keep Brooklyn location (76 Nevins St) - already geocoded correctly
3. Note: Group will have 1 location (sufficient, owner can add more later)

---

## 9. Vai Capoeira
**Website**: https://www.vaicapoeira.org

### Issues:
- **PHONE_AS_ADDRESS**: Location 1 has phone number (646.379.4468) as address
- **WRONG_GEOCODE**: Phone geocoded to Czech Republic instead of Brooklyn
- **VAGUE_WEBSITE**: Website only says "various locations in Brooklyn and Manhattan" with phone number

### Current Data (OLD - from 4/19/19, after merge):
1. ⚠️ **FIX ADDRESS**: Lincoln Terrace Park location
   - Current address: "646.379.4468" ❌ (phone number)
   - Correct address from rawText: "Lincoln Terrace Park, Crown Heights, Brooklyn, NY"
   - Teachers: Kujo and Chupa Ashanti
   - Schedule: Thurs & Sat 6:00pm
   - Geocoded to Czech Republic ❌ (needs re-geocoding)

2. ✅ **KEEP**: Ripley Grier Studios
   - Address: 520 8th Ave, New York, NY ✅ (Manhattan)
   - Schedule: Mon & Wed 8:00pm
   - Geocoded correctly ✅

### Fresh Website Data:
- "Classes are held in various locations in Brooklyn and Manhattan. Please call 646.379.4468 for details!"
- Main Contact Phone: 646.379.4468 ✅ (already correct)

### Actions:
1. Fix Location 1 address: "646.379.4468" → "Lincoln Terrace Park, Crown Heights, Brooklyn, NY"
2. **RE_GEOCODE** Location 1 with corrected address
3. Keep Location 2 (520 8th Ave, Manhattan) as-is
4. Both locations match website's Brooklyn/Manhattan description ✅

---

## 10. Carioca Capoeira → SPLIT INTO 3 REGIONAL GROUPS
**Website**: http://www.cariocacapoeira.com

### Issues:
- **ORGANIZATION_STRUCTURE**: This is an Academia with regional branches (NYC, Charleston, Miami)
- **DATA_MODEL_LIMITATION**: Current data model doesn't support Academia concept
- **SINGLE_GROUP**: All locations grouped under NYC leader, but Charleston and Miami have separate leadership

### Current Data (OLD - from 4/13/19):
**Single Group**: "Carioca Capoeira"
- Leader: Mestre Carioca (Carlos da Silva Borge) - Actually only leads NYC
- 3 NYC locations:
  1. Cornell Medical College - 445 East 69th St, NY ✅
  2. Woodside Ballet Academy - 49-10 43rd Ave, Woodside, NY 11377 (not on current website)
  3. The Q StudioLab - 41-20 Queens Boulevard, Sunnyside, NY 11104 ✅

### Fresh Website Data Shows 3 Regional Branches:

#### **Group A: Carioca Capoeira (New York City)**
- Leader: Mestre Carioca (Carlos da Silva Borge) (title: "mestre", nickname: "Carlos da Silva Borge")
- Website: http://www.cariocacapoeira.com
- Main Contact: cariocanyc@yahoo.com, 718-309-7605

**Locations (2):**
1. ✅ **KEEP**: Cornell Medical College, Olin Hall Gym
   - Address: 445 East 69th Street, New York, NY (on the corner of 69th St. & York Ave.)
   - Schedule: Tue 7-9pm; Sat 12-2pm

2. ✅ **KEEP**: The Q StudioLab
   - Address: 41-20 Queens Boulevard, Sunnyside, NY 11104
   - Schedule: Fri 7:30-9pm

3. ❌ **DROP**: Woodside Ballet Academy - 49-10 43rd Ave (not on current website)

#### **Group B: Carioca Capoeira (Charleston)**
- Leader: TBD (check Charleston website)
- Website: https://capoeiracharleston.com/

**Locations (2):**
1. ✅ **ADD**: Arthur Christopher Community Center
   - Address: Downtown Charleston, SC (need to search for full address: "Arthur Christopher Community Center Charleston SC")
   - Schedule: Tue & Thu 6:30pm

2. ✅ **ADD**: Hampton Park Gazebo
   - Address: Hampton Park, Charleston, SC (need to search for "Hampton Park Gazebo Charleston SC")
   - Schedule: Sat 10:30am

#### **Group C: Carioca Capoeira (Miami)**
- Leader: TBD
- Website: https://oceanlifestudios.com/our-classes/capoeira-miami-beach/
- Note: Part of Ocean Life Studios fitness center

**Locations (1):**
1. ✅ **ADD**: Ocean Life Studio
   - Address: 7123 N Miami Avenue, Miami, FL 33150
   - Schedule: TBD (check website)

### Actions:
1. **DELETE** the current single "Carioca Capoeira" group
2. **CREATE** 3 new regional groups:
   - "Carioca Capoeira (New York City)" (Mestre Carioca) - 2 locations (drop Woodside)
   - "Carioca Capoeira (Charleston)" - 2 locations
   - "Carioca Capoeira (Miami)" - 1 location
3. **SEARCH** for full addresses: Arthur Christopher Community Center (Charleston), Hampton Park Gazebo (Charleston)
4. **CHECK** Charleston website for leader info
5. **CHECK** Miami Instagram for schedule and leader info
6. **RE_GEOCODE** 3 new Charleston/Miami locations

---
