-- ============================================================
-- GENEALOGY PERSON: Pastinha
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
  'Vicente Ferreira Pastinha',
  'Pastinha',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://en.wikipedia.org/wiki/Vicente_Ferreira_Pastinha', 'https://velhosmestres.com/br/pastinha-1899', 'https://papoeira.com/en/who-was-mestre-pastinha/', 'https://ceca-riovermelho.org.br/mestres/mestre-pastinha/?lang=en', 'https://www.lalaue.com/learn-capoeira/mestre-pastinha/']::text[],
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Codifier of Capoeira Angola as a distinct style. Preserved traditional African-rooted techniques: low-to-the-ground movements, strategic play, mandinga (cunning/trickery), and emphasis on spiritual and cultural connection. Adopted yellow and black colors (from Esporte Clube Ypiranga) as the hallmark uniform of Angola capoeira. Created teaching methodology emphasizing that "Capoeira de Angola can only be taught without forcing the person''s natural expression."',
  E'Codificador da Capoeira Angola como estilo distinto. Preservou técnicas tradicionais de raiz africana: movimentos baixos, jogo estratégico, mandinga e ênfase na conexão espiritual e cultural. Adotou as cores amarelo e preto (do Esporte Clube Ypiranga) como uniforme característico da capoeira Angola. Criou metodologia de ensino enfatizando que "a Capoeira de Angola só pode ser ensinada sem forçar a expressão natural da pessoa."',
  -- Life dates
  1889,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1981,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bio_en)
  E'Vicente Ferreira Pastinha was born on April 5, 1889, on Rua do Tijolo in Salvador, Bahia. His father, José Señor Pastinha (also recorded as José Pastiña), was a Spanish peddler who owned a small shop. His mother, Maria Eugênia Ferreira, was a Black woman from Santo Amaro da Purificação who sold acarajé and did laundry. The two had little contact.

At ten years old, Pastinha faced a problem familiar to many small boys: a bigger kid bullied him regularly on Rua das Laranjeiras in the Pelourinho neighborhood. An elderly African neighbor named Benedito, native of Angola, watched these encounters and offered to teach the boy capoeira. For three years, young Vicente learned the art at Benedito''s house at Rua das Laranjeiras, n° 26. After training, he defeated the bully. In later interviews, Pastinha spoke with deep gratitude about "Mestre Benedito, a black man native of Angola." When asked who taught him capoeira, he simply replied: "Um africano"—an African.

In 1902, at twelve years old, Pastinha''s father enrolled him in the Escola de Aprendiz de Marineros (School of Naval Apprentices). The professor who knew his uncle recommended it because the boy was "a troublemaker who didn''t want to study." At the school, Pastinha was assigned number 110. He served until age 20, working as a musician—a horn virtuoso—while secretly teaching capoeira to his fellow sailors. He also trained with sword and foil, studied guitar, and saved money at Caixa Economica bank.

After leaving the navy in 1909 or 1910, Pastinha worked various jobs: painter (trained at Liceu de Artes e Ofício), newspaper seller, shoe shiner, tailor, casino security guard, and laborer helping build Salvador''s port. He played football with Esporte Clube Ypiranga—whose black and yellow colors would later define Capoeira Angola''s uniform.

Then came a mysterious gap. According to his own writings, Pastinha "completely withdrew from the practice of capoeira" from 1912 until 1941—nearly thirty years. The reasons remain unclear.

In February 1941, everything changed. One of Pastinha''s former students, Raimundo Aberrê, invited him to a Sunday roda at Ladeira de Gengibirra in the Liberdade neighborhood. The traditional Bahian capoeira had become known as "Capoeira de Angola" in opposition to Bimba''s modernizing Regional style. A group of old mestres—including Amorzinho, Totonho de Maré, Noronha, and Livino—held regular rodas there to preserve the traditional practice. Amorzinho, a civil guard, offered protection from police harassment.

When Pastinha arrived on February 23, 1941, Amorzinho extended his hand and offered him the berimbau: "I have been waiting a long time to give you this capoeira for you to master." With Aberrê, Amorzinho, and Antonio Maré supporting him, the 52-year-old Pastinha accepted leadership of Capoeira Angola.

That same year, Pastinha founded the Centro Esportivo de Capoeira Angola (CECA)—the first academy dedicated specifically to the traditional style. The group reformed several times (1944, 1949) before official registration on October 1, 1952. In 1955, at age 66, Pastinha moved CECA to its famous address: Praça do Pelourinho, n° 19.

The academy became legendary. Students wore black pants and yellow shirts—Ypiranga''s colors. Consecrated mestres like Waldemar da Paixão, Noronha, Maré, Divino, and Traíra trained there. Great names emerged: Mestre Curió, Albertino, Gildo Alfinete, Valdomiro, and above all, João Grande and João Pequeno—the two disciples to whom Pastinha entrusted his legacy. Pastinha created verses for his favorites: "In the academy there''re two boys/ called João/ one is a tame snake/ the other a hawk..."

In 1964, Pastinha published his book *Capoeira Angola*, with a cover by artist Carybé and text by writer Jorge Amado. It outlined his training methods and philosophy: "Angola, mother of Capoeira. Sorcery of slaves in the longing for freedom; its beginning has no method and its end is inconceivable to even the most knowledgeable capoeirista."

In April 1966, Pastinha realized a dream: knowing Africa. He traveled to Dakar, Senegal, for the First International Festival of Black Arts, bringing João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás, and Camafeu de Oxossi. By then, thrombosis had damaged his vision—he couldn''t climb stairs alone and sat in the shade at performances. But his students demonstrated Capoeira Angola to the world. At the festival, young Senegalese boys showed movements similar to capoeira. When asked if it was capoeira, they replied: "Capoeira is in Brasil... Our people took it there and now you are showing it here."

Tragedy struck in 1971. Pastinha became a victim of gentrification in Pelourinho. The Salvador city government ordered him to vacate the CECA building for "renovation" with promises of return. He piled his berimbaus, pandeiros, and benches into a room barely four square meters. The renovation completed—but Pastinha never returned. The building became a SENAC restaurant.

His health deteriorated. After two falls, he went blind. In 1978, he suffered a stroke, then another. His wife Maria Romélia da Costa de Oliveira (Dona Nice), a baiana de acarajé, cared for him in a tiny, damp room at Rua Alfredo Brito n° 14 in Pelourinho. Unable to afford medical care, she eventually placed him in Abrigo Dom Pedro II, a shelter for the elderly.

On April 12, 1981, Pastinha played his final roda. Seven months later, on November 13, 1981—a Friday—he died of cerebral hemorrhage at age 92, blind, nearly paralyzed, and abandoned. His friend, the painter Carybé, paid for the funeral. He was buried the same afternoon at Cemitério do Campo Santo.

Jorge Amado wrote: "Mestre Pastinha... master of Capoeira Angola and Bahian cordiality, being of the highest civilization, man of the people with all their playful mischief... In his school in the Pelourinho, Mestre Pastinha produces Brazilian culture of the most real and best kind." In 1970, Pastinha said of João Pequeno and João Grande: "They will be the greatest Capoeira players of the future... They will be real masters, not impromptu teachers, as exist out there and who only serve to destroy our tradition which is so beautiful."

His tradition continues. Mestre João Pequeno founded Academia de João Pequeno de Pastinha in 1982 at Forte de Santo Antônio Além do Carmo. Mestre João Grande established his academy in New York City in 1990. The yellow and black colors, the strategic low game, the mandinga—Pastinha''s legacy lives in every Angola roda worldwide.',
  -- bio_pt
  E'Vicente Ferreira Pastinha nasceu em 5 de abril de 1889, na Rua do Tijolo em Salvador, Bahia. Seu pai, José Señor Pastinha (também registrado como José Pastiña), era um mascate espanhol que possuía uma pequena loja. Sua mãe, Maria Eugênia Ferreira, era uma mulher negra de Santo Amaro da Purificação que vendia acarajé e lavava roupa. Os dois tiveram pouco contato.

Aos dez anos, Pastinha enfrentava um problema familiar a muitos meninos pequenos: um garoto maior o intimidava regularmente na Rua das Laranjeiras, no bairro do Pelourinho. Um vizinho africano idoso chamado Benedito, natural de Angola, observava esses encontros e ofereceu ensinar ao menino capoeira. Por três anos, o jovem Vicente aprendeu a arte na casa de Benedito na Rua das Laranjeiras, n° 26. Após o treinamento, derrotou o valentão. Em entrevistas posteriores, Pastinha falava com profunda gratidão sobre "Mestre Benedito, um preto natural de Angola." Quando perguntado quem lhe ensinou capoeira, respondeu simplesmente: "Um africano."

Em 1902, aos doze anos, o pai de Pastinha o matriculou na Escola de Aprendiz de Marinheiros. O professor que conhecia seu tio recomendou porque o menino era "encrenqueiro e não queria estudar." Na escola, Pastinha recebeu o número 110. Serviu até os 20 anos, trabalhando como músico—virtuose de trompa—enquanto secretamente ensinava capoeira aos colegas marinheiros. Também treinou com espada e florete, estudou violão e guardou dinheiro na Caixa Econômica.

Após deixar a marinha em 1909 ou 1910, Pastinha trabalhou em vários empregos: pintor (formado no Liceu de Artes e Ofício), vendedor de jornais, engraxate, alfaiate, segurança de cassino e trabalhador ajudando a construir o porto de Salvador. Jogou futebol no Esporte Clube Ypiranga—cujas cores preto e amarelo mais tarde definiriam o uniforme da Capoeira Angola.

Então veio uma lacuna misteriosa. Segundo seus próprios escritos, Pastinha "retirou-se completamente da prática da capoeira" de 1912 até 1941—quase trinta anos. As razões permanecem obscuras.

Em fevereiro de 1941, tudo mudou. Um de seus antigos alunos, Raimundo Aberrê, convidou-o para uma roda de domingo na Ladeira de Gengibirra no bairro da Liberdade. A capoeira baiana tradicional tinha se tornado conhecida como "Capoeira de Angola" em oposição ao estilo Regional modernizador de Bimba. Um grupo de velhos mestres—incluindo Amorzinho, Totonho de Maré, Noronha e Livino—realizava rodas regulares ali para preservar a prática tradicional. Amorzinho, um guarda civil, oferecia proteção contra assédio policial.

Quando Pastinha chegou em 23 de fevereiro de 1941, Amorzinho estendeu a mão e ofereceu-lhe o berimbau: "Há muito tempo espero para lhe dar esta capoeira para você comandar." Com Aberrê, Amorzinho e Antonio Maré apoiando-o, o Pastinha de 52 anos aceitou a liderança da Capoeira Angola.

Naquele mesmo ano, Pastinha fundou o Centro Esportivo de Capoeira Angola (CECA)—a primeira academia dedicada especificamente ao estilo tradicional. O grupo foi reformado várias vezes (1944, 1949) antes do registro oficial em 1º de outubro de 1952. Em 1955, aos 66 anos, Pastinha mudou o CECA para seu endereço famoso: Praça do Pelourinho, n° 19.

A academia tornou-se lendária. Os alunos usavam calças pretas e camisas amarelas—as cores do Ypiranga. Mestres consagrados como Waldemar da Paixão, Noronha, Maré, Divino e Traíra treinaram lá. Grandes nomes surgiram: Mestre Curió, Albertino, Gildo Alfinete, Valdomiro, e acima de tudo, João Grande e João Pequeno—os dois discípulos a quem Pastinha confiou seu legado. Pastinha criou versos para seus favoritos: "Na academia tem dois rapazes/ chamados João/ um é cobra mansa/ o outro é gavião..."

Em 1964, Pastinha publicou seu livro *Capoeira Angola*, com capa do artista Carybé e texto do escritor Jorge Amado. Delineava seus métodos de treinamento e filosofia: "Angola, capoeira mãe. Mandinga de escravo em ânsia de liberdade; seu princípio não tem método e seu fim é inconcebível ao mais sábio capoeirista."

Em abril de 1966, Pastinha realizou um sonho: conhecer a África. Viajou para Dakar, Senegal, para o Primeiro Festival Internacional de Artes Negras, levando João Grande, Gato Preto, Gildo Alfinete, Roberto Satanás e Camafeu de Oxossi. Nessa época, trombose havia danificado sua visão—não conseguia subir escadas sozinho e sentava na sombra durante as apresentações. Mas seus alunos demonstraram Capoeira Angola ao mundo. No festival, jovens senegaleses mostraram movimentos similares à capoeira. Quando perguntados se era capoeira, responderam: "Capoeira é no Brasil... Nosso povo levou para lá e agora vocês estão mostrando aqui."

A tragédia veio em 1971. Pastinha tornou-se vítima da gentrificação no Pelourinho. O governo de Salvador ordenou que desocupasse o prédio do CECA para "reforma" com promessas de retorno. Ele empilhou seus berimbaus, pandeiros e bancos em um cômodo de mal quatro metros quadrados. A reforma terminou—mas Pastinha nunca voltou. O prédio tornou-se um restaurante do SENAC.

Sua saúde deteriorou. Após duas quedas, ficou cego. Em 1978, sofreu um AVC, depois outro. Sua esposa Maria Romélia da Costa de Oliveira (Dona Nice), uma baiana de acarajé, cuidou dele em um quarto minúsculo e úmido na Rua Alfredo Brito n° 14, no Pelourinho. Incapaz de pagar tratamento médico, ela eventualmente o colocou no Abrigo Dom Pedro II, um abrigo para idosos.

Em 12 de abril de 1981, Pastinha jogou sua última roda. Sete meses depois, em 13 de novembro de 1981—uma sexta-feira—morreu de hemorragia cerebral aos 92 anos, cego, quase paralisado e abandonado. Seu amigo, o pintor Carybé, pagou o funeral. Foi enterrado na mesma tarde no Cemitério do Campo Santo.

Jorge Amado escreveu: "Mestre Pastinha... mestre da Capoeira Angola e da cordialidade baiana, sendo da mais alta civilização, homem do povo com toda a sua malícia brincalhona... Em sua escola no Pelourinho, Mestre Pastinha produz cultura brasileira da mais real e melhor espécie." Em 1970, Pastinha disse sobre João Pequeno e João Grande: "Serão os grandes capoeiras do futuro... Serão mestres de verdade, não professores improvisados, como existem por aí e que só servem para destruir nossa tradição que é tão bonita."

Sua tradição continua. Mestre João Pequeno fundou a Academia de João Pequeno de Pastinha em 1982 no Forte de Santo Antônio Além do Carmo. Mestre João Grande estabeleceu sua academia em Nova York em 1990. As cores amarelo e preto, o jogo baixo estratégico, a mandinga—o legado de Pastinha vive em toda roda de Angola pelo mundo.',
  -- achievements_en
  E'Founded Centro Esportivo de Capoeira Angola (CECA) in 1941, the first Capoeira Angola academy
Official CECA registration October 1, 1952
Published "Capoeira Angola" (1964), one of the first written sources on the art
Represented Brazil at the First International Festival of Black Arts in Dakar, Senegal (April 1966)
Codified and preserved traditional Capoeira Angola style
Established yellow and black as the colors of Capoeira Angola
Trained generations of mestres including João Grande, João Pequeno, Curió, Gildo Alfinete, Boca Rica
Known as the "Philosopher of Capoeira" for his aphorisms and teachings
Recorded LP "Capoeira Angola" (1969) at Teatro Castro Alves',
  -- achievements_pt
  E'Fundou o Centro Esportivo de Capoeira Angola (CECA) em 1941, a primeira academia de Capoeira Angola
Registro oficial do CECA em 1º de outubro de 1952
Publicou "Capoeira Angola" (1964), uma das primeiras fontes escritas sobre a arte
Representou o Brasil no Primeiro Festival Internacional de Artes Negras em Dakar, Senegal (abril de 1966)
Codificou e preservou o estilo tradicional da Capoeira Angola
Estabeleceu amarelo e preto como as cores da Capoeira Angola
Treinou gerações de mestres incluindo João Grande, João Pequeno, Curió, Gildo Alfinete, Boca Rica
Conhecido como o "Filósofo da Capoeira" por seus aforismos e ensinamentos
Gravou LP "Capoeira Angola" (1969) no Teatro Castro Alves',
  -- notes_en
  E'BIRTH DATE: April 5, 1889 is widely accepted. Some sources list 1889, others note civil registration may show slightly different date.

DEATH DATE: November 13, 1981. One source (velhosmestres) gives November 14. Using November 13 as majority consensus.

MOTHER NAME: Sources vary - Maria Eugênia Ferreira, Eugênia Maria de Carvalho, or Raimunda dos Santos. Using Maria Eugênia Ferreira as most common.

FATHER NAME: José Señor Pastinha or José Pastiña - Spanish origin confirmed across sources.

TEACHER: Mestre Benedito, African from Angola. Limited documentation of his life beyond being Pastinha''s teacher (c. 1899-1902).

CECA FOUNDING: Pastinha claims February 23, 1941; official registration October 1, 1952. Paulo Santos Silva attempted to claim founder status during registration.

RELATIONSHIP WITH ABERRÊ: Sources conflict on whether Aberrê was Pastinha''s student (1910-1912) or vice versa. Both versions appear in historical records.

DEATH CERTIFICATE: Died at Abrigo Dom Pedro II. Cerebral hemorrhage (derrame cerebral). Buried same day at Cemitério do Campo Santo. Carybé paid funeral expenses.

PENDING RELATIONSHIPS (require future imports):
- João Grande student_of Pastinha
- João Pequeno student_of Pastinha
- Curió student_of Pastinha
- Gildo Alfinete student_of Pastinha
- Boca Rica student_of Pastinha
- Albertino student_of Pastinha
- Valdomiro student_of Pastinha
- Gato Preto student_of Pastinha
- Roberto Satanás student_of Pastinha
- Camafeu de Oxossi student_of Pastinha',
  -- notes_pt
  E'DATA DE NASCIMENTO: 5 de abril de 1889 é amplamente aceito. Algumas fontes listam 1889, outras notam que o registro civil pode mostrar data ligeiramente diferente.

DATA DE MORTE: 13 de novembro de 1981. Uma fonte (velhosmestres) dá 14 de novembro. Usando 13 de novembro como consenso majoritário.

NOME DA MÃE: Fontes variam - Maria Eugênia Ferreira, Eugênia Maria de Carvalho ou Raimunda dos Santos. Usando Maria Eugênia Ferreira como mais comum.

NOME DO PAI: José Señor Pastinha ou José Pastiña - origem espanhola confirmada em todas as fontes.

PROFESSOR: Mestre Benedito, africano de Angola. Documentação limitada de sua vida além de ser o professor de Pastinha (c. 1899-1902).

FUNDAÇÃO DO CECA: Pastinha afirma 23 de fevereiro de 1941; registro oficial 1º de outubro de 1952. Paulo Santos Silva tentou reivindicar status de fundador durante o registro.

RELAÇÃO COM ABERRÊ: Fontes conflitam sobre se Aberrê era aluno de Pastinha (1910-1912) ou vice-versa. Ambas versões aparecem em registros históricos.

CERTIDÃO DE ÓBITO: Morreu no Abrigo Dom Pedro II. Hemorragia cerebral (derrame cerebral). Enterrado no mesmo dia no Cemitério do Campo Santo. Carybé pagou despesas do funeral.

RELACIONAMENTOS PENDENTES (requerem importações futuras):
- João Grande student_of Pastinha
- João Pequeno student_of Pastinha
- Curió student_of Pastinha
- Gildo Alfinete student_of Pastinha
- Boca Rica student_of Pastinha
- Albertino student_of Pastinha
- Valdomiro student_of Pastinha
- Gato Preto student_of Pastinha
- Roberto Satanás student_of Pastinha
- Camafeu de Oxossi student_of Pastinha'
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
