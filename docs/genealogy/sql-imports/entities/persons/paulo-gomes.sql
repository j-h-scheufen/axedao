-- ============================================================
-- GENEALOGY PERSON: Paulo Gomes
-- Generated: 2025-12-16
-- ============================================================
-- BIRTH DATE: January 25, 1941 - Confirmed by capoeirahistory.com
-- and velhosmestres.com.
--
-- DEATH DATE: September 23, 1998 - Confirmed by velhosmestres.com;
-- capoeirahistory.com lists only year 1998.
--
-- STYLE: Regional - Trained under Mestre Artur Emídio who taught
-- the systematized Bahian method; Paulo Gomes was described as
-- "the only successor of Mestre Bimba in Brazil" and "the hope
-- that regional capoeira will continue to exist."
--
-- LINEAGE: Neném (African) → Paizinho → Artur Emídio → Paulo Gomes
--
-- SIGNIFICANCE: Pioneer of capoeira in Baixada Fluminense and
-- São Paulo; founder of Centro de Capoeira Ilha de Maré (1963)
-- and ABRACAP (1985); credited with creating the batizado ceremony
-- in capoeira; helped establish August 3rd as Capoeirista Day
-- in São Paulo; advisor to Governor Mário Covas; murdered in 1998.
--
-- ALTERNATE APELIDO: "Galo Cego" mentioned in velhosmestres.com
-- but not widely used; keeping primary apelido as "Paulo Gomes"
-- which is how he is known in lineage references.
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
  'Paulo Gomes da Cruz',
  'Paulo Gomes',
  'mestre'::genealogy.title,
  NULL,  -- No public domain portrait found
  ARRAY[
    'https://capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/',
    'https://velhosmestres.com/br/destaques-55'
  ]::text[],
  -- Capoeira-specific
  'regional'::genealogy.style,
  E'Paulo Gomes was trained in the Regional style by Mestre Artur Emídio, who taught the systematized Bahian method derived from his teacher Paizinho. Paulo Gomes was described as "the only successor of Mestre Bimba in Brazil" and "the hope that regional capoeira will continue to exist" at a time when many practitioners were mixing Regional with Angola. His emphasis was on preserving pure Regional technique.',
  E'Paulo Gomes foi treinado no estilo Regional por Mestre Artur Emídio, que ensinava o método baiano sistematizado derivado de seu mestre Paizinho. Paulo Gomes foi descrito como "o único sucessor de Mestre Bimba no Brasil" e "a esperança de que a capoeira regional continue a existir" em uma época em que muitos praticantes estavam misturando Regional com Angola. Sua ênfase era preservar a técnica Regional pura.',
  -- Life dates
  1941,
  'exact'::genealogy.date_precision,
  'Itabuna, Bahia, Brazil',
  1998,
  'exact'::genealogy.date_precision,
  'São Paulo, Brazil',
  -- Extended content (English)
  E'Paulo Gomes da Cruz was born on January 25, 1941, in Itabuna, southern Bahia—a cocoa-producing region and the birthplace of writer Jorge Amado. Like many Bahians of his generation, he migrated to Rio de Janeiro seeking better opportunities.

In the carioca capital, Paulo Gomes learned capoeira from Mestre Artur Emídio, who was also from Itabuna and ran an academy in Bonsucesso, a suburb north of the city center. At Artur Emídio''s academy, he trained alongside other future mestres: Leopoldina, Celso do Engenho da Rainha, and Djalma Bandeira. It was there that he earned his capoeira name and graduated to the rank of mestre.

His capoeira genealogy traces a distinguished Bahian lineage: "son" of Mestre Artur Emídio (1930-2011), "grandson" of Mestre Paizinho (Teodoro Ramos), and "great-grandson" of Mestre Neném, a capoeirista of African origin.

On June 11, 1963, Paulo Gomes founded the Centro de Capoeira Ilha de Maré—reportedly the first to institutionalize the batizado (baptism ceremony) as a formal graduation ritual in capoeira. In 1967, he established an academy on Rua Augusta 1351 in São Paulo. He recalled that while he had 30 male students there, "in Rio, in three years, I trained more than 30 women."

In the 1960s, Paulo Gomes moved to the Baixada Fluminense, specifically to São João de Meriti in the Coelho da Rocha neighborhood. There he became a foundational figure, training mestres who would establish capoeira across the region. His principal disciples included Mestre Valdir Sales (1942-2019), who founded the Associação de Capoeira Valdir Sales in São João de Meriti, and Mestre Josias da Silva, who established the Associação de Capoeira Josias da Silva in Nova Iguaçu and Duque de Caxias.

The famous Sunday roda at Zé Pedro''s academy in Bonsucesso (1973-1979) featured Paulo Gomes among its regular participants, alongside Artur Emídio, Mintirinha, Khorvo, Luis Malhado, Macaco Preto, Nilson Arerê, and Paulão Muzenza. These gatherings were legendary for their intensity—"his roda only had bambas, tough guys," recalled Mestre Valdir Sales.

In São Paulo, Paulo Gomes became one of the founders of a new capoeira community. In 1985, he created the Associação do Brasil da Capoeira (ABRACAP—Brazilian Capoeira Association). That same year, he helped establish State Law nº 4.649, designating August 3rd as "Dia do Capoeirista" (Capoeirista Day) in São Paulo. He served as an advisor to Governor Mário Covas on capoeira-related matters.

Among his São Paulo students was Mestra Maria Pandeiro (Roberta Maria Neves), who began training with him in 1980 at the Academia Ilha de Maré. She later founded Capoeira Dandara in Bremen, Germany (2002). Another notable student was Jorginho (Jorge Machado Silva), a 12-year-old prodigy of whom Paulo Gomes said: "This kid is the great hope of capoeira regional, he''s too good."

He published a book, *Capoeira: a arte marcial brasileira* (Capoeira: The Brazilian Martial Art), and recorded a CD, *Roda de Capoeira da Ilha de Maré*.

Paulo Gomes met a tragic end on September 23, 1998. He was murdered inside his Ilha de Maré academy, located at Avenida Brigadeiro Luis Antonio 3940 in São Paulo. The attack occurred during evening classes around 9 PM when a bailiff, accompanied by another man, entered and shot him. Two other capoeiristas—Mestre Fernandão (director of ABRACAP and a regular at the Praça da República roda) and Cristhiano—were wounded trying to intervene. Paulo Gomes died at the hospital. The motive was a debt he owed to a car rental company.

His wake was held in the academy hall, filled with homages from fellow masters. He was buried at the São Pedro Cemetery with traditional capoeira songs and berimbau music—a fitting farewell for a mestre who had devoted his life to preserving and spreading capoeira Regional.',
  -- Extended content (Portuguese)
  E'Paulo Gomes da Cruz nasceu em 25 de janeiro de 1941, em Itabuna, sul da Bahia—região produtora de cacau e terra natal do escritor Jorge Amado. Como muitos baianos de sua geração, migrou para o Rio de Janeiro em busca de melhores oportunidades.

Na capital carioca, Paulo Gomes aprendeu capoeira com Mestre Artur Emídio, também de Itabuna, que mantinha uma academia em Bonsucesso, subúrbio ao norte do centro da cidade. Na academia de Artur Emídio, treinou ao lado de outros futuros mestres: Leopoldina, Celso do Engenho da Rainha e Djalma Bandeira. Foi lá que recebeu seu nome de capoeira e se formou mestre.

Sua genealogia capoeirística traça uma linhagem baiana distinta: "filho" de Mestre Artur Emídio (1930-2011), "neto" de Mestre Paizinho (Teodoro Ramos) e "bisneto" de Mestre Neném, um capoeirista de origem africana.

Em 11 de junho de 1963, Paulo Gomes fundou o Centro de Capoeira Ilha de Maré—supostamente o primeiro a institucionalizar o batizado como ritual formal de graduação na capoeira. Em 1967, estabeleceu uma academia na Rua Augusta 1351, em São Paulo. Ele lembrava que, enquanto tinha 30 alunos homens lá, "no Rio, em três anos, formei mais de 30 mulheres."

Nos anos 1960, Paulo Gomes mudou-se para a Baixada Fluminense, especificamente para São João de Meriti, no bairro Coelho da Rocha. Ali tornou-se uma figura fundamental, treinando mestres que estabeleceriam a capoeira por toda a região. Seus principais discípulos incluíam Mestre Valdir Sales (1942-2019), que fundou a Associação de Capoeira Valdir Sales em São João de Meriti, e Mestre Josias da Silva, que estabeleceu a Associação de Capoeira Josias da Silva em Nova Iguaçu e Duque de Caxias.

A famosa roda de domingo na academia de Zé Pedro em Bonsucesso (1973-1979) contava com Paulo Gomes entre seus participantes regulares, ao lado de Artur Emídio, Mintirinha, Khorvo, Luis Malhado, Macaco Preto, Nilson Arerê e Paulão Muzenza. Esses encontros eram lendários por sua intensidade—"a roda dele só tinha bamba, cara duro," recordou Mestre Valdir Sales.

Em São Paulo, Paulo Gomes tornou-se um dos fundadores de uma nova comunidade de capoeira. Em 1985, criou a Associação do Brasil da Capoeira (ABRACAP). Nesse mesmo ano, ajudou a estabelecer a Lei Estadual nº 4.649, designando 3 de agosto como "Dia do Capoeirista" em São Paulo. Serviu como assessor do Governador Mário Covas em assuntos relacionados à capoeira.

Entre seus alunos paulistanos estava Mestra Maria Pandeiro (Roberta Maria Neves), que começou a treinar com ele em 1980 na Academia Ilha de Maré. Ela posteriormente fundou a Capoeira Dandara em Bremen, Alemanha (2002). Outro aluno notável foi Jorginho (Jorge Machado Silva), um prodígio de 12 anos sobre quem Paulo Gomes disse: "Este garoto é a grande esperança da capoeira regional, ele é bom demais."

Publicou um livro, *Capoeira: a arte marcial brasileira*, e gravou um CD, *Roda de Capoeira da Ilha de Maré*.

Paulo Gomes encontrou um fim trágico em 23 de setembro de 1998. Foi assassinado dentro de sua academia Ilha de Maré, localizada na Avenida Brigadeiro Luis Antonio 3940, em São Paulo. O ataque ocorreu durante as aulas noturnas, por volta das 21h, quando um oficial de justiça, acompanhado de outro homem, entrou e atirou nele. Dois outros capoeiristas—Mestre Fernandão (diretor da ABRACAP e frequentador da roda da Praça da República) e Cristhiano—ficaram feridos ao tentar intervir. Paulo Gomes morreu no hospital. O motivo foi uma dívida que ele tinha com uma locadora de carros.

Seu velório foi realizado no salão da academia, repleto de homenagens de mestres companheiros. Foi enterrado no Cemitério São Pedro ao som de cantigas tradicionais de capoeira e música de berimbau—uma despedida apropriada para um mestre que dedicou sua vida a preservar e disseminar a capoeira Regional.',
  -- Achievements (English)
  E'- Founded Centro de Capoeira Ilha de Maré (June 11, 1963), credited with institutionalizing the batizado ceremony
- Established first capoeira baptism ceremony in São Paulo (1967)
- Founded ABRACAP - Associação do Brasil da Capoeira (1985)
- Helped establish State Law nº 4.649 designating August 3rd as "Dia do Capoeirista" in São Paulo
- Advisor to São Paulo Governor Mário Covas on capoeira matters
- Pioneer of capoeira in Baixada Fluminense and São Paulo
- Published *Capoeira: a arte marcial brasileira* (1982)
- Recorded CD *Roda de Capoeira da Ilha de Maré*
- Trained more than 30 women capoeiristas in Rio de Janeiro
- Described as "the only successor of Mestre Bimba in Brazil"',
  -- Achievements (Portuguese)
  E'- Fundou o Centro de Capoeira Ilha de Maré (11 de junho de 1963), creditado por institucionalizar a cerimônia do batizado
- Realizou a primeira cerimônia de batizado de capoeira em São Paulo (1967)
- Fundou a ABRACAP - Associação do Brasil da Capoeira (1985)
- Ajudou a estabelecer a Lei Estadual nº 4.649 designando 3 de agosto como "Dia do Capoeirista" em São Paulo
- Assessor do Governador de São Paulo Mário Covas em assuntos de capoeira
- Pioneiro da capoeira na Baixada Fluminense e São Paulo
- Publicou *Capoeira: a arte marcial brasileira* (1982)
- Gravou CD *Roda de Capoeira da Ilha de Maré*
- Formou mais de 30 mulheres capoeiristas no Rio de Janeiro
- Descrito como "o único sucessor de Mestre Bimba no Brasil"',
  -- Researcher notes (English)
  E'BIRTH DATE: January 25, 1941 - Confirmed by both capoeirahistory.com and velhosmestres.com.

DEATH DATE: September 23, 1998 - Velhosmestres.com provides exact date; capoeirahistory.com lists only "1998." Death occurred inside his academy during evening class.

ALTERNATE APELIDO: Velhosmestres.com mentions "Galo Cego" as an alternate apelido, but this is not widely used in other sources. "Paulo Gomes" is the primary name used in lineage references.

BATIZADO CLAIM: Velhosmestres.com credits Paulo Gomes with creating/institutionalizing the batizado ceremony in capoeira. This is a significant claim that may require further verification, as other sources attribute formal graduation ceremonies to Mestre Bimba. The claim may refer specifically to the formal institutionalization of the ceremony as a graduation ritual rather than its origin.

TRAINING TIMELINE:
- 1962: Began training with Artur Emídio in Rio de Janeiro (per velhosmestres.com)
- 1963: Founded Ilha de Maré (June 11)
- 1960s: Moved to Baixada Fluminense (São João de Meriti)
- 1967: Opened São Paulo academy at Rua Augusta 1351

STUDENTS TO VERIFY:
- Valdir Sales (1942-2019) - exists in sources, confirmed
- Josias da Silva - exists in sources; currently in persons backlog from Cobra Mansa import
- Maria Pandeiro (Roberta Maria Neves) - trained 1980-1985; should add to backlog
- Jorginho (Jorge Machado Silva) - child prodigy; needs backlog entry
- Fernandão - director of ABRACAP; wounded during attack; needs backlog entry

ACADEMY LOCATION DISCREPANCY: Velhosmestres.com gives São Paulo academy location as Rua Augusta 1351 (1967), while capoeirahistory.com lists final location as Avenida Brigadeiro Luis Antonio 3940. These may represent different phases of the academy.

ZÉ PEDRO RODA: Paulo Gomes was a regular participant at the famous Sunday roda at Zé Pedro''s academy in Bonsucesso (1973-1979).

DEATH CIRCUMSTANCES: Shot during evening class by bailiff over car rental debt. Mestre Fernandão and Cristhiano wounded. Wake held at academy with capoeira tributes. Buried at São Pedro Cemetery.

SOURCES CONSULTED:
- capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/
- velhosmestres.com/br/destaques-55
- capoeirahistory.com/the-roda-at-ze-pedros/
- capoeira-dandara.de/en/maria_en.php',
  -- Researcher notes (Portuguese)
  E'DATA DE NASCIMENTO: 25 de janeiro de 1941 - Confirmado por capoeirahistory.com e velhosmestres.com.

DATA DE FALECIMENTO: 23 de setembro de 1998 - Velhosmestres.com fornece data exata; capoeirahistory.com lista apenas "1998." A morte ocorreu dentro de sua academia durante aula noturna.

APELIDO ALTERNATIVO: Velhosmestres.com menciona "Galo Cego" como apelido alternativo, mas não é amplamente usado em outras fontes. "Paulo Gomes" é o nome principal usado em referências de linhagem.

ALEGAÇÃO SOBRE BATIZADO: Velhosmestres.com credita Paulo Gomes por criar/institucionalizar a cerimônia de batizado na capoeira. Esta é uma alegação significativa que pode requerer verificação adicional, pois outras fontes atribuem cerimônias formais de graduação a Mestre Bimba. A alegação pode se referir especificamente à institucionalização formal da cerimônia como ritual de graduação, e não à sua origem.

CRONOLOGIA DE TREINAMENTO:
- 1962: Começou a treinar com Artur Emídio no Rio de Janeiro (por velhosmestres.com)
- 1963: Fundou Ilha de Maré (11 de junho)
- Anos 1960: Mudou-se para Baixada Fluminense (São João de Meriti)
- 1967: Abriu academia em São Paulo na Rua Augusta 1351

ALUNOS A VERIFICAR:
- Valdir Sales (1942-2019) - existe nas fontes, confirmado
- Josias da Silva - existe nas fontes; atualmente no backlog de pessoas do import de Cobra Mansa
- Maria Pandeiro (Roberta Maria Neves) - treinou 1980-1985; adicionar ao backlog
- Jorginho (Jorge Machado Silva) - prodígio infantil; precisa entrada no backlog
- Fernandão - diretor da ABRACAP; ferido durante ataque; precisa entrada no backlog

DISCREPÂNCIA DE LOCALIZAÇÃO DA ACADEMIA: Velhosmestres.com dá localização da academia de São Paulo como Rua Augusta 1351 (1967), enquanto capoeirahistory.com lista localização final como Avenida Brigadeiro Luis Antonio 3940. Podem representar fases diferentes da academia.

RODA DE ZÉ PEDRO: Paulo Gomes era participante regular da famosa roda de domingo na academia de Zé Pedro em Bonsucesso (1973-1979).

CIRCUNSTÂNCIAS DA MORTE: Baleado durante aula noturna por oficial de justiça por dívida com locadora de carros. Mestre Fernandão e Cristhiano feridos. Velório realizado na academia com tributos de capoeira. Enterrado no Cemitério São Pedro.

FONTES CONSULTADAS:
- capoeirahistory.com/mestre/master-paulo-gomes-1941-1998/
- velhosmestres.com/br/destaques-55
- capoeirahistory.com/the-roda-at-ze-pedros/
- capoeira-dandara.de/en/maria_en.php'
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
