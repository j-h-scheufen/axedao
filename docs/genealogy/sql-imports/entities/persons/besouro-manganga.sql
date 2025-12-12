-- ============================================================
-- GENEALOGY PERSON: Besouro Mangangá
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
  'Manoel Henrique Pereira',
  'Besouro Mangangá',
  NULL, -- Mestre by reputation, not formal title; title enum doesn't apply to pre-codification era
  NULL, -- No verified historical portrait exists
  '[{"type": "website", "url": "https://en.wikipedia.org/wiki/Besouro_Mangang%C3%A1"}, {"type": "website", "url": "https://velhosmestres.com/en/besouro"}, {"type": "website", "url": "https://www.lalaue.com/learn-capoeira/besouro/"}]'::jsonb,
  -- Capoeira-specific
  NULL, -- Pre-codification; Angola/Regional distinction didn't exist yet
  'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. Sometimes referred to as "Angola tradition" by later mestres.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão Angola/Regional. Às vezes referido como "tradição Angola" por mestres posteriores.',
  -- Life dates
  1895,
  'year'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  1924,
  'exact'::genealogy.date_precision,
  'Santa Casa de Misericórdia, Santo Amaro da Purificação, Bahia, Brazil',
  -- bio_en
  E'Manoel Henrique Pereira was born in 1895 in Santo Amaro da Purificação, in the Recôncavo region of Bahia—an area with deep African cultural roots. His father was João Matos Pereira, nicknamed "João Grosso," and his mother was Maria Haifa (also recorded as Maria Auta Pereira). According to Mestre Cobrinha Verde, his cousin, "Besouro''s father was named João, nicknamed João Grosso, and his mother was Maria Haifa. Maria Haifa was my aunt, so Besouro was my cousin, and was raised as my brother."

As a boy, Besouro learned capoeira from Tio Alípio, an African ex-slave and Babalaô (Candomblé priest) who had been brought to Brazil in chains to work at the Engenho de Pantaleão sugar mill. Training took place in Trapiche de Baixo, the poorest neighborhood of Santo Amaro, done in secret because capoeira was forbidden by law.

His nickname "Besouro" (beetle) came from his ability to escape dangerous situations—people said he could scurry away or take flight like a beetle, evading capture. "Mangangá" derives from the African word for a type of medicine taken in a ritual believed to create a "corpo fechado" (closed body), attributed to him because of his apparent invincibility to bullets and blades.

Beyond Tio Alípio, Besouro trained with a circle of capoeiristas who would meet on Sundays: Paulo Barroquinha, Canário Pardo, Siri de Mangue, and Maria Doze Homens. Together they formed what some sources call a "gang of capoeira resistance fighters." He became a dangerous knife fighter (faquista), known for playing with a straight razor using his foot.

Besouro served in the army, stationed at the 31st Infantry Battalion. In September 1918, when police seized a berimbau from his group, he went to the police station in São Caetano, Salvador, to recover it. When the officer refused, Besouro attacked with companions. Repelled by police aided by local residents, he retreated to the 31st Infantry Battalion, gathered soldiers, and returned with a squad of 30 men to arrest the police officers. The neighborhood of São Caetano came to a halt. He was subsequently expelled from the army.

After the military, he worked as a saveirista (dock worker for traditional boats), as a vaqueiro (cowboy), and in sugar-cane plants. Historian Antonio Liberac Cardoso Simões Pires notes: "His practices cannot be associated with banditry, because Besouro has always characterized himself as a worker throughout his life, never being arrested for robbery, theft, or common criminal activity."

He began teaching his younger cousin, Rafael Alves França (later Mestre Cobrinha Verde), when Rafael was just four years old, around 1912. On his deathbed, according to Cobrinha Verde, "Besouro called together all his students and told me that I, Cobrinha Verde, was the only one to whom he was giving his spirit to teach capoeira."

In July 1924, at around age 29, Besouro accepted work at the Maracangalha plantation from Dr. Zeca, a local landowner. According to legend, he unwittingly carried a note—being illiterate—that read "kill the man who is delivering this card." He was surrounded by approximately forty armed men. When they opened fire, he dodged the bullets as usual. But his protective patuá had allegedly been stolen by a woman the night before. Eusébio de Quibaca stabbed him in the back with a knife carved from tucum wood—a material said to have magical properties capable of penetrating a corpo fechado. The knife had been blessed by a sorceress specifically for this purpose.

Besouro was stabbed on July 6, 1924. He did not die immediately but was taken to the Santa Casa de Misericórdia hospital in Santo Amaro, where he died on July 8. His death certificate records: "Manoel Henrique, dark mulatto, single, 24 years old, native of Urupy, resident at Usina Maracangalha, profession of cattle herder, entered on the 8th of July 1924 at 10:30 hours of the day and died at seven o''clock in the evening, (due to) an injury piercing the section of the abdomen."

Shortly after his death, Besouro became a mythical capoeira hero. His fame spread nationally from the 1930s and internationally as capoeira expanded to other continents. He is celebrated in countless songs and stories. A 2009 Brazilian film "Besouro" (directed by João Daniel Tikhomiroff, with Ailton Carmo in the title role) dramatized his life.',
  -- bio_pt
  E'Manoel Henrique Pereira nasceu em 1895 em Santo Amaro da Purificação, na região do Recôncavo da Bahia—uma área com profundas raízes culturais africanas. Seu pai era João Matos Pereira, apelidado de "João Grosso", e sua mãe era Maria Haifa (também registrada como Maria Auta Pereira). Segundo Mestre Cobrinha Verde, seu primo, "O pai de Besouro se chamava João, apelidado de João Grosso, e sua mãe era Maria Haifa. Maria Haifa era minha tia, então Besouro era meu primo e foi criado como meu irmão."

Ainda menino, Besouro aprendeu capoeira com Tio Alípio, um ex-escravo africano e Babalaô (sacerdote do Candomblé) que havia sido trazido ao Brasil acorrentado para trabalhar no Engenho de Pantaleão. O treinamento acontecia no Trapiche de Baixo, o bairro mais pobre de Santo Amaro, feito em segredo porque a capoeira era proibida por lei.

Seu apelido "Besouro" veio de sua habilidade de escapar de situações perigosas—as pessoas diziam que ele podia correr ou voar como um besouro, evadindo a captura. "Mangangá" deriva da palavra africana para um tipo de remédio tomado em um ritual que se acreditava criar um "corpo fechado", atribuído a ele por causa de sua aparente invulnerabilidade a balas e lâminas.

Além de Tio Alípio, Besouro treinava com um círculo de capoeiristas que se reuniam aos domingos: Paulo Barroquinha, Canário Pardo, Siri de Mangue e Maria Doze Homens. Juntos formavam o que algumas fontes chamam de "gangue de lutadores de resistência da capoeira". Ele se tornou um perigoso lutador de faca (faquista), conhecido por jogar com uma navalha usando o pé.

Besouro serviu no exército, estacionado no 31º Batalhão de Infantaria. Em setembro de 1918, quando a polícia apreendeu um berimbau de seu grupo, ele foi à delegacia de São Caetano, Salvador, para recuperá-lo. Quando o oficial recusou, Besouro atacou com companheiros. Repelido pela polícia auxiliada por moradores locais, ele recuou para o 31º Batalhão de Infantaria, reuniu soldados e retornou com um pelotão de 30 homens para prender os policiais. O bairro de São Caetano parou. Ele foi subsequentemente expulso do exército.

Após o serviço militar, trabalhou como saveirista (trabalhador portuário de barcos tradicionais), como vaqueiro e em usinas de cana-de-açúcar. O historiador Antonio Liberac Cardoso Simões Pires observa: "Suas práticas não podem ser associadas ao banditismo, porque Besouro sempre se caracterizou como trabalhador ao longo de sua vida, nunca sendo preso por roubo, furto ou atividade criminosa comum."

Ele começou a ensinar seu primo mais novo, Rafael Alves França (mais tarde Mestre Cobrinha Verde), quando Rafael tinha apenas quatro anos, por volta de 1912. Em seu leito de morte, segundo Cobrinha Verde, "Besouro reuniu todos os seus alunos e me disse que eu, Cobrinha Verde, era o único a quem ele estava dando seu espírito para ensinar capoeira."

Em julho de 1924, com cerca de 29 anos, Besouro aceitou trabalho na fazenda Maracangalha do Dr. Zeca, um fazendeiro local. Segundo a lenda, ele carregava sem saber um bilhete—sendo analfabeto—que dizia "mate o homem que está entregando este cartão." Ele foi cercado por aproximadamente quarenta homens armados. Quando abriram fogo, ele desviou das balas como de costume. Mas seu patuá protetor havia supostamente sido roubado por uma mulher na noite anterior. Eusébio de Quibaca o apunhalou nas costas com uma faca feita de madeira de tucum—um material que se dizia ter propriedades mágicas capazes de penetrar um corpo fechado. A faca havia sido abençoada por uma feiticeira especificamente para este propósito.

Besouro foi apunhalado em 6 de julho de 1924. Ele não morreu imediatamente, mas foi levado ao hospital Santa Casa de Misericórdia em Santo Amaro, onde morreu em 8 de julho. Sua certidão de óbito registra: "Manoel Henrique, mulato escuro, solteiro, 24 anos, natural de Urupy, residente na Usina Maracangalha, profissão de vaqueiro, entrou no dia 8 de julho de 1924 às 10:30 horas do dia e morreu às sete horas da noite, (devido a) um ferimento perfurante na seção do abdômen."

Pouco após sua morte, Besouro tornou-se um herói mítico da capoeira. Sua fama se espalhou nacionalmente a partir dos anos 1930 e internacionalmente conforme a capoeira se expandiu para outros continentes. Ele é celebrado em inúmeras músicas e histórias. Um filme brasileiro de 2009, "Besouro" (dirigido por João Daniel Tikhomiroff, com Ailton Carmo no papel principal) dramatizou sua vida.',
  -- achievements_en
  'Folk hero celebrated in countless capoeira songs; subject of 2009 Brazilian film "Besouro"; teacher of Mestre Cobrinha Verde who carried his legacy to subsequent generations including Mestre João Grande and Mestre João Pequeno',
  -- achievements_pt
  'Herói popular celebrado em inúmeras músicas de capoeira; tema do filme brasileiro de 2009 "Besouro"; professor de Mestre Cobrinha Verde que levou seu legado às gerações seguintes incluindo Mestre João Grande e Mestre João Pequeno',
  -- Researcher notes (English)
  E'BIRTH YEAR: Most sources cite 1895; some say 1897. Death certificate states age 24 (suggesting birth ~1900), but this conflicts with oral history placing him teaching by 1912. Using 1895 as more consistent with timeline.

DEATH: Stabbed July 6, 1924 at Maracangalha plantation; died July 8, 1924 at Santa Casa de Misericórdia hospital.

TITLE: Left NULL because formal titles (Mestre, etc.) didn''t exist in the modern sense during his era. Called "Mestre" by reputation/legend, not formal conferral.

PORTRAIT: No authentic historical photograph exists. The 2009 film features actor Ailton Carmo, not actual images of Besouro.

ALTERNATE NAMES: Besouro Preto, Besouro Cordão de Ouro',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO: A maioria das fontes cita 1895; algumas dizem 1897. A certidão de óbito indica 24 anos (sugerindo nascimento ~1900), mas isso conflita com a história oral que o coloca ensinando em 1912. Usando 1895 como mais consistente com a linha do tempo.

MORTE: Apunhalado em 6 de julho de 1924 na fazenda Maracangalha; morreu em 8 de julho de 1924 no hospital Santa Casa de Misericórdia.

TÍTULO: Deixado NULL porque títulos formais (Mestre, etc.) não existiam no sentido moderno durante sua era. Chamado de "Mestre" por reputação/lenda, não por conferimento formal.

RETRATO: Nenhuma fotografia histórica autêntica existe. O filme de 2009 apresenta o ator Ailton Carmo, não imagens reais de Besouro.

NOMES ALTERNATIVOS: Besouro Preto, Besouro Cordão de Ouro'
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
