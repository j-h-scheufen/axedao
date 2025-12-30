-- ============================================================
-- GENEALOGY PERSON: Mucungê
-- Generated: 2025-12-16
-- Primary Sources: velhosmestres.com, capoeirahistory.com
-- ============================================================
-- DEPENDENCIES: waldemar.sql (trained at Barracão do Waldemar with bateria)
-- ============================================================
--
-- FULL NAME: Unknown
-- His apelido "Mucungê" likely derives from the town Mucugê in the Chapada
-- Diamantina region of Bahia, suggesting either origin there or connection to it.
--
-- BIRTH YEAR ESTIMATION:
-- No birth year documented. Based on:
-- 1. Active in bateria at Waldemar's Barracão in the 1950s
-- 2. Co-founded Filhos de Angola in 1960 (would need to be at least 25+)
-- 3. Still active in 1997 events (documented photos)
-- 4. Died March 8, 1998 from respiratory failure
-- Estimating birth around 1920s-1930s. Using 1930 with decade precision.
--
-- DEATH DATE:
-- According to death certificate (cited in "A Roda da Central" academic article):
-- Died March 8, 1998 of respiratory failure while residing in Queimados, RJ.
--
-- ORIGIN:
-- Bahian migrant to Rio de Janeiro. Participated in Mestre Waldemar's
-- bateria in Salvador alongside Bugalho, Zacarias, and Ananias before
-- migrating to Rio in the 1950s.
--
-- KNOWN FOR:
-- - Exceptional berimbau skills - described as "legendary"
-- - Taught berimbau to Mestre Roque
-- - Participated in Mestre Paraná's 1963 LP recording
-- - Co-founded Grupo Filhos de Angola (Rio, July 21, 1960)
-- - Key figure at Roda da Central (Carnival street roda, 1950s-1983)
-- - "Bamba" (tough guy) remembered by old masters in documentary testimony
--
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  NULL,
  'Mucungê',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/destaques-51', 'https://capoeirahistory.com/m-parana/', 'https://capoeirahistory.com/central-station-roda/']::text[],
  'angola'::genealogy.style,
  E'Mucungê was renowned primarily as a berimbau virtuoso rather than for his game in the roda. His exceptional skill on the instrument made him a sought-after musician for recordings and performances. He represented the traditional Angola style brought from Bahia to Rio de Janeiro.',
  E'Mucungê era conhecido principalmente como um virtuose do berimbau, mais do que pelo seu jogo na roda. Sua habilidade excepcional no instrumento o tornava um músico requisitado para gravações e apresentações. Ele representava o estilo tradicional da Angola trazido da Bahia para o Rio de Janeiro.',
  1930,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  1998,
  'exact'::genealogy.date_precision,
  'Queimados, Rio de Janeiro, Brazil',
  E'Mucungê was a Bahian angoleiro who migrated to Rio de Janeiro in the 1950s, becoming one of the key figures in establishing capoeira angola in the city. His apelido likely derives from the town of Mucugê in the Chapada Diamantina region of Bahia.\n\nIn Salvador, before migrating to Rio, Mucungê was part of the inner circle at Mestre Waldemar''s legendary Barracão in the Liberdade neighborhood. There he worked in the bateria alongside Bugalho, Zacarias Boa Morte, and Mestre Ananias—the rhythmic foundation that powered the weekly rodas that attracted academics, artists, and journalists throughout the 1950s.\n\nMucungê became legendary for his mastery of the berimbau. Mestre Roque, one of the four founding lineage figures of contemporary capoeira in Rio, asserts that he learned to play berimbau from Mucungê after arriving in Rio. Multiple sources describe Mucungê as "well-known for his skills as a berimbau player" rather than for his game, suggesting he was primarily valued as a musician.\n\nOn July 21, 1960, Mucungê co-founded Grupo Filhos de Angola in Rio de Janeiro together with Roque, Onça Preta, Dois de Ouro, Baleado, and Imagem do Cão. This group of Bahian angoleiros created a cultural movement that pioneered capoeira teaching in Rio''s favelas, particularly in the Zona Sul.\n\nIn 1963, Mestre Paraná invited Mucungê to participate in recording his landmark album "Capoeira: Mestre Paraná", released on CBS Masterworks. According to André Luiz Lacé Lopes, Mucungê was one of two Bahian capoeiristas invited alongside Santo Amaro (though Mestre Gegê recalled the second musician as Onça Preta).\n\nMucungê was one of the "bambas"—the tough guys—who defined the legendary Roda da Central, the spontaneous capoeira circle that formed during Carnival between the samba parade route on Avenida Presidente Vargas and Central Station. This roda ran continuously for four days and nights until 1983. Mestre Roque remembered: "Na Central? Era Inglês, Mucungê, Onça Preta, Baleado, Vavá Moleque, Reginaldo, quem mais? É... Seu Menezes, Lamartine, Paraná..."\n\nThroughout the 1980s and 1990s, Mucungê remained active in Rio''s capoeira community. In 1984, he participated in Mestre Camisa''s event at Circo Voador alongside mestres João Pequeno and Zacarias Boa Morte. In 1987, he attended a gathering of elderly mestres from Bahia in Rio. Photographs from 1997 show him at events in Morro da Babilônia (Leme) with Mestres Dorado and Garça, and at Mestre Poraquê''s event playing berimbau with Mestres Mendonça and Leopoldina.\n\nMucungê died on March 8, 1998, from respiratory failure while residing in Queimados, Rio de Janeiro. His death certificate, cited in the academic article "A Roda da Central", confirms these details. The documentary film "Roda da Central" preserves the oral testimony of masters who remembered Mucungê as one of the key protagonists of that undocumented annual street tradition.\n\nMucungê is referenced in traditional capoeira songs, including a ladainha honoring Mestre Bimba that mentions "Ensinando a Mucungê" (teaching Mucungê), indicating his recognition within the broader capoeira community.',
  E'Mucungê foi um angoleiro baiano que migrou para o Rio de Janeiro nos anos 1950, tornando-se uma das figuras-chave no estabelecimento da capoeira angola na cidade. Seu apelido provavelmente deriva da cidade de Mucugê, na região da Chapada Diamantina na Bahia.\n\nEm Salvador, antes de migrar para o Rio, Mucungê fazia parte do círculo íntimo no lendário Barracão de Mestre Waldemar no bairro da Liberdade. Lá ele trabalhava na bateria ao lado de Bugalho, Zacarias Boa Morte e Mestre Ananias—a base rítmica que impulsionava as rodas semanais que atraíam acadêmicos, artistas e jornalistas durante os anos 1950.\n\nMucungê tornou-se lendário por sua maestria no berimbau. Mestre Roque, uma das quatro linhagens fundadoras da capoeira contemporânea no Rio, afirma que aprendeu a tocar berimbau com Mucungê após chegar ao Rio. Múltiplas fontes descrevem Mucungê como "conhecido por suas habilidades como tocador de berimbau" mais do que pelo seu jogo, sugerindo que ele era valorizado principalmente como músico.\n\nEm 21 de julho de 1960, Mucungê co-fundou o Grupo Filhos de Angola no Rio de Janeiro junto com Roque, Onça Preta, Dois de Ouro, Baleado e Imagem do Cão. Este grupo de angoleiros baianos criou um movimento cultural que foi pioneiro no ensino de capoeira nas favelas do Rio, particularmente na Zona Sul.\n\nEm 1963, Mestre Paraná convidou Mucungê para participar da gravação de seu álbum marcante "Capoeira: Mestre Paraná", lançado pela CBS Masterworks. Segundo André Luiz Lacé Lopes, Mucungê foi um dos dois capoeiristas baianos convidados ao lado de Santo Amaro (embora Mestre Gegê lembrasse do segundo músico como Onça Preta).\n\nMucungê foi um dos "bambas"—os valentões—que definiram a lendária Roda da Central, a roda de capoeira espontânea que se formava durante o Carnaval entre o percurso do desfile de samba na Avenida Presidente Vargas e a Estação Central. Esta roda funcionava continuamente por quatro dias e noites até 1983. Mestre Roque lembrava: "Na Central? Era Inglês, Mucungê, Onça Preta, Baleado, Vavá Moleque, Reginaldo, quem mais? É... Seu Menezes, Lamartine, Paraná..."\n\nAo longo das décadas de 1980 e 1990, Mucungê permaneceu ativo na comunidade de capoeira do Rio. Em 1984, participou do evento de Mestre Camisa no Circo Voador ao lado dos mestres João Pequeno e Zacarias Boa Morte. Em 1987, participou de um encontro de mestres idosos da Bahia no Rio. Fotografias de 1997 o mostram em eventos no Morro da Babilônia (Leme) com os Mestres Dorado e Garça, e no evento de Mestre Poraquê tocando berimbau com os Mestres Mendonça e Leopoldina.\n\nMucungê faleceu em 8 de março de 1998, por insuficiência respiratória, enquanto residia em Queimados, Rio de Janeiro. Sua certidão de óbito, citada no artigo acadêmico "A Roda da Central", confirma esses detalhes. O documentário "Roda da Central" preserva o testemunho oral de mestres que lembravam Mucungê como um dos protagonistas principais daquela tradição de rua anual não documentada.\n\nMucungê é referenciado em canções tradicionais de capoeira, incluindo uma ladainha em homenagem a Mestre Bimba que menciona "Ensinando a Mucungê" (ensinando a Mucungê), indicando seu reconhecimento dentro da comunidade mais ampla de capoeira.',
  E'Co-founder of Grupo Filhos de Angola (Rio de Janeiro, July 21, 1960)\nRenowned berimbau virtuoso - taught berimbau to Mestre Roque\nParticipated in Mestre Paraná''s 1963 CBS album recording\nMember of bateria at Mestre Waldemar''s Barracão in Salvador\nKey protagonist of Roda da Central (Carnival street roda, 1950s-1983)\nParticipated in Circo Voador event with João Pequeno and Zacarias (1984)\nReferenced in traditional ladainha honoring Mestre Bimba\nTestimony preserved in "Roda da Central" documentary',
  E'Co-fundador do Grupo Filhos de Angola (Rio de Janeiro, 21 de julho de 1960)\nRenomado virtuose do berimbau - ensinou berimbau a Mestre Roque\nParticipou da gravação do álbum CBS de Mestre Paraná em 1963\nMembro da bateria no Barracão de Mestre Waldemar em Salvador\nProtagonista principal da Roda da Central (roda de rua do Carnaval, anos 1950-1983)\nParticipou do evento no Circo Voador com João Pequeno e Zacarias (1984)\nReferenciado em ladainha tradicional em homenagem a Mestre Bimba\nTestemunho preservado no documentário "Roda da Central"',
  E'BIRTH YEAR ESTIMATION:\nNo birth year documented. Estimated ~1930 (decade precision) based on:\n- Active in Waldemar''s bateria in Salvador 1950s\n- Co-founded Filhos de Angola 1960 (would need to be adult)\n- Still photographed at events in 1997\n- Died March 8, 1998\n\nDEATH DATE:\nDeath certificate cited in academic article "A Roda da Central: a capoeira de rua carioca, décadas de 1950 a 1970" (Revista EntreRios):\n- Date: March 8, 1998\n- Cause: Respiratory failure\n- Residence at death: Queimados, RJ\n\nNAME/APELIDO ORIGIN:\nApelido likely derives from Mucugê, a town in Chapada Diamantina, Bahia. Full name unknown.\n\nPARANÁ LP RECORDING (1963):\nConflicting accounts of second musician:\n- André Luiz Lacé Lopes says: Mucungê and Santo Amaro\n- Mestre Gegê says: Mucungê and Onça Preta\nMucungê''s participation confirmed by both sources.\n\nKEY LOCATIONS:\n- Salvador: Waldemar''s Barracão (bateria member, 1950s)\n- Rio: Roda da Central (Carnival, until 1983)\n- Rio: Morro da Babilônia, Leme (1997 visit)\n- Queimados, RJ (final residence)\n\nCONTEMPORARIES (Rio):\n- Roque, Onça Preta, Dois de Ouro, Baleado, Imagem do Cão (Filhos de Angola co-founders)\n- Paraná, Inglês, Vavá Moleque, Reginaldo, Seu Menezes, Lamartine (Roda da Central)\n- João Pequeno, Zacarias Boa Morte (1984 Circo Voador)\n- Leopoldina, Mendonça, Poraquê (1997 events)\n- Dorado, Garça, Guará (Morro da Babilônia 1997)\n\nCONTEMPORARIES (Salvador):\n- Waldemar da Liberdade (roda leader)\n- Bugalho, Zacarias, Ananias (bateria)\n\nDOCUMENTARY EVIDENCE:\n- Photographs in André Lacé Collection\n- Audio recordings: ladainha (1996, 1:10), corrido (1984, 0:45)\n- "Roda da Central" documentary (oral testimony of 8 old masters)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO:\nNenhum ano de nascimento documentado. Estimado ~1930 (precisão de década) baseado em:\n- Ativo na bateria de Waldemar em Salvador nos anos 1950\n- Co-fundou Filhos de Angola em 1960 (precisaria ser adulto)\n- Ainda fotografado em eventos em 1997\n- Faleceu em 8 de março de 1998\n\nDATA DE FALECIMENTO:\nCertidão de óbito citada no artigo acadêmico "A Roda da Central: a capoeira de rua carioca, décadas de 1950 a 1970" (Revista EntreRios):\n- Data: 8 de março de 1998\n- Causa: Insuficiência respiratória\n- Residência no óbito: Queimados, RJ\n\nORIGEM DO NOME/APELIDO:\nApelido provavelmente deriva de Mucugê, uma cidade na Chapada Diamantina, Bahia. Nome completo desconhecido.\n\nGRAVAÇÃO DO LP DE PARANÁ (1963):\nRelatos conflitantes sobre o segundo músico:\n- André Luiz Lacé Lopes diz: Mucungê e Santo Amaro\n- Mestre Gegê diz: Mucungê e Onça Preta\nParticipação de Mucungê confirmada por ambas as fontes.\n\nLOCAIS PRINCIPAIS:\n- Salvador: Barracão de Waldemar (membro da bateria, anos 1950)\n- Rio: Roda da Central (Carnaval, até 1983)\n- Rio: Morro da Babilônia, Leme (visita em 1997)\n- Queimados, RJ (última residência)\n\nCONTEMPORÂNEOS (Rio):\n- Roque, Onça Preta, Dois de Ouro, Baleado, Imagem do Cão (co-fundadores do Filhos de Angola)\n- Paraná, Inglês, Vavá Moleque, Reginaldo, Seu Menezes, Lamartine (Roda da Central)\n- João Pequeno, Zacarias Boa Morte (Circo Voador 1984)\n- Leopoldina, Mendonça, Poraquê (eventos de 1997)\n- Dorado, Garça, Guará (Morro da Babilônia 1997)\n\nCONTEMPORÂNEOS (Salvador):\n- Waldemar da Liberdade (líder da roda)\n- Bugalho, Zacarias, Ananias (bateria)\n\nEVIDÊNCIA DOCUMENTAL:\n- Fotografias na Coleção André Lacé\n- Gravações de áudio: ladainha (1996, 1:10), corrido (1984, 0:45)\n- Documentário "Roda da Central" (testemunho oral de 8 mestres antigos)'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name, title = EXCLUDED.title, portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links, style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en, style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year, birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place, death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision, death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en, bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en, achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en, notes_pt = EXCLUDED.notes_pt, updated_at = NOW();
