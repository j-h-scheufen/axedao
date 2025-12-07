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
 * - Grupo Capoeira Brasil - Boneco, Sabiá, Ceará (blessed split from Senzala)
 * - Grupo Muzenza de Capoeira - Paulão (founder), Burguês (current president)
 * - Grupo Axé Capoeira - Mestre Barrão (founder), Barrãozinho (son/successor)
 * - Grupo Capoeira Filhos de Angola - Roberval, Laércio, Cabore, Rosalvo (four co-founders)
 * - CECA/Academia João Pequeno - Additional historical figures (Africano Benedito, Faísca, Decânio, Curió)
 * - ICAF/FICA - Additional co-founders (Jurandir, Valmir) + Hawaii chapter (Trenel Joe)
 * - GCAIG Irmãos Guerreiros - Baixinho (founder), Marrom (son), Perna (Europe), Kenneth (Vienna)
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

  // ============================================================
  // PHASE 7: GRUPO CAPOEIRA BRASIL FOUNDERS
  // Blessed split from Senzala (1989)
  // ============================================================

  // --- Mestre Boneco (Grupo Capoeira Brasil co-founder) ---
  const [boneco] = await db
    .insert(personProfiles)
    .values({
      name: 'Luis Roberto Simas',
      apelido: 'Boneco',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'Co-founder of Grupo Capoeira Brasil (1989). Trained under Mestre Camisa at Grupo Senzala where he earned the red cord. Left Senzala with blessing from padrinhos (Gato, Peixinho, Rafael Flores, Suassuna, Itapoã, Ezekiel) to found Grupo Capoeira Brasil with Paulinho Sabiá and Paulão Ceará. Primary visible leader of the group with branches in 40+ countries.',
    })
    .returning();

  console.log(`Created: Mestre Boneco (${boneco.id})`);

  // --- Mestre Paulinho Sabiá (Grupo Capoeira Brasil co-founder) ---
  const [paulinhoSabia] = await db
    .insert(personProfiles)
    .values({
      name: 'Paulo César da Silva Sousa',
      apelido: 'Paulinho Sabiá',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'Co-founder of Grupo Capoeira Brasil (1989). Trained under Mestre Camisa at Grupo Senzala where he earned the red cord. Left Senzala with blessing to found Grupo Capoeira Brasil with Boneco and Paulão Ceará.',
    })
    .returning();

  console.log(`Created: Mestre Paulinho Sabiá (${paulinhoSabia.id})`);

  // --- Mestre Paulão Ceará (Grupo Capoeira Brasil co-founder) ---
  const [paulaoCeara] = await db
    .insert(personProfiles)
    .values({
      name: 'Paulão Sales Neto',
      apelido: 'Paulão Ceará',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'Co-founder of Grupo Capoeira Brasil (1989). Trained under Mestre Camisa at Grupo Senzala where he earned the red cord. Left Senzala with blessing to found Grupo Capoeira Brasil with Boneco and Paulinho Sabiá.',
    })
    .returning();

  console.log(`Created: Mestre Paulão Ceará (${paulaoCeara.id})`);

  // --- Mestre Itapoã (Elder who blessed Capoeira Brasil founding) ---
  const [itapoa] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Itapoã',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'Respected elder who served as padrinho (godfather) at the founding of Grupo Capoeira Brasil in 1989, blessing the new group alongside other masters.',
    })
    .returning();

  console.log(`Created: Mestre Itapoã (${itapoa.id})`);

  // --- Mestre Ezekiel (Elder who blessed Capoeira Brasil founding, deceased) ---
  const [ezekiel] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Ezekiel',
      title: 'mestre',
      birthYearPrecision: 'unknown',
      bio: 'Respected elder (deceased) who served as padrinho (godfather) at the founding of Grupo Capoeira Brasil in 1989, blessing the new group alongside other masters.',
    })
    .returning();

  console.log(`Created: Mestre Ezekiel (${ezekiel.id})`);

  // ============================================================
  // PHASE 8: GRUPO MUZENZA FOUNDERS & LEADERS
  // One of the largest capoeira organizations worldwide
  // ============================================================

  // --- Mestre Mintirinha (Paulão's teacher and brother) ---
  const [mintirinha] = await db
    .insert(personProfiles)
    .values({
      name: 'Luís Américo da Silva',
      apelido: 'Mintirinha',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'Teacher of Mestre Paulão (the founder of Grupo Muzenza). Notable for the family relationship - Mintirinha taught his brother Paulão, who then founded one of the largest capoeira organizations in the world.',
    })
    .returning();

  console.log(`Created: Mestre Mintirinha (${mintirinha.id})`);

  // --- Mestre Paulão (Muzenza founder) ---
  const [paulaoMuzenza] = await db
    .insert(personProfiles)
    .values({
      name: 'Paulo Sérgio da Silva',
      apelido: 'Paulão',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Rio de Janeiro, Brazil',
      bio: 'Founder of Grupo Muzenza de Capoeira (May 5, 1972). Came from Capoarte de Obaluaê and trained under his brother Mestre Mintirinha. Led Muzenza until 1978 when Mestre Burguês became president. Current status unknown.',
    })
    .returning();

  console.log(`Created: Mestre Paulão (Muzenza) (${paulaoMuzenza.id})`);

  // --- Mestre Burguês (Muzenza president since 1978) ---
  const [burgues] = await db
    .insert(personProfiles)
    .values({
      name: 'Antônio Carlos de Menezes',
      apelido: 'Burguês',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'President of Grupo Muzenza de Capoeira since 1978. Moved to Curitiba in 1975 and massively expanded the group to 61 countries and 706 registered instructors. Known for developing a modern and stylized style while researching traditional fundamentals. Created 22 choreographed sequences methodology. Founded ENCAMUZENZA academic program (2013+).',
      achievements:
        'Expanded Muzenza to 61 countries with 706+ registered instructors. 20,000+ students through Curitiba location alone. Established ENCAMUZENZA academic/research program.',
    })
    .returning();

  console.log(`Created: Mestre Burguês (${burgues.id})`);

  // ============================================================
  // PHASE 9: GRUPO AXÉ CAPOEIRA FOUNDERS & LEADERS
  // Large international network with family succession
  // ============================================================

  // --- Mestre Barrão (Grupo Axé Capoeira founder) ---
  const [barrao] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Barrão',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Recife, Brazil',
      bio: 'Founder and leader of Grupo Axé Capoeira (1982). Emigrated from Brazil to Canada and grew the network internationally. One of the larger international Capoeira networks with locations across Canada, USA, Brazil, and other countries.',
    })
    .returning();

  console.log(`Created: Mestre Barrão (${barrao.id})`);

  // --- Contra-Mestre Barrãozinho (Barrão's son and successor) ---
  const [barraozinho] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Barrãozinho',
      title: 'contra-mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: "Biological son of Mestre Barrão. Active leader in Grupo Axé Capoeira and apparent successor to his father. Example of family succession in Capoeira leadership, where he is both Barrão's son AND his student.",
    })
    .returning();

  console.log(`Created: Contra-Mestre Barrãozinho (${barraozinho.id})`);

  // ============================================================
  // PHASE 10: GRUPO CAPOEIRA FILHOS DE ANGOLA (GCFA) FOUNDERS
  // Traditional Angola group with four co-founders (1984)
  // ============================================================

  // --- Mestre Caiçara (Laércio's initial teacher) ---
  const [caicara] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Caiçara',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Traditional Angola mestre from Salvador. Teacher of Mestre Laércio (GCFA co-founder) from 1978 when Laércio was 12 years old. Part of the Pastinha lineage of Capoeira Angola.',
    })
    .returning();

  console.log(`Created: Mestre Caiçara (${caicara.id})`);

  // --- Mestre Roberval (GCFA co-founder) ---
  const [roberval] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Roberval',
      title: 'mestre',
      style: 'angola',
      birthYear: 1964,
      birthYearPrecision: 'exact',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Co-founder of Grupo Capoeira Filhos de Angola (GCFA) in 1984. Started Capoeira Angola at age 14. Currently based in Stockholm, Sweden, where he coordinates GCFA Sverige (founded 1997). One of four co-founders who later separated geographically while maintaining the GCFA network.',
    })
    .returning();

  console.log(`Created: Mestre Roberval (${roberval.id})`);

  // --- Mestre Laércio (GCFA co-founder and international coordinator) ---
  const [laercio] = await db
    .insert(personProfiles)
    .values({
      name: 'Laércio dos Anjos Borges',
      apelido: 'Laércio',
      title: 'mestre',
      style: 'angola',
      birthYear: 1966,
      birthYearPrecision: 'exact',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Co-founder of Grupo Capoeira Filhos de Angola (GCFA) in 1984. Started training in 1978 (age 12) with Mestre Caiçara, later trained under MANY Angola mestres including João Grande, João Pequeno, Canjiquinha, Valdemar, Boca Rica, and others. Currently based in Berlin, Germany, coordinates 25+ GCFA núcleos throughout Europe and Asia. Co-founded ABCA (Associação Brasileira de Capoeira Angola) in 1991.',
    })
    .returning();

  console.log(`Created: Mestre Laércio (${laercio.id})`);

  // --- Mestre Cabore (GCFA co-founder) ---
  const [cabore] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Cabore',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Co-founder of Grupo Capoeira Filhos de Angola (GCFA) in 1984 alongside Roberval, Laércio, and Rosalvo. Current activity and location unknown.',
    })
    .returning();

  console.log(`Created: Mestre Cabore (${cabore.id})`);

  // --- Mestre Rosalvo (GCFA co-founder, Academia Jangada founder) ---
  const [rosalvo] = await db
    .insert(personProfiles)
    .values({
      name: 'Rosalvo Ferreira dos Santos',
      apelido: 'Rosalvo',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Co-founder of Grupo Capoeira Filhos de Angola (GCFA) in 1984. Trained under Mestre Cobra Mansa from age 15. Received Contramestre diploma from Cobra Mansa in 1991, named Mestre by João Pequeno and João Grande in 2002. Founded Academia Jangada in Berlin (1997), described as first European academy for Capoeira Angola. Now operates independently from GCFA network.',
    })
    .returning();

  console.log(`Created: Mestre Rosalvo (${rosalvo.id})`);

  // --- Mestre Canjiquinha (Historical Angola mestre) ---
  const [canjiquinha] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Canjiquinha',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Legendary Capoeira Angola mestre from Salvador. One of many Angola mestres who trained Mestre Laércio (GCFA co-founder). Known for traditional Angola practice and preservation.',
    })
    .returning();

  console.log(`Created: Mestre Canjiquinha (${canjiquinha.id})`);

  // --- Mestre Valdemar (Angola mestre, ABCA co-founder) ---
  const [valdemar] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Valdemar',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Traditional Capoeira Angola mestre from Salvador. Trained Mestre Laércio (GCFA co-founder). Co-founder of ABCA (Associação Brasileira de Capoeira Angola) in 1991 alongside João Pequeno, Paulo dos Anjos, Boca Rica, and others.',
    })
    .returning();

  console.log(`Created: Mestre Valdemar (${valdemar.id})`);

  // --- Mestre Boca Rica (Angola mestre, ABCA co-founder) ---
  const [bocaRica] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Boca Rica',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Traditional Capoeira Angola mestre from Salvador. Trained Mestre Laércio (GCFA co-founder). Co-founder of ABCA (Associação Brasileira de Capoeira Angola) in 1991.',
    })
    .returning();

  console.log(`Created: Mestre Boca Rica (${bocaRica.id})`);

  // --- Mestre Paulo dos Anjos (ABCA co-founder) ---
  const [pauloDosAnjos] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Paulo dos Anjos',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Traditional Capoeira Angola mestre. Co-founder of ABCA (Associação Brasileira de Capoeira Angola) in 1991 alongside João Pequeno, Laércio, Valdemar, Boca Rica, and others. Important figure in Angola preservation movement.',
    })
    .returning();

  console.log(`Created: Mestre Paulo dos Anjos (${pauloDosAnjos.id})`);

  // ============================================================
  // PHASE 11: CECA ADDITIONAL HISTORICAL FIGURES
  // Completing the foundational CECA lineage
  // ============================================================

  // --- Mestre Africano Benedito (Pre-Pastinha, from Angola) ---
  const [africanoBenedito] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Africano Benedito',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Angola, Africa',
      bio: 'Native of Angola, Africa. Taught young Vicente Ferreira Pastinha (age 10, ~1899) when Pastinha was being bullied by an older boy. Known as "Tio Benito" (Uncle Benito) by Pastinha. Represents the DIRECT AFRICAN ORIGIN of the Pastinha Angola lineage. Lived at Rua das Laranjeiras, #26, Salvador, Bahia.',
    })
    .returning();

  console.log(`Created: Mestre Africano Benedito (${africanoBenedito.id})`);

  // --- Mestre Faísca (Current CECA leader) ---
  const [faisca] = await db
    .insert(personProfiles)
    .values({
      name: 'Luís Roberto Ricardo',
      apelido: 'Faísca',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Current leader of CECA/Academia João Pequeno de Pastinha. Started training in São Paulo, founded first group in Mococa-SP (1989). First lesson with João Pequeno at USP in 1991. Moved to Salvador 1996 to be close to João Pequeno. Received mestre title from João Pequeno. Founded CEDANZE. Designated by João Pequeno to "keep CECA alive". Now coordinates CEDANZE Internacional - Academia João Pequeno de Pastinha - CECA with 15+ locations worldwide.',
      achievements:
        'General Coordinator of CEDANZE Internacional. Expanded CECA to Europe (France, Italy, Belgium, Spain, Portugal, Switzerland) and Latin America (Uruguay).',
    })
    .returning();

  console.log(`Created: Mestre Faísca (${faisca.id})`);

  // --- Mestre Decânio (Council of Honor member) ---
  const [decanio] = await db
    .insert(personProfiles)
    .values({
      name: 'Ângelo Augusto Decânio Filho',
      apelido: 'Decânio',
      title: 'mestre',
      birthYearPrecision: 'unknown',
      bio: 'Doctor (Dr.) and mestre. Member of CECA/CEDANZE Council of Honor with lifetime position. Important figure in Capoeira Angola documentation and preservation.',
    })
    .returning();

  console.log(`Created: Mestre Decânio (${decanio.id})`);

  // --- Mestre Jair Moura (Council of Honor member) ---
  const [jairMoura] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Jair Moura',
      title: 'mestre',
      birthYearPrecision: 'unknown',
      bio: 'Filmmaker and writer. Member of CECA/CEDANZE Council of Honor with lifetime position. Important contributor to Capoeira documentation through film and writing.',
    })
    .returning();

  console.log(`Created: Mestre Jair Moura (${jairMoura.id})`);

  // --- Mestre Curió/Curiò (Pastinha student, founded ECAIG Irmãos Gêmeos) ---
  const [curio] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Curiò',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Alagoinhas, Bahia, Brazil',
      bio: 'Trained with Mestre Pastinha as young boy until Pastinha passed away. Founded ECAIG (Escola de Capoeira Angola Irmãos Gêmeos) in 1960 in Alagoinhas, Bahia. Pure Capoeira Angola organization. International network including Banda do Saci (Mexico) which affiliated with ECAIG in 1997.',
      achievements:
        'Founded ECAIG (1960). Pastinha lineage. Direct student representing another branch of the original CECA lineage.',
    })
    .returning();

  console.log(`Created: Mestre Curiò (${curio.id})`);

  // ============================================================
  // PHASE 12: ICAF/FICA ADDITIONAL FIGURES
  // Completing ICAF co-founders and Hawaii chapter
  // ============================================================

  // --- Mestre Jurandir Nascimento (ICAF co-founder, President) ---
  const [jurandir] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Jurandir',
      name: 'Jurandir Nascimento',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Co-founder and President of ICAF/FICA (International Capoeira Angola Foundation). Trained under Mestre Moraes at GCAP. Known for emphasis on music and cultural aspects. Based in USA, travels internationally. Part of the Generation 3 lineage from Pastinha.',
    })
    .returning();

  console.log(`Created: Mestre Jurandir (${jurandir.id})`);

  // --- Mestre Valmir Damasceno (ICAF co-founder, Salvador) ---
  const [valmir] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Valmir',
      name: 'Valmir Damasceno',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Co-founder of ICAF/FICA. Trained under Mestre Moraes at GCAP. Based in Salvador, Bahia, leads FICA activities in Brazil. Part of the Generation 3 lineage from Pastinha.',
    })
    .returning();

  console.log(`Created: Mestre Valmir (${valmir.id})`);

  // --- Trenel Joe (FICA Hawaii leader) ---
  const [trenelJoe] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Trenel Joe',
      name: 'Joe Hoffman',
      title: 'instrutor',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Founder and leader of FICA Hawaii (2005). Trained under Mestre Jurandir Nascimento and Mestre Silvinho. Teaches in Hilo and Pahoa on the Big Island of Hawaii. Uses the ICAF title "Trenel" (advanced instructor level). Has maintained FICA Hawaii for 20 years.',
    })
    .returning();

  console.log(`Created: Trenel Joe (${trenelJoe.id})`);

  // ============================================================
  // PHASE 13: GCAIG IRMÃOS GUERREIROS
  // Family-founded Angola group from São Paulo periphery
  // ============================================================

  // --- Mestre Baixinho (GCAIG founder, father) ---
  const [baixinho] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Baixinho',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Bahia, Brazil',
      bio: 'Founder of Grupo de Capoeira Angola Irmãos Guerreiros (GCAIG) in 1983. Migrated from Bahia to São Paulo, built house in Taboão da Serra in 1970s that became Senzalinha headquarters. Father of Mestre Marrom who he trained from age 8. Co-founded with son Marrom and brothers Guerreiro and Macete.',
    })
    .returning();

  console.log(`Created: Mestre Baixinho (${baixinho.id})`);

  // --- Mestre Marrom (GCAIG co-founder, son of Baixinho) ---
  const [marrom] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Marrom',
      title: 'mestre',
      style: 'angola',
      birthYear: 1970,
      birthYearPrecision: 'approximate',
      birthPlace: 'São Paulo, Brazil',
      bio: 'Co-founder of GCAIG (1983) at age 13. Son of Mestre Baixinho who trained him from age 8. Currently "at the forefront of group activities" in São Paulo. Graduated Physical Education in 2012. Leads Senzalinha headquarters. Represents second-generation leadership in family-founded group.',
    })
    .returning();

  console.log(`Created: Mestre Marrom (${marrom.id})`);

  // --- Mestre Perna (GCAIG European coordinator) ---
  const [perna] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Perna',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Taboão da Serra, São Paulo, Brazil',
      bio: 'European coordinator for GCAIG. Started training at age 9 with Mestre Baixinho and Mestre Marrom at Senzalinha. Moved to Bremen, Germany in 2002, bringing GCAIG to Europe. Founded Centro Cultural Cazuá e.V. in 2004. Received mestre title during GCAIG 30th anniversary in 2013. Coordinates European núcleos across Portugal, Germany, Austria, Poland, Slovakia, Norway.',
    })
    .returning();

  console.log(`Created: Mestre Perna (${perna.id})`);

  // --- Contra-Mestre Kenneth (GCAIG Vienna, trained under Moraes) ---
  const [kenneth] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Kenneth',
      name: 'Kenneth Borges',
      title: 'contra-mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Co-leads GCAIG European expansion from Vienna. Trained at GCAP under Mestre Moraes from 1987 in Salvador. Moved to Vienna 2003 to teach independently. Joined GCAIG in 2008, becoming "right hand" of Mestre Perna in Europe. Brings GCAP lineage into GCAIG. Organizes annual Suncamp event.',
    })
    .returning();

  console.log(`Created: Contra-Mestre Kenneth (${kenneth.id})`);

  // ============================================================
  // PHASE 13: NGOMA CAPOEIRA ANGOLA (formerly Mestre Marrom e Alunos)
  // Mestre Anastácio Marrom (different from GCAIG Marrom)
  // ============================================================

  // --- Mestre Cobrinha Verde (Bateria master at Pastinha's CECA) ---
  const [cobrinhaVerde] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Cobrinha Verde',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      deathYearPrecision: 'unknown',
      bio: "Mestre de Bateria (Master of Music) at Mestre Pastinha's CECA academy. Key figure in preserving Angola musical traditions. Teacher of Mestre Gato Preto.",
    })
    .returning();

  console.log(`Created: Mestre Cobrinha Verde (${cobrinhaVerde.id})`);

  // --- Mestre Gato Preto (Angola master, student of Cobrinha Verde) ---
  const [gatoPerto] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Gato Preto',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Bahia, Brazil',
      bio: 'Known as "Berimbau de Ouro da Bahía" (Golden Berimbau of Bahia). Student of Mestre Cobrinha Verde. Primary Angola teacher of Mestre Anastácio Marrom. Key link in the Pastinha lineage through the musical tradition.',
    })
    .returning();

  console.log(`Created: Mestre Gato Preto (${gatoPerto.id})`);

  // --- Mestre Angolinha (Angola influence) ---
  const [angolinha] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Angolinha',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Bahia, Brazil',
      bio: 'Traditional Angola mestre. Major influence and reference for Mestre Anastácio Marrom in his transition to Angola.',
    })
    .returning();

  console.log(`Created: Mestre Angolinha (${angolinha.id})`);

  // --- Mestre Nô (Angola influence) ---
  const [mestreNo] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Nô',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Bahia, Brazil',
      bio: 'Traditional Angola mestre. Reference and influence for Mestre Anastácio Marrom.',
    })
    .returning();

  console.log(`Created: Mestre Nô (${mestreNo.id})`);

  // --- Mestre Canela (Marrom's first formal teacher) ---
  const [canela] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Canela',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Rio de Janeiro, Brazil',
      bio: 'Based in Engenho Novo, Rio de Janeiro. First formal capoeira teacher of young Anastácio Marrom in the 1970s.',
    })
    .returning();

  console.log(`Created: Mestre Canela (${canela.id})`);

  // --- Mestre Anastácio Marrom (Ngoma founder - different from GCAIG Marrom) ---
  const [anastacioMarrom] = await db
    .insert(personProfiles)
    .values({
      name: 'Henrique Anastácio de Jesus',
      apelido: 'Anastácio Marrom',
      title: 'mestre',
      style: 'angola',
      birthYear: 1963,
      birthYearPrecision: 'exact',
      birthPlace: 'Itabuna, Bahia, Brazil',
      styleNotes:
        'Trained Regional (1970s-1990) under Mestre Canela and Mestre Peixinho at Senzala (red belt). Transitioned to Angola in 1990, studying under Mestre Gato Preto (primary), Angolinha, Nô, and João Grande.',
      bio: 'Founder of Ngoma Capoeira Angola (1990, originally "Marrom Capoeira & Alunos"). Based in Morro da Babilônia favela, Rio de Janeiro for 25+ years. Renamed group to "Ngoma" in 2018 as political statement reaffirming African origins. Opened Casa Ngoma community space in 2020. Known for autonomous continuation model where students establish independent groups while maintaining cultural connection.',
      achievements:
        'Founded Ngoma Capoeira Angola (1990). Opened Casa Ngoma sociocultural space (2020). Network spans 15+ locations across 8 countries.',
    })
    .returning();

  console.log(`Created: Mestre Anastácio Marrom (${anastacioMarrom.id})`);

  // --- Contra-Mestra Tatiana (Ngoma co-founder) ---
  const [tatiana] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Tatiana',
      title: 'contra-mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: "Co-founder of Ngoma Capoeira Angola in Rio de Janeiro. Started Capoeira at age 14. Co-producer of all school projects. Recognized for strengthening and valuing women's leadership in Capoeira culture. Unlike most groups, Ngoma has explicit co-leadership emphasizing women's role.",
    })
    .returning();

  console.log(`Created: Contra-Mestra Tatiana (${tatiana.id})`);

  // --- Mestre Forró (Ngoma Berlin/Hannover) ---
  const [forro] = await db
    .insert(personProfiles)
    .values({
      name: 'Joelson Menezes da Silva',
      apelido: 'Forró',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Belém do Pará, Brazil',
      bio: 'Made Contra-Mestre by Mestre Anastácio Marrom in Rio (2004), later elevated to Mestre. Spent ~15 years in Rio training. Actor, percussionist, and Capoeira Angola mestre. Moved to Hannover, Germany, later Berlin. Leads Forum Brasil and Capoeira Angola Hannover. Known for cross-visitation arrangements between Berlin Ngoma locations.',
    })
    .returning();

  console.log(`Created: Mestre Forró (${forro.id})`);

  // --- Contra-Mestre Stéph (Ngoma Paris) ---
  const [steph] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Stéph',
      title: 'contra-mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Started capoeira in 1998. Spent 15+ years training in Rio with Mestre Anastácio Marrom. Founded Association Oyà in Paris (2018) representing Ngoma. Created scholarship system for refugees and people in precarious situations. Hosts Filhas de Dandara Afro-feminist collective.',
    })
    .returning();

  console.log(`Created: Contra-Mestre Stéph (${steph.id})`);

  // --- Contra-Mestre Bom Cabelo (Ngoma Helsinki/Finland) ---
  const [bomCabelo] = await db
    .insert(personProfiles)
    .values({
      name: 'José Reinaldo Santos Soares',
      apelido: 'Bom Cabelo',
      title: 'contra-mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Brazil',
      bio: 'Longtime student of Mestre Anastácio Marrom. Experience teaching in Brazil and Finland. Co-leads Tambor Vivo / Ngoma Capoeira Angola in Helsinki with CM Carcará.',
    })
    .returning();

  console.log(`Created: Contra-Mestre Bom Cabelo (${bomCabelo.id})`);

  // --- Contra-Mestre Dion Dragas (Ngoma Scotland/Greece) ---
  const [dionDragas] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Dion Dragas',
      title: 'contra-mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Founded "Mão No Chão" (Hand on the Ground) in Edinburgh ~2002. Later rebranded as Ngoma Scotland (Edinburgh, Glasgow, Inverness). Now based in Athens/Crete, Greece. Student of Mestre Anastácio Marrom.',
    })
    .returning();

  console.log(`Created: Contra-Mestre Dion Dragas (${dionDragas.id})`);

  // ============================================================
  // PHASE 14: ANGOLEIROS DO SERTÃO
  // Mestre Cláudio Costa and nucleus network from Feira de Santana
  // ============================================================

  // --- Mestre Di Mola (Cláudio's initial teacher) ---
  const [diMola] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Di Mola',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Feira de Santana, Bahia, Brazil',
      bio: 'Capoeira mestre from Feira de Santana. Initial teacher of Mestre Cláudio Costa (founder of Angoleiros do Sertão).',
    })
    .returning();

  console.log(`Created: Mestre Di Mola (${diMola.id})`);

  // --- Mestre Cláudio Costa (Angoleiros do Sertão founder) ---
  const [claudioCosta] = await db
    .insert(personProfiles)
    .values({
      name: 'Cláudio da Feira',
      apelido: 'Cláudio Costa',
      title: 'mestre',
      style: 'angola',
      birthYear: 1966,
      birthYearPrecision: 'exact',
      birthPlace: 'Feira de Santana, Bahia, Brazil',
      bio: 'Founder of Escola de Capoeira Angoleiros do Sertão in the 1980s. Initially trained under Mestre Di Mola, then primarily through street experience in Feira de Santana. Emphasizes "compromisso" (ethical commitment) philosophy. Known for strict discipline, musical excellence, and integration of Samba Rural into practice. Weekly public rodas on main avenue median strip.',
      achievements:
        'Founded Angoleiros do Sertão (1980s). Network of 20+ núcleos across 6+ countries. Album "Angoleiros do Sertão e do Recôncavo" with Mestre Felipe de Santo Amaro (2004).',
    })
    .returning();

  console.log(`Created: Mestre Cláudio Costa (${claudioCosta.id})`);

  // --- Mestre Felipe de Santo Amaro (collaborator) ---
  const [felipeSantoAmaro] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Felipe de Santo Amaro',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Santo Amaro, Bahia, Brazil',
      bio: 'Traditional Angola mestre from the Recôncavo region of Bahia (coastal area around Salvador). Collaborated with Mestre Cláudio Costa on album "Angoleiros do Sertão e do Recôncavo" (2004) - a collaboration between different regional Angola traditions (Sertão interior + Recôncavo coastal).',
    })
    .returning();

  console.log(`Created: Mestre Felipe de Santo Amaro (${felipeSantoAmaro.id})`);

  // --- Treinel Tito Casal (Berlin nucleus leader) ---
  const [titoCasal] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Tito Casal',
      title: 'treinel',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Long time student of Mestre Cláudio in Brazil. Established Berlin nucleus of Angoleiros do Sertão in 2015. Leads classes for adults and children in Neukölln district.',
    })
    .returning();

  console.log(`Created: Treinel Tito Casal (${titoCasal.id})`);

  // ============================================================
  // PHASE 15: ESCOLA NESTOR CAPOEIRA
  // Scholar-practitioner legacy of Mestre Nestor Capoeira (PhD)
  // ============================================================

  // --- Mestre Leopoldina (Nestor's first teacher) ---
  const [leopoldina] = await db
    .insert(personProfiles)
    .values({
      name: 'Demerval Lopes de Lacerda',
      apelido: 'Leopoldina',
      title: 'mestre',
      style: 'regional',
      birthYear: 1933,
      birthYearPrecision: 'exact',
      birthPlace: 'Rio de Janeiro, Brazil',
      deathYear: 2007,
      deathYearPrecision: 'exact',
      bio: 'Rio de Janeiro capoeira community figure, Regional-oriented. First teacher of Nestor Capoeira (1965-1967) before Nestor moved to Grupo Senzala.',
    })
    .returning();

  console.log(`Created: Mestre Leopoldina (${leopoldina.id})`);

  // --- Mestre Preguiça (Senzala founder, Bimba formado) ---
  const [preguica] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Preguiça',
      name: 'Wandencolque',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Bahia, Brazil',
      bio: "Formado from Mestre Bimba's academy in Bahia. Came to Rio de Janeiro with Acordeon's folk show and stayed, becoming one of the founders of Grupo Senzala. Key influence on Nestor Capoeira, who received red cord from him in 1969.",
    })
    .returning();

  console.log(`Created: Mestre Preguiça (${preguica.id})`);

  // --- Mestre Nestor Capoeira (Scholar-practitioner, PhD, 10 books) ---
  const [nestorCapoeira] = await db
    .insert(personProfiles)
    .values({
      name: 'Nestor Sezefredo dos Passos Neto',
      apelido: 'Nestor Capoeira',
      title: 'mestre',
      style: 'contemporanea',
      birthYear: 1946,
      birthYearPrecision: 'exact',
      birthPlace: 'Belo Horizonte, Minas Gerais, Brazil',
      deathYear: 2025,
      deathYearPrecision: 'exact',
      deathPlace: 'Rio de Janeiro, Brazil',
      styleNotes:
        'Started under Mestre Leopoldina (1965-1967), then Grupo Senzala (1968-1990). Developed own Contemporânea approach emphasizing traditional and modern aspects after founding own school in 1990.',
      bio: 'The most academically accomplished capoeira mestre documented. PhD in Communication and Culture (2001), postdoctoral degree from PUC/SP. Author of 10 books with 120,000+ copies sold worldwide, translated into multiple languages. International pioneer who first brought Senzala Capoeira to Great Britain in 1971 (London School of Contemporary Dance). Received red cord (highest rank) from Senzala in 1969 after only one year. Founded Escola Nestor Capoeira in 1990/1992.',
      achievements:
        'PhD in Communication and Culture (2001). Postdoctoral degree (PUC/SP). 10 published books, 120,000+ copies sold. First Senzala mestre in UK (1971). Engineering degree UFRJ (1969). Performed at Kennedy Center, theaters in London, Amsterdam, Copenhagen, Hamburg.',
    })
    .returning();

  console.log(`Created: Mestre Nestor Capoeira (${nestorCapoeira.id})`);

  // --- Mestre Jorge Itapuã (Nestor's son, first mestre from ENC) ---
  const [jorgeItapua] = await db
    .insert(personProfiles)
    .values({
      name: 'Jorge Itapuã Beiramar',
      apelido: 'Jorge Itapuã',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: "Son of Mestre Nestor Capoeira and filmmaker Rose Lacreta. First mestre trained by Escola Nestor Capoeira. Created 'Movimento Orgânico' (Organic Movement / Organicflow) method - a physical and mental training system developed over 20 years combining capoeira fundamentals with other body techniques. Pioneer in spreading capoeira via internet/video channel.",
      achievements:
        'First mestre graduated from Escola Nestor Capoeira. Created Movimento Orgânico method. Digital pioneer for capoeira instruction.',
    })
    .returning();

  console.log(`Created: Mestre Jorge Itapuã (${jorgeItapua.id})`);

  // --- Mestre Roberto Coelho (Belo Horizonte branch) ---
  const [robertoCoelho] = await db
    .insert(personProfiles)
    .values({
      name: 'Roberto Kanitz',
      apelido: 'Coelho',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: "Coordinates Escola Nestor Capoeira - Belo Horizonte (founded 2018). Established branch in Mestre Nestor's birthplace. Created 'Núcleo de Estudo e Prática da Capoeira - NECA' extension project with UEMG university.",
    })
    .returning();

  console.log(`Created: Mestre Roberto Coelho (${robertoCoelho.id})`);

  // ============================================================
  // PHASE 16: CAPOEIRA ARUANDA AUSTRALIA
  // Split from Capoeira Brasil, independent graduation through Bimba lineage
  // ============================================================

  // --- Mestre Vermelho 27 (Bimba's student, took over his academy) ---
  const [vermelho27] = await db
    .insert(personProfiles)
    .values({
      name: 'José Carlos Andrade Bittencourt',
      apelido: 'Vermelho 27',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: "Student of Mestre Bimba from 1953. When Bimba left Salvador, Vermelho 27 took over the academy. After Bimba's death (1974), renamed it to 'Associação de Capoeira Mestre Bimba' (1975). Key link in preserving the original Regional lineage.",
    })
    .returning();

  console.log(`Created: Mestre Vermelho 27 (${vermelho27.id})`);

  // --- Mestre Boa Gente (multi-style, graduated Borracha) ---
  const [boaGente] = await db
    .insert(personProfiles)
    .values({
      name: 'Vivaldo Conceição Rodrigues',
      apelido: 'Boa Gente',
      title: 'mestre',
      style: 'contemporanea',
      birthYear: 1945,
      birthYearPrecision: 'exact',
      birthPlace: 'Ibicaraí, South Bahia, Brazil',
      styleNotes:
        'Multi-style training: Started with Mestre Antônio Cabeceiro (streets of Ilhéus), trained with Mestre Gato (Escola Baiana de Capoeira Angola), and Mestre Vermelho 27 (Regional, Bimba lineage).',
      bio: 'Founded Associação de Capoeira Mestre Boa Gente in 1981. Independent organization with direct Bimba lineage through Vermelho 27. Multi-style background combining Angola and Regional. Awarded Mestre title to Mestre Borracha (2015).',
    })
    .returning();

  console.log(`Created: Mestre Boa Gente (${boaGente.id})`);

  // --- Mestre Borracha (Aruanda Australia founder) ---
  const [borracha] = await db
    .insert(personProfiles)
    .values({
      name: 'José Amorim',
      apelido: 'Borracha',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Acre, Brazil',
      bio: 'First capoeirista to perform double back somersault without sprung floor or gym mats (1992). Came to Sydney in 1997 as Grupo Capoeira Brasil teacher. Founded independent group Capoeiracre (2005), renamed to Capoeira Aruanda (2007). Awarded Mestre belt by Mestre Boa Gente in 2015 (not through Capoeira Brasil hierarchy). 20+ years teaching in Australia.',
      achievements:
        'First double back somersault without mats (1992). Founded Capoeira Aruanda Australia (2005). Mestre title from Boa Gente (2015). Regional NSW presence: Sydney East, Sydney West, Newcastle.',
    })
    .returning();

  console.log(`Created: Mestre Borracha (${borracha.id})`);

  // ============================================================
  // PHASE 17: CAPOEIRA MANDINGA AOTEAROA (NEW ZEALAND)
  // First capoeira in NZ, style evolution from Regional to Angola
  // Note: Suassuna and João Pequeno already defined above
  // ============================================================

  // --- Mestre Marcelo Caveirinha (Capoeira Mandinga founder) ---
  const [caveirinha] = await db
    .insert(personProfiles)
    .values({
      name: 'Marcelo Pereira',
      apelido: 'Caveirinha',
      title: 'mestre',
      style: 'contemporanea',
      birthYear: 1959,
      birthYearPrecision: 'exact',
      birthPlace: 'São Paulo, Brazil',
      bio: 'Trained under Mestre Suassuna at Cordão de Ouro. One of the last generation to train directly with Suassuna. Left Brazil in 1984, moved to Oakland, California. One of only three people teaching capoeira in USA at that time. Founded Associação de Capoeira Senzala Grande (1984), renamed to Capoeira Mandinga (1995). International expansion: USA, New Zealand, Israel, China, Taiwan, Japan, Italy, Iceland, Mexico, Brazil.',
    })
    .returning();

  console.log(`Created: Mestre Marcelo Caveirinha (${caveirinha.id})`);

  // Note: João Pequeno already defined above in PHASE 1

  // --- Mestre Jogo de Dentro (João Pequeno student, Semente do Jogo) ---
  const [jogoDeDentro] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Jogo de Dentro',
      title: 'mestre',
      style: 'angola',
      birthYear: 1965,
      birthYearPrecision: 'exact',
      birthPlace: 'Alagoinhas, Bahia, Brazil',
      bio: 'Started capoeira 1982 at Forte Santo Antônio with Mestre João Pequeno. Nicknamed by Mestre João Grande (1983): "Jogo de Dentro" (Inside Game). Founded Semente do Jogo de Angola (September 9, 1990). Recognized as Mestre by João Pequeno (February 27, 1994). Author of "Capoeira Angola e Ancestralidade" (2020). Key influence on Capoeira Mandinga Aotearoa Angola transition.',
    })
    .returning();

  console.log(`Created: Mestre Jogo de Dentro (${jogoDeDentro.id})`);

  // --- Mestre Roxinho (ECAMAR, first Bahia Angola master in Australia) ---
  const [roxinho] = await db
    .insert(personProfiles)
    .values({
      name: 'Edielson da Silva Miranda',
      apelido: 'Roxinho',
      title: 'mestre',
      style: 'angola',
      birthYear: 1969,
      birthYearPrecision: 'exact',
      birthPlace: 'Ilha de Veracruz, Bahia, Brazil',
      bio: 'Founded ECAMAR (Escola de Capoeira Angola Mato Rasteiro) in Salvador (1998). Mestre title from Mestre Virgilio (2002). Immigrated to Australia (2006), establishing ECAMAR Sydney. First Bahia Angola master to establish school in Australia. Founded Project Bantu (youth engagement). Key supporter and inspiration for Capoeira Mandinga Aotearoa Angola evolution.',
    })
    .returning();

  console.log(`Created: Mestre Roxinho (${roxinho.id})`);

  // --- Mestre Brabo (Grant Cole, first NZ capoeira master) ---
  const [brabo] = await db
    .insert(personProfiles)
    .values({
      name: 'Grant Cole',
      apelido: 'Brabo',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'New Zealand',
      styleNotes:
        'Trained Regional/Contemporânea under Mestre Marcelo Caveirinha (1984-2004). Organization transitioned to pure Capoeira Angola around 2004 through influences from João Pequeno, Jogo de Dentro, and Roxinho.',
      bio: 'First capoeira master in New Zealand history (mestre title 2007). Met Mestre Marcelo Caveirinha in USA (1983), began training (1984). Returned to NZ (November 1991). Founded Capoeira Mandinga Aotearoa (1992) - first capoeira ever taught in New Zealand. Professor title (1999). Mestre title from Caveirinha (April 21, 2007). 33+ years training relationship with Mestre Marcelo.',
      achievements:
        'First person to bring capoeira to New Zealand (1992). First New Zealand capoeira master (2007). National organization with 4 cities: Auckland, Wellington, Taranaki, Christchurch.',
    })
    .returning();

  console.log(`Created: Mestre Brabo (${brabo.id})`);

  // ============================================================
  // PHASE 18: CAPOEIRA ANGOLA CENTER KIBERA (KENYA)
  // First East African branch of João Grande's network
  // "Reverse diaspora" - capoeira returns to Africa
  // ============================================================

  // --- Contra-Mestre Salim Rollins (CACK founder) ---
  const [salimRollins] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Salim',
      name: 'Salim Rollins',
      title: 'contra-mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Kenya',
      bio: "Founded Capoeira Angola Center Kibera (CACK) in 2015 - first East African branch of Mestre João Grande's network. Trained with João Grande in NYC from 1995 (20+ years). Returned to Kenya in 2014. Also yoga instructor and event producer. Organized Mandinga Ancestral festival (2017) bringing João Grande to Africa for first time in 51 years. Operates programs in Kibera slum (Nairobi) and Luanda (Angola).",
      achievements:
        'Founded first East African Capoeira Angola center (2015). Organized Mandinga Ancestral festival (2017). Trained 200+ students. Pioneer of "reverse diaspora" - bringing capoeira home to Africa.',
    })
    .returning();

  console.log(`Created: Contra-Mestre Salim Rollins (${salimRollins.id})`);

  // ============================================================
  // PHASE 19: GRUPO CANDEIAS DE CAPOEIRA (GOIÁS, BRAZIL)
  // Regional powerhouse with Bimba lineage through his son Formiga
  // Founded 1977, current 10,000+ students, 17 countries
  // ============================================================

  // --- Formiga (Bimba's biological son) ---
  const [formiga] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Formiga',
      title: 'mestre',
      style: 'regional',
      bio: 'Biological son of Mestre Bimba (founder of Capoeira Regional). Taught Carlinhos Chuchu who founded Grupo Candeias. Important figure in transmitting Bimba lineage to next generation, particularly in Goiás region.',
      achievements:
        'Biological son of Mestre Bimba. Key link in Bimba lineage transmission to Centro-Oeste Brazil. Teacher of Carlinhos Chuchu.',
    })
    .returning();

  console.log(`Created: Mestre Formiga (${formiga.id})`);

  // --- Mestre Osvaldo (Goiás pioneer, late 1960s) ---
  const [mestreOsvaldo] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Osvaldo',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      bio: 'Pioneer of capoeira in Goiânia, Goiás (late 1960s). Taught at Jóquei Clube, Colégio Carlos Chagas, and an academy in downtown Goiânia. Made historic contribution by bringing Mestre Bimba himself to Goiânia for the first graduation ceremony of his students - a landmark moment connecting Goiás directly to the legendary founder of Capoeira Regional.',
      achievements:
        "Pioneer of capoeira in Goiás (late 1960s). Organized Mestre Bimba's historic visit to Goiânia. Subject of book 'A História da Capoeira de Goiás Contada Por Seus Pioneiros'.",
    })
    .returning();

  console.log(`Created: Mestre Osvaldo (${mestreOsvaldo.id})`);

  // --- Mestre Sabú (Goiás pioneer, late 1960s) ---
  const [mestreSabu] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Sabú',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      bio: 'Pioneer of capoeira in Goiânia, Goiás (late 1960s). Conducted open rodas at Praça Cívica and Feira Hippie in central Goiânia. Made and sold capoeira instruments. Together with Mestre Osvaldo, planted the first seeds of capoeira culture in Goiás.',
      achievements:
        "Pioneer of capoeira in Goiás (late 1960s). Promoted capoeira publicly in Goiânia. Instrument maker. Subject of book 'A História da Capoeira de Goiás Contada Por Seus Pioneiros'.",
    })
    .returning();

  console.log(`Created: Mestre Sabú (${mestreSabu.id})`);

  // --- Carlinhos Chuchu (founder of Grupo Candeias) ---
  const [carlinhosChuchu] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Carlinhos Chuchu',
      name: 'Carlos Antônio',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      bio: "Physical Education student who founded what became Grupo Candeias. In 1975, negotiated with SESC Universitário to establish formal capoeira training space - creating sustainable funding model where SESC members trained free while others paid directly. Formally established Grupo de Capoeira Anglo-Regional in 1977. Student of Formiga (Mestre Bimba's son), giving him direct biological lineage to Bimba.",
      achievements:
        'Founded Grupo Candeias (1977, originally Anglo-Regional). Established SESC partnership model. Direct student of Formiga (Bimba lineage). Pioneered capoeira institutionalization in Goiás.',
    })
    .returning();

  console.log(`Created: Mestre Carlinhos Chuchu (${carlinhosChuchu.id})`);

  // --- Mestre Passarinho (2nd leader of Candeias) ---
  const [passarinho] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Passarinho',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      bio: 'Second leader of what became Grupo Candeias. Assumed leadership in 1978 and renamed the group to Grupo São Bento Pequeno (after traditional capoeira rhythm). Led during critical early expansion period before passing leadership to Mestre Suíno in 1981.',
      achievements:
        'Second leader of Grupo Candeias (1978-1981). Renamed group to São Bento Pequeno. Part of early leadership that built foundation for later expansion.',
    })
    .returning();

  console.log(`Created: Mestre Passarinho (${passarinho.id})`);

  // --- Mestre Suíno (current leader since 1981) ---
  const [suino] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Suíno',
      name: 'Elto Pereira de Brito',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Goiás, Brazil',
      bio: 'First mestre trained/graduated by Grupo Candeias itself. Assumed leadership at SESC in 1981. Primary architect of the group\'s expansion and systematization. Led unification in 1991 when competing graduate-led groups consolidated under "Candeias" name. Implemented six operational areas (historical-cultural, technical, musical, philosophical, pedagogical, administrative). Current president of Associação de Capoeira Candeias. Under his leadership: 6 consecutive JEBS championships (1983-1988), expansion to 13 Brazilian states and 17 countries, 10,000+ students.',
      achievements:
        'First mestre graduated by Candeias. President since 1981 (44+ years). Six consecutive JEBS championships (1983-1988). Built organization to 10,000+ students, 17 countries. Published 7 books, 4 CDs.',
    })
    .returning();

  console.log(`Created: Mestre Suíno (${suino.id})`);

  // ============================================================
  // PHASE 20: ACAD - ASSOCIAÇÃO DE CAPOEIRA ANGOLA DOBRADA
  // Founded 1992 in Kassel, Germany - one of first Angola orgs in Europe
  // Dual lineage: GCAP (Moraes) + FICA (Cobra Mansa)
  // ============================================================

  // --- Mestre Rogério (ACAD co-founder) ---
  const [rogerio] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Rogério',
      name: 'Rogério Soares Peixoto',
      title: 'mestre',
      style: 'angola',
      birthYear: 1954,
      birthYearPrecision: 'exact',
      birthPlace: 'Rio de Janeiro, Brazil',
      bio: 'Started capoeira 1972 in Rio de Janeiro. Received mestre title 1989 with dual recognition from both Mestre Moraes (GCAP) and Mestre Cobra Mansa (FICA). Founded first Capoeira Angola school in Belo Horizonte (1989). Moved to Germany 1990, co-founded ACAD (1992) - one of first Angola organizations in Europe. Currently lives in Düsseldorf, teaches regularly in Frankfurt, Kassel, Hamburg, Freiburg.',
      achievements:
        'First Capoeira Angola school in Belo Horizonte (1989). Co-founded ACAD (1992) - early European Angola presence. Dual lineage recognition from GCAP and FICA. 11+ locations across 3 countries.',
    })
    .returning();

  console.log(`Created: Mestre Rogério (${rogerio.id})`);

  // --- Mestre Índio (ACAD co-founder) ---
  const [indio] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Índio',
      name: 'Carlos Roberto Gallo',
      title: 'mestre',
      style: 'angola',
      birthYear: 1963,
      birthYearPrecision: 'exact',
      birthPlace: 'Várzea da Palma, Minas Gerais, Brazil',
      bio: 'Co-founded ACAD in 1992 with Mestre Rogério in Kassel, Germany. At founding was not yet mestre (likely Contramestre or Professor). Received mestre title in 2004 from Mestre Rogério - 12 years after co-founding ACAD. Invited Rogério to Germany in 1990.',
      achievements: 'Co-founded ACAD (1992). Titled Mestre 2004 by co-founder Rogério.',
    })
    .returning();

  console.log(`Created: Mestre Índio (${indio.id})`);

  // ============================================================
  // PHASE 21: CAI NA CAPOEIRA (HUDSON VALLEY, NY)
  // CDO affiliate under remote supervision from Brazil
  // Shows small regional affiliate expansion pattern
  // ============================================================

  // --- Mestre Esquilo (CDO Sete Lagoas, supervises Cabeção) ---
  const [esquilo] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Esquilo',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Sete Lagoas, Minas Gerais, Brazil',
      bio: 'Leads Cordão de Ouro nucleus in Sete Lagoas, Minas Gerais, Brazil. Trained Contra Mestre Cabeção starting in 1996. Supervises Cai Na Capoeira (Hudson Valley, NY) remotely from Brazil, maintaining CDO lineage and standards.',
      achievements: 'Leads CDO Sete Lagoas. Trained Contra Mestre Cabeção. Remote supervision of US affiliate.',
    })
    .returning();

  console.log(`Created: Mestre Esquilo (${esquilo.id})`);

  // --- Contra Mestre Cabeção (Cai Na Capoeira founder) ---
  const [cabecao] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Cabeção',
      name: 'Rafael Teixeira',
      title: 'contra-mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Brazil',
      bio: "Started training with Mestre Esquilo in Sete Lagoas, Minas Gerais (June 1996). Bachelor's degree in Physical Education (Uni-BH). 25+ years capoeira experience. Moved to USA April 2011, started teaching Hudson Valley NY area. Founded Cai Na Capoeira January 2012. International experience in Brazil, Israel, USA.",
      achievements:
        "Founded Cai Na Capoeira (2012). Bachelor's in Physical Education. 25+ years capoeira. 5+ locations in Hudson Valley NY.",
    })
    .returning();

  console.log(`Created: Contra Mestre Cabeção (${cabecao.id})`);

  // ============================================================
  // PHASE 22: ESCOLA DE CAPOEIRA ANGOLA NZINGA (GERMANY)
  // Pioneer European capoeira, Filhos de Angola lineage from Rio
  // Founded 1985, Sommer-Meeting 1987-2004
  // ============================================================

  // --- Besouro Mangangá (legendary historical capoeirista) ---
  const [besouro] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Besouro Mangangá',
      name: 'Manuel Henrique Pereira',
      title: 'mestre',
      style: 'angola',
      birthYear: 1897,
      birthYearPrecision: 'year',
      birthPlace: 'Santo Amaro da Purificação, Bahia, Brazil',
      deathYear: 1924,
      deathYearPrecision: 'year',
      deathPlace: 'Maracangalha, Bahia, Brazil',
      bio: 'Legendary capoeirista of the Recôncavo Baiano region. Known as "Besouro Cordão de Ouro" (Golden Cord Beetle). Famous for his skill and mystical abilities. Died young (age ~27) but became one of most legendary figures in capoeira history. Trained under Tio Alípio. Teacher of Mestre Cobrinha Verde (his cousin).',
      achievements:
        'Legendary status in capoeira history. Cultural icon. Teacher of Cobrinha Verde. Subject of films and songs.',
    })
    .returning();

  console.log(`Created: Mestre Besouro Mangangá (${besouro.id})`);

  // --- Mestre Roque (Founder of Filhos de Angola, Rio) ---
  const [mestreRoque] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Roque',
      name: 'Roque Mendes dos Santos',
      title: 'mestre',
      style: 'angola',
      birthYear: 1938,
      birthYearPrecision: 'year',
      birthPlace: 'Salvador/Cachoeira, Bahia, Brazil',
      bio: "From Bahia angoleiro tradition. Came to Rio de Janeiro in 1956 via Navy, settled in Pavão/Pavãozinho favela (between Ipanema and Copacabana). Founded 'Filhos de Angola' (Sons of Angola) in 1960 - one of the founding lineages of capoeira contemporânea in Rio. Known for 'Line of São Bento' - faster Angola style. Described as running a 'quilombo' in the most expensive area of Rio.",
      achievements:
        "Founded Filhos de Angola (1960). Pioneer of capoeira in Rio's South Zone favelas. One of founding lineages of capoeira contemporânea. Trained Adilson, Paulo Siqueira, and others.",
    })
    .returning();

  console.log(`Created: Mestre Roque (${mestreRoque.id})`);

  // --- Mestre Adilson Camisa Preta (student of Roque) ---
  const [adilsonCamisaPreta] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Camisa Preta',
      name: 'Adilson',
      title: 'mestre',
      style: 'angola',
      birthYear: 1952,
      birthYearPrecision: 'year',
      birthPlace: 'Morro do Cantagalo, Rio de Janeiro, Brazil',
      deathYearPrecision: 'decade',
      bio: "Student of Mestre Roque. Took over leadership of Filhos de Angola school in 1970s. Direct teacher of Mestre Paulo Siqueira. Worked with Paulo in theatrical productions at venues like 'Bahia Saravá' show and Intercontinental Hotel Vidigal. Granted Paulo the mestre title. Died in the 1990s.",
      achievements: 'Led Filhos de Angola school. Trained and titled Mestre Paulo Siqueira. Theatrical performer.',
    })
    .returning();

  console.log(`Created: Mestre Adilson Camisa Preta (${adilsonCamisaPreta.id})`);

  // --- Mestre Paulo Siqueira (founder of Nzinga Germany) ---
  const [pauloSiqueira] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Paulo Siqueira',
      name: 'Paulo Siqueira',
      title: 'mestre',
      style: 'angola',
      birthYear: 1955,
      birthYearPrecision: 'exact',
      birthPlace: 'Rio de Janeiro, Brazil',
      bio: "Started capoeira ~1972 at Mestre Roque's academy on Morro do Pavão. Trained under Mestre Roque and Mestre Adilson Camisa Preta. Also studied classical ballet with Mercedes Baptista (first Black dancer at Rio Municipal Theatre). Performed professionally. Moved to Germany 1980, permanent 1985. Founded Escola de Capoeira Angola Nzinga in Hamburg 1985. Organized Capoeira Sommer-Meeting 1987-2004 (300-600 participants, largest capoeira event outside Brazil). Pioneer of capoeira in Europe.",
      achievements:
        'Founded Nzinga Germany (1985). Organized Capoeira Sommer-Meeting 17 years (1987-2004). Pioneer of European capoeira. 40+ years teaching in Hamburg. Writing book on European capoeira history.',
    })
    .returning();

  console.log(`Created: Mestre Paulo Siqueira (${pauloSiqueira.id})`);

  // ============================================================
  // PHASE 23: CAPOEIRA BEIRA-MAR (BRAZIL & USA)
  // Regional lineage: Bimba → Suassuna → Medicina → Tarzan
  // Unique reunion/merger pattern: Grupo Bantu → Beira-Mar
  // ============================================================

  // --- Mestre Medicina (Suassuna's disciple, remained in Bahia) ---
  const [medicina] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Medicina',
      name: 'Luiz Medicina',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Bahia, Brazil',
      bio: "Disciple of Mestre Suassuna. When Suassuna moved to São Paulo seeking better life, Medicina remained in Bahia. 'At that time was not yet a mestre' but later 'began forming disciples throughout Bahia'. Key intermediary generation transmitting Suassuna lineage in Bahia. Taught Mestre Tarzan (founder of Beira-Mar).",
      achievements:
        'Preserved and transmitted Suassuna lineage in Bahia while Suassuna built São Paulo presence. Trained Mestre Tarzan and others.',
    })
    .returning();

  console.log(`Created: Mestre Medicina (${medicina.id})`);

  // --- Mestre Tarzan (founder of Beira-Mar Brazil) ---
  const [tarzan] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Tarzan',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Brazil',
      bio: "Direct lineage from Bimba through Suassuna and Medicina (generation 4). 1974: Arrived in Campinas, São Paulo 'by indication of Mestre Suassuna' - suggests Suassuna sent him to establish presence. Founded Associação Desportiva e Cultural de Capoeira Beira Mar with schools in Araçatuba and Campinas. 200+ students in Brazil. 35+ years experience. Visits USA when possible.",
      achievements:
        'Founded Beira-Mar Brazil (1970s-80s). 200+ students. 35+ years experience. Established international organization spanning Brazil, USA, South Korea.',
    })
    .returning();

  console.log(`Created: Mestre Tarzan (${tarzan.id})`);

  // --- Contra Mestre Bundo (US representative) ---
  const [bundo] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Bundo',
      title: 'contra-mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Brazil',
      bio: "Started training 1984 under Mestre Tarzan (first mestre). Also trained under Mestres Canhão, Gladson, Burguês, Paulo Gomes, Ananias. 1990: Professor title under Caiçara and Lampião. Contra-Mestre title from Mestre Ananias before moving to USA. Founded Grupo Bantu in Jacksonville, FL (independent). Maintained contact with Tarzan, later renamed to 'Bantu Beira-Mar', then full merger as US representative.",
      achievements:
        'US representative for Beira-Mar Capoeira. Founded Grupo Bantu → merged back with master organization. 5+ USA locations across Florida, Kentucky, Colorado.',
    })
    .returning();

  console.log(`Created: Contra Mestre Bundo (${bundo.id})`);

  // ============================================================
  // PHASE 24: CAPOEIRA LONGE DO MAR (MEXICO)
  // First Mexican mestres, dual lineage (Regional + Angola)
  // Split from Banda do Saci for "capoeira without labels"
  // ============================================================

  // --- Mariano Andrade (Argentine pioneer who brought capoeira to Mexico) ---
  const [marianoAndrade] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Mariano Andrade',
      name: 'Mariano Andrade',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Argentina',
      bio: 'Argentine who brought capoeira to Mexico. March 16, 1992: Taught first formal capoeira class in Mexico at Antiguo Colegio de San Ildefonso, Mexico City (organized by UNAM Dance Department). 1994: First batizado in Mexico with Mestre Delei. 1995: Founded Ollin-Bao (Afro-American cultures promotion). 1996: Founded Banda do Saci - first registered capoeira group in Mexico. 1997: Affiliated with ECAIG (Mestre Curiò). 1998: Banda do Saci became exclusively Capoeira Angola.',
      achievements:
        'First capoeira teacher in Mexico (1992). Founded first registered capoeira group in Mexico (Banda do Saci, 1996). Pioneer who planted capoeira in Mexico.',
    })
    .returning();

  console.log(`Created: Mariano Andrade (${marianoAndrade.id})`);

  // Note: Mestre Curiò (ECAIG founder) already defined above in CECA/Academia section as 'curio'

  // --- Mestre Cabello (Angola mestre, OuroVerde farm) ---
  const [cabello] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Cabello',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Bahia, Brazil',
      bio: "Capoeira Angola mestre. Directs OuroVerde cultural farm in Bahia, Brazil. Directs Barracão d'Angola cultural center in Serra Grande, Bahia. Representatives in 5 locations (Brazil, Mexico, USA). 2008: Recognized Longe do Mar professor graduations alongside Mestre Acordeón - dual validation from Angola tradition.",
      achievements:
        "Directs OuroVerde cultural farm. Directs Barracão d'Angola. Validated Longe do Mar graduations (2008) - dual recognition with Regional mestre.",
    })
    .returning();

  console.log(`Created: Mestre Cabello (${cabello.id})`);

  // --- Mestre Cigano (first Mexican mestre) ---
  const [cigano] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Cigano',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Mexico',
      bio: 'First Mexican to achieve Mestre rank. Currently co-leading Longe do Mar. Represents achievement of highest capoeira rank by Mexican-trained capoeirista. Trained under Mariano Andrade tradition, graduated through Longe do Mar system with dual lineage recognition (Regional via Acordeón, Angola via Cabello).',
      achievements: 'First Mexican mestre. Co-leads Longe do Mar. Historic achievement for Mexican capoeira community.',
    })
    .returning();

  console.log(`Created: Mestre Cigano (${cigano.id})`);

  // --- Mestre Acordeon (Regional lineage authority who validated Longe do Mar) ---
  const [acordeon] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Acordeon',
      name: 'Ubirajara Almeida',
      title: 'mestre',
      style: 'regional',
      birthYear: 1943,
      birthYearPrecision: 'year',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Student of Mestre Bimba (founder of Capoeira Regional). Came to the United States in 1978 and established himself as a major figure in spreading Capoeira Regional internationally. Founded the United Capoeira Association (UCA). Recognized authority in Regional lineage. 2005: Granted Contra-Mestre title to Adolfo Flores of Longe do Mar, providing Regional lineage validation. Co-validated Longe do Mar professor graduations in 2008 alongside Angola Mestre Cabello.',
      achievements:
        'Direct student of Mestre Bimba. Founded UCA. International Regional authority. Validated Mexican capoeira graduations.',
    })
    .returning();

  console.log(`Created: Mestre Acordeon (${acordeon.id})`);

  // --- Contra-Mestre Rosita (first Mexican woman contra-mestre) ---
  const [rosita] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Rosita',
      name: 'Rosalinda Pérez',
      title: 'contra-mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Mexico',
      bio: 'First Mexican woman to achieve Contra-Mestre rank. Co-founder of Longe do Mar (May 1998). Student of Mariano Andrade. Founding member of Banda do Saci. Left with two others to found Longe do Mar when Banda do Saci shifted to exclusive Capoeira Angola. Currently co-leading Longe do Mar.',
      achievements:
        "First Mexican woman contra-mestre. Co-founded Longe do Mar (1998). Women's leadership in capoeira.",
    })
    .returning();

  console.log(`Created: Contra-Mestre Rosita (${rosita.id})`);

  // --- Contra-Mestre Adolfo Flores (co-founder, director) ---
  const [adolfoFlores] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Adolfo Flores',
      name: 'Adolfo Flores',
      title: 'contra-mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Mexico',
      bio: 'Co-founder of Longe do Mar (May 1998). Became director of Longe do Mar from founding. Student of Mariano Andrade. Founding member of Banda do Saci. 2005: Received Contra-Mestre rank from Mestre Acordeón (Regional lineage). Still active as of 2025.',
      achievements:
        'Co-founded Longe do Mar (1998). Director since founding. Contra-Mestre title from Mestre Acordeón (2005).',
    })
    .returning();

  console.log(`Created: Contra-Mestre Adolfo Flores (${adolfoFlores.id})`);

  // --- Iñaki Garrido (co-founder) ---
  const [inakiGarrido] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Iñaki Garrido',
      name: 'Iñaki Garrido',
      birthYearPrecision: 'unknown',
      birthPlace: 'Mexico',
      bio: 'Co-founder of Longe do Mar (May 1998). Student of Mariano Andrade. Founding member of Banda do Saci. One of three who left to found Longe do Mar when parent group shifted to exclusive Angola style.',
      achievements: 'Co-founded Longe do Mar (1998).',
    })
    .returning();

  console.log(`Created: Iñaki Garrido (${inakiGarrido.id})`);

  // ============================================================
  // PHASE 25: CAPOEIRA MANDINGA HANGZHOU (CHINA)
  // CDO lineage via blessed split. Russian founder in China.
  // First capoeira instruction in China (2005 via Shanghai branch).
  // ============================================================

  // --- Mestre Marcelo Caveirinha (founder of Capoeira Mandinga) ---
  const [marceloCaveirinha] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Caveirinha',
      name: 'Marcelo Pereira',
      title: 'mestre',
      style: 'contemporanea',
      birthYear: 1959,
      birthYearPrecision: 'year',
      birthPlace: 'São Paulo, Brazil',
      bio: 'Founder of Capoeira Mandinga. Student of Mestre Suassuna (CDO co-founder). In 1984, was one of only three people teaching capoeira in the entire United States. Pioneer who brought capoeira to Oakland, California.',
      achievements:
        '30+ years teaching. Founded Associação de Capoeira Senzala Grande (1984) renamed Capoeira Mandinga (1995). Built international network spanning 15+ countries.',
    })
    .returning();

  console.log(`Created: Mestre Marcelo Caveirinha (${marceloCaveirinha.id})`);

  // --- Diego Pappalardo (first capoeira teacher in China) ---
  const [diegoPappalardo] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Diego',
      name: 'Diego Pappalardo',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Italy',
      bio: 'Italian capoeirista who became the first person to teach capoeira in China (Shanghai, 2005). Chief instructor of Capoeira Mandinga Shanghai. Student of Mestre Marcelo Caveirinha.',
      achievements:
        'First capoeira instructor in China (2005). Established capoeira as an art form in a country of 1.4 billion people. Taught Instrutor Alex who expanded to multiple Chinese cities.',
    })
    .returning();

  console.log(`Created: Diego Pappalardo (${diegoPappalardo.id})`);

  // --- Instrutor Alex (Alex Maltsev) - Russian founder of Hangzhou branch ---
  const [alexMaltsev] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Alex',
      name: 'Alex Maltsev',
      title: 'instrutor',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Russia',
      bio: 'Russian capoeirista who lived 25 years in China. Founded Capoeira Mandinga Hangzhou (2014) and supervised branches in Hefei, Chengdu, and Wenzhou. Self-described "pioneer of capoeira in China". Also founder/editor of Magazeta (Russian-language China magazine). Certified by Mestre Edan and Mestre Cueca (CDO mestres). Relocated to Thailand in 2023 due to family crisis.',
      achievements:
        'Blue belt/Instrutor (2019). Founded or supervised 4+ branches in China. Created online course reaching thousands across China. Trained students who became teachers leading their own groups.',
    })
    .returning();

  console.log(`Created: Instrutor Alex (${alexMaltsev.id})`);

  // --- Mestra Luar do Sertão (Tucson founder) ---
  const [luarDoSertao] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Luar do Sertão',
      title: 'mestra',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'Female mestre who founded Capoeira Mandinga Tucson (1996). One of the few female mestres in the Mandinga network. Student of Mestre Marcelo Caveirinha.',
      achievements: 'Founded Capoeira Mandinga Tucson (1996). Leads Capoeira Institute Southwest.',
    })
    .returning();

  console.log(`Created: Mestra Luar do Sertão (${luarDoSertao.id})`);

  // --- Mestre Edan (CDO Russia founder) ---
  const [mestreEdan] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Edan',
      name: 'Edan Harrari',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'CDO (Cordão de Ouro) mestre who founded CDO in Russia in early 1990s. Part of the Capoeira Instructors Course that certified Instrutor Alex, revealing hidden CDO connections even in separate organizations like Mandinga.',
      achievements: 'Founded CDO Russia (early 1990s). Certified instructors across multiple organizations.',
    })
    .returning();

  console.log(`Created: Mestre Edan (${mestreEdan.id})`);

  // --- Mestre Cueca (CDO Moscow leader) ---
  const [mestreCueca] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Cueca',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'CDO mestre who leads CDO Moscow with 30+ training halls. Part of the certification system that trained Instrutor Alex, demonstrating cross-organizational connections within the CDO lineage network.',
      achievements: 'Leads CDO Moscow with 30+ halls. Certified instructors across multiple organizations.',
    })
    .returning();

  console.log(`Created: Mestre Cueca (${mestreCueca.id})`);

  // --- Ed Zingu (Beijing instructor from South Africa) ---
  const [edZingu] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Ed Zingu',
      name: 'Ed Zingu',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Cape Town, South Africa',
      bio: 'South African capoeirista who taught capoeira in Beijing, China. Part of the early wave of non-Brazilian instructors bringing capoeira to Asia.',
      achievements:
        'Taught capoeira at Workers Stadium area in Beijing. Mixed classes with Chinese and foreign students.',
    })
    .returning();

  console.log(`Created: Ed Zingu (${edZingu.id})`);

  // ============================================================
  // PHASE 26: CAPOEIRA ZOADOR (JAPAN)
  // Unknown lineage - American founder in Tokyo.
  // Claims "pioneer of capoeira in Asia" and "longest-running professional school in Asia"
  // ============================================================

  // --- Mestre Sucuri (American founder of Capoeira Zoador, Japan) ---
  const [mestreSucuri] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Sucuri',
      name: 'Arturo Urena Hamelitz',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'San Diego, California, USA',
      bio: 'American capoeirista who moved to Tokyo in 1999 to teach professionally. Founded Capoeira Zoador Academy in 2003. First non-Brazilian to produce original capoeira music. M.A. from Waseda University (2012) with thesis on "Globalization of Afro-Brazilian Popular Culture in Japan". Author of two books on capoeira philosophy. Self-described "pioneer of capoeira in Asia". Training lineage unknown despite research.',
      achievements:
        'Founded Capoeira Zoador (2003). First non-Brazilian capoeira music producer. M.A. in International Relations (Waseda, 2012). Published "The Path of Capoeira" (2014) and "Capoeira Fire" (2022). 26+ years teaching in Japan.',
    })
    .returning();

  console.log(`Created: Mestre Sucuri (${mestreSucuri.id})`);

  // --- Contramestre Linguica (co-instructor at Zoador) ---
  const [linguica] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Linguica',
      title: 'contra-mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      bio: 'Co-instructor at Capoeira Zoador in Tokyo. Long-term student of Mestre Sucuri. Teaches at Ota-ku and Harajuku locations.',
      achievements: 'Achieved Contramestre rank. Co-instructs at Capoeira Zoador.',
    })
    .returning();

  console.log(`Created: Contramestre Linguica (${linguica.id})`);

  // ============================================================
  // PHASE 27: CAPOEIRA BATUQUE JAPÃO
  // Clear Mestre Waldemar Angola lineage. Branch model with LA HQ.
  // ============================================================

  // --- Mestre Waldemar da Paixão (legendary Angola master) ---
  const [waldemar] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Waldemar',
      name: 'Waldemar da Paixão',
      title: 'mestre',
      style: 'angola',
      birthYear: 1916,
      birthYearPrecision: 'year',
      deathYear: 1990,
      deathYearPrecision: 'year',
      birthPlace: 'Ilha de Maré, Bahia, Brazil',
      bio: 'Legendary Capoeira Angola master from Liberdade neighborhood, Salvador. Started capoeira in 1936. Trained under multiple masters: Canário Pardo, Peripiri, Talabi, Siri-de-Mangue, Ricardo. Independent Angola lineage parallel to Mestre Pastinha. Also influenced Mestre Bimba and Cobrinha Verde, demonstrating cross-lineage impact on both Angola and Regional traditions.',
      achievements:
        'Legendary Angola master representing traditional Bahian lineage independent of Pastinha school. Cross-influenced both Angola and Regional development.',
    })
    .returning();

  console.log(`Created: Mestre Waldemar (${waldemar.id})`);

  // --- Mestre Amen (Joselito do Espirito Santo) ---
  const [mestreAmen] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Amen',
      name: 'Joselito do Espirito Santo',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Brazilian Angola mestre, student of Mestre Waldemar and Mestre Avila in Liberdade, Salvador. Founded Brasil Brasil Cultural Center in Santa Monica, California (1989). Choreographer for "Only the Strong" (1993) - major Hollywood film that brought capoeira to mainstream American awareness. Also choreographed "Kickboxer IV". Regular visits to Japan for batizados since 2009.',
      achievements:
        'Founded Brasil Brasil Cultural Center (1989, LA). 35+ years teaching. Film choreographer ("Only the Strong" 1993). Established Japan branch (2009). Carries Mestre Waldemar lineage internationally.',
    })
    .returning();

  console.log(`Created: Mestre Amen (${mestreAmen.id})`);

  // --- Contra Mestra Pomba (Yoko) ---
  const [pomba] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Pomba',
      name: 'Yoko',
      title: 'contra-mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Female Contra Mestra in Japan branch of Capoeira Batuque. Specializes in choreography. Student of Mestre Amen. Notable as female leader in traditionally male-dominated Angola tradition. Part of distributed leadership model in Japan with four co-equal senior instructors.',
      achievements:
        'Achieved Contra Mestra rank (13+ years training). Choreography specialty. Senior instructor in Japan.',
    })
    .returning();

  console.log(`Created: Contra Mestra Pomba (${pomba.id})`);

  // --- Contra Mestre Pensador (Jun Ishibashi) ---
  const [pensador] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Pensador',
      name: 'Jun Ishibashi',
      title: 'contra-mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Japanese Contra Mestre in Japan branch of Capoeira Batuque. Student of Mestre Amen. Part of distributed leadership model with four co-equal senior instructors.',
      achievements: 'Achieved Contra Mestre rank (13+ years training). Senior instructor in Japan.',
    })
    .returning();

  console.log(`Created: Contra Mestre Pensador (${pensador.id})`);

  // --- Professor Esperto (MILE) ---
  const [esperto] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Esperto',
      name: 'MILE',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Professor in Japan branch of Capoeira Batuque. Student of Mestre Amen. Part of distributed leadership model.',
      achievements: 'Achieved Professor rank (13+ years training required). Instructor in Japan.',
    })
    .returning();

  console.log(`Created: Professor Esperto (${esperto.id})`);

  // --- Instructora Lua Cheia (HiRO) ---
  const [luaCheia] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Lua Cheia',
      name: 'HiRO',
      title: 'instrutor',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'Female Instructora in Japan branch of Capoeira Batuque. Student of Mestre Amen. Notable as female instructor in traditionally male-dominated Angola tradition. Part of distributed leadership model with 50% female representation among senior instructors.',
      achievements: 'Achieved Instructora rank. Female instructor representing gender balance in Japan branch.',
    })
    .returning();

  console.log(`Created: Instructora Lua Cheia (${luaCheia.id})`);

  // ============================================================
  // PHASE 28: ESCOLA DE CAPOEIRA ANGOLA OKUPANDULA (ANGOLA)
  // First Capoeira Angola school in the country of Angola.
  // Fulfills Mestre Pastinha's prophecy: "Capoeira Angola will return to Angola"
  // ============================================================

  // --- Contramestre Kimbundo (Lucio Ngungi) ---
  const [kimbundo] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Kimbundo',
      name: 'Lucio Ngungi',
      title: 'contra-mestre',
      style: 'angola',
      birthYear: 1985,
      birthYearPrecision: 'approximate',
      birthPlace: 'Angola',
      bio: 'Angolan capoeirista who went into exile at age 15 during the 27-year civil war (1975-2002). Returned to Angola in 2014 to "help bring about change in the country". Founded Escola de Capoeira Angola Okupandula in Luanda - the FIRST Capoeira Angola school in the country of Angola. Student of Mestre Moraes (GCAP). Started with Capoeira Regional but switched to Angola after 7 years, saying "Why would I keep training Regional when I can go to the roots of my country?" Also works as a social worker.',
      achievements:
        'Founded first Capoeira Angola school in Angola (2014). Fulfilled Mestre Pastinha\'s prophecy that "Capoeira Angola will return to Angola". Achieved Contramestre rank under Mestre Moraes. Combines social work with cultural education.',
    })
    .returning();

  console.log(`Created: Contramestre Kimbundo (${kimbundo.id})`);

  // ============================================================
  // PHASE 29: ESCRAVOS BRANCOS (PIAUÍ, BRAZIL)
  // Regional group without international expansion. Migration-based
  // knowledge transfer: São Paulo → Piauí. Founded state federation.
  // ============================================================

  // --- Mestre Zé da Volks (São Paulo) ---
  const [zeDaVolks] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Zé da Volks',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'São Bernardo do Campo, São Paulo, Brazil',
      bio: 'São Paulo Regional mestre. Teacher of Mestre Albino in São Bernardo do Campo during early 1970s. Representative of São Paulo Capoeira Federation organizational model. Lineage incomplete - his own teachers unknown.',
    })
    .returning();

  console.log(`Created: Mestre Zé da Volks (${zeDaVolks.id})`);

  // --- Mestre Albino (Piauí founder) ---
  const [mestreAlbino] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Albino',
      name: 'Albino de Brito Veras',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Piauí, Brazil',
      bio: 'Migrated from Piauí to São Bernardo do Campo, São Paulo in early 1970s (typical Nordestino migration pattern). Trained under Mestre Zé da Volks. Returned to Teresina, Piauí in 1977 with both capoeira techniques and organizational knowledge. Founded Grupo Escravos Brancos and Federação Piauiense de Capoeira (FPC) the same year. Represents "circular migration cultural transfer" pattern - economic migration repurposed for cultural transmission.',
      achievements:
        'Founded Escravos Brancos (1977). Founded Federação Piauiense de Capoeira (1977). President of ACCEB since 2005. 48+ years teaching. Brought São Paulo Federation model to Piauí.',
    })
    .returning();

  console.log(`Created: Mestre Albino (${mestreAlbino.id})`);

  // ============================================================
  // PHASE 30: GRUPO ORIAXÉ (ARGENTINA)
  // Pioneer - oldest capoeira institution in Argentina.
  // Childhood friends pattern: Marcos & Val trained together, split.
  // ============================================================

  // --- Mestre Alfredo (Salvador, Bahia - teacher of Marcos and Val) ---
  const [mestreAlfredo] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Alfredo',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: 'Bahian mestre based in Liberdade neighborhood, Salvador. Trained under Mestre Saci and Mestre Paulo dos Anjos. Teacher of childhood best friends Mestre Marcos Gytauna and Mestre Val Boa Morte, who became "three times champions of Bahian capoeira" together before each becoming pioneers in different countries (Argentina and Australia respectively).',
      achievements:
        'Trained Mestre Marcos Gytauna (Argentina pioneer) and Mestre Val Boa Morte (Australia pioneer). His students produced three-time Bahian champions.',
    })
    .returning();

  console.log(`Created: Mestre Alfredo (${mestreAlfredo.id})`);

  // --- Mestre Marcos Gytauna (Argentina pioneer) ---
  const [marcosGytauna] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Gytauna',
      name: 'Marcos Moura Freitas',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'São Salvador, Bahia, Brazil',
      bio: 'Started capoeira 1975 in Liberdade, Salvador under Mestre Alfredo. Childhood best friend of Mestre Val Boa Morte - together they were "three times champions of Bahian capoeira". Arrived Argentina January 10, 1987 with Val, invited by actress Egle Martin for "Ritos y Candombe" cultural project (planned 5 days, stayed 38+ years). First student actor Adrián Ghio encouraged him to stay. Worked with Val 1987-1989, then Val returned to Brazil. Composed capoeira songs: "Berimbau de Fe", "Capoeira Me Chama", "Ser Capoeira".',
      achievements:
        'Founded oldest capoeira institution in Argentina (AAC 1995). Pioneer - first capoeira in Argentina (1987). 3x Bahian champion with Val. 38+ years teaching in Argentina. Composed original capoeira songs.',
    })
    .returning();

  console.log(`Created: Mestre Marcos Gytauna (${marcosGytauna.id})`);

  // ============================================================
  // PHASE 31: GRUPO ZIMBA (TERESINA, PIAUÍ)
  // Blessed departure from GCAP. Mestre Boca do Rio trained under Moraes.
  // Remote coordination from Spain since 2007.
  // ============================================================

  // --- Mestre Boca do Rio (Marcelo Conceição dos Santos) ---
  const [bocaDoRio] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Boca do Rio',
      name: 'Marcelo Conceição dos Santos',
      title: 'mestre',
      style: 'angola',
      birthYearPrecision: 'unknown',
      birthPlace: 'Boca do Rio neighborhood, Salvador, Bahia, Brazil',
      bio: 'Started training at GCAP in 1983 under Mestre Moraes. Graduated as Contra-Mestre in 1996 alongside Mestre Cobra Mansa. Left GCAP shortly after to teach independently (blessed departure). Founded Grupo de Capoeira Angola Zimba in 1998 in Salvador. Received Mestre title in 2007 from his former classmate Mestre Cobra Mansa (peer recognition). Moved to Santiago de Compostela, Spain in 2007 and continues coordinating Zimba internationally from there.',
      achievements:
        'Founded Grupo Zimba (1998). Received Mestre title from peer (Cobra Mansa, 2007). 15 years training at GCAP. Coordinates international network from Spain. "Zimba" means "Supreme God" in African languages.',
    })
    .returning();

  console.log(`Created: Mestre Boca do Rio (${bocaDoRio.id})`);

  // --- Celso de Brito (Teresina núcleo founder) ---
  const [celsoDeBrito] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Celso de Brito',
      name: 'Celso de Brito',
      style: 'angola',
      birthYearPrecision: 'unknown',
      bio: 'PhD in Social Anthropology (UFRGS). Assistant Professor at Federal University of Piauí (UFPI), Social Sciences department. Co-founded Zimba Teresina núcleo in 2018 with Andrea Pace Rodriguez. Represents academic-practitioner model - bridges traditional oral transmission with scholarly documentation. Published research on capoeira politics in Teresina, lineages, and federations.',
      achievements:
        'Founded Zimba Teresina núcleo (2018). PhD Social Anthropology. UFPI professor. Published academic research on capoeira in Teresina.',
    })
    .returning();

  console.log(`Created: Celso de Brito (${celsoDeBrito.id})`);

  // ============================================================
  // PHASE 32: MANDINGUEIROS DOS PALMARES (BH, BRAZIL + MASSACHUSETTS, USA)
  // Three-generation family tradition. Founder-led diaspora expansion.
  // ============================================================

  // --- Mestre Itapoan (Raimundo César Alves de Almeida) ---
  const [itapoan] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Itapoan',
      name: 'Raimundo César Alves de Almeida',
      title: 'mestre',
      style: 'regional',
      birthYearPrecision: 'unknown',
      birthPlace: 'Salvador, Bahia, Brazil',
      bio: "Direct student of Mestre Bimba (founder of Capoeira Regional). Legendary Regional authority and keeper of Bimba's tradition. Granted Grão Mestre title to Mestre Chuvisco in December 2017 - described as 'third and final level' of Grão Mestre recognition for decades of dedication to capoeira.",
      achievements:
        'Direct student of Mestre Bimba. Legendary Regional authority. Grants Grão Mestre titles to recognized masters of the Regional tradition.',
    })
    .returning();

  console.log(`Created: Mestre Itapoan (${itapoan.id})`);

  // --- Grão Mestre Chuvisco (Gutemberg Souza) ---
  const [chuvisco] = await db
    .insert(personProfiles)
    .values({
      apelido: 'Chuvisco',
      name: 'Gutemberg Souza',
      title: 'mestre',
      style: 'contemporanea',
      birthYearPrecision: 'unknown',
      birthPlace: 'Belo Horizonte, Minas Gerais, Brazil',
      bio: "Started capoeira at age 8 (family tradition - father was capoeirista). Graduated to Mestre in 1977. Founded Mandingueiros dos Palmares the same year (June 7, 1977) in Belo Horizonte. Brought capoeira to Boston, Massachusetts in 1995 - claims 'Boston's First Capoeira School'. Received Grão Mestre title from legendary Mestre Itapoan in December 2017. 50+ years in capoeira, 40+ years teaching. Three-generation family tradition continuing through sons Mestre Chuvisquinho and Guthemberg Teixeira.",
      achievements:
        "Founded Mandingueiros dos Palmares (1977). 'Boston's First Capoeira School' (1995). Grão Mestre title (2017, from Mestre Itapoan). 50+ years practice. Three-generation family tradition.",
    })
    .returning();

  console.log(`Created: Grão Mestre Chuvisco (${chuvisco.id})`);

  console.log(`Created ${123} person profiles`);

  // ============================================================
  // PHASE 14: GROUP PROFILES
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

  // --- Grupo Capoeira Brasil ---
  const [capoeiraBrasil] = await db
    .insert(groupProfiles)
    .values({
      name: 'Grupo Capoeira Brasil',
      description:
        'Founded January 14, 1989 by three Senzala red cords (Boneco, Paulinho Sabiá, Paulão Ceará) with blessing from padrinhos (Gato, Peixinho, Rafael Flores, Suassuna, Itapoã, Ezekiel). A "blessed split" from Senzala due to ideological differences. Known for Regional Contemporânea style and international reach across 40+ countries. Operates as 501(c)(3) non-profit in USA.',
      style: 'contemporanea',
      nameAliases: ['Capoeira Brasil', 'GCB'],
      foundedYear: 1989,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Rio de Janeiro, Brazil',
      philosophy:
        'Regional Contemporânea style blending Regional and Angola traditions. Community-focused cultural preservation with emphasis on youth education.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Grupo Capoeira Brasil (${capoeiraBrasil.id})`);

  // --- Grupo Muzenza de Capoeira ---
  const [muzenza] = await db
    .insert(groupProfiles)
    .values({
      name: 'Grupo Muzenza de Capoeira',
      description:
        'One of the largest Capoeira organizations worldwide. Founded May 5, 1972 in Rio de Janeiro by Mestre Paulão. Expanded massively under Mestre Burguês (president since 1978) from Curitiba base. Known for standardized methodology (22 sequences), academic focus (ENCAMUZENZA), and massive international reach.',
      style: 'contemporanea',
      nameAliases: ['Muzenza'],
      foundedYear: 1972,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Rio de Janeiro, Brazil',
      philosophy:
        'Contemporary blend of traditional and modern capoeira. "Capoeira é capoeira, para que você possa entender melhor essa definição deve vivê-la" (Capoeira is capoeira, to truly understand this definition you must live it).',
      isActive: true,
      nameHistory: [
        {
          name: 'Grupo Muzenza de Capoeira',
          startedAt: '1972-05-05',
          context: 'Founded in Rio de Janeiro by Mestre Paulão',
        },
      ],
    })
    .returning();

  console.log(`Created: Grupo Muzenza (${muzenza.id})`);

  // --- Grupo Axé Capoeira ---
  const [axeCapoeira] = await db
    .insert(groupProfiles)
    .values({
      name: 'Grupo Axé Capoeira',
      description:
        'One of the larger international Capoeira networks. Founded in 1982 in Recife, Brazil by Mestre Barrão. Now based internationally with locations across Canada, USA, Brazil, and other countries. Known for centralized brand control with uniform naming convention across all locations.',
      style: 'contemporanea',
      nameAliases: ['Axé Capoeira'],
      foundedYear: 1982,
      foundedYearPrecision: 'year',
      foundedLocation: 'Recife, Brazil',
      philosophy: 'Regional/Contemporânea style with strong central identity and network-wide consistency.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Grupo Axé Capoeira (${axeCapoeira.id})`);

  // --- Grupo Capoeira Filhos de Angola (GCFA) ---
  const [gcfa] = await db
    .insert(groupProfiles)
    .values({
      name: 'Grupo Capoeira Filhos de Angola',
      description:
        'Traditional Angola group founded March 20, 1984 in Salvador, Bahia by four co-founders: Roberval, Laércio, Cabore, and Rosalvo. Now an international network with 25+ núcleos across Europe and Asia, coordinated by Mestre Laércio from Berlin. Co-founders later separated geographically, with some operating independently (Academia Jangada) and others within the GCFA network.',
      style: 'angola',
      nameAliases: ['GCFA', 'Filhos de Angola'],
      foundedYear: 1984,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Salvador, Bahia, Brazil',
      philosophy:
        'Traditional Capoeira Angola preservation. Art, knowledge, philosophy and awareness. Non-profit cultural association without belt/cord system (traditional Angola approach).',
      isActive: true,
    })
    .returning();

  console.log(`Created: Grupo Capoeira Filhos de Angola (${gcfa.id})`);

  // --- Grupo de Capoeira Angola Irmãos Guerreiros (GCAIG) ---
  const [gcaig] = await db
    .insert(groupProfiles)
    .values({
      name: 'Grupo de Capoeira Angola Irmãos Guerreiros',
      description:
        'Family-founded Angola group from São Paulo periphery. Founded 1983 in Taboão da Serra by Bahian family: Mestre Baixinho (father), Mestre Marrom (son), and uncles Guerreiro and Macete. Headquarters at Senzalinha (family garage). International expansion since 2002 with European hub in Bremen (Centro Cultural Cazuá). Known for community focus in marginalized areas and integration of multiple Afro-Brazilian practices.',
      style: 'angola',
      nameAliases: ['GCAIG', 'Irmãos Guerreiros'],
      foundedYear: 1983,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Taboão da Serra, São Paulo, Brazil',
      philosophy:
        'Preserve and disseminate Capoeira Angola and Afro-Brazilian traditions. Using popular culture as engine for social change. Colors: Brown (earth/strength) and White (peace).',
      isActive: true,
    })
    .returning();

  console.log(`Created: GCAIG Irmãos Guerreiros (${gcaig.id})`);

  // --- Ngoma Capoeira Angola (formerly Mestre Marrom e Alunos) ---
  const [ngoma] = await db
    .insert(groupProfiles)
    .values({
      name: 'Ngoma Capoeira Angola',
      description:
        'Founded 1990 in Rio de Janeiro by Mestre Anastácio Marrom (originally as "Marrom Capoeira & Alunos"). Renamed to "Ngoma" (African/Bantu word) in 2018 as political statement reaffirming African origins. Based in Morro da Babilônia favela for 25+ years. Opened Casa Ngoma community space (2020). Known for "autonomous continuation" model where students maintain cultural connection across 15+ locations in 8 countries. Emphasizes women\'s leadership through co-founder Contra-Mestra Tatiana.',
      style: 'angola',
      nameAliases: ['Marrom Capoeira & Alunos', 'Casa Ngoma'],
      foundedYear: 1990,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Rio de Janeiro, Brazil',
      philosophy:
        'Political reaffirmation of Black and African origins of Capoeira Angola. Social justice focus, community integration, women\'s leadership. "Compromisso" (commitment) philosophy - ethical responsibilities extending beyond the roda into life.',
      isActive: true,
      nameHistory: [
        {
          name: 'Marrom Capoeira & Alunos',
          startedAt: '1990-01-01',
          endedAt: '2018-01-01',
          context: 'Traditional Angola naming emphasizing teacher-student personal relationship',
        },
        {
          name: 'Ngoma Capoeira Angola',
          startedAt: '2018-01-01',
          changeReason: 'Political statement reaffirming Black and African origins of Capoeira Angola',
        },
      ],
    })
    .returning();

  console.log(`Created: Ngoma Capoeira Angola (${ngoma.id})`);

  // --- Escola de Capoeira Angoleiros do Sertão ---
  const [angoleirosSertao] = await db
    .insert(groupProfiles)
    .values({
      name: 'Escola de Capoeira Angoleiros do Sertão',
      description:
        'Founded in the 1980s in Feira de Santana, Bahia by Mestre Cláudio Costa. "Angoleiros do Sertão" means "Capoeira Angola Players of the Backlands" - emphasizing rural, interior identity distinct from coastal Salvador. Known for nucleus (núcleo) organizational model with 20+ semi-autonomous branches across 6+ countries. Unique for integrating Samba Rural into practice and weekly public rodas on main avenue.',
      style: 'angola',
      nameAliases: ['Angoleiros do Sertão'],
      foundedYear: 1985,
      foundedYearPrecision: 'approximate',
      foundedLocation: 'Feira de Santana, Bahia, Brazil',
      philosophy:
        '"Compromisso" (ethical commitment) - responsibilities extend beyond the roda. Strict discipline, musical excellence, cultural preservation. "You don\'t need to be rich to be clean; you just need self-respect."',
      isActive: true,
      isHeadquarters: true,
    })
    .returning();

  console.log(`Created: Angoleiros do Sertão (${angoleirosSertao.id})`);

  // --- Escola Nestor Capoeira ---
  const [escolaNestor] = await db
    .insert(groupProfiles)
    .values({
      name: 'Escola Nestor Capoeira',
      description:
        'Founded 1990/1992 in Rio de Janeiro by Mestre Nestor Capoeira after 22 years with Grupo Senzala. Personal school model named after founder (PhD, 10 books, 120,000+ copies sold). Based at Planetário da Gávea / Galpão das Artes Urbanas. Known for academic-mission approach with books as primary knowledge transmission. Branches in Belo Horizonte (2018) and France.',
      style: 'contemporanea',
      nameAliases: ['ENC', 'ENC-BH'],
      foundedYear: 1992,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Rio de Janeiro, Brazil',
      philosophy:
        'Unique pedagogical approach emphasizing both traditional and contemporary aspects. Balance of structure and spontaneity (Senzala influence). Capoeira as philosophy and way of life. Academic rigor and cultural depth. "Malícia" as philosophical wisdom.',
      isActive: true,
      nameHistory: [
        {
          name: 'Independent work begins',
          startedAt: '1990-01-01',
          context: 'Nestor left Grupo Senzala after 22 years to develop own philosophy',
        },
        {
          name: 'Escola Nestor Capoeira',
          startedAt: '1992-01-01',
          context: 'Formally established at Planetário da Gávea after Denmark trip',
        },
      ],
    })
    .returning();

  console.log(`Created: Escola Nestor Capoeira (${escolaNestor.id})`);

  // --- Capoeira Aruanda Australia ---
  const [aruandaAustralia] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Aruanda Australia',
      description:
        'Founded 2005 as Capoeiracre, renamed to Capoeira Aruanda in 2007. Founded by Mestre Borracha after 8 years teaching for Grupo Capoeira Brasil in Sydney. Regional presence in NSW: Sydney East (headquarters), Sydney West, Newcastle (Team Novo Flow). "Aruanda" is a mutation of Luanda (Angola capital) - symbolizing African homeland and freedom.',
      style: 'contemporanea',
      nameAliases: ['Capoeiracre', 'Aruanda Australia', 'Team Novo Flow'],
      foundedYear: 2005,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Sydney, NSW, Australia',
      philosophy:
        'Contemporary style blending Angola and Regional. "Aruanda" name represents African roots and freedom. Professional approach with corporate workshops and team building programs.',
      isActive: true,
      nameHistory: [
        {
          name: 'Capoeiracre',
          startedAt: '2005-01-01',
          endedAt: '2007-01-01',
          context: "Named after founder's home state of Acre, Brazil",
        },
        {
          name: 'Capoeira Aruanda',
          startedAt: '2007-01-01',
          changeReason: 'Philosophical deepening - Aruanda (mutation of Luanda) represents African freedom',
        },
      ],
    })
    .returning();

  console.log(`Created: Capoeira Aruanda Australia (${aruandaAustralia.id})`);

  // Note: Cordão de Ouro already defined above

  // --- Capoeira Mandinga (International, Caveirinha) ---
  const [mandinga] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Mandinga',
      description:
        'International capoeira organization founded by Mestre Marcelo Caveirinha. Originally Associação de Capoeira Senzala Grande (1984 in Oakland, CA), renamed to Capoeira Mandinga (1995). Presence in USA, New Zealand, Israel, China, Taiwan, Japan, Italy, Iceland, Mexico, Brazil.',
      style: 'contemporanea',
      nameAliases: ['Senzala Grande'],
      foundedYear: 1995,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Oakland, California, USA',
      philosophy: 'International expansion of capoeira, maintaining Brazilian roots while adapting to global contexts.',
      isActive: true,
      nameHistory: [
        {
          name: 'Associação de Capoeira Senzala Grande',
          startedAt: '1984-01-01',
          endedAt: '1995-01-01',
          context: 'Original name when founded in Oakland',
        },
        {
          name: 'Capoeira Mandinga',
          startedAt: '1995-01-01',
          changeReason: 'Rebranding as international expansion grew',
        },
      ],
    })
    .returning();

  console.log(`Created: Capoeira Mandinga (${mandinga.id})`);

  // --- Capoeira Mandinga Aotearoa (New Zealand chapter) ---
  const [mandingaAotearoa] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Mandinga Aotearoa',
      description:
        "New Zealand's national capoeira organization. Founded 1992 in Auckland by Mestre Brabo (Grant Cole) - first capoeira ever taught in New Zealand. Chapter of Capoeira Mandinga. Transitioned from Regional/Contemporânea to Capoeira Angola around 2004. Four cities: Auckland (HQ), Wellington, Taranaki, Christchurch.",
      style: 'angola',
      nameAliases: ['Mandinga NZ', 'Mandinga Aotearoa'],
      foundedYear: 1992,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Auckland, New Zealand',
      philosophy:
        'Originally Regional/Contemporânea (1992-2004), evolved to pure Capoeira Angola tradition through influences from João Pequeno, Jogo de Dentro, and Roxinho. Community-first philosophy.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Capoeira Mandinga Aotearoa (${mandingaAotearoa.id})`);

  // --- ECAMAR (Mestre Roxinho) ---
  const [ecamar] = await db
    .insert(groupProfiles)
    .values({
      name: 'ECAMAR',
      description:
        'Escola de Capoeira Angola Mato Rasteiro. Founded 1998 in Salvador by Mestre Roxinho. Expanded to Sydney, Australia (2006) - first Bahia Angola master to establish school in Australia. Also has Auckland chapter. Youth engagement through Project Bantu.',
      style: 'angola',
      nameAliases: ['Escola de Capoeira Angola Mato Rasteiro', 'ECAMAR Sydney', 'ECAMAR Auckland'],
      foundedYear: 1998,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Salvador, Bahia, Brazil',
      isActive: true,
    })
    .returning();

  console.log(`Created: ECAMAR (${ecamar.id})`);

  // --- Capoeira Angola Center Kibera (CACK) ---
  const [cack] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Angola Center Kibera',
      description:
        'First East African branch of Mestre João Grande\'s Capoeira Angola Center network. Founded 2015 in Kibera slum, Nairobi, Kenya by Contra-Mestre Salim Rollins. Part of Inuka Cultural Center NGO. Represents "reverse diaspora" - capoeira returning to Africa. Hosted Mandinga Ancestral festival (2017) bringing João Grande to Africa for first time in 51 years.',
      style: 'angola',
      nameAliases: ['CACK', 'Capoeira Angola Center Kenya'],
      foundedYear: 2015,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Kibera, Nairobi, Kenya',
      philosophy:
        'Youth empowerment through traditional Capoeira Angola in extreme poverty contexts. Free programs for slum youth. "Reconnecting Grand Mestre João Grande with Africa." Cultural arts as pathway out of poverty.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Capoeira Angola Center Kibera (${cack.id})`);

  // --- Grupo Candeias de Capoeira ---
  const [grupoCandeias] = await db
    .insert(groupProfiles)
    .values({
      name: 'Grupo Candeias de Capoeira',
      description:
        'Regional powerhouse founded 1977 in Goiânia, Goiás. Direct Bimba lineage through his son Formiga. Six consecutive Brazilian School Games championships (1983-1988). Systematized pedagogy with six operational areas. Scale: 13 Brazilian states, 17 countries, 10,000+ students, 21+ mestres. Headquarters-centric model maintaining Goiânia (GYN) as symbolic and operational center.',
      style: 'regional',
      nameAliases: ['Candeias', 'Anglo-Regional', 'São Bento Pequeno', 'Grupo de Capoeira do SESC'],
      foundedYear: 1977,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Goiânia, Goiás, Brazil',
      philosophy:
        'Estudar para melhorar o mundo, respeitar para ser honrado, trabalhar para ter dignidade e amar para ter fé (Study to improve the world, respect to be honored, work for dignity, love for faith). Six operational areas: historical-cultural, technical-tactical, musical, philosophical, pedagogical, administrative.',
      isActive: true,
      nameHistory: [
        {
          name: 'Grupo de Capoeira do SESC',
          startedAt: '1975-01-01',
          endedAt: '1977-01-01',
          context: 'Embryonic phase at SESC Universitário',
        },
        {
          name: 'Grupo de Capoeira Anglo-Regional',
          startedAt: '1977-01-01',
          endedAt: '1978-01-01',
          context: 'Formal founding name',
        },
        {
          name: 'Grupo São Bento Pequeno',
          startedAt: '1978-01-01',
          endedAt: '1991-01-01',
          context: 'Under Mestre Passarinho leadership, named after traditional capoeira rhythm',
        },
        {
          name: 'Grupo Candeias de Capoeira',
          startedAt: '1991-01-01',
          changeReason:
            'Unification - competitive selection process consolidated competing graduate-led groups under single brand',
        },
      ],
    })
    .returning();

  console.log(`Created: Grupo Candeias de Capoeira (${grupoCandeias.id})`);

  // --- ACAD - Associação de Capoeira Angola Dobrada ---
  const [acad] = await db
    .insert(groupProfiles)
    .values({
      name: 'Associação de Capoeira Angola Dobrada',
      description:
        'Founded 1992 in Kassel, Germany by Mestre Rogério and Mestre Índio - one of first Capoeira Angola organizations founded in Europe. Named after "Angola Dobrada" berimbau rhythm (doubled variation). Dual lineage from GCAP (Moraes) and FICA (Cobra Mansa). Scale: 11+ locations across Germany, Italy, and Brazil. Three annual international meetings rotating between Freiburg (May), Cesena (July/Sept), and Belo Horizonte (November).',
      style: 'angola',
      nameAliases: ['ACAD', 'Angola Dobrada'],
      foundedYear: 1992,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Kassel, Germany',
      philosophy:
        'To cultivate, spread and maintain the art and rituals of Capoeira Angola in accordance with the tradition, without deforming it. Preservation of traditional practices while spreading Angola internationally.',
      isActive: true,
    })
    .returning();

  console.log(`Created: ACAD (${acad.id})`);

  // --- Cai Na Capoeira (CDO affiliate, Hudson Valley NY) ---
  const [caiNaCapoeira] = await db
    .insert(groupProfiles)
    .values({
      name: 'Cai Na Capoeira',
      description:
        'Small regional CDO affiliate founded 2012 in Hudson Valley, New York. Founded by Contra Mestre Cabeção under supervision of Mestre Esquilo (CDO Sete Lagoas, Brazil). Name means "Join Capoeira" or "Fall into Capoeira". 5+ locations across Westchester, Rockland, Orange, and Dutchess counties. Exemplifies instructor migration pattern - Brazilian instructor establishing supervised affiliate while maintaining parent organization connection.',
      style: 'regional',
      foundedYear: 2012,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Ossining, New York, USA',
      philosophy:
        'Promote capoeira and all elements: music, culture, health, dance, arts. CDO methodology with Jogo do Miudinho emphasis. Community-focused bringing capoeira to suburban/small town areas.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Cai Na Capoeira (${caiNaCapoeira.id})`);

  // --- Filhos de Angola (Mestre Roque's group, Rio, 1960) ---
  const [filhosDeAngolaRio] = await db
    .insert(groupProfiles)
    .values({
      name: 'Filhos de Angola',
      description:
        "Founded 1960 by Mestre Roque in Pavão/Pavãozinho favela (Rio's South Zone). One of the founding lineages of capoeira contemporânea in Rio de Janeiro. Known for 'Line of São Bento' - faster Angola style. Described as a 'quilombo' in the most expensive area of the city. Trained Mestre Adilson Camisa Preta and Mestre Paulo Siqueira. Important in the evolution of Rio's distinctive capoeira culture.",
      style: 'angola',
      foundedYear: 1960,
      foundedYearPrecision: 'year',
      foundedLocation: 'Pavão/Pavãozinho favela, Rio de Janeiro, Brazil',
      philosophy:
        'Community-based capoeira in favela context. Cultural resistance. Quilombo spirit - community of resistance.',
      isActive: false,
    })
    .returning();

  console.log(`Created: Filhos de Angola Rio (${filhosDeAngolaRio.id})`);

  // --- Escola de Capoeira Angola Nzinga (Germany) ---
  const [nzingaGermany] = await db
    .insert(groupProfiles)
    .values({
      name: 'Escola de Capoeira Angola Nzinga',
      description:
        'Founded 1985 in Hamburg, Germany by Mestre Paulo Siqueira - pioneer of capoeira in Europe. Named after Queen Nzinga (1581-1663) of Angola who led 40-year resistance to Portuguese. Filhos de Angola lineage from Rio. Organized Capoeira Sommer-Meeting 1987-2004 (300-600 participants annually, largest capoeira event outside Brazil at the time). 3 locations: Hamburg (HQ since 1985), Hannover (1994, first capoeira school in city), Kiel (2000).',
      style: 'angola',
      nameAliases: ['Nzinga Germany', 'Capoeuropa'],
      foundedYear: 1985,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Hamburg, Germany',
      philosophy:
        'Combination of multiple cultural expressions: dance, music, combat, theater, play and spiritual practice. Pioneer mission bringing authentic Brazilian capoeira to Europe.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Nzinga Germany (${nzingaGermany.id})`);

  // --- Capoeira Beira-Mar (Brazil & USA) ---
  const [beiraMar] = await db
    .insert(groupProfiles)
    .values({
      name: 'Associação Desportiva e Cultural de Capoeira Beira Mar',
      description:
        'Founded by Mestre Tarzan in São Paulo state (Araçatuba, Campinas). Direct Regional lineage: Bimba → Suassuna → Medicina → Tarzan (gen 4). 200+ students in Brazil. USA presence established by Contra-Mestre Bundo who founded Grupo Bantu independently, then reunited as Beira-Mar USA. 8+ locations across Brazil, USA (Florida, Kentucky, Colorado), South Korea. Unique reunion/merger pattern showing voluntary reintegration with master organization.',
      style: 'regional',
      nameAliases: ['Beira-Mar', 'Grupo Bantu', 'Bantu Beira-Mar'],
      foundedYear: 1975,
      foundedYearPrecision: 'decade',
      foundedLocation: 'Campinas, São Paulo, Brazil',
      philosophy:
        'Preserves the rich cultural heritage and practice of Capoeira, fosters cultural citizenship, and promotes health and physical fitness to all ages and races through the practice of Capoeira.',
      isActive: true,
      nameHistory: [
        {
          name: 'Grupo Bantu',
          startedAt: '1990-01-01',
          endedAt: '2000-01-01',
          context: 'Independent USA founding by Contra-Mestre Bundo in Jacksonville, FL',
        },
        {
          name: 'Bantu Beira-Mar',
          startedAt: '2000-01-01',
          endedAt: '2005-01-01',
          context: 'Reconnection phase - dual identity preserving both contributions',
          changeReason: 'Bundo maintained contact with Mestre Tarzan, adopted combined name',
        },
        {
          name: 'Beira-Mar USA',
          startedAt: '2005-01-01',
          context: 'Full merger as official US presence',
          changeReason: 'Bundo became US representative for Tarzan organization',
        },
      ],
    })
    .returning();

  console.log(`Created: Beira-Mar (${beiraMar.id})`);

  // --- ECAIG (Escola de Capoeira Angola Irmãos Gêmeos) ---
  const [ecaig] = await db
    .insert(groupProfiles)
    .values({
      name: 'Escola de Capoeira Angola Irmãos Gêmeos',
      description:
        'Founded 1960 by Mestre Curiò in Alagoinhas, Bahia. Pure Capoeira Angola organization with Pastinha lineage. International network including Banda do Saci (Mexico) affiliation in 1997.',
      style: 'angola',
      nameAliases: ['ECAIG', 'Irmãos Gêmeos'],
      foundedYear: 1960,
      foundedYearPrecision: 'year',
      foundedLocation: 'Alagoinhas, Bahia, Brazil',
      philosophy: 'Pure Capoeira Angola preservation. Pastinha lineage transmission.',
      isActive: true,
    })
    .returning();

  console.log(`Created: ECAIG (${ecaig.id})`);

  // --- Banda do Saci (first registered capoeira group in Mexico) ---
  const [bandaDoSaci] = await db
    .insert(groupProfiles)
    .values({
      name: 'Banda do Saci',
      description:
        'First registered capoeira group in Mexico, founded 1996 by Mariano Andrade. Mixed style initially. 1997: Affiliated with ECAIG (Mestre Curiò). 1998: Became exclusively Capoeira Angola. This shift to pure Angola style caused the split that created Longe do Mar.',
      style: 'angola',
      foundedYear: 1996,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Mexico City, Mexico',
      philosophy: 'Pure Capoeira Angola (since 1998). ECAIG affiliation.',
      isActive: true,
      nameHistory: [
        {
          name: 'Ollin-Bao',
          startedAt: '1995-01-01',
          endedAt: '1996-01-01',
          context: 'Predecessor group promoting Afro-American cultures (Nahuatl name)',
        },
        {
          name: 'Banda do Saci',
          startedAt: '1996-01-01',
          context: 'First registered capoeira group in Mexico',
        },
      ],
    })
    .returning();

  console.log(`Created: Banda do Saci (${bandaDoSaci.id})`);

  // --- Capoeira Longe do Mar (Mexico) ---
  const [longeDoMar] = await db
    .insert(groupProfiles)
    .values({
      name: 'Academia de Capoeira Longe do Mar',
      description:
        'Founded May 1998 in Mexico City by three co-founders who split from Banda do Saci seeking "capoeira without labels" (mixed style vs. pure Angola). First Mexican mestres: Mestre Cigano (first Mexican mestre), Contra-Mestre Rosita (first Mexican woman contra-mestre). Dual lineage recognition: Regional (Acordeón) + Angola (Cabello). 27 consecutive years of annual Encuentro Nacional (1998-2025). 9+ cities across Mexico, 300+ students. "Un grupo de capoeira orgullosamente mexicano" (proudly Mexican).',
      style: 'contemporanea',
      nameAliases: ['Longe do Mar', 'LDM'],
      foundedYear: 1998,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Mexico City, Mexico',
      philosophy:
        'Capoeira para todos (Capoeira for all). Capoeira without labels - mixed/contemporary approach not restricted to pure Angola or Regional. Values: Loyalty, Harmony, Social Work. Artistic and cultural emphasis beyond sport.',
      legalStructure: 'non_profit',
      isActive: true,
    })
    .returning();

  console.log(`Created: Longe do Mar (${longeDoMar.id})`);

  // --- Capoeira Mandinga (parent organization - Oakland, USA) ---
  const [capoeiraMandinga] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Mandinga',
      description:
        'Founded 1984 in Oakland, California by Mestre Marcelo Caveirinha (student of Mestre Suassuna). Originally named Associação de Capoeira Senzala Grande, renamed to Capoeira Mandinga in 1995. At founding, Mestre Marcelo was one of only three people teaching capoeira in the entire USA. International network spanning 15+ countries with 20+ cities. "Mandinga" means sorcery/magic/trickery in Portuguese - central to capoeira philosophy.',
      style: 'contemporanea',
      nameAliases: ['Mandinga', 'Capoeira Mandinga Academy'],
      foundedYear: 1984,
      foundedYearPrecision: 'year',
      foundedLocation: 'Oakland, California, USA',
      philosophy:
        'CDO (Cordão de Ouro) tradition via Mestre Suassuna. Emphasis on musicality, acrobatics, and game flow. Decentralized network with local autonomy - each location operates independently.',
      legalStructure: 'non_profit',
      isActive: true,
      nameHistory: [
        {
          name: 'Associação de Capoeira Senzala Grande',
          startedAt: '1984-01-01',
          endedAt: '1995-01-01',
          context:
            'Original name referenced Senzala (not official Grupo Senzala - Marcelo was CDO lineage). Due to 1980s CDO tradition requiring graduated students to create own school names.',
        },
        {
          name: 'Capoeira Mandinga',
          startedAt: '1995-01-01',
          context: 'Renamed to reflect distinct identity and maturation of organization.',
        },
      ],
    })
    .returning();

  console.log(`Created: Capoeira Mandinga (${capoeiraMandinga.id})`);

  // --- Capoeira Mandinga Shanghai (first in China) ---
  const [mandingaShanghai] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Mandinga Shanghai',
      description:
        'First group to teach capoeira in China, founded 2005 by Diego Pappalardo (Italian). Historic expansion to Asia. Less than 200 capoeiristas in entire China as of 2014 (population 1.4 billion). Classes at Fuxing Zhong Lu and Xikang Lu (Jogo Space). Mix of Chinese nationals and expatriates.',
      style: 'contemporanea',
      foundedYear: 2005,
      foundedYearPrecision: 'year',
      foundedLocation: 'Shanghai, China',
      philosophy:
        'Capoeira Mandinga tradition. "Not only a great physical activity, but also involves music and culture." Cultural education alongside physical training.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Capoeira Mandinga Shanghai (${mandingaShanghai.id})`);

  // --- Capoeira Mandinga Hangzhou ---
  const [mandingaHangzhou] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Mandinga Hangzhou',
      description:
        'Founded 2014 by Instrutor Alex (Alex Maltsev), a Russian who lived 25 years in China. "Passionate, non-profit collective of capoeira enthusiasts." Location: Guodu Commercial Building, 21F, Room 2101, Fengqi Rd. Chinese name: 杭州巴西战舞 (Hangzhou Brazilian War Dance). Supervised branches in Hefei, Chengdu, Wenzhou. Featured on TV (Alibaba Group, 2017). Status uncertain after founder relocated to Thailand (2023).',
      style: 'contemporanea',
      nameAliases: ['杭州巴西战舞', 'Hangzhou Bāxī Zhànwǔ'],
      foundedYear: 2014,
      foundedYearPrecision: 'year',
      foundedLocation: 'Hangzhou, Zhejiang, China',
      philosophy:
        'Celebrate and share the art of capoeira by enjoying the game and spreading knowledge of its rich Afro-Brazilian traditions. Inclusivity - welcomes beginners and people of all fitness levels, ages, and backgrounds.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Capoeira Mandinga Hangzhou (${mandingaHangzhou.id})`);

  // --- Capoeira Zoador (Tokyo, Japan) ---
  const [capoeirZoador] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Zoador',
      description:
        'Founded 2003 in Tokyo by Mestre Sucuri (American from San Diego). Claims "longest-running professional Capoeira school in Asia" and "pioneer of capoeira in Asia". Three locations in Tokyo metropolitan area: Ota-ku, Harajuku (Studio Worcle), and Yokohama. Contemporary style combining traditional rituals/philosophy with modern training concepts. "Zoador" means "one who zooms/flies" in Portuguese. Founder lineage unknown.',
      style: 'contemporanea',
      nameAliases: ['Zoador', 'Capoeira Zoador Academy'],
      foundedYear: 2003,
      foundedYearPrecision: 'year',
      foundedLocation: 'Tokyo, Japan',
      philosophy:
        'Contemporary approach combining rituals and philosophy of traditional Capoeira with modern training concepts and balanced beauty of movements. Inclusive - students ages 3-50, all nationalities, all walks of life.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Capoeira Zoador (${capoeirZoador.id})`);

  // --- Brasil Brasil Cultural Center (LA headquarters) ---
  const [brasilBrasil] = await db
    .insert(groupProfiles)
    .values({
      name: 'Brasil Brasil Cultural Center',
      description:
        'Founded 1989 in Santa Monica, California by Mestre Amen (Joselito do Espirito Santo). Cultural center emphasizing broader Afro-Brazilian culture beyond capoeira. Mestre Amen trained under Mestre Waldemar in Liberdade, Salvador. Choreographed "Only the Strong" (1993) which brought capoeira to mainstream American awareness. 35+ years of operations. Headquarters for Japan branch (Capoeira Batuque Japão).',
      style: 'angola',
      foundedYear: 1989,
      foundedYearPrecision: 'year',
      foundedLocation: 'Santa Monica, California, USA',
      philosophy:
        'Preservation of Mestre Waldemar lineage and traditional Bahian Angola. Cultural center for broader Afro-Brazilian arts education. Long-term development (13+ years to Professor Level 3).',
      legalStructure: 'non_profit',
      isActive: true,
    })
    .returning();

  console.log(`Created: Brasil Brasil Cultural Center (${brasilBrasil.id})`);

  // --- Capoeira Batuque Japão (Japan branch) ---
  const [batuqueJapao] = await db
    .insert(groupProfiles)
    .values({
      name: 'Capoeira Batuque Japão',
      description:
        'Japan branch of Brasil Brasil Cultural Center, established circa 2009. Mestre Amen (LA) visits for batizados. Four co-equal senior instructors lead day-to-day operations: Contra Mestra Pomba (Yoko), Contra Mestre Pensador (Jun Ishibashi), Professor Esperto (MILE), Instructora Lua Cheia (HiRO). Locations in Kanto region (Tokyo, Yokohama, Chiba) and Kochi (Shikoku). "Batuque" = traditional Afro-Brazilian dance/music form. 50% female leadership among senior instructors.',
      style: 'angola',
      nameAliases: ['Batuque Japão', 'Capoeira Batuque Japan'],
      foundedYear: 2009,
      foundedYearPrecision: 'approximate',
      foundedLocation: 'Tokyo, Japan',
      philosophy:
        'Traditional Angola (Mestre Waldemar lineage). Musical foundation with batuque/percussion emphasis. Long-term development - 13+ years minimum to Professor Level 3. Distributed leadership model.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Capoeira Batuque Japão (${batuqueJapao.id})`);

  // --- Escola de Capoeira Angola Okupandula (Angola) ---
  const [okupandula] = await db
    .insert(groupProfiles)
    .values({
      name: 'Escola de Capoeira Angola Okupandula',
      description:
        'FIRST Capoeira Angola school in the country of Angola, founded 2014 in Luanda by Contramestre Kimbundo (Lucio Ngungi). Name "Okupandula" is Kimbundu language meaning "Thank you to you and your ancestors". Fulfills Mestre Pastinha\'s prophecy from 1981: "Capoeira Angola is here in Brazil and will return to Angola again." Founder went into exile at age 15 during 27-year civil war, returned in 2014 to rebuild country through cultural education. Small but keen cohort of students. Classes 3x per week.',
      style: 'angola',
      nameAliases: ['Okupandula', 'Grupo Okupandula'],
      foundedYear: 2014,
      foundedYearPrecision: 'year',
      foundedLocation: 'Luanda, Angola',
      philosophy:
        'Cultural reclamation - reconnecting Angolans with pre-slavery African heritage. Reverse diaspora (Brazil → Africa). Post-conflict nation building. Ritualistic Angola style emphasizing tradition, African roots, and historical education.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Escola de Capoeira Angola Okupandula (${okupandula.id})`);

  // --- Associação Cultural de Capoeira Escravos Brancos (ACCEB) ---
  const [escravosBrancos] = await db
    .insert(groupProfiles)
    .values({
      name: 'Associação Cultural de Capoeira Escravos Brancos',
      description:
        'Founded 1977 in Teresina, Piauí by Mestre Albino upon his return from São Paulo. Represents "invisible majority" pattern - regional group with significant local impact but no expansion beyond Piauí state. Founded at Centro Social Urbano da Primavera (CSU Primavera), zona norte. "Escravos Brancos" = "White Slaves" (significance unclear). 48+ years of operation. CNPJ: 03.368.992/0001-00.',
      style: 'regional',
      nameAliases: ['Escravos Brancos', 'ACCEB'],
      foundedYear: 1977,
      foundedYearPrecision: 'year',
      foundedLocation: 'Teresina, Piauí, Brazil',
      philosophy:
        'São Paulo Capoeira Federation model. Sporting competition emphasis. Formal graduation system with cords. Regional identity focus (Piauí capoeira).',
      legalStructure: 'non_profit',
      isActive: true,
    })
    .returning();

  console.log(`Created: Escravos Brancos (${escravosBrancos.id})`);

  // --- Federação Piauiense de Capoeira (FPC) ---
  const [fpc] = await db
    .insert(groupProfiles)
    .values({
      name: 'Federação Piauiense de Capoeira',
      description:
        'State capoeira federation for Piauí, founded 1977 by Mestre Albino. Model imported from São Paulo Capoeira Federation. Initially only Escravos Brancos graduates became members. Faced opposition from Senzala/Abadá lineage practitioners who founded competing Federação de Capoeira Piauiense (FECAPI). Represents regional federation politics pattern.',
      style: 'regional',
      nameAliases: ['FPC'],
      foundedYear: 1977,
      foundedYearPrecision: 'year',
      foundedLocation: 'Teresina, Piauí, Brazil',
      philosophy: 'Graduation system. Sporting competition rules. Standardized approach following São Paulo model.',
      isActive: true,
    })
    .returning();

  console.log(`Created: Federação Piauiense de Capoeira (${fpc.id})`);

  // --- Asociación Argentina de Capoeira / Grupo Oriaxé ---
  const [aacOriaxe] = await db
    .insert(groupProfiles)
    .values({
      name: 'Asociación Argentina de Capoeira',
      description:
        "Oldest capoeira institution in Argentina. Founded May 14, 1995 in Buenos Aires by Mestre Marcos Gytauna (teaching since 1987). Pioneer status - first capoeira in Argentina when art was completely unknown (confused with food/drinks). Marcos arrived with childhood best friend Mestre Val Boa Morte (January 10, 1987) for 5-day cultural project 'Ritos y Candombe' but stayed 38+ years. Val returned to Brazil (1989), later founded Filhos da Bahia International in Australia. 22+ batizados. 30th anniversary 2025.",
      style: 'regional',
      nameAliases: ['AAC', 'Grupo Oriaxé', 'Oriaxé Internacional'],
      foundedYear: 1995,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Buenos Aires, Argentina',
      philosophy:
        'Capoeira as "philosophy of life" beyond physical practice. Cultural ambassador bringing Brazilian culture to Argentina. Dedicated to the diffusion of Brazilian culture.',
      legalStructure: 'non_profit',
      isActive: true,
    })
    .returning();

  console.log(`Created: AAC/Oriaxé (${aacOriaxe.id})`);

  // --- Grupo de Capoeira Angola Zimba ---
  const [grupoZimba] = await db
    .insert(groupProfiles)
    .values({
      name: 'Grupo de Capoeira Angola Zimba',
      description:
        'Founded 1998 in Salvador, Bahia by Mestre Boca do Rio after blessed departure from GCAP. "Zimba" means "Supreme God" in African languages. International núcleo network: 8+ locations across Brazil (Salvador HQ, Porto Alegre, Curitiba, Teresina), Europe (Santiago de Compostela, Paris, Warsaw), and Latin America (Xalapa). Mestre Boca do Rio has coordinated remotely from Spain since 2007. Second-generation GCAP lineage (Pastinha → Moraes → Boca do Rio). IPHAN registered with Salvador as main entity, others as filiais.',
      style: 'angola',
      nameAliases: ['Zimba', 'GCA Zimba'],
      foundedYear: 1998,
      foundedYearPrecision: 'year',
      foundedLocation: 'Salvador, Bahia, Brazil',
      philosophy:
        'Continuation of Mestre Pastinha lineage via GCAP. Traditional Angola style preservation. Núcleo network model with semi-autonomous branches under shared identity. African cultural heritage connection (name "Zimba" from African languages).',
      isActive: true,
    })
    .returning();

  console.log(`Created: Grupo Zimba (${grupoZimba.id})`);

  // --- Associação de Capoeira Mandingueiros dos Palmares ---
  const [mandingueirosPalmares] = await db
    .insert(groupProfiles)
    .values({
      name: 'Associação de Capoeira Mandingueiros dos Palmares',
      description:
        "Founded June 7, 1977 in Belo Horizonte, Minas Gerais by Grão Mestre Chuvisco (same year as his mestre graduation). Name references Quilombo dos Palmares (17th century maroon settlement) and mandinga (Candomblé spiritual power). US presence established 1995 in Massachusetts - claims 'Boston's First Capoeira School'. Dual headquarters: Belo Horizonte (origin) + Cambridge, MA (diaspora). Three-generation family tradition: Chuvisco's father → Chuvisco → sons Chuvisquinho (Mestre 2014) and Guthemberg Teixeira. Founder received Grão Mestre title from Mestre Itapoan (student of Bimba) in 2017. 48+ years founder leadership.",
      style: 'contemporanea',
      nameAliases: ['Mandingueiros dos Palmares', 'MdP', 'Capoeira MdP'],
      foundedYear: 1977,
      foundedYearPrecision: 'exact',
      foundedLocation: 'Belo Horizonte, Minas Gerais, Brazil',
      philosophy:
        'Preservation of capoeira and Afro-Brazilian culture through education. Capoeira Contemporânea based on Regional tradition. Cultural pride through name referencing Palmares quilombo resistance.',
      legalStructure: 'non_profit',
      isActive: true,
    })
    .returning();

  console.log(`Created: Mandingueiros dos Palmares (${mandingueirosPalmares.id})`);

  console.log(`Created ${41} group profiles`);

  // ============================================================
  // PHASE 15: STATEMENTS (RELATIONSHIPS)
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

    // Capoeira Brasil split_from_group Senzala (blessed)
    {
      subjectType: 'group' as const,
      subjectId: capoeiraBrasil.id,
      predicate: 'split_from_group' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1989-01-14',
      properties: {
        split_type: 'blessed',
        context:
          'Boneco, Paulinho Sabiá, and Paulão Ceará left Senzala with blessing from padrinhos (Gato, Peixinho, Rafael Flores, Suassuna, Itapoã, Ezekiel).',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Brasil documentation, AranhaCapoeira.com',
    },

    // ============================================================
    // GRUPO CAPOEIRA BRASIL: PERSON-TO-PERSON RELATIONSHIPS
    // ============================================================

    // Boneco student_of Camisa
    {
      subjectType: 'person' as const,
      subjectId: boneco.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: camisa.id,
      confidence: 'verified' as const,
      source: 'Capoeira Brasil history',
      notes: 'Trained under Mestre Camisa at Grupo Senzala, earning red cord.',
    },

    // Paulinho Sabiá student_of Camisa
    {
      subjectType: 'person' as const,
      subjectId: paulinhoSabia.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: camisa.id,
      confidence: 'verified' as const,
      source: 'Capoeira Brasil history',
      notes: 'Trained under Mestre Camisa at Grupo Senzala, earning red cord.',
    },

    // Paulão Ceará student_of Camisa
    {
      subjectType: 'person' as const,
      subjectId: paulaoCeara.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: camisa.id,
      confidence: 'verified' as const,
      source: 'Capoeira Brasil history',
      notes: 'Trained under Mestre Camisa at Grupo Senzala, earning red cord.',
    },

    // ============================================================
    // GRUPO CAPOEIRA BRASIL: PERSON-TO-GROUP RELATIONSHIPS
    // ============================================================

    // Boneco member_of Senzala (before founding Capoeira Brasil)
    {
      subjectType: 'person' as const,
      subjectId: boneco.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      endedAt: '1989-01-14',
      confidence: 'verified' as const,
      source: 'Capoeira Brasil history',
    },

    // Boneco departed_from Senzala (blessed)
    {
      subjectType: 'person' as const,
      subjectId: boneco.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1989-01-14',
      properties: {
        departure_type: 'blessed',
        context: 'Left with blessing from padrinhos to co-found Grupo Capoeira Brasil.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Brasil history',
    },

    // Paulinho Sabiá member_of Senzala
    {
      subjectType: 'person' as const,
      subjectId: paulinhoSabia.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      endedAt: '1989-01-14',
      confidence: 'verified' as const,
      source: 'Capoeira Brasil history',
    },

    // Paulinho Sabiá departed_from Senzala (blessed)
    {
      subjectType: 'person' as const,
      subjectId: paulinhoSabia.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1989-01-14',
      properties: {
        departure_type: 'blessed',
        context: 'Left with blessing from padrinhos to co-found Grupo Capoeira Brasil.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Brasil history',
    },

    // Paulão Ceará member_of Senzala
    {
      subjectType: 'person' as const,
      subjectId: paulaoCeara.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      endedAt: '1989-01-14',
      confidence: 'verified' as const,
      source: 'Capoeira Brasil history',
    },

    // Paulão Ceará departed_from Senzala (blessed)
    {
      subjectType: 'person' as const,
      subjectId: paulaoCeara.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1989-01-14',
      properties: {
        departure_type: 'blessed',
        context: 'Left with blessing from padrinhos to co-found Grupo Capoeira Brasil.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Brasil history',
    },

    // Boneco co_founded Capoeira Brasil
    {
      subjectType: 'person' as const,
      subjectId: boneco.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: capoeiraBrasil.id,
      startedAt: '1989-01-14',
      confidence: 'verified' as const,
      source: 'Capoeira Brasil documentation',
      notes: 'Primary visible leader among the three co-founders.',
    },

    // Paulinho Sabiá co_founded Capoeira Brasil
    {
      subjectType: 'person' as const,
      subjectId: paulinhoSabia.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: capoeiraBrasil.id,
      startedAt: '1989-01-14',
      confidence: 'verified' as const,
      source: 'Capoeira Brasil documentation',
    },

    // Paulão Ceará co_founded Capoeira Brasil
    {
      subjectType: 'person' as const,
      subjectId: paulaoCeara.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: capoeiraBrasil.id,
      startedAt: '1989-01-14',
      confidence: 'verified' as const,
      source: 'Capoeira Brasil documentation',
    },

    // Boneco leads Capoeira Brasil
    {
      subjectType: 'person' as const,
      subjectId: boneco.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: capoeiraBrasil.id,
      startedAt: '1989-01-14',
      confidence: 'verified' as const,
      source: 'Capoeira Brasil documentation',
      notes: 'Primary visible leader with regional "arms" under his supervision.',
    },

    // ============================================================
    // GRUPO MUZENZA: RELATIONSHIPS
    // ============================================================

    // Paulão student_of Mintirinha
    {
      subjectType: 'person' as const,
      subjectId: paulaoMuzenza.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: mintirinha.id,
      confidence: 'verified' as const,
      source: 'Muzenza history',
      notes: "Mintirinha is Paulão's brother - family teaching relationship.",
    },

    // Paulão and Mintirinha are brothers
    {
      subjectType: 'person' as const,
      subjectId: paulaoMuzenza.id,
      predicate: 'family_of' as const,
      objectType: 'person' as const,
      objectId: mintirinha.id,
      properties: { relationship_type: 'sibling' } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Muzenza history',
      notes: 'Biological brothers - Mintirinha taught Paulão.',
    },

    // Paulão founded Muzenza
    {
      subjectType: 'person' as const,
      subjectId: paulaoMuzenza.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: muzenza.id,
      startedAt: '1972-05-05',
      confidence: 'verified' as const,
      source: 'Muzenza official history',
    },

    // Paulão led Muzenza (1972-1978)
    {
      subjectType: 'person' as const,
      subjectId: paulaoMuzenza.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: muzenza.id,
      startedAt: '1972-05-05',
      endedAt: '1978-01-01',
      confidence: 'verified' as const,
      source: 'Muzenza official history',
      notes: 'Led the group until Burguês became president in 1978.',
    },

    // Burguês member_of Muzenza
    {
      subjectType: 'person' as const,
      subjectId: burgues.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: muzenza.id,
      startedAt: '1975-10-01',
      confidence: 'verified' as const,
      source: 'Muzenza official history',
      notes: 'Joined/moved to Curitiba in October 1975.',
    },

    // Burguês leads Muzenza (since 1978)
    {
      subjectType: 'person' as const,
      subjectId: burgues.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: muzenza.id,
      startedAt: '1978-01-01',
      confidence: 'verified' as const,
      source: 'Muzenza official history',
      notes: 'President since 1978 (47+ years). Massively expanded the organization.',
    },

    // ============================================================
    // GRUPO AXÉ CAPOEIRA: RELATIONSHIPS
    // ============================================================

    // Barrão founded Axé Capoeira
    {
      subjectType: 'person' as const,
      subjectId: barrao.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: axeCapoeira.id,
      startedAt: '1982-01-01',
      confidence: 'verified' as const,
      source: 'Axé Capoeira official website',
    },

    // Barrão leads Axé Capoeira
    {
      subjectType: 'person' as const,
      subjectId: barrao.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: axeCapoeira.id,
      startedAt: '1982-01-01',
      confidence: 'verified' as const,
      source: 'Axé Capoeira official website',
    },

    // Barrãozinho student_of Barrão
    {
      subjectType: 'person' as const,
      subjectId: barraozinho.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: barrao.id,
      confidence: 'verified' as const,
      source: 'Axé Capoeira network information',
      notes: 'Both son AND student of Mestre Barrão.',
    },

    // Barrãozinho and Barrão are father-son
    {
      subjectType: 'person' as const,
      subjectId: barraozinho.id,
      predicate: 'family_of' as const,
      objectType: 'person' as const,
      objectId: barrao.id,
      properties: { relationship_type: 'parent' } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Axé Capoeira network information',
      notes: 'Barrãozinho is the biological son of Barrão (subject has parent relationship with object).',
    },

    // Barrãozinho member_of Axé Capoeira
    {
      subjectType: 'person' as const,
      subjectId: barraozinho.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: axeCapoeira.id,
      confidence: 'verified' as const,
      source: 'Axé Capoeira network information',
      notes: 'Active leader and apparent successor to his father.',
    },

    // ============================================================
    // GRUPO CAPOEIRA FILHOS DE ANGOLA (GCFA): RELATIONSHIPS
    // ============================================================

    // Laércio student_of Caiçara (primary teacher from 1978)
    {
      subjectType: 'person' as const,
      subjectId: laercio.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: caicara.id,
      startedAt: '1978-01-01',
      confidence: 'verified' as const,
      source: 'GCFA documentation',
      notes: 'Started training at age 12 with Caiçara as initial teacher.',
    },

    // Laércio trained_under João Grande
    {
      subjectType: 'person' as const,
      subjectId: laercio.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: joaoGrande.id,
      confidence: 'verified' as const,
      source: 'GCFA documentation',
      notes: 'One of many Angola mestres who trained Laércio.',
    },

    // Laércio trained_under João Pequeno
    {
      subjectType: 'person' as const,
      subjectId: laercio.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: joaoPequeno.id,
      confidence: 'verified' as const,
      source: 'GCFA documentation',
      notes: 'One of many Angola mestres who trained Laércio.',
    },

    // Laércio trained_under Canjiquinha
    {
      subjectType: 'person' as const,
      subjectId: laercio.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: canjiquinha.id,
      confidence: 'verified' as const,
      source: 'GCFA documentation',
    },

    // Laércio trained_under Valdemar
    {
      subjectType: 'person' as const,
      subjectId: laercio.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: valdemar.id,
      confidence: 'verified' as const,
      source: 'GCFA documentation',
    },

    // Laércio trained_under Boca Rica
    {
      subjectType: 'person' as const,
      subjectId: laercio.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: bocaRica.id,
      confidence: 'verified' as const,
      source: 'GCFA documentation',
    },

    // Rosalvo student_of Cobra Mansa
    {
      subjectType: 'person' as const,
      subjectId: rosalvo.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: cobraMansa.id,
      confidence: 'verified' as const,
      source: 'Academia Jangada documentation',
      notes: 'Trained under Cobra Mansa from age 15. Received Contramestre diploma in 1991.',
    },

    // João Pequeno granted_title_to Rosalvo
    {
      subjectType: 'person' as const,
      subjectId: joaoPequeno.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: rosalvo.id,
      startedAt: '2002-01-01',
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Academia Jangada documentation',
      notes: 'Named Mestre by João Pequeno and João Grande in 2002.',
    },

    // João Grande granted_title_to Rosalvo
    {
      subjectType: 'person' as const,
      subjectId: joaoGrande.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: rosalvo.id,
      startedAt: '2002-01-01',
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Academia Jangada documentation',
      notes: 'Named Mestre by João Pequeno and João Grande in 2002.',
    },

    // Roberval co_founded GCFA
    {
      subjectType: 'person' as const,
      subjectId: roberval.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: gcfa.id,
      startedAt: '1984-03-20',
      confidence: 'verified' as const,
      source: 'GCFA documentation',
    },

    // Laércio co_founded GCFA
    {
      subjectType: 'person' as const,
      subjectId: laercio.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: gcfa.id,
      startedAt: '1984-03-20',
      confidence: 'verified' as const,
      source: 'GCFA documentation',
    },

    // Cabore co_founded GCFA
    {
      subjectType: 'person' as const,
      subjectId: cabore.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: gcfa.id,
      startedAt: '1984-03-20',
      confidence: 'verified' as const,
      source: 'GCFA documentation',
    },

    // Rosalvo co_founded GCFA
    {
      subjectType: 'person' as const,
      subjectId: rosalvo.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: gcfa.id,
      startedAt: '1984-03-20',
      confidence: 'verified' as const,
      source: 'GCFA documentation',
    },

    // Laércio leads GCFA (current coordinator)
    {
      subjectType: 'person' as const,
      subjectId: laercio.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: gcfa.id,
      confidence: 'verified' as const,
      source: 'GCFA documentation',
      notes: 'Current international coordinator based in Berlin, coordinates 25+ núcleos.',
    },

    // Caiçara student_of Pastinha (lineage connection)
    {
      subjectType: 'person' as const,
      subjectId: caicara.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      confidence: 'likely' as const,
      source: 'Historical Angola lineage',
      notes: 'Part of the Pastinha lineage of Capoeira Angola.',
    },

    // ============================================================
    // CECA ADDITIONAL HISTORICAL RELATIONSHIPS
    // ============================================================

    // Pastinha student_of Africano Benedito (THE ROOT - African origin)
    {
      subjectType: 'person' as const,
      subjectId: pastinha.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: africanoBenedito.id,
      startedAt: '1899-01-01',
      confidence: 'verified' as const,
      source: "Pastinha's own account, CECA documentation",
      notes:
        'Taught by Benedito (from Angola, Africa) when Pastinha was 10 years old. This is the DIRECT AFRICAN ORIGIN of the Angola lineage.',
    },

    // Faísca student_of João Pequeno
    {
      subjectType: 'person' as const,
      subjectId: faisca.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: joaoPequeno.id,
      startedAt: '1991-01-01',
      confidence: 'verified' as const,
      source: 'CECA/CEDANZE documentation',
      notes: 'First lesson at USP in 1991. Moved to Salvador 1996 to be close to master.',
    },

    // João Pequeno granted_title_to Faísca
    {
      subjectType: 'person' as const,
      subjectId: joaoPequeno.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: faisca.id,
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'CECA/CEDANZE documentation',
      notes: 'Received mestre title from João Pequeno at Academia do Forte.',
    },

    // Faísca leads CECA (current leader, designated successor)
    {
      subjectType: 'person' as const,
      subjectId: faisca.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: ceca.id,
      startedAt: '2011-01-01',
      confidence: 'verified' as const,
      source: 'CECA/CEDANZE documentation',
      notes: 'Designated by João Pequeno to "keep CECA alive". Current General Coordinator.',
    },

    // Curió student_of Pastinha
    {
      subjectType: 'person' as const,
      subjectId: curio.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      confidence: 'verified' as const,
      source: 'Historical records',
      notes: 'Began training with Pastinha as young boy and trained until Pastinha passed away.',
    },

    // ============================================================
    // ICAF/FICA ADDITIONAL RELATIONSHIPS
    // ============================================================

    // Jurandir student_of Moraes
    {
      subjectType: 'person' as const,
      subjectId: jurandir.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: moraes.id,
      confidence: 'verified' as const,
      source: 'ICAF documentation',
      notes: 'Trained at GCAP. Generation 3 from Pastinha.',
    },

    // Valmir student_of Moraes
    {
      subjectType: 'person' as const,
      subjectId: valmir.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: moraes.id,
      confidence: 'verified' as const,
      source: 'ICAF documentation',
      notes: 'Trained at GCAP. Generation 3 from Pastinha.',
    },

    // Jurandir co_founded ICAF
    {
      subjectType: 'person' as const,
      subjectId: jurandir.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: icaf.id,
      startedAt: '1996-01-01',
      confidence: 'verified' as const,
      source: 'ICAF documentation',
      notes: 'ICAF President. Blessed split from GCAP.',
    },

    // Valmir co_founded ICAF
    {
      subjectType: 'person' as const,
      subjectId: valmir.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: icaf.id,
      startedAt: '1996-01-01',
      confidence: 'verified' as const,
      source: 'ICAF documentation',
      notes: 'Leads FICA activities in Salvador, Brazil.',
    },

    // Trenel Joe student_of Jurandir
    {
      subjectType: 'person' as const,
      subjectId: trenelJoe.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: jurandir.id,
      confidence: 'verified' as const,
      source: 'FICA Hawaii website',
      notes: 'Trained under Jurandir and Mestre Silvinho.',
    },

    // Trenel Joe member_of ICAF
    {
      subjectType: 'person' as const,
      subjectId: trenelJoe.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: icaf.id,
      startedAt: '2005-01-01',
      confidence: 'verified' as const,
      source: 'FICA Hawaii website',
      notes: 'Founded FICA Hawaii chapter in 2005.',
    },

    // ============================================================
    // GCAIG IRMÃOS GUERREIROS RELATIONSHIPS
    // ============================================================

    // Marrom student_of Baixinho (son trained by father)
    {
      subjectType: 'person' as const,
      subjectId: marrom.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: baixinho.id,
      startedAt: '1978-01-01',
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: 'Trained by father from age 8. Biological son.',
    },

    // Marrom family_of Baixinho (father-son)
    {
      subjectType: 'person' as const,
      subjectId: marrom.id,
      predicate: 'family_of' as const,
      objectType: 'person' as const,
      objectId: baixinho.id,
      properties: { relationship_type: 'parent' } as StatementProperties,
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: 'Marrom is the biological son of Baixinho (subject has parent relationship with object).',
    },

    // Baixinho founded GCAIG
    {
      subjectType: 'person' as const,
      subjectId: baixinho.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: gcaig.id,
      startedAt: '1983-01-01',
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: 'Co-founded with son Marrom and brothers Guerreiro and Macete.',
    },

    // Marrom co_founded GCAIG (at age 13)
    {
      subjectType: 'person' as const,
      subjectId: marrom.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: gcaig.id,
      startedAt: '1983-01-01',
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: 'Child co-founder at age 13. Now leads São Paulo operations.',
    },

    // Marrom leads GCAIG (current leader)
    {
      subjectType: 'person' as const,
      subjectId: marrom.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: gcaig.id,
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: 'Currently "at the forefront of group activities" in São Paulo.',
    },

    // Perna student_of Baixinho
    {
      subjectType: 'person' as const,
      subjectId: perna.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: baixinho.id,
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: 'Started training at age 9 at Senzalinha.',
    },

    // Perna student_of Marrom
    {
      subjectType: 'person' as const,
      subjectId: perna.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: marrom.id,
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: 'Trained under both Baixinho and Marrom.',
    },

    // Perna member_of GCAIG
    {
      subjectType: 'person' as const,
      subjectId: perna.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: gcaig.id,
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: 'European coordinator since 2002. Titled mestre 2013.',
    },

    // Kenneth student_of Moraes (external lineage)
    {
      subjectType: 'person' as const,
      subjectId: kenneth.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: moraes.id,
      startedAt: '1987-01-01',
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: 'Trained at GCAP in Salvador before joining GCAIG.',
    },

    // Kenneth member_of GCAIG (joined 2008)
    {
      subjectType: 'person' as const,
      subjectId: kenneth.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: gcaig.id,
      startedAt: '2008-01-01',
      confidence: 'verified' as const,
      source: 'GCAIG documentation',
      notes: '"Right hand" of Mestre Perna in Europe. Brings GCAP lineage.',
    },

    // ============================================================
    // NGOMA CAPOEIRA ANGOLA RELATIONSHIPS
    // Note: Anastácio Marrom is different from GCAIG Marrom
    // ============================================================

    // --- Pastinha lineage through Cobrinha Verde (musical tradition) ---
    // Cobrinha Verde student_of Pastinha (Bateria master)
    {
      subjectType: 'person' as const,
      subjectId: cobrinhaVerde.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Mestre de Bateria (Master of Music) at CECA. Key musical lineage.',
    },

    // Gato Preto student_of Cobrinha Verde
    {
      subjectType: 'person' as const,
      subjectId: gatoPerto.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: cobrinhaVerde.id,
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Known as "Berimbau de Ouro da Bahía".',
    },

    // --- Anastácio Marrom's Regional period (1970s-1990) ---
    // Anastácio Marrom trained_under Canela (first teacher)
    {
      subjectType: 'person' as const,
      subjectId: anastacioMarrom.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: canela.id,
      startedAt: '1975-01-01',
      endedAt: '1980-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'First formal capoeira teacher in Engenho Novo, Rio.',
    },

    // Anastácio Marrom student_of Peixinho (Regional period)
    {
      subjectType: 'person' as const,
      subjectId: anastacioMarrom.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: peixinho.id,
      startedAt: '1980-01-01',
      endedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Trained at Grupo Senzala, received red belt. Regional period before transition to Angola.',
    },

    // --- Anastácio Marrom's Angola period (1990-present) ---
    // Anastácio Marrom student_of Gato Preto (PRIMARY Angola teacher)
    {
      subjectType: 'person' as const,
      subjectId: anastacioMarrom.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: gatoPerto.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Primary Angola teacher. Key link to Pastinha lineage through musical tradition.',
    },

    // Anastácio Marrom trained_under Angolinha
    {
      subjectType: 'person' as const,
      subjectId: anastacioMarrom.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: angolinha.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Major Angola influence and reference.',
    },

    // Anastácio Marrom trained_under Nô
    {
      subjectType: 'person' as const,
      subjectId: anastacioMarrom.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: mestreNo.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Angola influence and reference.',
    },

    // Anastácio Marrom trained_under João Grande
    {
      subjectType: 'person' as const,
      subjectId: anastacioMarrom.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: joaoGrande.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Angola influence and reference.',
    },

    // --- Ngoma founding and leadership ---
    // Anastácio Marrom co_founded Ngoma
    {
      subjectType: 'person' as const,
      subjectId: anastacioMarrom.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: ngoma.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Originally "Marrom Capoeira & Alunos". Renamed to Ngoma in 2018.',
    },

    // Tatiana co_founded Ngoma
    {
      subjectType: 'person' as const,
      subjectId: tatiana.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: ngoma.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: "Co-founder and co-producer of all school projects. Women's leadership advocate.",
    },

    // Anastácio Marrom leads Ngoma
    {
      subjectType: 'person' as const,
      subjectId: anastacioMarrom.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: ngoma.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Current',
      notes: 'Primary leader for 30+ years.',
    },

    // --- Ngoma students (autonomous continuation model) ---
    // Forró student_of Anastácio Marrom
    {
      subjectType: 'person' as const,
      subjectId: forro.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: anastacioMarrom.id,
      startedAt: '1990-01-01',
      endedAt: '2004-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: '~15 years training in Rio. Made Contra-Mestre in 2004.',
    },

    // Anastácio Marrom granted_title_to Forró
    {
      subjectType: 'person' as const,
      subjectId: anastacioMarrom.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: forro.id,
      startedAt: '2004-01-01',
      properties: {
        title_grant: { title: 'contra-mestre', location: 'Rio de Janeiro' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
    },

    // Forró member_of Ngoma
    {
      subjectType: 'person' as const,
      subjectId: forro.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: ngoma.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Leads Forum Brasil (Berlin) and Capoeira Angola Hannover.',
    },

    // Stéph student_of Anastácio Marrom
    {
      subjectType: 'person' as const,
      subjectId: steph.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: anastacioMarrom.id,
      startedAt: '1998-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: '15+ years training in Rio.',
    },

    // Stéph member_of Ngoma
    {
      subjectType: 'person' as const,
      subjectId: steph.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: ngoma.id,
      startedAt: '1998-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Founded Association Oyà in Paris (2018) representing Ngoma.',
    },

    // Bom Cabelo student_of Anastácio Marrom
    {
      subjectType: 'person' as const,
      subjectId: bomCabelo.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: anastacioMarrom.id,
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Longtime student.',
    },

    // Bom Cabelo member_of Ngoma
    {
      subjectType: 'person' as const,
      subjectId: bomCabelo.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: ngoma.id,
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Co-leads Tambor Vivo / Ngoma Capoeira Angola in Helsinki.',
    },

    // Dion Dragas student_of Anastácio Marrom
    {
      subjectType: 'person' as const,
      subjectId: dionDragas.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: anastacioMarrom.id,
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
    },

    // Dion Dragas member_of Ngoma
    {
      subjectType: 'person' as const,
      subjectId: dionDragas.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: ngoma.id,
      startedAt: '2002-01-01',
      confidence: 'verified' as const,
      source: 'Ngoma case study research',
      notes: 'Founded Mão No Chão in Edinburgh ~2002. Rebranded to Ngoma Scotland. Now based in Athens/Crete.',
    },

    // ============================================================
    // ANGOLEIROS DO SERTÃO RELATIONSHIPS
    // Mestre Cláudio Costa and nucleus network
    // ============================================================

    // Cláudio Costa student_of Di Mola
    {
      subjectType: 'person' as const,
      subjectId: claudioCosta.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: diMola.id,
      confidence: 'verified' as const,
      source: 'Angoleiros do Sertão case study research',
      notes: 'Initial training. Also learned through street experience in Feira de Santana.',
    },

    // Cláudio Costa founded Angoleiros do Sertão
    {
      subjectType: 'person' as const,
      subjectId: claudioCosta.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: angoleirosSertao.id,
      startedAt: '1985-01-01',
      confidence: 'verified' as const,
      source: 'Angoleiros do Sertão case study research',
      notes: 'Founded in 1980s, exact year uncertain.',
    },

    // Cláudio Costa leads Angoleiros do Sertão
    {
      subjectType: 'person' as const,
      subjectId: claudioCosta.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: angoleirosSertao.id,
      startedAt: '1985-01-01',
      confidence: 'verified' as const,
      source: 'Current',
      notes: 'Headquarters in Feira de Santana. Oversees 20+ núcleos worldwide.',
    },

    // Tito Casal student_of Cláudio Costa
    {
      subjectType: 'person' as const,
      subjectId: titoCasal.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: claudioCosta.id,
      confidence: 'verified' as const,
      source: 'Angoleiros do Sertão case study research',
      notes: 'Long time student. Trained in Feira de Santana.',
    },

    // Tito Casal member_of Angoleiros do Sertão
    {
      subjectType: 'person' as const,
      subjectId: titoCasal.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: angoleirosSertao.id,
      startedAt: '2015-01-01',
      confidence: 'verified' as const,
      source: 'Angoleiros do Sertão case study research',
      notes: 'Established Berlin nucleus in 2015. Leads classes in Neukölln district.',
    },

    // Cláudio Costa associated_with Felipe de Santo Amaro (album collaboration)
    {
      subjectType: 'person' as const,
      subjectId: claudioCosta.id,
      predicate: 'associated_with' as const,
      objectType: 'person' as const,
      objectId: felipeSantoAmaro.id,
      startedAt: '2004-01-01',
      properties: {
        association_type: 'friend',
        context: 'Album collaboration "Angoleiros do Sertão e do Recôncavo" (2004)',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Spotify/Apple Music',
      notes: 'Collaboration between different regional Angola traditions (Sertão interior + Recôncavo coastal).',
    },

    // ============================================================
    // ESCOLA NESTOR CAPOEIRA RELATIONSHIPS
    // Scholar-practitioner lineage
    // ============================================================

    // Preguiça student_of Bimba
    {
      subjectType: 'person' as const,
      subjectId: preguica.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: bimba.id,
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: "Formado from Bimba's academy. Came to Rio with Acordeon's folk show.",
    },

    // Preguiça member_of Senzala
    {
      subjectType: 'person' as const,
      subjectId: preguica.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'Stayed in Rio and became Senzala founder.',
    },

    // Nestor student_of Leopoldina (first teacher, 1965-1967)
    {
      subjectType: 'person' as const,
      subjectId: nestorCapoeira.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: leopoldina.id,
      startedAt: '1965-01-01',
      endedAt: '1967-01-01',
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'Initial teacher in Rio de Janeiro. Regional-oriented.',
    },

    // Nestor trained_under Preguiça (Senzala, graduated 1969)
    {
      subjectType: 'person' as const,
      subjectId: nestorCapoeira.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: preguica.id,
      startedAt: '1968-01-01',
      endedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'Received red cord (highest rank) in 1969. One of the mestres who graduated Nestor.',
    },

    // Nestor trained_under Gato (Senzala)
    {
      subjectType: 'person' as const,
      subjectId: nestorCapoeira.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: gato.id,
      startedAt: '1968-01-01',
      endedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'One of the mestres who graduated Nestor to red cord in 1969.',
    },

    // Nestor member_of Senzala (1968-1990)
    {
      subjectType: 'person' as const,
      subjectId: nestorCapoeira.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1968-01-01',
      endedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: '22 years with Senzala. Left to found own school.',
    },

    // Nestor departed_from Senzala (1990)
    {
      subjectType: 'person' as const,
      subjectId: nestorCapoeira.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: senzala.id,
      startedAt: '1990-01-01',
      properties: {
        departure_type: 'neutral',
        context: 'Left after 22 years to develop own philosophy and teaching methodology.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'No evidence of conflict - mature independence.',
    },

    // Nestor founded Escola Nestor Capoeira
    {
      subjectType: 'person' as const,
      subjectId: nestorCapoeira.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: escolaNestor.id,
      startedAt: '1992-01-01',
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'Formal establishment at Planetário da Gávea after Denmark trip.',
    },

    // Nestor leads Escola Nestor Capoeira
    {
      subjectType: 'person' as const,
      subjectId: nestorCapoeira.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: escolaNestor.id,
      startedAt: '1992-01-01',
      endedAt: '2025-03-29',
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'Led until death on March 29, 2025.',
    },

    // Jorge Itapuã student_of Nestor (son and first mestre)
    {
      subjectType: 'person' as const,
      subjectId: jorgeItapua.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: nestorCapoeira.id,
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'Biological son. First mestre trained by Escola Nestor Capoeira.',
    },

    // Jorge Itapuã family_of Nestor (son)
    {
      subjectType: 'person' as const,
      subjectId: jorgeItapua.id,
      predicate: 'family_of' as const,
      objectType: 'person' as const,
      objectId: nestorCapoeira.id,
      properties: {
        relationship_type: 'parent',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'Son of Nestor and filmmaker Rose Lacreta.',
    },

    // Nestor granted_title_to Jorge Itapuã (first mestre from ENC)
    {
      subjectType: 'person' as const,
      subjectId: nestorCapoeira.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: jorgeItapua.id,
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'First mestre graduated from Escola Nestor Capoeira.',
    },

    // Jorge Itapuã member_of Escola Nestor Capoeira
    {
      subjectType: 'person' as const,
      subjectId: jorgeItapua.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: escolaNestor.id,
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'First mestre. Potential successor.',
    },

    // Roberto Coelho student_of Nestor
    {
      subjectType: 'person' as const,
      subjectId: robertoCoelho.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: nestorCapoeira.id,
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
    },

    // Roberto Coelho member_of Escola Nestor Capoeira
    {
      subjectType: 'person' as const,
      subjectId: robertoCoelho.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: escolaNestor.id,
      startedAt: '2018-01-01',
      confidence: 'verified' as const,
      source: 'Escola Nestor Capoeira case study research',
      notes: 'Founded Belo Horizonte branch in 2018. UEMG university partnership.',
    },

    // ============================================================
    // CAPOEIRA ARUANDA AUSTRALIA RELATIONSHIPS
    // Regional lineage through Bimba → Vermelho 27 → Boa Gente → Borracha
    // ============================================================

    // Vermelho 27 student_of Bimba
    {
      subjectType: 'person' as const,
      subjectId: vermelho27.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: bimba.id,
      startedAt: '1953-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Aruanda case study research',
      notes:
        "Took over Bimba's academy when Bimba left Salvador. Renamed to Associação de Capoeira Mestre Bimba in 1975.",
    },

    // Boa Gente trained_under Vermelho 27 (Regional lineage)
    {
      subjectType: 'person' as const,
      subjectId: boaGente.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: vermelho27.id,
      confidence: 'verified' as const,
      source: 'Capoeira Aruanda case study research',
      notes: 'Regional training at Bimba lineage academy.',
    },

    // Boa Gente trained_under Gato (Angola lineage, different from Senzala Gato)
    // Note: This is a different Mestre Gato - Escola Baiana de Capoeira Angola
    // Commenting out as we don't have this specific Gato in the database
    // {
    //   subjectType: 'person' as const,
    //   subjectId: boaGente.id,
    //   predicate: 'trained_under' as const,
    //   objectType: 'person' as const,
    //   objectId: /* different Gato */ ,
    //   notes: 'Angola training at Escola Baiana de Capoeira Angola.',
    // },

    // Borracha member_of Capoeira Brasil (1997-2005)
    {
      subjectType: 'person' as const,
      subjectId: borracha.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: capoeiraBrasil.id,
      startedAt: '1997-01-01',
      endedAt: '2005-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Aruanda case study research',
      notes: 'Sent to Sydney as CB teacher. 8 years teaching for CB.',
    },

    // Borracha departed_from Capoeira Brasil
    {
      subjectType: 'person' as const,
      subjectId: borracha.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: capoeiraBrasil.id,
      startedAt: '2005-01-01',
      properties: {
        departure_type: 'neutral',
        context: 'Founded independent group Capoeiracre after 8 years teaching for CB in Sydney.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Aruanda case study research',
      notes: 'Nature of split unknown (blessed vs conflict not documented).',
    },

    // Borracha founded Capoeira Aruanda
    {
      subjectType: 'person' as const,
      subjectId: borracha.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: aruandaAustralia.id,
      startedAt: '2005-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Aruanda case study research',
      notes: 'Originally named Capoeiracre, renamed to Capoeira Aruanda in 2007.',
    },

    // Borracha leads Capoeira Aruanda
    {
      subjectType: 'person' as const,
      subjectId: borracha.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: aruandaAustralia.id,
      startedAt: '2005-01-01',
      confidence: 'verified' as const,
      source: 'Current',
      notes: '20+ years teaching in Australia.',
    },

    // Boa Gente granted_title_to Borracha (mestre 2015)
    {
      subjectType: 'person' as const,
      subjectId: boaGente.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: borracha.id,
      startedAt: '2015-01-01',
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Aruanda case study research',
      notes: 'Independent graduation outside Capoeira Brasil hierarchy. Direct Bimba lineage through Vermelho 27.',
    },

    // ============================================================
    // CAPOEIRA MANDINGA AOTEAROA (NEW ZEALAND) RELATIONSHIPS
    // First capoeira in NZ, style evolution from Regional to Angola
    // ============================================================

    // Suassuna student_of Bimba
    {
      subjectType: 'person' as const,
      subjectId: suassuna.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: bimba.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'Trained under Bimba. Co-founded Cordão de Ouro (1967).',
    },

    // Caveirinha student_of Suassuna
    {
      subjectType: 'person' as const,
      subjectId: caveirinha.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: suassuna.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'Trained at Cordão de Ouro. One of last generation to train directly with Suassuna.',
    },

    // Caveirinha founded Capoeira Mandinga
    {
      subjectType: 'person' as const,
      subjectId: caveirinha.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: mandinga.id,
      startedAt: '1984-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'Originally Senzala Grande (1984), renamed Capoeira Mandinga (1995).',
    },

    // Caveirinha leads Capoeira Mandinga
    {
      subjectType: 'person' as const,
      subjectId: caveirinha.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: mandinga.id,
      startedAt: '1984-01-01',
      confidence: 'verified' as const,
      source: 'Current',
    },

    // João Pequeno student_of Pastinha
    {
      subjectType: 'person' as const,
      subjectId: joaoPequeno.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: "One of two principal heirs to Pastinha's legacy (with João Grande).",
    },

    // Jogo de Dentro student_of João Pequeno
    {
      subjectType: 'person' as const,
      subjectId: jogoDeDentro.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: joaoPequeno.id,
      startedAt: '1982-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'Started at Forte Santo Antônio with João Pequeno.',
    },

    // João Pequeno granted_title_to Jogo de Dentro
    {
      subjectType: 'person' as const,
      subjectId: joaoPequeno.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: jogoDeDentro.id,
      startedAt: '1994-02-27',
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
    },

    // Roxinho founded ECAMAR
    {
      subjectType: 'person' as const,
      subjectId: roxinho.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: ecamar.id,
      startedAt: '1998-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'Founded in Salvador. Expanded to Sydney (2006).',
    },

    // Roxinho leads ECAMAR
    {
      subjectType: 'person' as const,
      subjectId: roxinho.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: ecamar.id,
      startedAt: '1998-01-01',
      confidence: 'verified' as const,
      source: 'Current',
    },

    // Brabo student_of Caveirinha
    {
      subjectType: 'person' as const,
      subjectId: brabo.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: caveirinha.id,
      startedAt: '1984-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'Met in USA (1983), began training (1984). 33+ year relationship.',
    },

    // Brabo trained_under João Pequeno
    {
      subjectType: 'person' as const,
      subjectId: brabo.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: joaoPequeno.id,
      startedAt: '2004-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'Traveled to Brazil for Angola training. Part of style transition.',
    },

    // Brabo trained_under Jogo de Dentro
    {
      subjectType: 'person' as const,
      subjectId: brabo.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: jogoDeDentro.id,
      startedAt: '2004-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'Key influence on Angola transition. Traveled to Bahia for training.',
    },

    // Brabo founded Mandinga Aotearoa
    {
      subjectType: 'person' as const,
      subjectId: brabo.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: mandingaAotearoa.id,
      startedAt: '1992-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'First capoeira ever taught in New Zealand.',
    },

    // Brabo leads Mandinga Aotearoa
    {
      subjectType: 'person' as const,
      subjectId: brabo.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: mandingaAotearoa.id,
      startedAt: '1992-01-01',
      confidence: 'verified' as const,
      source: 'Current',
      notes: '33+ years leading NZ capoeira.',
    },

    // Caveirinha granted_title_to Brabo (mestre 2007)
    {
      subjectType: 'person' as const,
      subjectId: caveirinha.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: brabo.id,
      startedAt: '2007-04-21',
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'First capoeira master in New Zealand history. Also received Professor title (1999).',
    },

    // Mandinga Aotearoa part_of Mandinga (chapter relationship)
    {
      subjectType: 'group' as const,
      subjectId: mandingaAotearoa.id,
      predicate: 'part_of' as const,
      objectType: 'group' as const,
      objectId: mandinga.id,
      startedAt: '1992-01-01',
      properties: {
        affiliation_type: 'branch',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Aotearoa case study research',
      notes: 'NZ chapter of international Capoeira Mandinga. Maintains stylistic autonomy (Angola focus).',
    },

    // ============================================================
    // CAPOEIRA ANGOLA CENTER KIBERA (KENYA) RELATIONSHIPS
    // First East African branch, "reverse diaspora"
    // ============================================================

    // Salim Rollins student_of João Grande
    {
      subjectType: 'person' as const,
      subjectId: salimRollins.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: joaoGrande.id,
      startedAt: '1995-01-01',
      confidence: 'verified' as const,
      source: 'CACK case study research',
      notes: '20+ years training with João Grande in NYC before returning to Kenya.',
    },

    // Salim Rollins founded CACK
    {
      subjectType: 'person' as const,
      subjectId: salimRollins.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: cack.id,
      startedAt: '2015-01-01',
      confidence: 'verified' as const,
      source: 'CACK case study research',
      notes: 'First East African branch of João Grande network.',
    },

    // Salim Rollins leads CACK
    {
      subjectType: 'person' as const,
      subjectId: salimRollins.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: cack.id,
      startedAt: '2015-01-01',
      confidence: 'verified' as const,
      source: 'Current',
      notes: 'Also operates program in Luanda, Angola.',
    },

    // CACK part_of JGCAC (João Grande Capoeira Angola Center)
    {
      subjectType: 'group' as const,
      subjectId: cack.id,
      predicate: 'part_of' as const,
      objectType: 'group' as const,
      objectId: jgcac.id,
      startedAt: '2015-01-01',
      properties: {
        affiliation_type: 'branch',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'CACK case study research',
      notes: 'Official African branch of João Grande network. Only African location in network.',
    },

    // ============================================================
    // GRUPO CANDEIAS DE CAPOEIRA RELATIONSHIPS
    // Regional powerhouse with Bimba lineage through son Formiga
    // ============================================================

    // Formiga family_of Bimba (biological son)
    {
      subjectType: 'person' as const,
      subjectId: formiga.id,
      predicate: 'family_of' as const,
      objectType: 'person' as const,
      objectId: bimba.id,
      properties: {
        relationship_type: 'parent',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
      notes: 'Biological son of Mestre Bimba (founder of Capoeira Regional).',
    },

    // Formiga trained_under Bimba (learned from father)
    {
      subjectType: 'person' as const,
      subjectId: formiga.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: bimba.id,
      confidence: 'likely' as const,
      source: 'Grupo Candeias case study research',
      notes: 'As biological son, likely trained directly under Bimba.',
    },

    // Carlinhos Chuchu student_of Formiga
    {
      subjectType: 'person' as const,
      subjectId: carlinhosChuchu.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: formiga.id,
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
      notes: "Trained under Formiga (Bimba's son), giving direct biological lineage to Bimba.",
    },

    // Carlinhos Chuchu founded Grupo Candeias
    {
      subjectType: 'person' as const,
      subjectId: carlinhosChuchu.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: grupoCandeias.id,
      startedAt: '1977-01-01',
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
      notes: 'Founded as Grupo de Capoeira Anglo-Regional in 1977. Earlier SESC program from 1975.',
    },

    // Passarinho member_of Grupo Candeias
    {
      subjectType: 'person' as const,
      subjectId: passarinho.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: grupoCandeias.id,
      startedAt: '1977-01-01',
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
    },

    // Passarinho leads Grupo Candeias (1978-1981)
    {
      subjectType: 'person' as const,
      subjectId: passarinho.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: grupoCandeias.id,
      startedAt: '1978-01-01',
      endedAt: '1981-01-01',
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
      notes: 'Renamed group to São Bento Pequeno during his leadership.',
    },

    // Suíno student_of Carlinhos Chuchu (first mestre graduated by group)
    {
      subjectType: 'person' as const,
      subjectId: suino.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: carlinhosChuchu.id,
      confidence: 'likely' as const,
      source: 'Grupo Candeias case study research',
      notes: 'First mestre trained/graduated by Grupo Candeias itself.',
    },

    // Suíno member_of Grupo Candeias
    {
      subjectType: 'person' as const,
      subjectId: suino.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: grupoCandeias.id,
      startedAt: '1977-01-01',
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
    },

    // Suíno leads Grupo Candeias (1981-present)
    {
      subjectType: 'person' as const,
      subjectId: suino.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: grupoCandeias.id,
      startedAt: '1981-01-01',
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
      notes: 'President since 1981 (44+ years). Primary architect of expansion. Led 1991 unification.',
    },

    // Mestre Osvaldo cultural_pioneer_of Goiás (connected to Bimba visit)
    {
      subjectType: 'person' as const,
      subjectId: mestreOsvaldo.id,
      predicate: 'cultural_pioneer_of' as const,
      objectType: 'group' as const,
      objectId: grupoCandeias.id,
      startedAt: '1968-01-01',
      properties: {
        region: 'Goiás',
        country: 'Brazil',
        context: 'Pioneer period late 1960s. Organized Bimba visit to Goiânia for historic graduation ceremony.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
      notes:
        "Pre-dates formal group founding. Brought Mestre Bimba to Goiânia. Subject of book 'A História da Capoeira de Goiás'.",
    },

    // Mestre Sabú cultural_pioneer_of Goiás
    {
      subjectType: 'person' as const,
      subjectId: mestreSabu.id,
      predicate: 'cultural_pioneer_of' as const,
      objectType: 'group' as const,
      objectId: grupoCandeias.id,
      startedAt: '1968-01-01',
      properties: {
        region: 'Goiás',
        country: 'Brazil',
        context: 'Pioneer period late 1960s. Public rodas at Praça Cívica and Feira Hippie. Instrument maker.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
      notes: "Pre-dates formal group founding. Subject of book 'A História da Capoeira de Goiás'.",
    },

    // Mestre Osvaldo and Mestre Sabú as co-pioneers (associated_with each other)
    {
      subjectType: 'person' as const,
      subjectId: mestreOsvaldo.id,
      predicate: 'associated_with' as const,
      objectType: 'person' as const,
      objectId: mestreSabu.id,
      startedAt: '1968-01-01',
      properties: {
        association_type: 'friend',
        context: 'Co-pioneers of capoeira in Goiás (late 1960s)',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Grupo Candeias case study research',
      notes: "Both honored in book 'A História da Capoeira de Goiás Contada Por Seus Pioneiros'.",
    },

    // ============================================================
    // ACAD (ASSOCIAÇÃO DE CAPOEIRA ANGOLA DOBRADA) RELATIONSHIPS
    // Dual lineage from GCAP + FICA, founded in Germany 1992
    // ============================================================

    // Rogério student_of Moraes
    {
      subjectType: 'person' as const,
      subjectId: rogerio.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: moraes.id,
      startedAt: '1972-01-01',
      confidence: 'verified' as const,
      source: 'ACAD case study research',
      notes: 'Trained at GCAP. Part of dual lineage recognition (GCAP + FICA).',
    },

    // Rogério trained_under Cobra Mansa
    {
      subjectType: 'person' as const,
      subjectId: rogerio.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: cobraMansa.id,
      confidence: 'verified' as const,
      source: 'ACAD case study research',
      notes: 'Part of dual lineage recognition (GCAP + FICA).',
    },

    // Moraes granted_title_to Rogério (1989)
    {
      subjectType: 'person' as const,
      subjectId: moraes.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: rogerio.id,
      startedAt: '1989-01-01',
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'ACAD case study research',
      notes: 'Dual recognition - titled by both Moraes (GCAP) and Cobra Mansa (FICA) in 1989.',
    },

    // Cobra Mansa granted_title_to Rogério (1989)
    {
      subjectType: 'person' as const,
      subjectId: cobraMansa.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: rogerio.id,
      startedAt: '1989-01-01',
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'ACAD case study research',
      notes: 'Dual recognition - titled by both Moraes (GCAP) and Cobra Mansa (FICA) in 1989.',
    },

    // Índio student_of Rogério
    {
      subjectType: 'person' as const,
      subjectId: indio.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: rogerio.id,
      startedAt: '1990-01-01',
      confidence: 'verified' as const,
      source: 'ACAD case study research',
      notes: 'Trained under Rogério after inviting him to Germany in 1990.',
    },

    // Rogério granted_title_to Índio (2004)
    {
      subjectType: 'person' as const,
      subjectId: rogerio.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: indio.id,
      startedAt: '2004-01-01',
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'ACAD case study research',
      notes: 'Titled 12 years after co-founding ACAD together.',
    },

    // Rogério co_founded ACAD
    {
      subjectType: 'person' as const,
      subjectId: rogerio.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: acad.id,
      startedAt: '1992-01-01',
      confidence: 'verified' as const,
      source: 'ACAD case study research',
      notes: 'Co-founded in Kassel, Germany - one of first Angola orgs in Europe.',
    },

    // Índio co_founded ACAD
    {
      subjectType: 'person' as const,
      subjectId: indio.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: acad.id,
      startedAt: '1992-01-01',
      confidence: 'verified' as const,
      source: 'ACAD case study research',
      notes: 'Co-founded when not yet mestre (titled 2004).',
    },

    // Rogério leads ACAD
    {
      subjectType: 'person' as const,
      subjectId: rogerio.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: acad.id,
      startedAt: '1992-01-01',
      confidence: 'verified' as const,
      source: 'ACAD case study research',
      notes: 'Primary traveling teacher. Lives in Düsseldorf, teaches across Germany.',
    },

    // ============================================================
    // CAI NA CAPOEIRA RELATIONSHIPS
    // CDO affiliate in Hudson Valley, NY - remote supervision model
    // ============================================================

    // Esquilo student_of Suassuna (CDO lineage)
    {
      subjectType: 'person' as const,
      subjectId: esquilo.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: suassuna.id,
      confidence: 'likely' as const,
      source: 'Cai Na Capoeira case study research',
      notes: 'CDO lineage - leads CDO nucleus in Sete Lagoas.',
    },

    // Esquilo member_of CDO
    {
      subjectType: 'person' as const,
      subjectId: esquilo.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: cordaoDeOuro.id,
      confidence: 'verified' as const,
      source: 'Cai Na Capoeira case study research',
      notes: 'Leads CDO Sete Lagoas nucleus.',
    },

    // Cabeção student_of Esquilo
    {
      subjectType: 'person' as const,
      subjectId: cabecao.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: esquilo.id,
      startedAt: '1996-06-01',
      confidence: 'verified' as const,
      source: 'Cai Na Capoeira case study research',
      notes: 'Trained in Sete Lagoas, Minas Gerais from June 1996.',
    },

    // Cabeção founded Cai Na Capoeira
    {
      subjectType: 'person' as const,
      subjectId: cabecao.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: caiNaCapoeira.id,
      startedAt: '2012-01-01',
      confidence: 'verified' as const,
      source: 'Cai Na Capoeira case study research',
      notes: 'Started teaching in Ossining, NY. First batizado October 2012.',
    },

    // Cabeção leads Cai Na Capoeira
    {
      subjectType: 'person' as const,
      subjectId: cabecao.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: caiNaCapoeira.id,
      startedAt: '2012-01-01',
      confidence: 'verified' as const,
      source: 'Cai Na Capoeira case study research',
      notes: 'Under supervision of Mestre Esquilo in Brazil.',
    },

    // Cai Na Capoeira part_of CDO (affiliate relationship)
    {
      subjectType: 'group' as const,
      subjectId: caiNaCapoeira.id,
      predicate: 'part_of' as const,
      objectType: 'group' as const,
      objectId: cordaoDeOuro.id,
      startedAt: '2012-01-01',
      properties: {
        affiliation_type: 'affiliate',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Cai Na Capoeira case study research',
      notes: 'Supervised affiliate - follows CDO methodology, graduation system. Remote supervision from Brazil.',
    },

    // ============================================================
    // ESCOLA DE CAPOEIRA ANGOLA NZINGA (GERMANY) RELATIONSHIPS
    // Filhos de Angola lineage: Besouro → Cobrinha Verde → Roque → Adilson → Paulo
    // ============================================================

    // Cobrinha Verde student_of Besouro (cousin relationship + training)
    {
      subjectType: 'person' as const,
      subjectId: cobrinhaVerde.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: besouro.id,
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
      notes: 'Cobrinha Verde was cousin and student of Besouro Mangangá.',
    },

    // Cobrinha Verde family_of Besouro (cousins)
    {
      subjectType: 'person' as const,
      subjectId: cobrinhaVerde.id,
      predicate: 'family_of' as const,
      objectType: 'person' as const,
      objectId: besouro.id,
      properties: {
        relationship_type: 'other',
        other_type: 'cousin',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
      notes: 'Cobrinha Verde was cousin of Besouro Mangangá.',
    },

    // Roque founded Filhos de Angola Rio
    {
      subjectType: 'person' as const,
      subjectId: mestreRoque.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: filhosDeAngolaRio.id,
      startedAt: '1960-01-01',
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
      notes: 'Founded in Pavão/Pavãozinho favela. One of founding lineages of capoeira contemporânea in Rio.',
    },

    // Roque leads Filhos de Angola Rio
    {
      subjectType: 'person' as const,
      subjectId: mestreRoque.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: filhosDeAngolaRio.id,
      startedAt: '1960-01-01',
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
    },

    // Adilson student_of Roque
    {
      subjectType: 'person' as const,
      subjectId: adilsonCamisaPreta.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: mestreRoque.id,
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
      notes: 'Trained at Morro do Pavão. Later took over leadership.',
    },

    // Adilson member_of Filhos de Angola Rio
    {
      subjectType: 'person' as const,
      subjectId: adilsonCamisaPreta.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: filhosDeAngolaRio.id,
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
    },

    // Adilson leads Filhos de Angola Rio (took over in 1970s)
    {
      subjectType: 'person' as const,
      subjectId: adilsonCamisaPreta.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: filhosDeAngolaRio.id,
      startedAt: '1975-01-01',
      confidence: 'likely' as const,
      source: 'Nzinga Germany case study research',
      notes: 'Took over leadership in 1970s.',
    },

    // Paulo Siqueira student_of Adilson
    {
      subjectType: 'person' as const,
      subjectId: pauloSiqueira.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: adilsonCamisaPreta.id,
      startedAt: '1972-01-01',
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
      notes: 'Primary teacher. Also trained under Roque at same academy.',
    },

    // Paulo Siqueira trained_under Roque
    {
      subjectType: 'person' as const,
      subjectId: pauloSiqueira.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: mestreRoque.id,
      startedAt: '1972-01-01',
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
      notes: "Started at Roque's academy, also trained directly under supervising mestre.",
    },

    // Adilson granted_title_to Paulo Siqueira
    {
      subjectType: 'person' as const,
      subjectId: adilsonCamisaPreta.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: pauloSiqueira.id,
      properties: {
        title_grant: { title: 'mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
      notes: 'Paulo was titled by his direct teacher Adilson.',
    },

    // Paulo Siqueira founded Nzinga Germany
    {
      subjectType: 'person' as const,
      subjectId: pauloSiqueira.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: nzingaGermany.id,
      startedAt: '1985-01-01',
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
      notes: 'Founded in Hamburg at Zeppelin Theater. Pioneer of capoeira in Europe.',
    },

    // Paulo Siqueira leads Nzinga Germany
    {
      subjectType: 'person' as const,
      subjectId: pauloSiqueira.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: nzingaGermany.id,
      startedAt: '1985-01-01',
      confidence: 'verified' as const,
      source: 'Nzinga Germany case study research',
      notes: '40+ years leading the school. Teaches in Hamburg, Hannover, Kiel.',
    },

    // ============================================================
    // CAPOEIRA BEIRA-MAR RELATIONSHIPS
    // Regional lineage: Bimba → Suassuna → Medicina → Tarzan → Bundo
    // ============================================================

    // Medicina student_of Suassuna
    {
      subjectType: 'person' as const,
      subjectId: medicina.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: suassuna.id,
      confidence: 'verified' as const,
      source: 'Beira-Mar case study research',
      notes: 'Disciple of Suassuna. Remained in Bahia when Suassuna moved to São Paulo.',
    },

    // Tarzan student_of Medicina
    {
      subjectType: 'person' as const,
      subjectId: tarzan.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: medicina.id,
      confidence: 'verified' as const,
      source: 'Beira-Mar case study research',
      notes: 'Direct lineage: Bimba → Suassuna → Medicina → Tarzan (gen 4).',
    },

    // Tarzan founded Beira-Mar
    {
      subjectType: 'person' as const,
      subjectId: tarzan.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: beiraMar.id,
      startedAt: '1975-01-01',
      confidence: 'verified' as const,
      source: 'Beira-Mar case study research',
      notes: "1974: Arrived in Campinas 'by indication of Mestre Suassuna'. Founded schools in Araçatuba and Campinas.",
    },

    // Tarzan leads Beira-Mar
    {
      subjectType: 'person' as const,
      subjectId: tarzan.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: beiraMar.id,
      startedAt: '1975-01-01',
      confidence: 'verified' as const,
      source: 'Beira-Mar case study research',
      notes: 'Overall founder and leader. Based in Brazil. Visits USA when possible.',
    },

    // Bundo student_of Tarzan
    {
      subjectType: 'person' as const,
      subjectId: bundo.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: tarzan.id,
      startedAt: '1984-01-01',
      confidence: 'verified' as const,
      source: 'Beira-Mar case study research',
      notes: 'First mestre. Also trained under 5+ other mestres in Brazil.',
    },

    // Bundo member_of Beira-Mar
    {
      subjectType: 'person' as const,
      subjectId: bundo.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: beiraMar.id,
      startedAt: '1984-01-01',
      confidence: 'verified' as const,
      source: 'Beira-Mar case study research',
      notes: 'Founded Grupo Bantu independently, later merged back as US representative.',
    },

    // Bundo leads Beira-Mar (US operations)
    {
      subjectType: 'person' as const,
      subjectId: bundo.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: beiraMar.id,
      startedAt: '2005-01-01',
      confidence: 'verified' as const,
      source: 'Beira-Mar case study research',
      notes: 'US representative. Day-to-day USA operations leadership. Reports to/coordinates with Tarzan.',
    },

    // ============================================================
    // CAPOEIRA LONGE DO MAR (MEXICO) RELATIONSHIPS
    // First Mexican mestres, dual lineage, split from Banda do Saci
    // ============================================================

    // Curiò student_of Pastinha
    {
      subjectType: 'person' as const,
      subjectId: curio.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: pastinha.id,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Pastinha lineage. Founded ECAIG 1960.',
    },

    // Curiò founded ECAIG
    {
      subjectType: 'person' as const,
      subjectId: curio.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: ecaig.id,
      startedAt: '1960-01-01',
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Founded in Alagoinhas, Bahia. Pure Capoeira Angola.',
    },

    // Curiò leads ECAIG
    {
      subjectType: 'person' as const,
      subjectId: curio.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: ecaig.id,
      startedAt: '1960-01-01',
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
    },

    // Mariano Andrade founded Banda do Saci
    {
      subjectType: 'person' as const,
      subjectId: marianoAndrade.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: bandaDoSaci.id,
      startedAt: '1996-01-01',
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'First registered capoeira group in Mexico. First capoeira class in Mexico March 16, 1992.',
    },

    // Mariano Andrade leads Banda do Saci
    {
      subjectType: 'person' as const,
      subjectId: marianoAndrade.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: bandaDoSaci.id,
      startedAt: '1996-01-01',
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
    },

    // Banda do Saci part_of ECAIG (1997 affiliation)
    {
      subjectType: 'group' as const,
      subjectId: bandaDoSaci.id,
      predicate: 'part_of' as const,
      objectType: 'group' as const,
      objectId: ecaig.id,
      startedAt: '1997-01-01',
      properties: {
        affiliation_type: 'affiliate',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: '1997 affiliation triggered shift to exclusive Capoeira Angola in 1998.',
    },

    // Rosita student_of Mariano Andrade
    {
      subjectType: 'person' as const,
      subjectId: rosita.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: marianoAndrade.id,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Founding member of Banda do Saci. Left to co-found Longe do Mar.',
    },

    // Adolfo Flores student_of Mariano Andrade
    {
      subjectType: 'person' as const,
      subjectId: adolfoFlores.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: marianoAndrade.id,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Founding member of Banda do Saci. Left to co-found Longe do Mar.',
    },

    // Iñaki Garrido student_of Mariano Andrade
    {
      subjectType: 'person' as const,
      subjectId: inakiGarrido.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: marianoAndrade.id,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Founding member of Banda do Saci. Left to co-found Longe do Mar.',
    },

    // Rosita co_founded Longe do Mar
    {
      subjectType: 'person' as const,
      subjectId: rosita.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: longeDoMar.id,
      startedAt: '1998-05-01',
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'One of three co-founders seeking "capoeira without labels".',
    },

    // Adolfo Flores co_founded Longe do Mar
    {
      subjectType: 'person' as const,
      subjectId: adolfoFlores.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: longeDoMar.id,
      startedAt: '1998-05-01',
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'One of three co-founders. Became director.',
    },

    // Iñaki Garrido co_founded Longe do Mar
    {
      subjectType: 'person' as const,
      subjectId: inakiGarrido.id,
      predicate: 'co_founded' as const,
      objectType: 'group' as const,
      objectId: longeDoMar.id,
      startedAt: '1998-05-01',
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'One of three co-founders.',
    },

    // Longe do Mar split_from_group Banda do Saci
    {
      subjectType: 'group' as const,
      subjectId: longeDoMar.id,
      predicate: 'split_from_group' as const,
      objectType: 'group' as const,
      objectId: bandaDoSaci.id,
      startedAt: '1998-05-01',
      properties: {
        split_type: 'neutral',
        context: 'Ideological/stylistic split - wanted "capoeira without labels" when parent went pure Angola',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes:
        'Three founding members of Banda do Saci left to found Longe do Mar when parent shifted to exclusive Angola.',
    },

    // Acordeón granted_title_to Adolfo Flores (2005)
    {
      subjectType: 'person' as const,
      subjectId: acordeon.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: adolfoFlores.id,
      startedAt: '2005-01-01',
      properties: {
        title_grant: { title: 'contra-mestre' },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Regional lineage recognition. 7 years after founding.',
    },

    // Cabello associated_with Longe do Mar (2008 validation)
    {
      subjectType: 'person' as const,
      subjectId: cabello.id,
      predicate: 'associated_with' as const,
      objectType: 'group' as const,
      objectId: longeDoMar.id,
      startedAt: '2008-01-01',
      properties: {
        association_type: 'supporter',
        context: '2008: Validated professor graduations alongside Acordeón - dual recognition',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Angola mestre validated Longe do Mar graduations alongside Regional mestre Acordeón.',
    },

    // Cigano member_of Longe do Mar
    {
      subjectType: 'person' as const,
      subjectId: cigano.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: longeDoMar.id,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'First Mexican mestre. Currently co-leads Longe do Mar.',
    },

    // Cigano leads Longe do Mar
    {
      subjectType: 'person' as const,
      subjectId: cigano.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: longeDoMar.id,
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Co-leads with Rosita and Adolfo Flores.',
    },

    // Rosita leads Longe do Mar
    {
      subjectType: 'person' as const,
      subjectId: rosita.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: longeDoMar.id,
      startedAt: '1998-05-01',
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Co-leads. First Mexican woman contra-mestre.',
    },

    // Adolfo Flores leads Longe do Mar
    {
      subjectType: 'person' as const,
      subjectId: adolfoFlores.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: longeDoMar.id,
      startedAt: '1998-05-01',
      confidence: 'verified' as const,
      source: 'Longe do Mar case study research',
      notes: 'Director since founding. Still active 2025.',
    },

    // ============================================================
    // PHASE 25: CAPOEIRA MANDINGA HANGZHOU RELATIONSHIPS
    // CDO lineage → Mandinga network → China expansion
    // ============================================================

    // Marcelo Caveirinha student_of Suassuna (CDO lineage)
    {
      subjectType: 'person' as const,
      subjectId: marceloCaveirinha.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: suassuna.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'CDO co-founder Suassuna trained Marcelo before 1984.',
    },

    // Marcelo Caveirinha founded Capoeira Mandinga
    {
      subjectType: 'person' as const,
      subjectId: marceloCaveirinha.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: capoeiraMandinga.id,
      startedAt: '1984-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'Founded as Associação de Capoeira Senzala Grande, renamed to Capoeira Mandinga 1995.',
    },

    // Capoeira Mandinga split_from_group Cordão de Ouro (blessed split)
    {
      subjectType: 'group' as const,
      subjectId: capoeiraMandinga.id,
      predicate: 'split_from_group' as const,
      objectType: 'group' as const,
      objectId: cordaoDeOuro.id,
      startedAt: '1984-01-01',
      properties: {
        split_type: 'blessed',
        context:
          '1980s CDO tradition: graduated students were not allowed to use their mestre group name - had to create own schools. All 15 students in Marcelo graduating class created separate schools.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'Forced blessed split due to CDO tradition. Maintains CDO lineage culturally.',
    },

    // Marcelo Caveirinha leads Capoeira Mandinga
    {
      subjectType: 'person' as const,
      subjectId: marceloCaveirinha.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: capoeiraMandinga.id,
      startedAt: '1984-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'Continues to lead 30+ years later.',
    },

    // Luar do Sertão student_of Marcelo Caveirinha
    {
      subjectType: 'person' as const,
      subjectId: luarDoSertao.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: marceloCaveirinha.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
    },

    // Luar do Sertão member_of Capoeira Mandinga
    {
      subjectType: 'person' as const,
      subjectId: luarDoSertao.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: capoeiraMandinga.id,
      startedAt: '1996-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'Founded Tucson branch.',
    },

    // Diego Pappalardo student_of Marcelo Caveirinha
    {
      subjectType: 'person' as const,
      subjectId: diegoPappalardo.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: marceloCaveirinha.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
    },

    // Diego Pappalardo founded Mandinga Shanghai
    {
      subjectType: 'person' as const,
      subjectId: diegoPappalardo.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: mandingaShanghai.id,
      startedAt: '2005-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'First capoeira instruction in China.',
    },

    // Diego Pappalardo leads Mandinga Shanghai
    {
      subjectType: 'person' as const,
      subjectId: diegoPappalardo.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: mandingaShanghai.id,
      startedAt: '2005-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'Chief instructor.',
    },

    // Mandinga Shanghai part_of Capoeira Mandinga network
    {
      subjectType: 'group' as const,
      subjectId: mandingaShanghai.id,
      predicate: 'part_of' as const,
      objectType: 'group' as const,
      objectId: capoeiraMandinga.id,
      startedAt: '2005-01-01',
      properties: {
        affiliation_type: 'branch',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
    },

    // Alex Maltsev student_of Diego Pappalardo
    {
      subjectType: 'person' as const,
      subjectId: alexMaltsev.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: diegoPappalardo.id,
      startedAt: '2007-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'Started training ~2007-2009. Diego was his first teacher.',
    },

    // Alex Maltsev trained_under Mestre Edan (CDO cross-certification)
    {
      subjectType: 'person' as const,
      subjectId: alexMaltsev.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: mestreEdan.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'Certified via Capoeira Instructors Course. Reveals hidden CDO network connections across organizations.',
    },

    // Alex Maltsev trained_under Mestre Cueca (CDO cross-certification)
    {
      subjectType: 'person' as const,
      subjectId: alexMaltsev.id,
      predicate: 'trained_under' as const,
      objectType: 'person' as const,
      objectId: mestreCueca.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'Certified via Capoeira Instructors Course alongside Mestre Edan.',
    },

    // Alex Maltsev founded Mandinga Hangzhou
    {
      subjectType: 'person' as const,
      subjectId: alexMaltsev.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: mandingaHangzhou.id,
      startedAt: '2014-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
    },

    // Alex Maltsev leads Mandinga Hangzhou
    {
      subjectType: 'person' as const,
      subjectId: alexMaltsev.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: mandingaHangzhou.id,
      startedAt: '2014-01-01',
      endedAt: '2023-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'Led until relocating to Thailand due to family crisis. Current leadership uncertain.',
    },

    // Mandinga Hangzhou part_of Capoeira Mandinga network
    {
      subjectType: 'group' as const,
      subjectId: mandingaHangzhou.id,
      predicate: 'part_of' as const,
      objectType: 'group' as const,
      objectId: capoeiraMandinga.id,
      startedAt: '2014-01-01',
      properties: {
        affiliation_type: 'branch',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
    },

    // Mestre Edan member_of Cordão de Ouro
    {
      subjectType: 'person' as const,
      subjectId: mestreEdan.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: cordaoDeOuro.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'CDO mestre who founded CDO Russia.',
    },

    // Mestre Cueca member_of Cordão de Ouro
    {
      subjectType: 'person' as const,
      subjectId: mestreCueca.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: cordaoDeOuro.id,
      confidence: 'verified' as const,
      source: 'Capoeira Mandinga Hangzhou case study research',
      notes: 'CDO mestre who leads CDO Moscow.',
    },

    // ============================================================
    // PHASE 26: CAPOEIRA ZOADOR RELATIONSHIPS
    // Note: Mestre Sucuri's training lineage is UNKNOWN
    // ============================================================

    // Mestre Sucuri founded Capoeira Zoador
    {
      subjectType: 'person' as const,
      subjectId: mestreSucuri.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: capoeirZoador.id,
      startedAt: '2003-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Zoador case study research',
      notes: 'American founder from San Diego. Claims "pioneer of capoeira in Asia".',
    },

    // Mestre Sucuri leads Capoeira Zoador
    {
      subjectType: 'person' as const,
      subjectId: mestreSucuri.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: capoeirZoador.id,
      startedAt: '2003-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Zoador case study research',
      notes: 'Continues to lead 22+ years later.',
    },

    // Linguica student_of Mestre Sucuri
    {
      subjectType: 'person' as const,
      subjectId: linguica.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: mestreSucuri.id,
      confidence: 'verified' as const,
      source: 'Capoeira Zoador case study research',
      notes: 'Long-term student. Achieved Contramestre rank.',
    },

    // Linguica member_of Capoeira Zoador
    {
      subjectType: 'person' as const,
      subjectId: linguica.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: capoeirZoador.id,
      confidence: 'verified' as const,
      source: 'Capoeira Zoador case study research',
      notes: 'Co-instructor at Ota-ku and Harajuku locations.',
    },

    // ============================================================
    // PHASE 27: CAPOEIRA BATUQUE JAPÃO RELATIONSHIPS
    // Mestre Waldemar Angola lineage → Mestre Amen → Japan
    // ============================================================

    // Mestre Amen student_of Mestre Waldemar
    {
      subjectType: 'person' as const,
      subjectId: mestreAmen.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: waldemar.id,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: 'Trained in Liberdade neighborhood, Salvador, Bahia.',
    },

    // Mestre Amen founded Brasil Brasil Cultural Center
    {
      subjectType: 'person' as const,
      subjectId: mestreAmen.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: brasilBrasil.id,
      startedAt: '1989-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: 'Santa Monica, California. Cultural center for Afro-Brazilian arts.',
    },

    // Mestre Amen leads Brasil Brasil Cultural Center
    {
      subjectType: 'person' as const,
      subjectId: mestreAmen.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: brasilBrasil.id,
      startedAt: '1989-01-01',
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: '35+ years leading.',
    },

    // Batuque Japão part_of Brasil Brasil (branch)
    {
      subjectType: 'group' as const,
      subjectId: batuqueJapao.id,
      predicate: 'part_of' as const,
      objectType: 'group' as const,
      objectId: brasilBrasil.id,
      startedAt: '2009-01-01',
      properties: {
        affiliation_type: 'branch',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: 'Japan branch with semi-autonomous day-to-day operations. Founder visits for batizados.',
    },

    // Pomba student_of Mestre Amen
    {
      subjectType: 'person' as const,
      subjectId: pomba.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: mestreAmen.id,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: '13+ years training to reach Contra Mestra rank.',
    },

    // Pomba member_of Batuque Japão
    {
      subjectType: 'person' as const,
      subjectId: pomba.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: batuqueJapao.id,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: 'Senior instructor in Japan. Choreography specialty.',
    },

    // Pensador student_of Mestre Amen
    {
      subjectType: 'person' as const,
      subjectId: pensador.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: mestreAmen.id,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: '13+ years training to reach Contra Mestre rank.',
    },

    // Pensador member_of Batuque Japão
    {
      subjectType: 'person' as const,
      subjectId: pensador.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: batuqueJapao.id,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: 'Senior instructor in Japan.',
    },

    // Esperto student_of Mestre Amen
    {
      subjectType: 'person' as const,
      subjectId: esperto.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: mestreAmen.id,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: '13+ years training required for Professor rank.',
    },

    // Esperto member_of Batuque Japão
    {
      subjectType: 'person' as const,
      subjectId: esperto.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: batuqueJapao.id,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: 'Instructor in Japan.',
    },

    // Lua Cheia student_of Mestre Amen
    {
      subjectType: 'person' as const,
      subjectId: luaCheia.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: mestreAmen.id,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
    },

    // Lua Cheia member_of Batuque Japão
    {
      subjectType: 'person' as const,
      subjectId: luaCheia.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: batuqueJapao.id,
      confidence: 'verified' as const,
      source: 'Capoeira Batuque Japão case study research',
      notes: 'Female instructor representing 50% gender balance in leadership.',
    },

    // ============================================================
    // PHASE 28: OKUPANDULA RELATIONSHIPS
    // First Capoeira Angola school in the country of Angola
    // Pastinha → João Grande → Moraes → Kimbundo lineage
    // ============================================================

    // Kimbundo student_of Mestre Moraes
    {
      subjectType: 'person' as const,
      subjectId: kimbundo.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: moraes.id,
      confidence: 'verified' as const,
      source: 'Escola de Capoeira Angola Okupandula case study research',
      notes:
        'Specifically sought out Mestre Moraes for Angola training. Earned Contramestre rank. Generation 4 from Pastinha.',
    },

    // Kimbundo founded Okupandula
    {
      subjectType: 'person' as const,
      subjectId: kimbundo.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: okupandula.id,
      startedAt: '2014-01-01',
      confidence: 'verified' as const,
      source: 'Escola de Capoeira Angola Okupandula case study research',
      notes:
        "First Capoeira Angola school in the country of Angola. Fulfills Pastinha's prophecy. Returned from exile to rebuild country.",
    },

    // Kimbundo leads Okupandula
    {
      subjectType: 'person' as const,
      subjectId: kimbundo.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: okupandula.id,
      startedAt: '2014-01-01',
      confidence: 'verified' as const,
      source: 'Escola de Capoeira Angola Okupandula case study research',
      notes: 'Single founder-led model. Also works as social worker.',
    },

    // Okupandula associated_with GCAP (cultural connection, not formal branch)
    {
      subjectType: 'group' as const,
      subjectId: okupandula.id,
      predicate: 'associated_with' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '2014-01-01',
      confidence: 'verified' as const,
      source: 'Escola de Capoeira Angola Okupandula case study research',
      notes:
        'Instagram bio states "Orientação: Mestre Moraes". Cultural/lineage connection but operates independently. Not a formal GCAP branch.',
    },

    // ============================================================
    // PHASE 29: ESCRAVOS BRANCOS RELATIONSHIPS
    // Migration-based knowledge transfer: São Paulo → Piauí
    // ============================================================

    // Mestre Albino student_of Mestre Zé da Volks
    {
      subjectType: 'person' as const,
      subjectId: mestreAlbino.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: zeDaVolks.id,
      startedAt: '1970-01-01',
      endedAt: '1977-01-01',
      confidence: 'verified' as const,
      source: 'Escravos Brancos case study research',
      notes: 'Trained in São Bernardo do Campo, São Paulo. ~7 years before returning to Piauí.',
    },

    // Mestre Albino founded Escravos Brancos
    {
      subjectType: 'person' as const,
      subjectId: mestreAlbino.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: escravosBrancos.id,
      startedAt: '1977-01-01',
      confidence: 'verified' as const,
      source: 'Escravos Brancos case study research',
      notes: 'Founded upon return from São Paulo at CSU Primavera, zona norte.',
    },

    // Mestre Albino founded Federação Piauiense de Capoeira
    {
      subjectType: 'person' as const,
      subjectId: mestreAlbino.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: fpc.id,
      startedAt: '1977-01-01',
      confidence: 'verified' as const,
      source: 'Escravos Brancos case study research',
      notes: 'State federation model imported from São Paulo Capoeira Federation.',
    },

    // Mestre Albino leads Escravos Brancos
    {
      subjectType: 'person' as const,
      subjectId: mestreAlbino.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: escravosBrancos.id,
      startedAt: '1977-01-01',
      confidence: 'verified' as const,
      source: 'Escravos Brancos case study research',
      notes: 'President of ACCEB since 2005. 48+ years leading.',
    },

    // Escravos Brancos associated_with FPC
    {
      subjectType: 'group' as const,
      subjectId: escravosBrancos.id,
      predicate: 'associated_with' as const,
      objectType: 'group' as const,
      objectId: fpc.id,
      startedAt: '1977-01-01',
      confidence: 'verified' as const,
      source: 'Escravos Brancos case study research',
      notes: 'Initially only Escravos Brancos graduates became FPC members. Founding group of federation.',
    },

    // ============================================================
    // PHASE 30: GRUPO ORIAXÉ (ARGENTINA) RELATIONSHIPS
    // Pioneer - oldest capoeira institution in Argentina
    // ============================================================

    // Mestre Marcos Gytauna student_of Mestre Alfredo
    {
      subjectType: 'person' as const,
      subjectId: marcosGytauna.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: mestreAlfredo.id,
      startedAt: '1975-01-01',
      properties: {
        relationship_type: 'parent',
        context: 'Trained at Mestre Alfredo school in Liberdade, Salvador from 1975.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Grupo Oriaxé case study research',
      notes: 'Primary teacher relationship in Salvador, Bahia.',
    },

    // Mestre Marcos Gytauna founded AAC/Oriaxé
    {
      subjectType: 'person' as const,
      subjectId: marcosGytauna.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: aacOriaxe.id,
      startedAt: '1995-05-14',
      confidence: 'verified' as const,
      source: 'Grupo Oriaxé case study research',
      notes: 'Officially founded AAC on Serrano street (now Jorge Luis Borges), Buenos Aires. Teaching since 1987.',
    },

    // Mestre Marcos Gytauna leads AAC/Oriaxé
    {
      subjectType: 'person' as const,
      subjectId: marcosGytauna.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: aacOriaxe.id,
      startedAt: '1995-05-14',
      confidence: 'verified' as const,
      source: 'Grupo Oriaxé case study research',
      notes: 'Founder and director since founding. 30+ years leading.',
    },

    // ============================================================
    // PHASE 31: GRUPO ZIMBA (TERESINA) RELATIONSHIPS
    // Blessed departure from GCAP. Remote coordination from Spain.
    // ============================================================

    // Mestre Boca do Rio student_of Mestre Moraes
    {
      subjectType: 'person' as const,
      subjectId: bocaDoRio.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: moraes.id,
      startedAt: '1983-01-01',
      endedAt: '1998-01-01',
      properties: {
        relationship_type: 'parent',
        context: '15 years training at GCAP (1983-1998). Graduated as Contra-Mestre in 1996.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Grupo Zimba case study research',
      notes: 'Primary teacher relationship. Graduated alongside Mestre Cobra Mansa.',
    },

    // Mestre Boca do Rio departed_from GCAP (blessed departure)
    {
      subjectType: 'person' as const,
      subjectId: bocaDoRio.id,
      predicate: 'departed_from' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1998-01-01',
      properties: {
        split_type: 'blessed',
        context: 'Left shortly after Contra-Mestre graduation (1996) to teach independently. No documented conflict.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Grupo Zimba case study research',
      notes: 'Traditional Angola succession pattern - graduates establish own groups with blessing.',
    },

    // Mestre Boca do Rio founded Grupo Zimba
    {
      subjectType: 'person' as const,
      subjectId: bocaDoRio.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: grupoZimba.id,
      startedAt: '1998-01-01',
      confidence: 'verified' as const,
      source: 'Grupo Zimba case study research',
      notes: 'Founded in Salvador, Bahia. Established at Rua dos Andradas, 1780/6º andar - CIA DE ARTE.',
    },

    // Mestre Boca do Rio leads Grupo Zimba
    {
      subjectType: 'person' as const,
      subjectId: bocaDoRio.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: grupoZimba.id,
      startedAt: '1998-01-01',
      confidence: 'verified' as const,
      source: 'Grupo Zimba case study research',
      notes: 'Coordinates remotely from Santiago de Compostela, Spain since 2007.',
    },

    // Grupo Zimba split_from_group GCAP (blessed departure)
    {
      subjectType: 'group' as const,
      subjectId: grupoZimba.id,
      predicate: 'split_from_group' as const,
      objectType: 'group' as const,
      objectId: gcap.id,
      startedAt: '1998-01-01',
      properties: {
        split_type: 'blessed',
        context:
          'Founder graduated from GCAP (Contra-Mestre 1996), left to establish own group. Traditional Angola succession.',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Grupo Zimba case study research',
      notes: 'Second-generation GCAP lineage. Maintains respectful independence from parent organization.',
    },

    // Celso de Brito member_of Grupo Zimba
    {
      subjectType: 'person' as const,
      subjectId: celsoDeBrito.id,
      predicate: 'member_of' as const,
      objectType: 'group' as const,
      objectId: grupoZimba.id,
      startedAt: '2018-01-01',
      confidence: 'verified' as const,
      source: 'Grupo Zimba case study research',
      notes: 'Co-founded Teresina núcleo in 2018 with Andrea Pace Rodriguez. Academic-practitioner model.',
    },

    // ============================================================
    // PHASE 32: MANDINGUEIROS DOS PALMARES RELATIONSHIPS
    // Three-generation family tradition. Founder-led diaspora expansion.
    // ============================================================

    // Mestre Itapoan student_of Mestre Bimba
    {
      subjectType: 'person' as const,
      subjectId: itapoan.id,
      predicate: 'student_of' as const,
      objectType: 'person' as const,
      objectId: bimba.id,
      properties: {
        relationship_type: 'parent',
        context: 'Direct student of Mestre Bimba (founder of Capoeira Regional).',
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Mandingueiros dos Palmares case study research',
      notes: 'Legendary Regional authority and keeper of Bimba tradition.',
    },

    // Mestre Itapoan granted_title_to Grão Mestre Chuvisco
    {
      subjectType: 'person' as const,
      subjectId: itapoan.id,
      predicate: 'granted_title_to' as const,
      objectType: 'person' as const,
      objectId: chuvisco.id,
      startedAt: '2017-12-01',
      properties: {
        title_grant: {
          title: 'mestre',
          context: 'Grão Mestre title (third and final level) granted for decades of dedication to capoeira.',
        },
      } as StatementProperties,
      confidence: 'verified' as const,
      source: 'Mandingueiros dos Palmares case study research',
      notes: 'External validation from legendary mestre. Honorary/recognition connection.',
    },

    // Grão Mestre Chuvisco founded Mandingueiros dos Palmares
    {
      subjectType: 'person' as const,
      subjectId: chuvisco.id,
      predicate: 'founded' as const,
      objectType: 'group' as const,
      objectId: mandingueirosPalmares.id,
      startedAt: '1977-06-07',
      confidence: 'verified' as const,
      source: 'Mandingueiros dos Palmares case study research',
      notes: 'Founded same year as mestre graduation. Sole founder.',
    },

    // Grão Mestre Chuvisco leads Mandingueiros dos Palmares
    {
      subjectType: 'person' as const,
      subjectId: chuvisco.id,
      predicate: 'leads' as const,
      objectType: 'group' as const,
      objectId: mandingueirosPalmares.id,
      startedAt: '1977-06-07',
      confidence: 'verified' as const,
      source: 'Mandingueiros dos Palmares case study research',
      notes: '48+ years founder leadership. Still leading. Based in Massachusetts/Brazil.',
    },
  ];

  await db.insert(statements).values(statementsData);
  console.log(`Created ${statementsData.length} statements`);

  console.log('');
  console.log('========================================');
  console.log('Genealogy prototype seed complete!');
  console.log('========================================');
  console.log(`  Person profiles: 123`);
  console.log(`  Group profiles:  41`);
  console.log(`  Total nodes:     164`);
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
