-- ============================================================
-- GENEALOGY PERSON: Bentinho
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
  'Nozinho Bento',
  'Bentinho',
  NULL, -- No formal title in the modern sense; proto-mestre era
  NULL, -- No portrait available
  '[]'::jsonb, -- No stable web pages specifically about Bentinho
  -- Capoeira-specific
  NULL, -- Style distinctions didn't exist yet
  'Practiced what Mestre Bimba later described as "capoeira de Angola" or "capoeira antiga" (ancient capoeira). Predates the Angola/Regional codification.',
  'Praticava o que Mestre Bimba mais tarde descreveu como "capoeira de Angola" ou "capoeira antiga". Anterior à codificação Angola/Regional.',
  -- Life dates (see header for birth year estimation reasoning)
  1870,
  'decade'::genealogy.date_precision,
  'Africa',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Bentinho, also known as Nozinho Bento, was an African who became captain (capitão) of the Companhia de Navegação Bahiana—a pioneering steamship company serving the Bahian coast and Recôncavo. As a boat commander, he likely traveled the Bay of All Saints and the ports that connected Salvador to the sugar plantations of the interior.

What makes Bentinho significant to capoeira history is a single, crucial fact: he was the first teacher of Manoel dos Reis Machado, who would become Mestre Bimba, the founder of Capoeira Regional and one of the most transformative figures in capoeira''s history.

Around 1911, when young Bimba was twelve years old, he began learning capoeira from Bentinho at the Estrada das Boiadas in Salvador''s Liberdade neighborhood—a predominantly Black area formed by freed people after abolition in 1888. The training took place at a location known as "Clube União em Apuros." The apprenticeship lasted approximately four years.

According to Bimba''s own account in a 1936 interview with the newspaper A Tarde: "I adapted various blows from what is called capoeira de Angola, the style practiced by my mestre, the African Bentinho."

The training methods were harsh by later standards. Bimba himself recalled: "Mestre Bimba costumava recordar um golpe formidável aplicado por Bentinho, que o acertara na cabeça, provocando um desmaio até o dia seguinte" (Mestre Bimba used to recall a formidable blow applied by Bentinho that struck his head, causing him to faint until the next day). The rodas at Estrada das Boiadas were described as "bravio" (fierce) with intense berimbau rhythms.

The movements Bentinho taught included the foundational vocabulary of capoeira: meia lua de frente, meia lua de compasso, meia lua armada, aú, cabeçada, chibata, rasteira, raspa, tesoura fechada, balão, leque, calcanheira, encruzilhada, and deslocamento.

After completing his training around 1915, Bimba began teaching what he had learned. He taught "Capoeira Angola" at the port authority of Bahia for more than ten years before beginning to develop his innovations that would become Capoeira Regional.

What happened to Bentinho after Bimba''s apprenticeship is not recorded. His dates of birth and death remain unknown. He exists in history through the singular but profound fact of having transmitted capoeira to the man who would revolutionize it.

As an African-born capoeirista active in the early 1900s, Bentinho represents a direct link to the art''s African roots—one of the last documented connections to the generation that carried capoeira from Africa to Brazil or learned it directly from those who did.',
  -- bio_pt
  E'Bentinho, também conhecido como Nozinho Bento, foi um africano que se tornou capitão da Companhia de Navegação Bahiana—uma empresa pioneira de navios a vapor que servia a costa baiana e o Recôncavo. Como comandante de embarcação, provavelmente viajava pela Baía de Todos os Santos e pelos portos que conectavam Salvador às fazendas de cana-de-açúcar do interior.

O que torna Bentinho significativo para a história da capoeira é um único fato crucial: ele foi o primeiro professor de Manoel dos Reis Machado, que se tornaria Mestre Bimba, o fundador da Capoeira Regional e uma das figuras mais transformadoras da história da capoeira.

Por volta de 1911, quando o jovem Bimba tinha doze anos, começou a aprender capoeira com Bentinho na Estrada das Boiadas, no bairro da Liberdade em Salvador—uma área predominantemente negra formada por pessoas libertas após a abolição em 1888. O treinamento acontecia em um local conhecido como "Clube União em Apuros." O aprendizado durou aproximadamente quatro anos.

Segundo o próprio relato de Bimba em uma entrevista de 1936 ao jornal A Tarde: "Eu adaptei vários golpes do que se chama capoeira de Angola, o estilo praticado pelo meu mestre, o africano Bentinho."

Os métodos de treinamento eram duros para os padrões posteriores. O próprio Bimba recordava: "Mestre Bimba costumava recordar um golpe formidável aplicado por Bentinho, que o acertara na cabeça, provocando um desmaio até o dia seguinte." As rodas na Estrada das Boiadas eram descritas como "bravio" (ferozes) com ritmos intensos de berimbau.

Os movimentos que Bentinho ensinava incluíam o vocabulário fundamental da capoeira: meia lua de frente, meia lua de compasso, meia lua armada, aú, cabeçada, chibata, rasteira, raspa, tesoura fechada, balão, leque, calcanheira, encruzilhada e deslocamento.

Após completar seu treinamento por volta de 1915, Bimba começou a ensinar o que havia aprendido. Ele ensinou "Capoeira Angola" na capitania dos portos da Bahia por mais de dez anos antes de começar a desenvolver as inovações que se tornariam a Capoeira Regional.

O que aconteceu com Bentinho após o aprendizado de Bimba não está registrado. Suas datas de nascimento e morte permanecem desconhecidas. Ele existe na história através do fato singular mas profundo de ter transmitido a capoeira ao homem que a revolucionaria.

Como capoeirista nascido na África e ativo no início dos anos 1900, Bentinho representa uma ligação direta com as raízes africanas da arte—uma das últimas conexões documentadas com a geração que trouxe a capoeira da África para o Brasil ou aprendeu diretamente de quem o fez.',
  -- achievements_en
  'Teacher of Mestre Bimba, the founder of Capoeira Regional; one of the last documented African-born capoeira teachers in Brazil; captain of the Companhia de Navegação Bahiana',
  -- achievements_pt
  'Professor de Mestre Bimba, o fundador da Capoeira Regional; um dos últimos professores de capoeira documentados nascidos na África no Brasil; capitão da Companhia de Navegação Bahiana',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1870, decade precision): African-born; was a captain (established profession) and teaching capoeira by 1911. If he was 35-45 when teaching 12-year-old Bimba in 1911, birth = ~1866-1876. Using 1870 as midpoint estimate.

DEATH: Unknown. No records of his death have been found.

NAME: Also recorded as "Nozinho Bento" in some sources.

COMPANHIA DE NAVEGAÇÃO BAHIANA: Founded in 1853 through merger of earlier companies. Operated steamships serving the Bahian coast and Recôncavo until the late 1800s/early 1900s.

PENDING RELATIONSHIPS (requires Mestre Bimba import):
- Bimba student_of Bentinho (~1911-1915)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1870, precisão de década): Nascido na África; era capitão (profissão estabelecida) e ensinava capoeira por volta de 1911. Se tinha 35-45 anos quando ensinava Bimba de 12 anos em 1911, nascimento = ~1866-1876. Usando 1870 como estimativa do ponto médio.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

NOME: Também registrado como "Nozinho Bento" em algumas fontes.

COMPANHIA DE NAVEGAÇÃO BAHIANA: Fundada em 1853 através da fusão de empresas anteriores. Operava navios a vapor servindo a costa baiana e o Recôncavo até o final dos anos 1800/início dos 1900.

RELACIONAMENTOS PENDENTES (requer importação de Mestre Bimba):
- Bimba student_of Bentinho (~1911-1915)'
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
