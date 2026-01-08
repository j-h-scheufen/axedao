-- ============================================================
-- GENEALOGY PERSON: Gary (Bonfim)
-- Generated: 2026-01-02
-- ============================================================
-- Student of Zé Grande and Deraldo at Grupo Bonfim (began 1957);
-- Also known as Mestre 22, Mestre 22 da Bonfim, Guere 22;
-- Founder of Associação Cultural de Capoeira Liberdade;
-- Died July 19, 2021 from COVID-19.
-- ============================================================
-- BIRTH YEAR ESTIMATION: ~1945 (decade precision)
-- Interview states: "67 years old" with "55 years militating" in
-- capoeira. Started 1957 at age 12. 1957 - 12 = ~1945.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  apelido_context,
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
  NULL, -- Full name unknown
  'Gary',
  'Bonfim', -- Context to distinguish from other Garys
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://capoeiraliberdade.net.br/view/historia.php']::text[],
  -- Capoeira-specific
  NULL, -- Pre-stylistic distinction era; learned in Rio before formal categories
  E'Gary learned capoeira in the Bonfim tradition, which combined Bahian roots (through Mário Buscapé from the Recôncavo) with the practical, competitive style that developed in Rio de Janeiro. His signature technique was the cabeçada (headbutt), which he learned from Mestre Veludo, one of the most respected cabeceiros in Rio. He characterized the 1960s-70s capoeira as "very dangerous," noting that practitioners were "simply capoeira players" without stylistic concerns. His game emphasized "constant movements using the headbutt and sweep."',
  E'Gary aprendeu capoeira na tradição Bonfim, que combinava raízes baianas (através de Mário Buscapé do Recôncavo) com o estilo prático e competitivo que se desenvolveu no Rio de Janeiro. Sua técnica característica era a cabeçada, que aprendeu com Mestre Veludo, um dos cabeceiros mais respeitados do Rio. Ele caracterizava a capoeira dos anos 1960-70 como "muito perigosa," notando que os praticantes eram "simplesmente jogadores de capoeira" sem preocupações estilísticas. Seu jogo enfatizava "movimentos constantes usando a cabeçada e a rasteira."',
  -- Life dates
  1945,
  'approximate'::genealogy.date_precision,
  NULL, -- Birth place unknown; possibly Rio de Janeiro or Alagoas based on conflicting sources
  2021,
  'exact'::genealogy.date_precision,
  NULL, -- Specific death location unknown
  -- bio_en
  E'Gary, known throughout the capoeira world as Mestre 22, Mestre 22 da Bonfim, and sometimes Guere 22, was a key figure in transmitting the Bonfim capoeira lineage to subsequent generations. His path into capoeira began with a moment of inspiration: witnessing a skilled capoeirista in a street altercation at the São Clemente block in Botafogo, Rio de Janeiro (today the famous São Clemente samba school). The martial prowess he observed that day convinced him to pursue the art.

In 1957, at age 12, Gary began training at the Associação Cultural Bonfim, learning from Mestres Zé Grande and Deraldo—the two men who had taken over leadership of the group after founder Mário Buscapé returned to Bahia. The Bonfim group had moved from its initial small space in São Cristóvão to a larger academy in Olaria, where it had become famous for training high-level competitors.

Within Bonfim, Gary encountered Mestre Veludo, a strong, quick Black man who was renowned as one of the most respected cabeceiros (headbutt specialists) in Rio de Janeiro. Veludo became Gary''s instructor in the dangerous cabeçada technique—a movement requiring precise timing and placement, demanding "all the cunning of capoeira." Gary would later pass this specialized knowledge to his own students.

Recalling the capoeira scene of the 1960s and 70s, Gary listed the notable practitioners of that dangerous era: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—and myself, Mestre 22 da Bonfim." He described this period as a time when there were no uniforms or cords; practitioners wore normal clothing and identified simply as "capoeira players" without stylistic labels.

The traditional roda protocol of that era made a lasting impression. Gary recalled how Mestre Zé Grande would call for the toque de iuna, at which point only mestres would play—"it was very beautiful to see."

Gary trained and graduated numerous mestres who carry on his lineage: Mestre Lébio, Mestre Rui Charuto, Mestre Mão de Onça, Mestre Toinho, Mestre Elias, and Mestra Marly "Malvadeza." Marly, who became both his disciple and wife, would continue his work after his death.

Gary founded the Associação Cultural de Capoeira Liberdade, which now operates in multiple Brazilian states: Ceará (Caucaia, São Gonçalo do Amarante, Trairi, Itapipoca, Amontada), Alagoas (Maceió, Tapera, Olivença, Jacaré dos Homens, Olho d''Água das Flores, Ipuera, Piau, Santana do Ipanema, Poço das Trincheiras), and Bahia.

When asked about his style, Gary rejected classifications. He stated: "I am simply an old student... just an old capoeira player." At the time of his interview (around 2012), he was 67 years old with 55 years in capoeira. His closing message urged respect for elderly masters as "sources of wisdom and living memory of capoeira."

Gary died on July 19, 2021, a victim of COVID-19. At the 2022 "Mulher Vem Pra Roda" event organized by his group, Mestra Marly Malvadeza ritualistically scattered his ashes at the feet of the participants—a final act of connection between the departed mestre and the continuing community.',
  -- bio_pt
  E'Gary, conhecido no mundo da capoeira como Mestre 22, Mestre 22 da Bonfim, e às vezes Guere 22, foi uma figura fundamental na transmissão da linhagem da capoeira Bonfim para as gerações seguintes. Seu caminho para a capoeira começou com um momento de inspiração: testemunhar um capoeirista habilidoso em uma briga de rua no bloco São Clemente, em Botafogo, Rio de Janeiro (hoje a famosa escola de samba São Clemente). A destreza marcial que ele observou naquele dia o convenceu a seguir a arte.

Em 1957, aos 12 anos, Gary começou a treinar na Associação Cultural Bonfim, aprendendo com os Mestres Zé Grande e Deraldo—os dois homens que assumiram a liderança do grupo depois que o fundador Mário Buscapé retornou à Bahia. O grupo Bonfim havia se mudado de seu pequeno espaço inicial em São Cristóvão para uma academia maior em Olaria, onde se tornou famoso por formar competidores de alto nível.

Dentro do Bonfim, Gary conheceu Mestre Veludo, um homem negro forte e rápido que era reconhecido como um dos cabeceiros (especialistas em cabeçada) mais respeitados do Rio de Janeiro. Veludo se tornou o instrutor de Gary na perigosa técnica da cabeçada—um movimento que exige timing preciso e posicionamento exato, demandando "toda a malícia da capoeira." Gary mais tarde passaria esse conhecimento especializado para seus próprios alunos.

Relembrando a cena da capoeira dos anos 1960 e 70, Gary listou os praticantes notáveis daquela era perigosa: "Zé Grande, Deraldo, Luiz do peito queimado, Zé Pedro, Mentirinha, Cilas, Touro, Travasso, Celso do Engenho da Rainha, Corvo, Bogado, Martins, Marlon—e eu mesmo, Mestre 22 da Bonfim." Ele descreveu este período como uma época em que não havia uniformes ou cordas; os praticantes usavam roupas normais e se identificavam simplesmente como "jogadores de capoeira" sem rótulos estilísticos.

O protocolo tradicional da roda daquela época deixou uma impressão duradoura. Gary recordou como Mestre Zé Grande chamava o toque de iuna, momento em que apenas mestres jogavam—"era muito bonito de ver."

Gary treinou e formou vários mestres que continuam sua linhagem: Mestre Lébio, Mestre Rui Charuto, Mestre Mão de Onça, Mestre Toinho, Mestre Elias e Mestra Marly "Malvadeza." Marly, que se tornou tanto sua discípula quanto esposa, continuaria seu trabalho após sua morte.

Gary fundou a Associação Cultural de Capoeira Liberdade, que agora opera em múltiplos estados brasileiros: Ceará (Caucaia, São Gonçalo do Amarante, Trairi, Itapipoca, Amontada), Alagoas (Maceió, Tapera, Olivença, Jacaré dos Homens, Olho d''Água das Flores, Ipuera, Piau, Santana do Ipanema, Poço das Trincheiras) e Bahia.

Quando perguntado sobre seu estilo, Gary rejeitou classificações. Ele declarou: "Eu sou simplesmente um aluno velho... apenas um velho jogador de capoeira." Na época de sua entrevista (por volta de 2012), ele tinha 67 anos com 55 anos de capoeira. Sua mensagem final exortava respeito pelos mestres idosos como "fontes de sabedoria e memória viva da capoeira."

Gary morreu em 19 de julho de 2021, vítima da COVID-19. No evento "Mulher Vem Pra Roda" de 2022, organizado por seu grupo, Mestra Marly Malvadeza ritualmente espalhou suas cinzas aos pés dos participantes—um ato final de conexão entre o mestre falecido e a comunidade que continua.',
  -- achievements_en
  E'Founder of Associação Cultural de Capoeira Liberdade; Trained and formed numerous mestres: Lébio, Rui Charuto, Mão de Onça, Toinho, Elias, Marly Malvadeza; Master of the cabeçada (headbutt) technique, learned from Mestre Veludo; Expanded Capoeira Liberdade to multiple states (Ceará, Alagoas, Bahia); Key figure in transmitting the Bonfim lineage (Besouro → Bidel → Dendê → Mário Buscapé → Zé Grande/Deraldo → Gary)',
  -- achievements_pt
  E'Fundador da Associação Cultural de Capoeira Liberdade; Treinou e formou vários mestres: Lébio, Rui Charuto, Mão de Onça, Toinho, Elias, Marly Malvadeza; Mestre da técnica de cabeçada, aprendida com Mestre Veludo; Expandiu a Capoeira Liberdade para múltiplos estados (Ceará, Alagoas, Bahia); Figura fundamental na transmissão da linhagem Bonfim (Besouro → Bidel → Dendê → Mário Buscapé → Zé Grande/Deraldo → Gary)',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (~1945, approximate):
Interview states he was 67 years old with 55 years in capoeira at time of interview (~2012). Started in 1957 at age 12. Calculation: 1957 - 12 = 1945. Interview date estimated ~2012 based on 55 years from 1957.

DEATH DATE: July 19, 2021 (exact)
Died from COVID-19. Source: maltanet.com.br 2022 article about "Mulher Vem Pra Roda" event.

NAME VARIATIONS:
- "Gary" - primary apelido
- "Mestre 22" - commonly used
- "Mestre 22 da Bonfim" - formal distinction
- "Guere 22" - variant spelling (capoeirahistory.com Rui Charuto page)
All refer to the same person.

ORIGIN DISCREPANCY:
- Mestre Rui Charuto''s biography calls him "a capoeirista from Alagoas"
- Other sources place him in Rio de Janeiro
- Possible that he was born in Alagoas and moved to Rio, or the Alagoas reference is an error
- His group now has strong presence in Alagoas, which may explain the association

TEACHERS:
- Mestre Zé Grande (primary teacher at Bonfim, from 1957)
- Mestre Deraldo (co-leader of Bonfim, taught alongside Zé Grande)
- Mestre Veludo (specialized instruction in cabeçada technique)

STUDENTS:
- Mestre Lébio
- Mestre Rui Charuto (Rui Montanheiro, born 1959)
- Mestre Mão de Onça
- Mestre Toinho
- Mestre Elias
- Mestra Marly "Malvadeza" (Marly Barbosa Vieira; wife; current president of group)

FAMILY:
- Wife: Mestra Marly Malvadeza (Marly Barbosa Vieira)

MEDIA APPEARANCES:
- Interview documented on capoeiraliberdade.net.br (primary biographical source)

GROUP FOUNDED:
- Associação Cultural de Capoeira Liberdade
- Currently operates in: Ceará, Alagoas, Bahia
- Now led by Mestra Marly Malvadeza after his death

INSPIRATION EVENT:
- Street altercation at São Clemente block, Botafogo, Rio (now São Clemente samba school)
- Witnessed skilled capoeirista fight; decided to learn capoeira',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (~1945, aproximado):
Entrevista afirma que ele tinha 67 anos com 55 anos na capoeira na época da entrevista (~2012). Começou em 1957 aos 12 anos. Cálculo: 1957 - 12 = 1945. Data da entrevista estimada ~2012 com base em 55 anos desde 1957.

DATA DE MORTE: 19 de julho de 2021 (exata)
Morreu de COVID-19. Fonte: artigo maltanet.com.br de 2022 sobre evento "Mulher Vem Pra Roda".

VARIAÇÕES DE NOME:
- "Gary" - apelido principal
- "Mestre 22" - comumente usado
- "Mestre 22 da Bonfim" - distinção formal
- "Guere 22" - variante ortográfica (página de Rui Charuto no capoeirahistory.com)
Todos se referem à mesma pessoa.

DISCREPÂNCIA DE ORIGEM:
- A biografia de Mestre Rui Charuto o chama de "um capoeirista de Alagoas"
- Outras fontes o situam no Rio de Janeiro
- Possível que ele tenha nascido em Alagoas e se mudado para o Rio, ou a referência a Alagoas é um erro
- Seu grupo agora tem forte presença em Alagoas, o que pode explicar a associação

MESTRES:
- Mestre Zé Grande (mestre principal no Bonfim, a partir de 1957)
- Mestre Deraldo (co-líder do Bonfim, ensinou junto com Zé Grande)
- Mestre Veludo (instrução especializada na técnica da cabeçada)

ALUNOS:
- Mestre Lébio
- Mestre Rui Charuto (Rui Montanheiro, nascido em 1959)
- Mestre Mão de Onça
- Mestre Toinho
- Mestre Elias
- Mestra Marly "Malvadeza" (Marly Barbosa Vieira; esposa; atual presidente do grupo)

FAMÍLIA:
- Esposa: Mestra Marly Malvadeza (Marly Barbosa Vieira)

APARIÇÕES NA MÍDIA:
- Entrevista documentada em capoeiraliberdade.net.br (fonte biográfica principal)

GRUPO FUNDADO:
- Associação Cultural de Capoeira Liberdade
- Atualmente opera em: Ceará, Alagoas, Bahia
- Agora liderado por Mestra Marly Malvadeza após sua morte

EVENTO DE INSPIRAÇÃO:
- Briga de rua no bloco São Clemente, Botafogo, Rio (hoje escola de samba São Clemente)
- Testemunhou luta de capoeirista habilidoso; decidiu aprender capoeira'
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
