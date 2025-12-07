/**
 * Genealogy Prototype Seed Data
 *
 * Seeds the genealogy schema with prototype data from well-documented case studies.
 * Based on the Genealogy Data Entry Guide and validated against case study research.
 *
 * Case Studies Included:
 * - Historical Mestres: Pastinha, Bimba, João Grande, João Pequeno
 * - GCAP (Grupo de Capoeira Angola Pelourinho) - Mestre Moraes
 * - Grupo Senzala - The "Sete Mestres" collective
 * - ABADÁ-Capoeira - Mestre Camisa + Camisa Roxa
 * - Cordão de Ouro - Mestre Suassuna + Mestre Brasília
 * - João Grande Capoeira Angola Center - NYC
 *
 * @see /docs/genealogy/genealogy-data-entry-guide.md
 */

import { createDatabaseConnection } from '../connection';
import { personProfiles, groupProfiles, statements, type StatementProperties } from '../schema/genealogy';

const LOCAL_DATABASE_URL = 'postgres://postgres:mypassword@localhost:5433/postgres';

export async function seedGenealogyPrototype() {
  console.log('Seeding genealogy prototype data...');

  const { db } = createDatabaseConnection(LOCAL_DATABASE_URL);

  // ============================================================
  // PHASE 1: HISTORICAL FOUNDATIONAL FIGURES (Generation 0)
  // These are the legendary mestres at the root of the lineage tree
  // ============================================================

  // --- Mestre Pastinha (Father of Capoeira Angola) ---
  const [pastinha] = await db
    .insert(personProfiles)
    .values({
      name: 'Vicente Ferreira Pastinha',
      apelido: 'Pastinha',
      title: 'mestre',
      style: 'angola',
      // TODO: Add avatar after implementing image storage (Phase 5)
      birthYear: 1889,
      birthYearPrecision: 'year',
      birthPlace: 'Salvador, Bahia, Brazil',
      deathYear: 1981,
      deathYearPrecision: 'year',
      deathPlace: 'Salvador, Bahia, Brazil',
      bio: 'Considered the "Father of Capoeira Angola." Founded Centro Esportivo de Capoeira Angola (CECA) in 1941. Systematized and preserved the Angola tradition. Traveled to Senegal in 1966 for the First World Festival of Black Arts. Became blind in later years.',
      achievements:
        'Founded CECA (1941). Represented Brazil at First World Festival of Black Arts, Senegal (1966). Systematized Capoeira Angola pedagogy.',
    })
    .returning();

  console.log(`Created: Mestre Pastinha (${pastinha.id})`);

  // --- Mestre Bimba (Creator of Capoeira Regional) ---
  const [bimba] = await db
    .insert(personProfiles)
    .values({
      name: 'Manoel dos Reis Machado',
      apelido: 'Bimba',
      title: 'mestre',
      style: 'regional',
      // TODO: Add avatar after implementing image storage (Phase 5)
      birthYear: 1899,
      birthYearPrecision: 'year',
      birthPlace: 'Salvador, Bahia, Brazil',
      deathYear: 1974,
      deathYearPrecision: 'year',
      deathPlace: 'Goiânia, Goiás, Brazil',
      bio: 'Creator of Capoeira Regional. Revolutionized capoeira by systematizing training, introducing sequences, and gaining government recognition. First to receive official permission to teach capoeira (1937). Known for elevating capoeira from street practice to recognized martial art.',
      achievements:
        'Created Capoeira Regional. First government-recognized capoeira academy (1937). Developed systematic training methodology with sequences.',
    })
    .returning();

  console.log(`Created: Mestre Bimba (${bimba.id})`);

  // ============================================================
  // PHASE 2: GENERATION 1 - PASTINHA'S PRINCIPAL STUDENTS
  // João Grande and João Pequeno: "The two most learned students"
  // ============================================================

  // --- Mestre João Grande ---
  const [joaoGrande] = await db
    .insert(personProfiles)
    .values({
      name: 'João Oliveira dos Santos',
      apelido: 'João Grande',
      title: 'mestre',
      style: 'angola',
      // TODO: Add avatar after implementing image storage (Phase 5)
      birthYear: 1933,
      birthYearPrecision: 'exact',
      birthPlace: 'Itagi, Bahia, Brazil',
      bio: 'One of Mestre Pastinha\'s "two most learned students." Received diploma from Pastinha in 1968. Traveled with Pastinha to Senegal (1966). Moved to NYC in 1990, founding the Capoeira Angola Center of Mestre João Grande. US National Heritage Fellow (2001). Still actively teaching at age 92.',
      achievements:
        'National Endowment for the Arts National Heritage Fellowship (2001). Doctorate of Humane Letters from Upsala College (1995). Subject of documentary "Mandinga em Manhattan."',
    })
    .returning();

  console.log(`Created: Mestre João Grande (${joaoGrande.id})`);

  // --- Mestre João Pequeno ---
  const [joaoPequeno] = await db
    .insert(personProfiles)
    .values({
      name: 'João Pereira dos Santos',
      apelido: 'João Pequeno',
      title: 'mestre',
      style: 'angola',
      // TODO: Add avatar after implementing image storage (Phase 5)
      birthYear: 1917,
      birthYearPrecision: 'year',
      birthPlace: 'Bahia, Brazil',
      deathYear: 2011,
      deathYearPrecision: 'year',
      deathPlace: 'Salvador, Bahia, Brazil',
      bio: 'One of Mestre Pastinha\'s "two most learned students." Introduced João Grande to Pastinha. Ran Pastinha\'s academy alongside João Grande when Pastinha became blind. Founded CECA-Academia João Pequeno in 1982 at Forte Santo Antônio.',
      achievements:
        "Founded CECA-Academia João Pequeno (1982). Kept Pastinha's academy running during difficult years.",
    })
    .returning();

  console.log(`Created: Mestre João Pequeno (${joaoPequeno.id})`);

  // ============================================================
  // PHASE 3: GENERATION 2 - SECOND GENERATION LEADERS
  // Mestres who trained under Generation 1
  // ============================================================

  // --- Mestre Moraes (GCAP Founder) ---
  const [moraes] = await db
    .insert(personProfiles)
    .values({
      name: 'Pedro Moraes Trindade',
      apelido: 'Moraes',
      title: 'mestre',
      style: 'angola',
      birthYear: 1950,
      birthYearPrecision: 'exact',
      birthPlace: 'Ilha de Maré, Salvador, Bahia, Brazil',
      bio: 'Known as "O Ressuscitador da Tradição" (The Resuscitator of Tradition). Founder of GCAP (1980). Trained under João Grande and João Pequeno at Pastinha\'s academy starting at age 8. Key figure in the 1980s revival of Capoeira Angola when it was nearly extinct. Academic: Master\'s in Social History, Doctorate in Culture and Society (UFBA).',
      achievements:
        'Founded GCAP (1980). Led revival of Capoeira Angola in 1980s. Grammy nomination for "Roda de Capoeira" album (1984). Master\'s and Doctorate from Universidade Federal da Bahia.',
    })
    .returning();

  console.log(`Created: Mestre Moraes (${moraes.id})`);

  // --- Mestre Cobra Mansa (GCAP → ICAF) ---
  const [cobraMansa] = await db
    .insert(personProfiles)
    .values({
      name: 'Cinézio Feliciano Peçanha',
      apelido: 'Cobra Mansa',
      title: 'mestre',
      style: 'angola',
      birthYear: 1960,
      birthYearPrecision: 'year',
      birthPlace: 'Duque de Caxias, Rio de Janeiro, Brazil',
      bio: 'Top student of Mestre Moraes. Joined Moraes at age 14 (1974). Moved to Salvador with Moraes in 1982. Together with Moraes, convinced João Grande to return from retirement in mid-1980s. Left GCAP in 1996 to found ICAF (International Capoeira Angola Foundation) with Mestres Jurandir and Valmir.',
      achievements:
        'Co-founded ICAF (1996). Producer/consultant for "Mandinga em Manhattan" documentary. Traveled to west-central Africa to research capoeira\'s African roots.',
    })
    .returning();

  console.log(`Created: Mestre Cobra Mansa (${cobraMansa.id})`);

  // ============================================================
  // PHASE 4: SENZALA FOUNDERS - THE "SETE MESTRES"
  // Collective leadership model from Rio de Janeiro
  // ============================================================

  // --- Mestre Peixinho (Senzala co-founder) ---
  const [peixinho] = await db
    .insert(personProfiles)
    .values({
      name: 'Antônio Carlos Peixinho',
      apelido: 'Peixinho',
      title: 'mestre',
      style: 'contemporanea',
      birthYear: 1943,
      birthYearPrecision: 'decade',
      birthPlace: 'Rio de Janeiro, Brazil',
      bio: 'One of the founding "Sete Mestres" (Seven Mestres) of Grupo Senzala. The founders visited Salvador to train under Mestre Bimba and observe street rodas. Remained with Senzala as a key leader. Known for collaborative leadership model emphasizing "interactivity between red belts."',
    })
    .returning();

  console.log(`Created: Mestre Peixinho (${peixinho.id})`);

  // --- Mestre Gato (Senzala co-founder) ---
  const [gato] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Gato',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'One of the founding "Sete Mestres" of Grupo Senzala. Trained with Paulo Flores in the early days. Later became a padrinho (godfather) for Grupo Capoeira Brasil\'s blessed founding in 1989.',
    })
    .returning();

  console.log(`Created: Mestre Gato (${gato.id})`);

  // --- Mestre Rafael Flores (Senzala co-founder) ---
  const [rafaelFlores] = await db
    .insert(personProfiles)
    .values({
      name: 'Rafael Flores',
      apelido: 'Rafael',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'One of the three Flores brothers who moved from Salvador to Rio de Janeiro and founded Grupo Senzala. Part of the founding "Sete Mestres." Later became a padrinho for Grupo Capoeira Brasil.',
    })
    .returning();

  console.log(`Created: Mestre Rafael Flores (${rafaelFlores.id})`);

  // ============================================================
  // PHASE 5: SENZALA STUDENTS WHO FOUNDED MAJOR GROUPS
  // ============================================================

  // --- Mestre Camisa (ABADÁ founder) ---
  const [camisa] = await db
    .insert(personProfiles)
    .values({
      name: 'José Tadeu Carneiro Cardoso',
      apelido: 'Camisa',
      title: 'mestre',
      style: 'contemporanea',
      birthYear: 1956,
      birthYearPrecision: 'decade',
      birthPlace: 'Fazenda Estiva, Bahia, Brazil',
      bio: "Founder and President of ABADÁ-Capoeira (1988), the world's largest capoeira organization. Started training under Mestre Bimba at age 12 with his brother Camisa Roxa. Former member of Grupo Senzala (early 1970s-1988). Left Senzala with blessing to create his own methodology following Bimba's innovative concepts.",
      achievements:
        'Founded ABADÁ-Capoeira (1988). Built organization to 40,000-80,000 members in 70+ countries. Only holder of White Cord (Diamond) rank in ABADÁ.',
    })
    .returning();

  console.log(`Created: Mestre Camisa (${camisa.id})`);

  // --- Grão Mestre Camisa Roxa (ABADÁ co-founder) ---
  const [camisaRoxa] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Camisa Roxa',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Fazenda Estiva, Bahia, Brazil',
      bio: 'Co-founder of ABADÁ-Capoeira with his brother Mestre Camisa. Student of Mestre Bimba. Convinced their mother to let young José Tadeu (Camisa) attend Bimba\'s academy. Holds unique title of "Grão Mestre" (Grand Master) within ABADÁ.',
    })
    .returning();

  console.log(`Created: Grão Mestre Camisa Roxa (${camisaRoxa.id})`);

  // --- Mestre Suassuna (Cordão de Ouro founder) ---
  const [suassuna] = await db
    .insert(personProfiles)
    .values({
      name: 'Reinaldo Ramos Suassuna',
      apelido: 'Suassuna',
      title: 'mestre',
      style: 'contemporanea',
      birthYear: 1938,
      birthYearPrecision: 'year',
      birthPlace: 'Brazil',
      bio: 'Co-founder of Cordão de Ouro (1967) with Mestre Brasília. Student of three mestres: Sururu, Abiné, and Tonho Role. Part of the founding generation of Grupo Senzala before departing to focus on Capoeira Regional traditions. Known for musical innovation and international influence.',
      achievements:
        'Co-founded Cordão de Ouro (1967). Developed certification system with registered trademark. Built international network across multiple continents.',
    })
    .returning();

  console.log(`Created: Mestre Suassuna (${suassuna.id})`);

  // --- Mestre Brasília (Cordão de Ouro co-founder) ---
  const [brasilia] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Brasília',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'Co-founder of Cordão de Ouro (1967) with Mestre Suassuna. Part of the founding generation of Grupo Senzala before departing with Suassuna to establish their own organization.',
    })
    .returning();

  console.log(`Created: Mestre Brasília (${brasilia.id})`);

  // ============================================================
  // PHASE 6: GCAP CO-FOUNDERS
  // The four mestres who founded GCAP in Rio de Janeiro (1980)
  // ============================================================

  // --- Mestre Braga (GCAP co-founder) ---
  const [braga] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Braga',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'One of the four co-founders of GCAP (1980) in Rio de Janeiro. Received mestre title from Moraes on December 16, 1978 at Parque Lage. Remained in Rio with full autonomy when Moraes moved GCAP to Salvador in 1982.',
    })
    .returning();

  console.log(`Created: Mestre Braga (${braga.id})`);

  // --- Mestre Neco (GCAP co-founder, idea originator) ---
  const [neco] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Neco',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'One of the four co-founders of GCAP (1980) in Rio de Janeiro. Originated the idea for GCAP. Received mestre title from Moraes on December 16, 1978 at Parque Lage. Remained in Rio with full autonomy when Moraes moved to Salvador in 1982.',
    })
    .returning();

  console.log(`Created: Mestre Neco (${neco.id})`);

  // --- Mestre Zé Carlos (GCAP co-founder) ---
  const [zeCarlos] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Zé Carlos',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'One of the four co-founders of GCAP (1980) in Rio de Janeiro. Received mestre title from Moraes on December 16, 1978 at Parque Lage. Remained in Rio with full autonomy when Moraes moved to Salvador in 1982.',
    })
    .returning();

  console.log(`Created: Mestre Zé Carlos (${zeCarlos.id})`);

  console.log(`Created ${14} person profiles`);

  // ============================================================
  // PHASE 7: GROUP PROFILES
  // ============================================================

  // --- CECA (Pastinha's original academy) ---
  const [ceca] = await db
    .insert(groupProfiles)
    .values({
      name: 'Centro Esportivo de Capoeira Angola',
      description:
        'Founded by Mestre Pastinha in Salvador, Bahia. The birthplace of organized Capoeira Angola and source of the Pastinha lineage that dominates modern Angola tradition.',
      style: 'angola',
      foundedYear: 1941,
      foundedYearPrecision: 'year',
      foundedLocation: 'Salvador, Bahia, Brazil',
      philosophy: 'Capoeira Angola as a path of self-knowledge and mastery. Preservation of African cultural roots.',
      isActive: false,
    })
    .returning();

  console.log(`Created: CECA (${ceca.id})`);

  // --- GCAP ---
  const [gcap] = await db
    .insert(groupProfiles)
    .values({
      name: 'Grupo de Capoeira Angola Pelourinho',
      description:
        'Founded by four co-founders (Moraes, Braga, Neco, Zé Carlos) in Rio de Janeiro in 1980. Led the revival of Capoeira Angola in the 1980s when the style was nearly extinct. Moved to Salvador in 1982 and established at Forte Santo Antônio Além do Carmo in 1983.',
      style: 'angola',
      foundedYear: 1980,
      foundedYearPrecision: 'year',
      foundedLocation: 'Rio de Janeiro, Brazil',
      philosophy:
        "Return to capoeira's African roots. Anti-commercialization stance. Cultural resistance against persecution of African culture.",
      isActive: true,
      nameHistory: [
        {
          name: 'Grupo de Capoeira Angola Pelourinho',
          startedAt: '1980-01-01',
          context: 'Name chosen as reference to African cultural heritage before the move to Salvador',
        },
      ],
    })
    .returning();

  console.log(`Created: GCAP (${gcap.id})`);

  // --- Grupo Senzala ---
  const [senzala] = await db
    .insert(groupProfiles)
    .values({
      name: 'Grupo Senzala',
      description:
        'One of the most influential capoeira groups in history. Founded in Rio de Janeiro by the "Sete Mestres" (Seven Mestres) including the Flores brothers. Known for collaborative leadership model, open roda philosophy, and systematic teaching methodology. Source of many blessed splits including ABADÁ and Cordão de Ouro.',
      style: 'contemporanea',
      nameAliases: ['Senzala'],
      // TODO: Add logo after implementing image storage (Phase 5)
      foundedYear: 1963,
      foundedYearPrecision: 'approximate',
      foundedLocation: 'Laranjeiras, Rio de Janeiro, Brazil',
      philosophy:
        'Balance between systematic structure and creative spontaneity. Open weekly rodas where every capoeirista is welcome. Collaborative leadership among red belts.',
      isActive: true,
      nameHistory: [
        {
          name: 'Grupo Senzala',
          startedAt: '1966-01-01',
          context:
            'Formally named during demonstration at German Club in 1966. "Senzala" refers to slave quarters - a political and cultural statement about capoeira as resistance.',
        },
      ],
    })
    .returning();

  console.log(`Created: Grupo Senzala (${senzala.id})`);

  // --- ABADÁ-Capoeira ---
  const [abada] = await db
    .insert(groupProfiles)
    .values({
      name: 'ABADÁ-Capoeira',
      description:
        "Associação Brasileira de Apoio e Desenvolvimento da Arte-Capoeira - The world's largest capoeira organization. Founded by brothers Mestre Camisa and Grão Mestre Camisa Roxa after a blessed departure from Grupo Senzala. Known for standardized graduation system and decentralized legal structure with cultural unity.",
      style: 'contemporanea',
      nameAliases: ['ABADÁ', 'Abada Capoeira'],
      // TODO: Add logo after implementing image storage (Phase 5)
      foundedYear: 1988,
      foundedYearPrecision: 'year',
      foundedLocation: 'Rio de Janeiro, Brazil',
      philosophy:
        "Follows Bimba's innovative concepts while incorporating Angola practices. Strong sense of family and community. Contemporary synthesis approach.",
      isActive: true,
    })
    .returning();

  console.log(`Created: ABADÁ-Capoeira (${abada.id})`);

  // --- Cordão de Ouro ---
  const [cordaoDeOuro] = await db
    .insert(groupProfiles)
    .values({
      name: 'Cordão de Ouro',
      description:
        'Associação de Capoeira Cordão de Ouro - One of the oldest and most widespread international capoeira networks. Co-founded by Mestre Suassuna and Mestre Brasília. Known for formal certification system, registered trademark, and Academia Matriz model.',
      style: 'contemporanea',
      nameAliases: ['CDO', 'Golden Cord'],
      // TODO: Add logo after implementing image storage (Phase 5)
      foundedYear: 1967,
      foundedYearPrecision: 'exact',
      foundedLocation: 'São Paulo, Brazil',
      philosophy:
        'Contemporânea style blending Angola and Regional traditions. Formal certification and quality control.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Cordão de Ouro (${cordaoDeOuro.id})`);

  // --- João Grande Capoeira Angola Center ---
  const [jgcac] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Angola Center of Mestre João Grande',
      description:
        'Founded in NYC when Mestre João Grande settled permanently after successful US tour. First permanent Capoeira Angola school established by a 1st-generation Pastinha student in the United States. International network spanning 9 countries with 12+ locations.',
      style: 'angola',
      foundedYear: 1990,
      foundedYearPrecision: 'year',
      foundedLocation: 'New York City, USA',
      philosophy:
        'Teaches in the African style, as a way of life, following Mestre Pastinha\'s tradition. Anti-anglicization stance. Nature-based teaching methodology. "Capoeira is a game not about fighting, but about philosophy, culture, community, and playing together."',
      isActive: true,
      nameHistory: [
        {
          name: 'Capoeira Angola Center',
          startedAt: '1990-01-01',
          context: 'Originally located at 14th Street, downtown Manhattan',
        },
        {
          name: 'Capoeira Angola Center of Mestre João Grande',
          startedAt: '2011-01-01',
          context: 'Moved to current location at 2916 Frederick Douglass Blvd, Harlem',
        },
      ],
    })
    .returning();

  console.log(`Created: João Grande Capoeira Angola Center (${jgcac.id})`);

  // --- ICAF (International Capoeira Angola Foundation) ---
  const [icaf] = await db
    .insert(groupProfiles)
    .values({
      name: 'International Capoeira Angola Foundation',
      description:
        'Founded by Mestre Cobra Mansa, Mestre Jurandir, and Mestre Valmir after departing GCAP. Based in Washington D.C. with affiliate schools across USA, Brazil, Europe, Asia, and Africa.',
      style: 'angola',
      nameAliases: ['ICAF', 'FICA'],
      foundedYear: 1996,
      foundedYearPrecision: 'year',
      foundedLocation: 'Washington D.C., USA',
      philosophy: 'Traditional Angola preservation with international reach. African roots focus.',
      isActive: true,
    })
    .returning();

  console.log(`Created: ICAF (${icaf.id})`);

  console.log(`Created ${7} group profiles`);

  // ============================================================
  // PHASE 8: STATEMENTS (RELATIONSHIPS)
  // ============================================================

  const statementsData = [
    // ============================================================
    // PERSON-TO-PERSON: TRAINING & LINEAGE
    // ============================================================

    // --- Angola Lineage Chain ---
    // João Grande student_of Pastinha (Generation 0 → 1)
    {
      subjectType: 'person' as const,
      subjectId: joaoGrande.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      startedAt: '1953-01-01',
      endedAt: '1981-01-01',
      confidence: 'verified' as const,
      source: 'Historical records, NEA Heritage Fellowship documentation, Smithsonian',
      notes: "Joined Pastinha's academy at age 20 in 1953. Received diploma from Pastinha in 1968.",
    },

    // João Pequeno student_of Pastinha (Generation 0 → 1)
    {
      subjectType: 'person' as const,
      subjectId: joaoPequeno.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      confidence: 'verified' as const,
      source: 'Historical records, Wikipedia',
      notes: 'One of Pastinha\'s "two most learned students."',
    },

    // Moraes trained_under João Grande (Generation 1 → 2)
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: joaoGrande.id,
      startedAt: '1958-01-01',
      confidence: 'verified' as const,
      source: 'GCAP documentation, case study research',
      notes:
        'Started at Pastinha\'s academy age 8 (~1958). Moraes states he is "truly the student of João Grande due to the inspiring way that João Grande played capoeira."',
    },

    // Moraes trained_under Pastinha (limited direct training)
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      startedAt: '1958-01-01',
      endedAt: '1981-01-01',
      confidence: 'verified' as const,
      source: 'Historical records',
      notes: 'Trained at CECA while Pastinha was still alive but blind. Limited direct instruction.',
    },

    // Moraes trained_under João Pequeno
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: joaoPequeno.id,
      startedAt: '1958-01-01',
      confidence: 'verified' as const,
      source: 'GCAP documentation',
      notes: "João Pequeno and João Grande ran Pastinha's academy together.",
    },

    // Cobra Mansa student_of Moraes (Generation 2 → 3)
    {
      subjectType: 'person' as const,
      subjectId: cobraMansa.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: moraes.id,
      startedAt: '1974-01-01',
      confidence: 'verified' as const,
      source: 'GCAP documentation, Wikipedia',
      notes: 'Became student of Moraes at age 14 (1974). Top student.',
    },

    // --- Regional/Contemporânea Lineage ---
    // Senzala founders trained_under Bimba
    {
      subjectType: 'person' as const,
      subjectId: peixinho.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: bimba.id,
      confidence: 'likely' as const,
      source: 'Senzala history',
      notes: 'The founders visited Salvador to train under Mestre Bimba and observe street rodas.',
    },

    // Camisa student_of Bimba
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: bimba.id,
      startedAt: '1968-01-01', // Started at age 12, born ~1956
      confidence: 'verified' as const,
      source: 'ABADÁ DC documentation, Wikipedia',
      notes: 'Started training under Mestre Bimba at age 12 after brother Camisa Roxa convinced their mother.',
    },

    // Camisa Roxa student_of Bimba
    {
      subjectType: 'person' as const,
      subjectId: camisaRoxa.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: bimba.id,
      confidence: 'verified' as const,
      source: 'ABADÁ DC documentation',
      notes: 'Both brothers trained under Bimba in Salvador.',
    },

    // ============================================================
    // PERSON-TO-PERSON: FAMILY
    // ============================================================

    // Camisa and Camisa Roxa are brothers
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'family_of' as const,
      objectType: 'person' as const,
      objectId: camisaRoxa.id,
      properties: { relationship_type: 'sibling' } as StatementProperties,
      confidence: 'verified' as const,
      source: 'ABADÁ documentation',
      notes: 'Biological brothers who co-founded ABADÁ.',
    },

    // ============================================================
    // PERSON-TO-PERSON: MENTORSHIP & RECOGNITION
    // ============================================================

    // Moraes granted_title_to Braga
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: braga.id,
      startedAt: '1978-12-16',
      properties: {
        title_grant: { title: 'mestre', ceremony: 'Formal graduation', location: 'Parque Lage, Rio de Janeiro' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'GCAP case study research',
      notes: 'Formal mestre title granting ceremony two years before GCAP founding.',
    },

    // Moraes granted_title_to Neco
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: neco.id,
      startedAt: '1978-12-16',
      properties: {
        title_grant: { title: 'mestre', ceremony: 'Formal graduation', location: 'Parque Lage, Rio de Janeiro' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'GCAP case study research',
    },

    // Moraes granted_title_to Zé Carlos
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: zeCarlos.id,
      startedAt: '1978-12-16',
      properties: {
        title_grant: { title: 'mestre', ceremony: 'Formal graduation', location: 'Parque Lage, Rio de Janeiro' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'GCAP case study research',
    },

    // ============================================================
    // PERSON-TO-GROUP: FOUNDING & LEADERSHIP
    // ============================================================

    // --- Pastinha founded CECA ---
    {
      subjectType: 'person' as const,
      subjectId: pastinha.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: ceca.id,
      startedAt: '1941-01-01',
      confidence: 'verified' as const,
      source: 'Historical records',
    },

    // --- GCAP founding ---
    // Moraes co_founded GCAP
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1980-01-01',
      confidence: 'verified' as const,
      source: 'GCAP case study research',
      notes: 'Primary leader among four co-founders.',
    },

    // Braga co_founded GCAP
    {
      subjectType: 'person' as const,
      subjectId: braga.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1980-01-01',
      confidence: 'verified' as const,
      source: 'GCAP case study research',
    },

    // Neco co_founded GCAP
    {
      subjectType: 'person' as const,
      subjectId: neco.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1980-01-01',
      confidence: 'verified' as const,
      source: 'GCAP case study research',
      notes: 'Originated the idea for GCAP.',
    },

    // Zé Carlos co_founded GCAP
    {
      subjectType: 'person' as const,
      subjectId: zeCarlos.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1980-01-01',
      confidence: 'verified' as const,
      source: 'GCAP case study research',
    },

    // Moraes leads GCAP
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1980-01-01',
      confidence: 'verified' as const,
      source: 'Current',
    },

    // --- Senzala founding ---
    // Peixinho co_founded Senzala
    {
      subjectType: 'person' as const,
      subjectId: peixinho.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1963-01-01',
      confidence: 'verified' as const,
      source: 'Senzala history',
    },

    // Gato co_founded Senzala
    {
      subjectType: 'person' as const,
      subjectId: gato.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1963-01-01',
      confidence: 'verified' as const,
      source: 'Senzala history',
    },

    // Rafael Flores co_founded Senzala
    {
      subjectType: 'person' as const,
      subjectId: rafaelFlores.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1963-01-01',
      confidence: 'verified' as const,
      source: 'Senzala history',
    },

    // Suassuna co_founded Senzala (before departing)
    {
      subjectType: 'person' as const,
      subjectId: suassuna.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1963-01-01',
      endedAt: '1967-01-01',
      confidence: 'verified' as const,
      source: 'CDO and Senzala history',
      notes: 'Part of founding generation before departing to create Cordão de Ouro.',
    },

    // Brasília co_founded Senzala (before departing)
    {
      subjectType: 'person' as const,
      subjectId: brasilia.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1963-01-01',
      endedAt: '1967-01-01',
      confidence: 'verified' as const,
      source: 'CDO and Senzala history',
    },

    // --- ABADÁ founding ---
    // Camisa co_founded ABADÁ
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: abada.id,
      startedAt: '1988-01-01',
      confidence: 'verified' as const,
      source: 'ABADÁ documentation',
    },

    // Camisa Roxa co_founded ABADÁ
    {
      subjectType: 'person' as const,
      subjectId: camisaRoxa.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: abada.id,
      startedAt: '1988-01-01',
      confidence: 'verified' as const,
      source: 'ABADÁ documentation',
    },

    // Camisa leads ABADÁ
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: abada.id,
      startedAt: '1988-01-01',
      confidence: 'verified' as const,
      source: 'ABADÁ documentation',
      notes: 'President and founder. Only holder of White Cord (Diamond) rank.',
    },

    // --- Cordão de Ouro founding ---
    // Suassuna co_founded CDO
    {
      subjectType: 'person' as const,
      subjectId: suassuna.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: cordaoDeOuro.id,
      startedAt: '1967-09-01',
      confidence: 'verified' as const,
      source: 'CDO official website',
    },

    // Brasília co_founded CDO
    {
      subjectType: 'person' as const,
      subjectId: brasilia.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: cordaoDeOuro.id,
      startedAt: '1967-09-01',
      confidence: 'verified' as const,
      source: 'CDO official website',
    },

    // Suassuna leads CDO
    {
      subjectType: 'person' as const,
      subjectId: suassuna.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: cordaoDeOuro.id,
      startedAt: '1967-09-01',
      confidence: 'verified' as const,
      source: 'CDO official website',
    },

    // --- João Grande Center founding ---
    // João Grande founded JGCAC
    {
      subjectType: 'person' as const,
      subjectId: joaoGrande.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: jgcac.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'joaogrande.org, NEA documentation',
    },

    // João Grande leads JGCAC
    {
      subjectType: 'person' as const,
      subjectId: joaoGrande.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: jgcac.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Current',
    },

    // --- ICAF founding ---
    // Cobra Mansa founded ICAF
    {
      subjectType: 'person' as const,
      subjectId: cobraMansa.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: icaf.id,
      startedAt: '1996-01-01',
      confidence: 'verified' as const,
      source: 'Wikipedia, ICAF documentation',
      notes: 'Co-founded with Mestres Jurandir and Valmir.',
    },

    // Cobra Mansa leads ICAF
    {
      subjectType: 'person' as const,
      subjectId: cobraMansa.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: icaf.id,
      startedAt: '1996-01-01',
      confidence: 'verified' as const,
      source: 'ICAF documentation',
    },

    // ============================================================
    // PERSON-TO-GROUP: MEMBERSHIP & AFFILIATION
    // ============================================================

    // João Grande cultural_pioneer_of JGCAC (USA)
    {
      subjectType: 'person' as const,
      subjectId: joaoGrande.id,
      predicate: 'cultural_pioneer_of' as const,
      objectType: 'group' as const,
      objectId: jgcac.id,
      startedAt: '1990-01-01',
      properties: {
        region: 'United States',
        country: 'USA',
        context: 'First Capoeira Angola mestre to establish permanent school in the USA',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'NEA documentation, joaogrande.org',
    },

    // Camisa was member_of Senzala (before founding ABADÁ)
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1972-01-01',
      endedAt: '1988-01-01',
      confidence: 'verified' as const,
      source: 'ABADÁ documentation',
    },

    // Camisa departed_from Senzala (blessed)
    {
      subjectType: 'person' as const,
      subjectId: camisa.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1988-01-01',
      properties: {
        departure_type: 'blessed',
        context: 'Left to found ABADÁ-Capoeira',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'ABADÁ documentation',
    },

    // Suassuna departed_from Senzala
    {
      subjectType: 'person' as const,
      subjectId: suassuna.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1967-01-01',
      properties: {
        departure_type: 'blessed',
        context: 'Departed to focus on Capoeira Regional traditions and found Cordão de Ouro.',
      } as StatementProperties,
      confidence: 'likely' as const,
      source: 'CDO and Senzala history',
    },

    // Cobra Mansa was member_of GCAP
    {
      subjectType: 'person' as const,
      subjectId: cobraMansa.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1974-01-01',
      endedAt: '1996-01-01',
      confidence: 'verified' as const,
      source: 'GCAP case study research',
    },

    // Cobra Mansa departed_from GCAP
    {
      subjectType: 'person' as const,
      subjectId: cobraMansa.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1996-01-01',
      properties: {
        departure_type: 'contentious',
        context: 'Left due to "difference over the direction of the school where they were both leader figures."',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Wikipedia, GCAP case study',
    },

    // ============================================================
    // GROUP-TO-GROUP: SPLITS & EVOLUTION
    // ============================================================

    // ABADÁ split_from_group Senzala (blessed)
    {
      subjectType: 'group' as const,
      subjectId: abada.id,
      predicate: 'split_from_group' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1988-01-01',
      properties: {
        split_type: 'blessed',
        context: 'Mestre Camisa left Senzala with blessing to establish ABADÁ-Capoeira',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'ABADÁ and Senzala documentation',
    },

    // Cordão de Ouro split_from_group Senzala (blessed)
    {
      subjectType: 'group' as const,
      subjectId: cordaoDeOuro.id,
      predicate: 'split_from_group' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1967-09-01',
      properties: {
        split_type: 'blessed',
        context: 'Mestre Suassuna and Brasília departed to focus on Capoeira Regional traditions',
      } as StatementProperties,
      confidence: 'likely' as const,
      source: 'CDO and Senzala history',
    },

    // ICAF split_from_group GCAP
    {
      subjectType: 'group' as const,
      subjectId: icaf.id,
      predicate: 'split_from_group' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1996-01-01',
      properties: {
        split_type: 'contentious',
        context: 'Cobra Mansa, Jurandir, and Valmir left GCAP due to ideological differences.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Wikipedia, GCAP case study',
    },
  ];

  await db.insert(statements).values(statementsData);
  console.log(`Created ${statementsData.length} statements`);

  console.log('');
  console.log('========================================');
  console.log('Genealogy prototype seed complete!');
  console.log('========================================');
  console.log(`  Person profiles: 14`);
  console.log(`  Group profiles:  7`);
  console.log(`  Statements:      ${statementsData.length}`);
  console.log('');
}

// Allow running directly
if (require.main === module) {
  seedGenealogyPrototype()
    .then(() => {
      console.log('Seed complete. Exiting.');
      process.exit(0);
    })
    .catch((error) => {
      console.error('Seed failed:', error);
      process.exit(1);
    });
}
