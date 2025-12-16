-- ============================================================
-- GENEALOGY PERSON: Joel Lourenço
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- No exact birth year documented. However, he was described as
-- part of the same "generation" as Paraná (1922-1972) and Onça
-- Preta (1909-2006). He was a government worker in Rio by 1946
-- and already established as a capoeira organizer by 1953.
-- Working backwards: if active professionally in 1946, likely
-- born between 1900-1920. Using 1910 as midpoint estimate with
-- decade precision.
--
-- DEATH: Unknown. Still alive in 1980 (Museu de Folclore event).
-- Wife Ismarina documented in legal proceedings 2003, but this
-- doesn't confirm Joel's status at that time.
--
-- SIGNIFICANCE: Pioneer in using "capoeira de Angola" to register
-- his school in Rio de Janeiro. Organized and directed Bahian
-- capoeiristas in Rio during the 1950s. Featured prominently in
-- Edison Carneiro's 1953 article as embodying "a herança espiritual
-- de Angola" (the spiritual heritage of Angola). Core member of
-- the three Bahian mestres (with Paraná and Onça Preta) from whom
-- contemporary capoeira developed in Rio.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  title,
  portrait,
  public_links,
  -- Capoeira-specific
  style,
  style_notes_en,
  style_notes_pt,
  -- Life dates
  birth_year,
  birth_year_precision,
  birth_place,
  death_year,
  death_year_precision,
  death_place,
  -- Extended content (bilingual)
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Joel Lourenço do Espírito Santo',
  'Joel Lourenço',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://velhosmestres.com/br/destaques-35',
    'https://capoeirahistory.com/masters-in-rio-de-janeiro/'
  ]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Joel Lourenço was described by Edison Carneiro in 1953 as the person among all his companions in whom "a herança espiritual de Angola" (the spiritual heritage of Angola) was most evident. He organized and directed exhibitions of Bahian capoeiristas in Rio without commanding through force, instead relying on his skill in navigating the individualistic capoeira community. He was known for being "ágil como um gato" (agile as a cat) with the characteristics typical of Angolan capoeira practitioners.',
  E'Joel Lourenço foi descrito por Edison Carneiro em 1953 como a pessoa entre todos os seus companheiros em quem "a herança espiritual de Angola" era mais evidente. Ele organizou e dirigiu exibições de capoeiristas baianos no Rio sem comandar pela força, contando com sua habilidade em navegar a comunidade individualista da capoeira. Era conhecido por ser "ágil como um gato" com as características típicas dos praticantes de capoeira de Angola.',
  -- Life dates
  1910,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  NULL,  -- Death year unknown
  NULL,
  NULL,  -- Death place unknown
  -- Extended content (English)
  E'Joel Lourenço do Espírito Santo was a Bahian capoeirista who played a pivotal role in establishing and organizing capoeira de Angola in Rio de Janeiro during the 1950s. Born in Bahia at an unknown date, he migrated to Rio de Janeiro and by 1946 was working for the municipal government, first at the Secretaria Geral de Administração (Departamento do Pessoal) and later with the 11º Distrito de Obras da Prefeitura.

In 1953, Edison Carneiro featured Joel Lourenço prominently in his article "A Arte dos Moleques de Sinhá" published in Flan magazine. Carneiro described him as the person among all his companions in whom the spiritual heritage of Angola was most evident: "Talvez seja esse negro, entre todos os seus companheiros, aquele em quem é mais patente a herança espiritual de Angola." Joel was recognized for his ability to organize and direct capoeira demonstrations, earning trust through skill rather than force in navigating the individualistic capoeira community. He was described as "ágil como um gato" (agile as a cat).

Joel Lourenço was one of the pioneers in using the term "capoeira de Angola" when registering his school''s name in Rio de Janeiro, at a time when the "utilitarian capoeira" of Sinhozinho was more prominent in the city. His students, however, did not continue using the "capoeira de Angola" designation, nor did they achieve the same prominence as their teacher.

In 1962, Joel Lourenço participated in the Rio de Janeiro staging of "O Pagador de Promessas" by Dias Gomes, alongside Mestre Paraná''s Conjunto Folclórico de Capoeira São Bento Pequeno. That same year, Onça Preta was documented as a member of Joel Lourenço''s capoeira Angola group.

Joel Lourenço maintained deep connections to both capoeira and samba communities. He was the son-in-law of Antenor dos Santos, a member of the Diretoria de Samba (Samba Board) of Portela, one of Rio''s most famous samba schools. He resided at Rua Itaúba, 243 in Madureira, a neighborhood in Rio''s northern zone known for its strong Afro-Brazilian cultural traditions.

In 1977, Joel Lourenço recorded an album "Samba de Caboclo" with his group, captured on February 27 in São João do Meriti, Rio de Janeiro. The recording featured Felipe da Encarnação alongside Joel Lourenço and was supervised by Aloysio de Alencar Pinto.

He participated in the First Folklore Festival in 1961 and continued his cultural activities into his later years. On March 14, 1980, he performed at the opening of the Museu de Folclore Edison Carneiro—a fitting tribute given Edison Carneiro''s early recognition of his significance to capoeira de Angola.

Joel Lourenço composed at least one capoeira song about the berimbau that was well-received among practitioners. Together with Paraná and Onça Preta, he formed part of the core group of Bahian mestres from whom a whole generation of capoeiristas born in the 1930s learned, forming the foundation from which contemporary capoeira developed in Rio de Janeiro.',
  -- Extended content (Portuguese)
  E'Joel Lourenço do Espírito Santo foi um capoeirista baiano que desempenhou papel fundamental no estabelecimento e organização da capoeira de Angola no Rio de Janeiro durante os anos 1950. Nascido na Bahia em data desconhecida, migrou para o Rio de Janeiro e em 1946 já trabalhava para o governo municipal, primeiro na Secretaria Geral de Administração (Departamento do Pessoal) e depois no 11º Distrito de Obras da Prefeitura.

Em 1953, Edison Carneiro destacou Joel Lourenço em seu artigo "A Arte dos Moleques de Sinhá" publicado na revista Flan. Carneiro o descreveu como a pessoa entre todos os seus companheiros em quem a herança espiritual de Angola era mais evidente: "Talvez seja esse negro, entre todos os seus companheiros, aquele em quem é mais patente a herança espiritual de Angola." Joel era reconhecido por sua habilidade em organizar e dirigir demonstrações de capoeira, conquistando confiança através da habilidade e não da força ao navegar a comunidade individualista da capoeira. Era descrito como "ágil como um gato".

Joel Lourenço foi um dos pioneiros a utilizar o termo "capoeira de Angola" ao registrar o nome de sua escola no Rio de Janeiro, numa época em que a "capoeira utilitária" de Sinhozinho era mais proeminente na cidade. Seus alunos, no entanto, não deram continuidade à denominação "capoeira de Angola", nem alcançaram o mesmo destaque que seu mestre.

Em 1962, Joel Lourenço participou da montagem carioca de "O Pagador de Promessas" de Dias Gomes, ao lado do Conjunto Folclórico de Capoeira São Bento Pequeno de Mestre Paraná. No mesmo ano, Onça Preta foi documentado como membro do grupo de capoeira Angola de Joel Lourenço.

Joel Lourenço manteve conexões profundas tanto com a comunidade da capoeira quanto do samba. Era genro de Antenor dos Santos, membro da Diretoria de Samba da Portela, uma das mais famosas escolas de samba do Rio. Residia na Rua Itaúba, 243 em Madureira, um bairro da zona norte do Rio conhecido por suas fortes tradições culturais afro-brasileiras.

Em 1977, Joel Lourenço gravou um álbum "Samba de Caboclo" com seu grupo, registrado em 27 de fevereiro em São João do Meriti, Rio de Janeiro. A gravação contou com Felipe da Encarnação ao lado de Joel Lourenço e foi supervisionada por Aloysio de Alencar Pinto.

Participou do Primeiro Festival Folclórico em 1961 e continuou suas atividades culturais até idade avançada. Em 14 de março de 1980, apresentou-se na inauguração do Museu de Folclore Edison Carneiro—uma homenagem adequada dado o reconhecimento precoce de Edison Carneiro sobre sua importância para a capoeira de Angola.

Joel Lourenço compôs pelo menos uma música de capoeira sobre o berimbau que foi bem recebida entre os praticantes. Junto com Paraná e Onça Preta, formou parte do grupo central de mestres baianos com quem toda uma geração de capoeiristas nascidos nos anos 1930 aprendeu, formando a base a partir da qual a capoeira contemporânea se desenvolveu no Rio de Janeiro.',
  -- Achievements (English)
  E'- Pioneer in using "capoeira de Angola" to register his school name in Rio de Janeiro
- Organized and directed Bahian capoeiristas in Rio de Janeiro (1950s)
- Featured prominently in Edison Carneiro''s "A Arte dos Moleques de Sinhá" (1953)
- Performed in "O Pagador de Promessas" (Rio production, 1962)
- Participated in First Folklore Festival (1961)
- Recorded "Samba de Caboclo" album with his group (1977)
- Performed at opening of Museu de Folclore Edison Carneiro (1980)
- Composed capoeira song about the berimbau',
  -- Achievements (Portuguese)
  E'- Pioneiro em usar "capoeira de Angola" para registrar o nome de sua escola no Rio de Janeiro
- Organizou e dirigiu capoeiristas baianos no Rio de Janeiro (anos 1950)
- Destacado no artigo de Edison Carneiro "A Arte dos Moleques de Sinhá" (1953)
- Atuou em "O Pagador de Promessas" (produção carioca, 1962)
- Participou do Primeiro Festival Folclórico (1961)
- Gravou o álbum "Samba de Caboclo" com seu grupo (1977)
- Apresentou-se na inauguração do Museu de Folclore Edison Carneiro (1980)
- Compôs música de capoeira sobre o berimbau',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION:
- No exact birth year documented
- Contemporary of Paraná (1922-1972) and Onça Preta (1909-2006)
- Government worker in Rio by 1946; established capoeira organizer by 1953
- Estimated 1910 with decade precision based on career timeline

DEATH: Unknown
- Still active in 1980 (Museu de Folclore performance)
- Wife Ismarina do Espírito Santo documented in 2003 legal proceedings
- No death date found in sources

FULL NAME VARIANTS:
- Joel Lourenço do Espírito Santo (full name per velhosmestres.com)
- Joel Lourenço dos Santos (per some sources - may be error)
- Mestre Joel (common reference)

FAMILY:
- Wife: Ismarina do Espírito Santo (documented 2003)
- Father-in-law: Antenor dos Santos (Portela samba school Diretoria de Samba)

RESIDENCE:
- Rua Itaúba, 243, Madureira, Rio de Janeiro

PROFESSION:
- Municipal government worker: Secretaria Geral de Administração, Departamento do Pessoal (1946-1947)
- Later: 11º Distrito de Obras da Prefeitura

KEY DATES:
- 1946-1955: Documented in Rio de Janeiro newspapers and government records
- 1953: Featured in Edison Carneiro''s "A Arte dos Moleques de Sinhá" (Flan magazine, May 31)
- 1961: First Folklore Festival
- 1962: O Pagador de Promessas; Onça Preta documented in his group
- 1977 Feb 27: Samba de Caboclo recording (São João do Meriti)
- 1980 Mar 14: Museu de Folclore Edison Carneiro opening exhibition

TEACHER: UNKNOWN
- No documentation found about who taught Joel Lourenço in Bahia
- Described as having "herança espiritual de Angola" but no lineage specified

GROUP:
- Led capoeira Angola group in Rio (Onça Preta was member in 1962)
- Pioneer in registering school as "capoeira de Angola"
- Students did not continue using "capoeira de Angola" designation

RECORDINGS:
- 1977: "Samba de Caboclo - RJ" (7", 33⅓ RPM) - Grupo Joel Lourenço
  - Recorded: São João do Meriti, Feb 27, 1977
  - Recording by: José Moreira Frade
  - Supervision/editing: Aloysio de Alencar Pinto
  - Featured: Felipe da Encarnação, Joel Lourenço do Espirito Santo

DISTINCTION FROM OTHER "MESTRE JOELS":
- Joel de Souza Menezes (1944-2020) is a DIFFERENT person
  - Born Santo Amaro, raised Feira de Santana
  - Student of Mestre Arara (Bimba lineage)
  - Recorded 1979 LP "Capoeira" (Associação de Capoeira Ilha de Itapuã)
  - Based in São Paulo
- Our Joel Lourenço (Rio/Angola) is distinct from this Joel de Souza Menezes (Salvador/Bimba lineage)

SOURCES CONSULTED:
- velhosmestres.com/br/destaques-35 (primary biographical source)
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-parana-1922-1972/
- discogs.com (Samba de Caboclo release)
- Academic paper on capoeira angola implantation in Rio (Semantic Scholar)
- Lalaue.com (Mestre Joel disambiguation)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DE ANO DE NASCIMENTO:
- Nenhum ano de nascimento exato documentado
- Contemporâneo de Paraná (1922-1972) e Onça Preta (1909-2006)
- Funcionário do governo no Rio em 1946; organizador de capoeira estabelecido em 1953
- Estimado 1910 com precisão de década baseado na cronologia de carreira

FALECIMENTO: Desconhecido
- Ainda ativo em 1980 (apresentação no Museu de Folclore)
- Esposa Ismarina do Espírito Santo documentada em procedimentos legais de 2003
- Nenhuma data de falecimento encontrada nas fontes

VARIANTES DO NOME COMPLETO:
- Joel Lourenço do Espírito Santo (nome completo per velhosmestres.com)
- Joel Lourenço dos Santos (per algumas fontes - pode ser erro)
- Mestre Joel (referência comum)

FAMÍLIA:
- Esposa: Ismarina do Espírito Santo (documentada 2003)
- Sogro: Antenor dos Santos (Diretoria de Samba da Portela)

RESIDÊNCIA:
- Rua Itaúba, 243, Madureira, Rio de Janeiro

PROFISSÃO:
- Funcionário do governo municipal: Secretaria Geral de Administração, Departamento do Pessoal (1946-1947)
- Depois: 11º Distrito de Obras da Prefeitura

DATAS CHAVE:
- 1946-1955: Documentado em jornais do Rio de Janeiro e registros governamentais
- 1953: Destacado no artigo de Edison Carneiro "A Arte dos Moleques de Sinhá" (revista Flan, 31 de maio)
- 1961: Primeiro Festival Folclórico
- 1962: O Pagador de Promessas; Onça Preta documentado em seu grupo
- 1977 Fev 27: Gravação Samba de Caboclo (São João do Meriti)
- 1980 Mar 14: Inauguração do Museu de Folclore Edison Carneiro

MESTRE: DESCONHECIDO
- Nenhuma documentação encontrada sobre quem ensinou Joel Lourenço na Bahia
- Descrito como tendo "herança espiritual de Angola" mas sem linhagem especificada

GRUPO:
- Liderou grupo de capoeira Angola no Rio (Onça Preta era membro em 1962)
- Pioneiro em registrar escola como "capoeira de Angola"
- Alunos não continuaram usando a denominação "capoeira de Angola"

GRAVAÇÕES:
- 1977: "Samba de Caboclo - RJ" (7", 33⅓ RPM) - Grupo Joel Lourenço
  - Gravado: São João do Meriti, 27 Fev 1977
  - Gravação por: José Moreira Frade
  - Supervisão/edição: Aloysio de Alencar Pinto
  - Participação: Felipe da Encarnação, Joel Lourenço do Espirito Santo

DISTINÇÃO DE OUTROS "MESTRE JOELS":
- Joel de Souza Menezes (1944-2020) é uma pessoa DIFERENTE
  - Nascido em Santo Amaro, criado em Feira de Santana
  - Aluno de Mestre Arara (linhagem Bimba)
  - Gravou LP "Capoeira" 1979 (Associação de Capoeira Ilha de Itapuã)
  - Baseado em São Paulo
- Nosso Joel Lourenço (Rio/Angola) é distinto deste Joel de Souza Menezes (Salvador/linhagem Bimba)

FONTES CONSULTADAS:
- velhosmestres.com/br/destaques-35 (fonte biográfica principal)
- capoeirahistory.com/masters-in-rio-de-janeiro/
- capoeirahistory.com/mestre/master-parana-1922-1972/
- discogs.com (lançamento Samba de Caboclo)
- Artigo acadêmico sobre implantação da capoeira angola no Rio (Semantic Scholar)
- Lalaue.com (desambiguação Mestre Joel)'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name,
  title = EXCLUDED.title,
  portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links,
  style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year,
  birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place,
  death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision,
  death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en,
  bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en,
  achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en,
  notes_pt = EXCLUDED.notes_pt,
  updated_at = NOW();
