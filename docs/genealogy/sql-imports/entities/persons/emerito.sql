-- ============================================================
-- GENEALOGY PERSON: Emerito
-- Generated: 2025-12-29
-- ============================================================
-- BIRTH YEAR ESTIMATION (~1920, decade precision):
-- Active teaching capoeira with public rodas in Engenho Velho de
-- Brotas neighborhood of Salvador in ~1963. Teachers typically
-- 25-50 years old when teaching publicly. Estimate 35-45 at time
-- of Jelon's encounter = birth ~1918-1928. Using ~1920 as midpoint.
--
-- SOURCE: Jelon Vieira's interview with Portal Capoeira describes
-- encountering Emerito leading a roda at the end of the Engenho
-- Velho de Brotas bus line on a Saturday afternoon, ~1963.
-- Emerito invited the 10-year-old Jelon to train at his house
-- where his entire family practiced capoeira.
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,
  'Emerito',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://portalcapoeira.com/capoeira/mestres/entrevista-mestre-jelon/', 'https://festival.si.edu/2017/on-the-move/mestre-jelon-vieira/smithsonian']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional Capoeira Angola teacher in Salvador. Taught from his home where his entire family practiced. Known for leading public rodas and playing berimbau.',
  E'Professor tradicional de Capoeira Angola em Salvador. Ensinava em sua casa onde toda sua família praticava. Conhecido por liderar rodas públicas e tocar berimbau.',
  -- Life dates
  1920,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Mestre Emerito was a Capoeira Angola teacher in Salvador, Bahia, who taught from his home in the Engenho Velho de Brotas neighborhood during the early 1960s. His entire family practiced capoeira, making his home a center for the art''s transmission to the next generation.

He is known primarily through the testimony of his most famous student: Mestre Jelon Vieira, who would go on to become one of the most influential figures in bringing capoeira to the United States.

The encounter between Emerito and Jelon came by chance on a Saturday afternoon around 1963. The ten-year-old Jelon was on his way to get a haircut when he heard the sound of a berimbau coming from the end of the Engenho Velho de Brotas bus line. Drawn by the music, he found a crowd of people gathered around a capoeira roda led by Mestre Emerito. Jelon watched for hours, enchanted by what he saw: two men leaping and executing leg sweeps while the crowd responded to the chorus that Emerito was singing.

After the roda ended, the young Jelon approached Emerito and said he wanted to learn "those kicks and jumps". Emerito laughed and explained that what Jelon had witnessed was Capoeira de Angola, then invited him to come to his house where he taught.

When Jelon told his mother he wanted to learn capoeira, she refused, saying the art had a very bad reputation and was practiced by bad people. From that day forward, Jelon decided to train in secret. He went to Emerito''s house, where he was impressed to find that the entire family practiced. However, training there was risky because Emerito''s house was very close to Jelon''s own home, increasing the chance of discovery.

Jelon eventually transitioned to training with Mestre Bobô, whom he would later consider his "true mestre". But it was Emerito who first introduced him to capoeira and planted the seed that would grow into a lifetime''s dedication to the art.

Emerito represents the countless unnamed teachers of capoeira who passed the art to the next generation during a time when it still carried significant social stigma. Through family practice and neighborhood rodas, teachers like Emerito kept the Angola tradition alive in Salvador during the mid-20th century.',
  -- bio_pt
  E'Mestre Emerito foi um professor de Capoeira Angola em Salvador, Bahia, que ensinava de sua casa no bairro do Engenho Velho de Brotas no início dos anos 1960. Toda sua família praticava capoeira, fazendo de sua casa um centro de transmissão da arte para a próxima geração.

Ele é conhecido principalmente através do testemunho de seu aluno mais famoso: Mestre Jelon Vieira, que viria a se tornar uma das figuras mais influentes na difusão da capoeira nos Estados Unidos.

O encontro entre Emerito e Jelon aconteceu por acaso em uma tarde de sábado por volta de 1963. O menino de dez anos estava a caminho de cortar o cabelo quando ouviu o som de um berimbau vindo do final da linha de ônibus do Engenho Velho de Brotas. Atraído pela música, encontrou uma multidão reunida em torno de uma roda de capoeira liderada por Mestre Emerito. Jelon assistiu por horas, encantado pelo que via: dois homens saltando e executando rasteiras enquanto a multidão respondia ao coro que Emerito cantava.

Depois que a roda terminou, o jovem Jelon se aproximou de Emerito e disse que queria aprender "aquelas pernadas e saltos". Emerito riu e explicou que o que Jelon havia presenciado era Capoeira de Angola, depois o convidou para ir à sua casa onde ele ensinava.

Quando Jelon contou à sua mãe que queria aprender capoeira, ela recusou, dizendo que a arte tinha uma reputação muito ruim e era praticada por pessoas más. A partir daquele dia, Jelon decidiu treinar em segredo. Ele foi à casa de Emerito, onde ficou impressionado ao descobrir que toda a família praticava. No entanto, treinar lá era arriscado porque a casa de Emerito ficava muito perto da casa de Jelon, aumentando a chance de ser descoberto.

Jelon eventualmente passou a treinar com Mestre Bobô, a quem mais tarde consideraria seu "verdadeiro mestre". Mas foi Emerito quem primeiro o introduziu à capoeira e plantou a semente que cresceria em uma dedicação de toda a vida à arte.

Emerito representa os incontáveis professores anônimos de capoeira que passaram a arte para a próxima geração durante um tempo em que ela ainda carregava significativo estigma social. Através da prática familiar e das rodas de bairro, professores como Emerito mantiveram a tradição Angola viva em Salvador durante meados do século XX.',
  -- achievements_en
  E'First capoeira teacher of Mestre Jelon Vieira (~1963); Introduced Jelon Vieira to Capoeira de Angola; Taught capoeira from his home in Engenho Velho de Brotas, Salvador; Led public rodas that attracted neighborhood crowds',
  -- achievements_pt
  E'Primeiro professor de capoeira de Mestre Jelon Vieira (~1963); Introduziu Jelon Vieira à Capoeira de Angola; Ensinava capoeira em sua casa no Engenho Velho de Brotas, Salvador; Liderava rodas públicas que atraíam multidões do bairro',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade precision):
- Active teaching in Engenho Velho de Brotas ~1963
- Teachers typically 35-50 when leading public rodas
- Estimate: born ~1918-1928, using 1920 as midpoint

LOCATION:
- Engenho Velho de Brotas neighborhood, Salvador, Bahia
- NOT Santo Amaro da Purificação (though Jelon was born there, his family moved to Salvador during his childhood)
- Taught from his home where entire family practiced

STUDENTS:
- Mestre Jelon Vieira (~1963, age 10) - first capoeira contact

THE ENCOUNTER (from Jelon''s interview, Portal Capoeira):
- Saturday afternoon, ~1963
- Jelon was going to get a haircut
- Heard berimbau at end of Engenho Velho de Brotas bus line
- Watched Emerito lead roda for hours
- Emerito was playing berimbau and leading chorus
- After roda, Jelon asked to learn "those kicks and jumps"
- Emerito invited him to train at his house

FAMILY PRACTICE:
- Entire family (toda a família) practiced capoeira
- Multi-generational transmission
- House was very close to Jelon''s home (risky for secret training)

SINGLE SOURCE:
- All information from Jelon Vieira''s testimony
- No independent corroboration found
- No full name, exact dates, or death information available',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1920, precisão de década):
- Ensinando ativamente no Engenho Velho de Brotas ~1963
- Professores tipicamente 35-50 anos quando lideram rodas públicas
- Estimativa: nascido ~1918-1928, usando 1920 como ponto médio

LOCALIZAÇÃO:
- Bairro do Engenho Velho de Brotas, Salvador, Bahia
- NÃO Santo Amaro da Purificação (embora Jelon tenha nascido lá, sua família se mudou para Salvador durante sua infância)
- Ensinava de sua casa onde toda a família praticava

ALUNOS:
- Mestre Jelon Vieira (~1963, aos 10 anos) - primeiro contato com capoeira

O ENCONTRO (da entrevista de Jelon, Portal Capoeira):
- Tarde de sábado, ~1963
- Jelon estava indo cortar o cabelo
- Ouviu berimbau no final da linha de ônibus do Engenho Velho de Brotas
- Assistiu Emerito liderar roda por horas
- Emerito estava tocando berimbau e puxando o coro
- Após a roda, Jelon pediu para aprender "aquelas pernadas e saltos"
- Emerito o convidou para treinar em sua casa

PRÁTICA FAMILIAR:
- Toda a família praticava capoeira
- Transmissão multigeracional
- Casa ficava muito perto da casa de Jelon (arriscado para treino secreto)

FONTE ÚNICA:
- Toda informação do testemunho de Jelon Vieira
- Nenhuma corroboração independente encontrada
- Nome completo, datas exatas, e informações de morte não disponíveis'
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
