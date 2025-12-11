-- ============================================================
-- GENEALOGY PERSON: Manduca da Praia
-- Migrated: 2025-12-11
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
  -- Extended content
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Manoel Alves da Silva',
  'Manduca da Praia',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  '[{"type": "website", "url": "https://en.wikipedia.org/wiki/Manduca_da_Praia"}, {"type": "website", "url": "https://www.historyoffighting.com/mestre-manduca-da-praia.php"}]'::jsonb,
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro.',
  'Ativo antes da codificação dos estilos de capoeira. Praticava a capoeira carioca durante a era das maltas no Rio de Janeiro.',
  -- Life dates
  1820,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL,  -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,  -- Death place unknown
  -- bio_en
  E'Manduca da Praia was a man who defied the expectations of his era. In mid-19th century Rio de Janeiro, capoeiristas typically fell into one of two paths: the violent underworld of the maltas or prison. Manduca navigated a third way.

His full name is recorded as Manoel Alves da Silva in most sources. He was described as "pardo claro" - a light-skinned mulatto - tall and powerfully built, with a graying pointed beard. But it was his appearance that set him apart from the street fighters of his day. He dressed like a gentleman: leather jacket, white beaver hat, pocket watch with gold chain, polished shoes, and always his walking cane - which doubled as his weapon of choice.

His legitimate business was a fish stall in the São José parish marketplace, where he was known not just for selling seafood but for holding court, sharing stories of his exploits with eager listeners. He supplemented it with bodyguard work for politicians, building the connections that would prove invaluable.

According to Plácido de Abreu''s 1886 book "Os Capoeiras," Manduca was chief of the Santa Luzia party within the Nagoa federation - one of the two great rival factions that divided Rio de Janeiro. The Nagoas wore white as their identifying color.

He started his career young, reportedly at Lavadinho, where he made his name in the brutal sport of running with bulls. His weapons included the knife, razor blade, the "petrópolis" (a long hardwood cudgel), and his ever-present cane. His capoeira techniques were comprehensive: the banda and rasteira (sweeps), punches, the headbutt in its various forms, and the devastating rabo de arraia (stingray tail kick).

The fight that cemented his legend was against a Portuguese Deputy named Santana. Santana was known for his physical strength and skill with the stick. Hearing of Manduca''s reputation, he publicly challenged him. These street fights were vicious affairs - no rules, ending only with knockout or submission. Manduca won decisively. But what happened next revealed his character: the two men left the fight with mutual respect and reportedly became friends.

He faced 27 criminal charges for assault and grievous bodily harm over his career. He was acquitted every single time. His political connections from bodyguard work ensured that witnesses would speak in his favor.

At the Penha festival, one of Rio''s major religious celebrations, he found himself fighting a group of armed pilgrims. He left them all unconscious.

What set Manduca apart was not just his fighting ability - though he was reportedly undefeated - but his ability to command respect in multiple worlds: the violent street culture of the maltas, the respectable commerce of the marketplace, and the political sphere where he served as protector.',
  -- bio_pt
  E'Manduca da Praia foi um homem que desafiou as expectativas de sua era. No Rio de Janeiro de meados do século XIX, capoeiristas tipicamente seguiam um de dois caminhos: o submundo violento das maltas ou a prisão. Manduca navegou por um terceiro caminho.

Seu nome completo é registrado como Manoel Alves da Silva na maioria das fontes. Foi descrito como "pardo claro" - mulato de pele clara - alto e de constituição poderosa, com barba grisalha pontuda. Mas era sua aparência que o distinguia dos lutadores de rua de sua época. Vestia-se como um cavalheiro: jaqueta de couro, chapéu branco de castor, relógio de bolso com corrente de ouro, sapatos polidos, e sempre sua bengala - que servia também como sua arma preferida.

Seu negócio legítimo era uma banca de peixe no mercado da freguesia de São José, onde era conhecido não apenas por vender frutos do mar, mas por receber pessoas e compartilhar histórias de suas façanhas com ouvintes ávidos. Complementava sua renda com trabalho de guarda-costas para políticos, construindo conexões que se provariam inestimáveis.

Segundo o livro de 1886 de Plácido de Abreu "Os Capoeiras", Manduca era chefe do partido de Santa Luzia dentro da federação Nagoa - uma das duas grandes facções rivais que dividiam o Rio de Janeiro. Os Nagoas usavam branco como cor de identificação.

Começou sua carreira jovem, supostamente no Lavadinho, onde fez seu nome no esporte brutal de correr com touros. Suas armas incluíam a faca, a navalha, o "petrópolis" (um longo cacete de madeira dura), e sua sempre presente bengala. Suas técnicas de capoeira eram abrangentes: a banda e rasteira, socos, cabeçadas em suas várias formas, e o devastador rabo de arraia.

A luta que cimentou sua lenda foi contra um deputado português chamado Santana. Santana era conhecido por sua força física e habilidade com o pau. Ouvindo sobre a reputação de Manduca, ele o desafiou publicamente. Essas lutas de rua eram assuntos violentos - sem regras, terminando apenas com nocaute ou submissão. Manduca venceu decisivamente. Mas o que aconteceu depois revelou seu caráter: os dois homens saíram da luta com respeito mútuo e supostamente tornaram-se amigos.

Enfrentou 27 acusações criminais por agressão e lesão corporal grave ao longo de sua carreira. Foi absolvido todas as vezes. Suas conexões políticas do trabalho de guarda-costas garantiam que testemunhas falassem a seu favor.

Na festa da Penha, uma das principais celebrações religiosas do Rio, viu-se lutando contra um grupo de peregrinos armados. Deixou todos inconscientes.

O que distinguia Manduca não era apenas sua habilidade de luta - embora supostamente nunca tenha sido derrotado - mas sua capacidade de comandar respeito em múltiplos mundos: a violenta cultura de rua das maltas, o respeitável comércio do mercado, e a esfera política onde servia como protetor.',
  -- achievements_en
  'Chief of Santa Luzia party (Nagoa federation); Undefeated in street fighting career; Acquitted of all 27 criminal charges; Famous victory over Portuguese Deputy Santana',
  -- achievements_pt
  'Chefe do partido de Santa Luzia (federação Nagoa); Invicto em carreira de lutas de rua; Absolvido de todas as 27 acusações criminais; Famosa vitória sobre o deputado português Santana',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1820, decade precision): Active around 1850 with a "graying pointed beard" and described as having started his career "young at Lavadinho." If he had a graying beard (suggesting 40s-50s) in 1850 and started young, birth decade estimated as 1820s.

NAME: Full name recorded as Manoel Alves da Silva in most sources.

DEATH: Unknown. No records of his death have been found.',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1820, precisão de década): Ativo por volta de 1850 com uma "barba pontuda grisalha" e descrito como tendo começado sua carreira "jovem no Lavadinho." Se ele tinha barba grisalha (sugerindo 40-50 anos) em 1850 e começou jovem, década de nascimento estimada como 1820.

NOME: Nome completo registrado como Manoel Alves da Silva na maioria das fontes.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.'
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
