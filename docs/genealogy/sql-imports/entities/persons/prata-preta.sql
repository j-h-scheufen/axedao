-- ============================================================
-- GENEALOGY PERSON: Prata Preta
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
  'Horácio José da Silva',
  'Prata Preta',
  NULL, -- Proto-mestre; no formal title in that era
  NULL, -- No historical portrait known
  ARRAY['https://capoeirahistory.com/prata-preta-an-exiled-capoeira/', 'https://riomemorias.com.br/memoria/prata-preta/']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; style distinctions did not exist
  'Pre-codification carioca capoeira. Known as a skilled capoeirista who used his combat abilities to defend the barricades of Porto Arthur during the 1904 Vaccine Revolt. Part of the generation of Rio dockworkers (estivadores) who practiced capoeira despite its criminalization in 1890.',
  'Capoeira carioca pré-codificação. Conhecido como habilidoso capoeirista que usou suas habilidades de combate para defender as barricadas de Porto Arthur durante a Revolta da Vacina de 1904. Parte da geração de estivadores do Rio que praticavam capoeira apesar de sua criminalização em 1890.',
  -- Life dates
  1874,
  'year'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL, -- Death place unknown
  -- bio_en
  E'Horácio José da Silva, known as Prata Preta ("Black Silver"), was a stevedore and capoeirista who became a symbol of popular resistance during Brazil''s 1904 Vaccine Revolt (Revolta da Vacina). A Black man approximately 30 years old, he lived in the Saúde neighborhood of Rio de Janeiro''s port district—an area marked by the presence of Black workers and descendants of enslaved people.

When the federal government imposed mandatory smallpox vaccination in November 1904, triggering widespread protests across the capital, Prata Preta emerged as one of the most feared leaders of the popular uprising. In the Saúde neighborhood, residents constructed elaborate barricades that they nicknamed "Porto Arthur"—an allusion to the fiercely contested territory in the Russo-Japanese War occurring that same year.

Prata Preta commanded these barricades at Praça da Harmonia, organizing over 2,000 residents to resist the Army and Navy forces sent to suppress the rebellion. His physical strength, charisma, and capoeira skills made him a legendary figure. He fought in the most dangerous positions on the trenches. The rebels employed improvised "weapons" to deceive the military—pieces of wood wrapped in silver paper to resemble dynamite sticks, and a gas lamp post mounted on cart wheels to imitate a cannon.

The trenches of Saúde were the last to fall. On November 16, 1904, before the final assault by Army and Navy forces, Prata Preta was captured in a police ambush. According to newspaper accounts, his arrest required five men from the police and army to subdue him. Even during capture, he was accused of killing an Army soldier and wounding two policemen. When brought to the Central Police Station, he was found carrying two revolvers, a knife, and a jackknife, his body marked with sword bruises.

On December 25, 1904, Prata Preta was deported aboard the ship Itaipava with hundreds of other prisoners to the distant federal territory of Acre—Brazil''s "tropical Siberia". The deportees were held in the ship''s hold under deplorable conditions, many dying during the voyage. They were abandoned in the Amazon without shelter or means of sustenance.

Nothing certain is known of Prata Preta''s fate after deportation. Some newspaper references from 1907 and 1909 suggest he may have returned to Rio de Janeiro, but this remains unconfirmed. His voice was silenced, making it easier for later narratives to construct allegories about him—some portraying him as a heroic opponent of elite oppression, others as something else entirely.

In 2004, on the centenary of the Vaccine Revolt, residents of the Saúde neighborhood founded the carnival block "Cordão do Prata Preta" to revive the memory of this popular leader. The Black, working-class capoeirista who led thousands against the state has become a symbol of resistance in Rio''s port zone.',
  -- bio_pt
  E'Horácio José da Silva, conhecido como Prata Preta, era um estivador e capoeirista que se tornou símbolo de resistência popular durante a Revolta da Vacina de 1904 no Brasil. Um homem negro com aproximadamente 30 anos, vivia no bairro da Saúde, na região portuária do Rio de Janeiro—uma área marcada pela presença de trabalhadores negros e descendentes de escravizados.

Quando o governo federal impôs a vacinação obrigatória contra a varíola em novembro de 1904, desencadeando protestos generalizados na capital, Prata Preta emergiu como um dos mais temidos líderes do levante popular. No bairro da Saúde, os moradores construíram elaboradas barricadas que apelidaram de "Porto Arthur"—em alusão ao território ferozmente disputado na Guerra Russo-Japonesa que ocorria naquele mesmo ano.

Prata Preta comandou essas barricadas na Praça da Harmonia, organizando mais de 2.000 moradores para resistir às forças do Exército e da Marinha enviadas para suprimir a rebelião. Sua força física, carisma e habilidades na capoeira fizeram dele uma figura lendária. Ele combatia nos lugares mais perigosos das trincheiras. Os rebeldes empregaram "armas" improvisadas para enganar os militares—pedaços de madeira enrolados em papel prateado para se assemelhar a cartuchos de dinamite, e um poste de iluminação a gás montado sobre rodas de carroça para imitar um canhão.

As trincheiras da Saúde foram as últimas a cair. Em 16 de novembro de 1904, antes do ataque final das forças do Exército e da Marinha, Prata Preta foi capturado em uma emboscada policial. Segundo relatos de jornais, sua prisão exigiu cinco homens da polícia e do exército para dominá-lo. Mesmo durante a captura, foi acusado de matar um soldado do Exército e ferir dois policiais. Quando levado à Repartição Central da Polícia, foi encontrado portando dois revólveres, uma faca e um canivete, seu corpo marcado por hematomas de espada.

Em 25 de dezembro de 1904, Prata Preta foi deportado a bordo do navio Itaipava junto com centenas de outros prisioneiros para o distante território federal do Acre—a "Sibéria tropical" do Brasil. Os deportados eram mantidos no porão do navio em condições deploráveis, muitos morrendo durante a viagem. Foram abandonados na Amazônia sem ter onde se abrigar ou como se sustentar.

Nada de certo se sabe sobre o destino de Prata Preta após a deportação. Algumas referências em jornais de 1907 e 1909 sugerem que ele pode ter retornado ao Rio de Janeiro, mas isso permanece não confirmado. Sua voz foi silenciada, tornando mais fácil para narrativas posteriores construírem alegorias sobre ele—algumas o retratando como um heroico opositor da opressão das elites, outras de forma diferente.

Em 2004, no centenário da Revolta da Vacina, moradores do bairro da Saúde fundaram o bloco carnavalesco "Cordão do Prata Preta" para reviver a memória deste líder popular. O capoeirista negro e trabalhador que liderou milhares contra o Estado tornou-se um símbolo de resistência na zona portuária do Rio.',
  -- achievements_en
  'Led the Porto Arthur barricade at Praça da Harmonia during the 1904 Vaccine Revolt, commanding over 2,000 rebels against Army and Navy forces; commemorated by the Cordão do Prata Preta carnival block founded in 2004; recognized as symbol of Black and popular resistance in Rio de Janeiro',
  -- achievements_pt
  'Liderou a barricada de Porto Arthur na Praça da Harmonia durante a Revolta da Vacina de 1904, comandando mais de 2.000 rebeldes contra as forças do Exército e da Marinha; homenageado pelo bloco carnavalesco Cordão do Prata Preta fundado em 2004; reconhecido como símbolo de resistência negra e popular no Rio de Janeiro',
  -- Researcher notes (English)
  E'BIRTH YEAR (1874, year precision): Multiple sources confirm Prata Preta was "approximately 30 years old" (cerca de 30 anos) during the 1904 Vaccine Revolt. Wikipedia PT and several sources explicitly state birth year as 1874.

DEATH: Unknown. After deportation to Acre on December 25, 1904 aboard the ship Itaipava, nothing certain is known of his fate. Some newspaper references from 1907 and 1909 suggest possible return to Rio de Janeiro, but this remains unconfirmed.

NAME: Full name confirmed as Horácio José da Silva. Nickname "Prata Preta" means "Black Silver".

PHYSICAL DESCRIPTION: "um homem de 30 anos presumíveis, alto, de compleição robusta, completamente imberbe" (a man of approximately 30 years, tall, robust build, completely beardless)

KEY DATES:
- November 10-16, 1904: Vaccine Revolt
- November 16, 1904: Fall of Porto Arthur barricade
- November 17, 1904, 9 AM: Prata Preta captured
- December 25, 1904: Deported aboard ship Itaipava to Acre

DEPORTATION CONTEXT: Part of approximately 461-1400 people deported to Acre following the revolt. Three ships (Itaipava, Itaperuna, Itapacy) transported deportees. Conditions were deplorable; many died during voyage.

OTHER DEPORTEES (no capoeira connection confirmed): Rato Branco, Truvisco, Machadinho, Almeidinha, Bombacha, Chico da Baiana, Valente, Chico Maluco, João Galego, José Moleque (José Antônio Vieira), Manduca de Luto

PENDING RELATIONSHIPS: None established. No documented teacher-student relationships. Contemporary of the malandro/capoeira generation that included Sete Coroas and later Madame Satã, but no direct connection documented.',
  -- Researcher notes (Portuguese)
  E'ANO DE NASCIMENTO (1874, precisão de ano): Múltiplas fontes confirmam que Prata Preta tinha "aproximadamente 30 anos" (cerca de 30 anos) durante a Revolta da Vacina de 1904. Wikipedia PT e várias fontes declaram explicitamente o ano de nascimento como 1874.

MORTE: Desconhecida. Após deportação para o Acre em 25 de dezembro de 1904 a bordo do navio Itaipava, nada de certo se sabe sobre seu destino. Algumas referências em jornais de 1907 e 1909 sugerem possível retorno ao Rio de Janeiro, mas isso permanece não confirmado.

NOME: Nome completo confirmado como Horácio José da Silva. Apelido "Prata Preta" significa "Black Silver" em inglês.

DESCRIÇÃO FÍSICA: "um homem de 30 anos presumíveis, alto, de compleição robusta, completamente imberbe"

DATAS IMPORTANTES:
- 10-16 de novembro de 1904: Revolta da Vacina
- 16 de novembro de 1904: Queda da barricada de Porto Arthur
- 17 de novembro de 1904, 9h: Prata Preta capturado
- 25 de dezembro de 1904: Deportado a bordo do navio Itaipava para o Acre

CONTEXTO DA DEPORTAÇÃO: Parte de aproximadamente 461-1400 pessoas deportadas para o Acre após a revolta. Três navios (Itaipava, Itaperuna, Itapacy) transportaram os deportados. Condições eram deploráveis; muitos morreram durante a viagem.

OUTROS DEPORTADOS (sem conexão com capoeira confirmada): Rato Branco, Truvisco, Machadinho, Almeidinha, Bombacha, Chico da Baiana, Valente, Chico Maluco, João Galego, José Moleque (José Antônio Vieira), Manduca de Luto

RELACIONAMENTOS PENDENTES: Nenhum estabelecido. Sem relações documentadas de mestre-aluno. Contemporâneo da geração de malandros/capoeiristas que incluía Sete Coroas e posteriormente Madame Satã, mas sem conexão direta documentada.'
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
