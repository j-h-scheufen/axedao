-- ============================================================
-- GENEALOGY PERSON: Laércio
-- Generated: 2026-01-11
-- ============================================================
-- Mestre Laércio is one of the key figures in the preservation and
-- international dissemination of Capoeira Angola. Co-founder of both
-- Grupo Filhos de Angola (GCFA, 1984) and the Associação Brasileira de
-- Capoeira Angola (ABCA, 1987). Based in Berlin since 1993, he
-- coordinates an international network of 25+ GCFA nuclei across
-- Europe and Asia.
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
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Laércio dos Anjos Borges',
  'Laércio',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'https://capoeira.fandom.com/wiki/Mestre_Laercio',
    'https://www.lalaue.com/capoeira-schools/filhos-de-angola/',
    'https://filhosdeangola.weebly.com/mestre-laercio.html',
    'https://mestrelaercio.bandcamp.com/'
  ]::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Laércio''s style reflects the deep influence of multiple Angola mestres from the golden generation of Bahian capoeira. His training under 12+ mestres including Caiçara, João Pequeno, João Grande, Canjiquinha, Waldemar, and Boca Rica gave him a broad foundation in traditional Angola principles. He emphasizes the cultural, musical, and philosophical dimensions of capoeira alongside the physical practice. His approach prioritizes preservation of ancestral traditions while teaching dynamically to diverse international audiences.',
  E'O estilo de Laércio reflete a profunda influência de múltiplos mestres de Angola da geração de ouro da capoeira baiana. Seu treinamento com mais de 12 mestres, incluindo Caiçara, João Pequeno, João Grande, Canjiquinha, Waldemar e Boca Rica, deu-lhe uma ampla base nos princípios tradicionais da Angola. Ele enfatiza as dimensões culturais, musicais e filosóficas da capoeira junto com a prática física. Sua abordagem prioriza a preservação das tradições ancestrais enquanto ensina de forma dinâmica para públicos internacionais diversos.',
  -- Life dates
  1966,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  -- Bio EN
  E'Laércio dos Anjos Borges was born in Salvador, Bahia in 1966. His discovery of capoeira came through childhood adventure: in 1976, at age 10, while hunting birds and playing in the woods near his home in Fazenda Grande do Retiro, his friend Samuel showed him the path to Mestre Caiçara''s academy. His parents disapproved of his decision to practice capoeira, so beginning in 1978, at age 12, he would cross through the woods at 6 PM to train in secret, sometimes returning at night and pretending he had been playing with friends on his street.

At Mestre Caiçara''s academy and at the countless rodas of Salvador, Laércio encountered the great mestres who shaped capoeira at that time: Caiçara, Canjiquinha, Waldemar, Curé, Fernanito, Boca Rica, Zacarias, João Grande, João Pequeno, Papo Amarelo, Bola Sete, Bobó, and Lua de Bobó. Under Caiçara''s guidance, he developed rapidly and began leading some training sessions himself at the academy, as Caiçara—by then elderly—could no longer climb to the rooftop where training took place, and his son Toinho often did not appear.

After Mestre Pastinha''s death in 1981, Laércio moved to the Quinta das Beatas neighborhood (now Cosme de Farias), where he met Roberval at a roda at the D. João Pedro dos Santos school. The two became fast friends, united by their devotion to Capoeira Angola. In 1984, in conversation with Roberval and Cabore, they decided to found a group to rescue, maintain, and preserve the roots of Capoeira Angola. On March 20, 1984, they created Grupo de Capoeira Filhos de Angola (GCFA)—with a fourth co-founder, Rosalvo—naming it in homage to Mestre Pastinha, considered the father of Capoeira Angola.

During a critical period when Capoeira Angola was at risk of extinction, the GCFA was invited by Mestre Cobra Mansa to join GCAP with Mestre Moraes, who had recently returned from Rio de Janeiro. The Filhos de Angola members spent three years training with Mestre João Pequeno, two years with Mestre Canjiquinha, considerable time with Mestre Boca Rica, and had the opportunity to attend Mestre João Grande''s Sunday classes at Forte Santo Antônio within the GCAP space. From Mestre Moraes, they learned the cultural and musical value of the roots of Capoeira Angola.

Eventually, GCFA felt the need for their own space and began sharing a room at Forte Santo Antônio with Mestre Boca Rica for two years. Fighting for the dignity of Capoeira Angola, Laércio and Roberval, together with mestres Curió, Bom Cabrito, Cabore, Baixinho, Augusto, and others, founded the Associação Brasileira de Capoeira Angola (ABCA) and the Casa da Capoeira Angola in Salvador in 1987. The ABCA''s first elected board included Mestre João Pequeno as President, Paulo dos Anjos as Vice-President, Mário Bom Cabrito as Treasurer, Nô as Technical Director, and Renê as Social Director.

Before moving to Europe, Laércio began social work with underprivileged children in the outskirts of Salvador, focusing on appreciation of the roots and origins of Capoeira Angola. In September 1993, he moved to Europe with the objective of spreading Capoeira Angola. In the beginning of his European work, he conducted workshops with Mestre Rogério, Mestre Sapo, and Rosalvo (who had arrived in Europe in 1989 as the first angoleiro on the continent).

Mestre Laércio settled in Berlin, where he established himself as a teacher and international coordinator. He was subsequently invited to teach in England, Spain, Greece, Italy, France, Switzerland, Sweden, and Russia, establishing active GCFA groups in each country. Today, he coordinates 25 nuclei of GCFA spread throughout Europe and Asia, dedicating his life to teaching the art, knowledge, philosophy, and awareness of Capoeira Angola.',
  -- Bio PT
  E'Laércio dos Anjos Borges nasceu em Salvador, Bahia em 1966. Sua descoberta da capoeira veio através de aventuras de infância: em 1976, aos 10 anos, enquanto caçava pássaros e brincava nas matas perto de sua casa na Fazenda Grande do Retiro, seu amigo Samuel mostrou-lhe o caminho para a academia de Mestre Caiçara. Seus pais desaprovavam sua decisão de praticar capoeira, então a partir de 1978, aos 12 anos, ele atravessava as matas às 18h para treinar em segredo, às vezes voltando à noite e fingindo que estava brincando com amigos na rua.

Na academia de Mestre Caiçara e nas incontáveis rodas de Salvador, Laércio encontrou os grandes mestres que moldaram a capoeira naquela época: Caiçara, Canjiquinha, Waldemar, Curé, Fernanito, Boca Rica, Zacarias, João Grande, João Pequeno, Papo Amarelo, Bola Sete, Bobó e Lua de Bobó. Sob a orientação de Caiçara, ele se desenvolveu rapidamente e começou a liderar alguns treinamentos na academia, já que Caiçara—já idoso—não podia mais subir ao terraço onde os treinos aconteciam, e seu filho Toinho muitas vezes não aparecia.

Após a morte de Mestre Pastinha em 1981, Laércio mudou-se para o bairro da Quinta das Beatas (hoje Cosme de Farias), onde conheceu Roberval em uma roda na escola D. João Pedro dos Santos. Os dois tornaram-se grandes amigos, unidos por sua devoção à Capoeira Angola. Em 1984, em conversa com Roberval e Cabore, decidiram fundar um grupo para resgatar, manter e preservar as raízes da Capoeira Angola. Em 20 de março de 1984, criaram o Grupo de Capoeira Filhos de Angola (GCFA)—com um quarto co-fundador, Rosalvo—dando-lhe o nome em homenagem a Mestre Pastinha, considerado o pai da Capoeira Angola.

Durante um período crítico em que a Capoeira Angola estava em risco de extinção, o GCFA foi convidado por Mestre Cobra Mansa a fazer parte do GCAP com Mestre Moraes, que havia retornado recentemente do Rio de Janeiro. Os membros dos Filhos de Angola passaram três anos treinando com Mestre João Pequeno, dois anos com Mestre Canjiquinha, um bom tempo com Mestre Boca Rica, e tiveram a oportunidade de frequentar as aulas de Mestre João Grande aos domingos no Forte Santo Antônio, no espaço do GCAP. Com Mestre Moraes, aprenderam o valor cultural e musical das raízes da Capoeira Angola.

Com o tempo, o GCFA sentiu a necessidade de ter seu próprio espaço e passou a dividir uma sala no Forte Santo Antônio com Mestre Boca Rica por dois anos. Lutando pela dignidade da Capoeira Angola, Laércio e Roberval, junto com os mestres Curió, Bom Cabrito, Cabore, Baixinho, Augusto, entre outros, fundaram a Associação Brasileira de Capoeira Angola (ABCA) e a Casa da Capoeira Angola em Salvador em 1987. A primeira diretoria eleita da ABCA incluiu Mestre João Pequeno como Presidente, Paulo dos Anjos como Vice-Presidente, Mário Bom Cabrito como Tesoureiro, Nô como Diretor Técnico e Renê como Diretor Social.

Antes de se mudar para a Europa, Laércio começou um trabalho social com crianças carentes nos arredores de Salvador, focando na valorização das raízes e origens da Capoeira Angola. Em setembro de 1993, ele mudou-se para a Europa com o objetivo de divulgar a Capoeira Angola. No início de seu trabalho europeu, realizou workshops com Mestre Rogério, Mestre Sapo e Rosalvo (que havia chegado à Europa em 1989 como o primeiro angoleiro no continente).

Mestre Laércio estabeleceu-se em Berlim, onde se firmou como professor e coordenador internacional. Posteriormente, foi convidado a ensinar na Inglaterra, Espanha, Grécia, Itália, França, Suíça, Suécia e Rússia, estabelecendo grupos ativos do GCFA em cada país. Hoje, ele coordena 25 núcleos do GCFA espalhados pela Europa e Ásia, dedicando sua vida a ensinar a arte, o conhecimento, a filosofia e a consciência da Capoeira Angola.',
  -- Achievements EN
  E'- Co-founder of Grupo de Capoeira Filhos de Angola (GCFA), March 20, 1984
- Founding member of Associação Brasileira de Capoeira Angola (ABCA), 1987
- Pioneer of Capoeira Angola in Germany and Europe (arrived 1993)
- International GCFA Coordinator, overseeing 25+ nuclei in Europe and Asia
- Recorded albums: "Mandinga e manhã: o segredo da Capoeira" (2009), "33 anos de resistência" (2017)
- Conducted workshops across Russia, Spain, England, France, Greece, Italy, Switzerland, Sweden, and Germany
- Established social work programs for underprivileged children in Salvador before European migration',
  -- Achievements PT
  E'- Co-fundador do Grupo de Capoeira Filhos de Angola (GCFA), 20 de março de 1984
- Membro fundador da Associação Brasileira de Capoeira Angola (ABCA), 1987
- Pioneiro da Capoeira Angola na Alemanha e Europa (chegou em 1993)
- Coordenador Internacional do GCFA, supervisionando mais de 25 núcleos na Europa e Ásia
- Álbuns gravados: "Mandinga e manhã: o segredo da Capoeira" (2009), "33 anos de resistência" (2017)
- Realizou workshops na Rússia, Espanha, Inglaterra, França, Grécia, Itália, Suíça, Suécia e Alemanha
- Estabeleceu programas de trabalho social para crianças carentes em Salvador antes da migração para a Europa',
  -- Notes EN
  E'BIRTH YEAR (1966, year precision):
Multiple sources confirm 1966 as birth year. Some sources state he started capoeira at age 9 (1975), others at age 12 (1978). The 1978 date (age 12) is more consistently cited. Discovery of capoeira via friend Samuel in 1976 (age 10) reconciles these—he discovered the academy in 1976 but formally began training in 1978.

ABCA FOUNDING DATE DISCREPANCY:
- ABCA WordPress states founding July 3, 1987 with first election results
- Some GCFA sources state "1991" for ABCA founding
- Majority of sources including official ABCA documentation confirm 1987
- Laércio was involved in ABCA founding but may not have been on first elected board (1987 board: João Pequeno, Paulo dos Anjos, Bom Cabrito, Nô, Renê)

FILHOS DE ANGOLA FOUNDING DATE:
- Sources consistently cite March 20, 1984 as founding date
- Some sources cite 1981 as when group members first came together
- 1984 is formal founding date; 1981 may reference initial friendship/collaboration

CO-FOUNDERS:
- Laércio (this person)
- Roberval do Espírito Santo (later separated, leads GCFA Sverige)
- Cabore (later separated)
- Rosalvo dos Santos (later separated, first angoleiro in Europe 1989, founded Academia Jangada Berlin)
- Over time, co-founders separated; Laércio continued with GCFA

TEACHERS (primary training):
- Mestre Caiçara (1978-ongoing, primary teacher at his academy)
- Mestre João Pequeno (3 years with GCFA group, at Forte Santo Antônio)
- Mestre Canjiquinha (2 years with GCFA group)
- Mestre Boca Rica (extended period)
- Mestre João Grande (Sunday classes at Forte Santo Antônio)
- Mestre Moraes (cultural/musical training through GCAP period)
- Additional influences at Salvador rodas: Waldemar, Curé, Fernanito, Zacarias, Papo Amarelo, Bola Sete, Bobó, Lua de Bobó

GCFA INTERNATIONAL LOCATIONS (2024):
- Germany: Berlin, Konstanz, Freiburg
- France: Lyon (Contramestre Jonathan, late 1990s), Haute-Savoie (Contramestre Teco Canindé, 2007)
- Spain: Valencia (Mestre Daniel Arroz)
- UK: Falmouth
- Portugal: Lisbon
- Greece: Thessaloniki
- Switzerland: Bienne
- Russia: (workshops)

MEDIA APPEARANCES:
- 2009: Album "Mandinga e manhã: o segredo da Capoeira" (recorded Nov 23, 2008 at Naunyn Ritze, Kreuzberg, Berlin)
- 2017: Album "33 anos de resistência" (recorded July 2015 in Valencia before 20th International Meeting GCFA)

EUROPEAN TIMELINE:
- 1989: Rosalvo (co-founder) arrives in Europe as first angoleiro
- 1993 (September): Laércio arrives in Europe
- 1990s: GCFA arrives in Germany; expansion begins
- Late 1990s: Contramestre Jonathan establishes GCFA France (Lyon)
- 2007: Contramestre Teco Canindé establishes GCFA Haute-Savoie',
  -- Notes PT
  E'ANO DE NASCIMENTO (1966, precisão anual):
Múltiplas fontes confirmam 1966 como ano de nascimento. Algumas fontes dizem que ele começou capoeira aos 9 anos (1975), outras aos 12 anos (1978). A data de 1978 (12 anos) é mais consistentemente citada. A descoberta da capoeira via amigo Samuel em 1976 (10 anos) reconcilia essas informações—ele descobriu a academia em 1976 mas começou formalmente a treinar em 1978.

DISCREPÂNCIA NA DATA DE FUNDAÇÃO DA ABCA:
- WordPress da ABCA afirma fundação em 3 de julho de 1987 com resultados da primeira eleição
- Algumas fontes do GCFA afirmam "1991" para fundação da ABCA
- A maioria das fontes incluindo documentação oficial da ABCA confirma 1987
- Laércio estava envolvido na fundação da ABCA mas pode não ter estado na primeira diretoria eleita (diretoria 1987: João Pequeno, Paulo dos Anjos, Bom Cabrito, Nô, Renê)

DATA DE FUNDAÇÃO DOS FILHOS DE ANGOLA:
- Fontes consistentemente citam 20 de março de 1984 como data de fundação
- Algumas fontes citam 1981 como quando os membros do grupo se reuniram pela primeira vez
- 1984 é a data de fundação formal; 1981 pode referir-se à amizade/colaboração inicial

CO-FUNDADORES:
- Laércio (esta pessoa)
- Roberval do Espírito Santo (separou-se depois, lidera GCFA Sverige)
- Cabore (separou-se depois)
- Rosalvo dos Santos (separou-se depois, primeiro angoleiro na Europa 1989, fundou Academia Jangada Berlim)
- Com o tempo, os co-fundadores se separaram; Laércio continuou com o GCFA

MESTRES (treinamento principal):
- Mestre Caiçara (1978-contínuo, professor principal em sua academia)
- Mestre João Pequeno (3 anos com grupo GCFA, no Forte Santo Antônio)
- Mestre Canjiquinha (2 anos com grupo GCFA)
- Mestre Boca Rica (período extenso)
- Mestre João Grande (aulas de domingo no Forte Santo Antônio)
- Mestre Moraes (treinamento cultural/musical durante período GCAP)
- Influências adicionais nas rodas de Salvador: Waldemar, Curé, Fernanito, Zacarias, Papo Amarelo, Bola Sete, Bobó, Lua de Bobó

LOCAIS INTERNACIONAIS DO GCFA (2024):
- Alemanha: Berlim, Konstanz, Freiburg
- França: Lyon (Contramestre Jonathan, final dos anos 1990), Alta Saboia (Contramestre Teco Canindé, 2007)
- Espanha: Valência (Mestre Daniel Arroz)
- Reino Unido: Falmouth
- Portugal: Lisboa
- Grécia: Salônica
- Suíça: Bienne
- Rússia: (workshops)

APARIÇÕES NA MÍDIA:
- 2009: Álbum "Mandinga e manhã: o segredo da Capoeira" (gravado 23 nov 2008 em Naunyn Ritze, Kreuzberg, Berlim)
- 2017: Álbum "33 anos de resistência" (gravado julho 2015 em Valência antes do 20º Encontro Internacional GCFA)

CRONOLOGIA EUROPEIA:
- 1989: Rosalvo (co-fundador) chega à Europa como primeiro angoleiro
- 1993 (setembro): Laércio chega à Europa
- Anos 1990: GCFA chega à Alemanha; expansão começa
- Final dos anos 1990: Contramestre Jonathan estabelece GCFA França (Lyon)
- 2007: Contramestre Teco Canindé estabelece GCFA Alta Saboia'
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
