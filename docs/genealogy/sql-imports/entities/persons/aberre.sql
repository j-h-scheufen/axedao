-- ============================================================
-- GENEALOGY PERSON: Aberrê
-- Migrated: 2025-12-11
-- Updated: 2026-01-02 (Consolidated with "Aberrê de Santo Amaro")
-- ============================================================
-- CONSOLIDATION NOTE: After thorough research, the "two Aberrês" theory
-- was found to be based on confusion about birthplace vs residence.
-- Antônio Raimundo Argolo was BORN in Santo Amaro da Purificação but
-- LIVED in Salvador from at least 1910. The "Aberrê de Santo Amaro"
-- designation refers to his birthplace, not a second person.
-- The name "Antônio Rufino dos Santos" appears to be an error that
-- propagated through secondary sources.
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
  'Antônio Raimundo Argolo',
  'Aberrê',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/en/featured-2', 'https://esquiva.wordpress.com/mestres/mestre-aberre/', 'https://nossa-tribo.com/mestre-aberre/', 'https://velhosmestres.com/br/destaques-27', 'http://ipcb-rj.com.br/?p=617']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  'Practiced the pre-codified capoeira of early 20th century Salvador. His teaching emphasized practical self-defense: negativa, queda de rim, and falling techniques. He explained students needed to know how to fall if pushed in the street. He carried a bengala (walking cane) both for elegance and as a potential weapon—a trademark he passed to his student Caiçara.',
  'Praticava a capoeira pré-codificada do início do século XX em Salvador. Seu ensino enfatizava autodefesa prática: negativa, queda de rim e técnicas de queda. Explicava que alunos precisavam saber cair caso fossem empurrados na rua. Carregava uma bengala tanto por elegância quanto como arma em potencial—uma marca registrada que passou ao seu aluno Caiçara.',
  -- Life dates
  1895,
  'exact'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  1942,
  'month'::genealogy.date_precision,
  'Fuisco de Baixo, Jacaré, Salvador, Brazil',
  -- Extended content (bio)
  'Antônio Raimundo Argolo was born on August 6, 1895, in Santo Amaro da Purificação in the Recôncavo Baiano—the same year as the legendary Besouro Mangangá. Son of Ângelo Argolo and Maria R. de Argolo, he grew up to become one of the pivotal figures in the survival of Capoeira Angola.

By 1910, the teenage Aberrê had moved to Salvador and was already practicing capoeira in the Baixada do Matatu Preto in the Matatu neighborhood. He trained among a formidable generation: Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, and Barbosa. Sources disagree on his primary teacher—some attribute his training to Mestre Pastinha, others to Mestre Antônio de Noronha, and some suggest both.

In 1935, Aberrê began teaching a 10-year-old named Washington Bruno da Silva—who would become Mestre Canjiquinha, "the joy of capoeira"—at the Matatu Preto Sunday training sessions. In 1938, he also began training 14-year-old Antônio Conceição Moraes from Cachoeira (later Mestre Caiçara), teaching him "os segredos e mistérios da capoeiragem" (the secrets and mysteries of capoeira). Aberrê emphasized practical street defense: negativa, queda de rim, and how to fall safely. When asked why, he explained simply: if someone pushes you in the street, you need to know how to land.

In 1936, Aberrê proved himself in Salvador''s fighting circuit. On March 25, he challenged Mestre Bimba at Parque Odeon. On May 16, he faced Onça Preta (Cícero Navarro). These challenges demonstrated his standing among the great mestres of his era.

By 1939, he was working as a mason at Santa Casa de Misericórdia da Bahia, living at Rua das Pitangueiras, n°50. Ruth Landes may have photographed him in October 1938 during her anthropological research in Salvador.

Then came 1941—the year Aberrê changed capoeira history. With several mestres dead and the tradition in danger of fragmenting, Aberrê convinced his former teacher (or student—accounts conflict) Pastinha to return to capoeira after a 30-year absence. According to Mestre Noronha''s manuscripts, Aberrê exercised leadership among the capoeiristas and, along with Amorzinho and Totonho de Maré, had helped create the Angolan capoeira center at Conceição da Praia—the embryo of the legendary Gengibirra roda.

On February 23, 1941, Aberrê invited Pastinha to a Sunday roda at Ladeira de Gengibirra in the Liberdade neighborhood. Aberrê was already famous at these gatherings. When Pastinha arrived, Amorzinho—a civil guard who led the roda—offered him the berimbau: "I have been waiting a long time to give you this capoeira for you to master". With Aberrê, Amorzinho, and Antonio Maré passing him the instrument, Pastinha became the leader of Capoeira Angola. Without Aberrê''s intervention, the "pastiniana" lineage might never have existed.

In September 1942, at a lively roda in Lower City where the Estrela de Salomão (Star of Solomon) was drawn, Aberrê was dominating his adversary when suddenly, without anyone expecting it, he collapsed. According to Mestre Canjiquinha, Aberrê had eaten beans with fat that morning, sang capoeira songs, then fell ill during a student''s game, collapsing during cartwheels. Mestre Onça Preta confirmed: it was a heart attack.

For weeks, no one played capoeira in Bahia. Everyone understood they had lost a great master.

The bengala (walking cane) that Aberrê always carried—both for elegance and as a potential weapon—he gave to his student Caiçara before his death. It remained a symbol of their lineage. Mestre Canjiquinha later founded the "Conjunto Folclórico Aberrê" in honor of his teacher.

**Note on the "Two Aberrês" controversy:** Some secondary sources identify Caiçara''s teacher as "Antônio Rufino dos Santos, Aberrê de Santo Amaro"—suggesting two different capoeiristas named Aberrê. However, research indicates this is likely confusion about Aberrê''s birthplace (Santo Amaro da Purificação) versus his residence (Salvador). Multiple sources confirm: (1) Aberrê was "natural de Santo Amaro da Purificação" (born there); (2) By 1910 he was already living in Salvador; (3) He taught BOTH Canjiquinha and Caiçara. The "Rufino" vs "Raimundo" discrepancy appears to stem from oral history confusion decades later. Both Canjiquinha and Caiçara denied connection to Pastinha''s lineage, but this reflects lineage politics rather than evidence of two different teachers.',
  -- bio_pt
  'Antônio Raimundo Argolo nasceu em 6 de agosto de 1895 em Santo Amaro da Purificação, no Recôncavo Baiano—o mesmo ano do lendário Besouro Mangangá. Filho de Ângelo Argolo e Maria R. de Argolo, ele cresceu para se tornar uma das figuras centrais na sobrevivência da Capoeira Angola.

Por volta de 1910, o adolescente Aberrê havia se mudado para Salvador e já praticava capoeira na Baixada do Matatu Preto, no bairro do Matatu. Ele treinou entre uma geração formidável: Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha e Barbosa. As fontes divergem sobre seu professor principal—algumas atribuem seu treinamento a Mestre Pastinha, outras a Mestre Antônio de Noronha, e algumas sugerem ambos.

Em 1935, Aberrê começou a ensinar um garoto de 10 anos chamado Washington Bruno da Silva—que se tornaria Mestre Canjiquinha, "a alegria da capoeira"—nas sessões de treino de domingo no Matatu Preto. Em 1938, também começou a treinar Antônio Conceição Moraes, de 14 anos, de Cachoeira (mais tarde Mestre Caiçara), ensinando-lhe "os segredos e mistérios da capoeiragem". Aberrê enfatizava a defesa prática de rua: negativa, queda de rim e como cair com segurança. Quando perguntado por quê, explicava simplesmente: se alguém te empurrar na rua, você precisa saber como aterrissar.

Em 1936, Aberrê provou seu valor no circuito de lutas de Salvador. Em 25 de março, desafiou Mestre Bimba no Parque Odeon. Em 16 de maio, enfrentou Onça Preta (Cícero Navarro). Esses desafios demonstraram sua posição entre os grandes mestres de sua era.

Em 1939, trabalhava como pedreiro na Santa Casa de Misericórdia da Bahia, morando na Rua das Pitangueiras, n°50. Ruth Landes pode tê-lo fotografado em outubro de 1938 durante sua pesquisa antropológica em Salvador.

Então veio 1941—o ano em que Aberrê mudou a história da capoeira. Com vários mestres mortos e a tradição em perigo de fragmentar-se, Aberrê convenceu seu antigo professor (ou aluno—os relatos conflitam) Pastinha a retornar à capoeira após uma ausência de 30 anos. Segundo os manuscritos de Mestre Noronha, Aberrê exercia liderança entre os capoeiristas e, junto com Amorzinho e Totonho de Maré, havia ajudado a criar o centro de capoeira angolana na Conceição da Praia—o embrião da lendária roda de Gengibirra.

Em 23 de fevereiro de 1941, Aberrê convidou Pastinha para uma roda de domingo na Ladeira de Gengibirra no bairro da Liberdade. Aberrê já era famoso nessas reuniões. Quando Pastinha chegou, Amorzinho—um guarda civil que liderava a roda—ofereceu-lhe o berimbau: "Há muito tempo espero para lhe dar esta capoeira para você comandar". Com Aberrê, Amorzinho e Antonio Maré passando-lhe o instrumento, Pastinha tornou-se o líder da Capoeira Angola. Sem a intervenção de Aberrê, a linhagem "pastiniana" talvez nunca tivesse existido.

Em setembro de 1942, em uma animada roda na Cidade Baixa onde estava desenhada a Estrela de Salomão, Aberrê dominava seu adversário quando subitamente, sem ninguém esperar, ele desabou. Segundo Mestre Canjiquinha, Aberrê havia comido feijão com gordura naquela manhã, cantou músicas de capoeira, depois passou mal durante o jogo de um aluno, desabando durante as rodas (aú). Mestre Onça Preta confirmou: foi um ataque cardíaco.

Por semanas, ninguém jogou capoeira na Bahia. Todos entenderam que haviam perdido um grande mestre.

A bengala que Aberrê sempre carregava—tanto por elegância quanto como potencial arma—ele deu ao seu aluno Caiçara antes de sua morte. Permaneceu como símbolo de sua linhagem. Mestre Canjiquinha mais tarde fundou o "Conjunto Folclórico Aberrê" em homenagem ao seu professor.

**Nota sobre a controvérsia dos "Dois Aberrês":** Algumas fontes secundárias identificam o professor de Caiçara como "Antônio Rufino dos Santos, Aberrê de Santo Amaro"—sugerindo dois capoeiristas diferentes chamados Aberrê. No entanto, pesquisas indicam que isso é provavelmente confusão sobre o local de nascimento de Aberrê (Santo Amaro da Purificação) versus sua residência (Salvador). Múltiplas fontes confirmam: (1) Aberrê era "natural de Santo Amaro da Purificação" (nasceu lá); (2) Em 1910 ele já vivia em Salvador; (3) Ele ensinou TANTO Canjiquinha QUANTO Caiçara. A discrepância "Rufino" vs "Raimundo" parece derivar de confusão de história oral décadas depois. Tanto Canjiquinha quanto Caiçara negaram conexão com a linhagem de Pastinha, mas isso reflete política de linhagem e não evidência de dois professores diferentes.',
  -- achievements
  'March 25, 1936: Challenged Mestre Bimba at Parque Odeon, Salvador
May 16, 1936: Challenged Onça Preta (Cícero Navarro) in fighting circuit
February 23, 1941: Invited Pastinha to Gengibirra and facilitated the handover of Capoeira Angola leadership
1935-1942: Trained Mestre Canjiquinha (1935) and Mestre Caiçara (1938)—both became major lineage founders
Co-founded Centro de Capoeira Angola at Conceição da Praia (precursor to Gengibirra)
His bengala became Caiçara''s trademark; Canjiquinha founded "Conjunto Folclórico Aberrê" in his honor',
  -- achievements_pt
  '25 de março de 1936: Desafiou Mestre Bimba no Parque Odeon, Salvador
16 de maio de 1936: Desafiou Onça Preta (Cícero Navarro) no circuito de lutas
23 de fevereiro de 1941: Convidou Pastinha para Gengibirra e facilitou a passagem da liderança da Capoeira Angola
1935-1942: Treinou Mestre Canjiquinha (1935) e Mestre Caiçara (1938)—ambos tornaram-se fundadores de grandes linhagens
Co-fundador do Centro de Capoeira Angola na Conceição da Praia (precursor de Gengibirra)
Sua bengala tornou-se marca registrada de Caiçara; Canjiquinha fundou o "Conjunto Folclórico Aberrê" em sua homenagem',
  -- notes (researcher metadata)
  'CONSOLIDATED 2026-01-02: Research determined the "two Aberrês" theory was based on birthplace/residence confusion. Key evidence: (1) Multiple sources confirm Aberrê was "natural de Santo Amaro da Purificação" (born there) but living in Salvador from 1910; (2) He taught BOTH Canjiquinha (1935 in Salvador) and Caiçara (1938); (3) Consistent biographical details across sources; (4) The "Antônio Rufino dos Santos" attribution appears to be an oral history error—"Rufino" confused with "Raimundo". Sources: ipcb-rj.com.br/?p=617 (key article on the controversy), velhosmestres.com, esquiva.wordpress.com, palitocapoeira.com.br. Full name from birth records per velhosmestres.com. Death circumstances recorded by both Mestre Canjiquinha and Mestre Onça Preta. Possible appearance in Ruth Landes photographs (October 23, 1938) but unconfirmed.',
  -- notes_pt
  'CONSOLIDADO 2026-01-02: Pesquisa determinou que a teoria dos "dois Aberrês" baseava-se em confusão entre local de nascimento e residência. Evidências principais: (1) Múltiplas fontes confirmam que Aberrê era "natural de Santo Amaro da Purificação" (nasceu lá) mas vivia em Salvador desde 1910; (2) Ele ensinou TANTO Canjiquinha (1935 em Salvador) QUANTO Caiçara (1938); (3) Detalhes biográficos consistentes entre fontes; (4) A atribuição "Antônio Rufino dos Santos" parece ser erro de história oral—"Rufino" confundido com "Raimundo". Fontes: ipcb-rj.com.br/?p=617 (artigo principal sobre a controvérsia), velhosmestres.com, esquiva.wordpress.com, palitocapoeira.com.br. Nome completo de registros de nascimento conforme velhosmestres.com. Circunstâncias da morte registradas por Mestre Canjiquinha e Mestre Onça Preta. Possível aparição em fotografias de Ruth Landes (23 de outubro de 1938) mas não confirmado.'
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
