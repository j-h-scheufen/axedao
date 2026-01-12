-- ============================================================
-- GENEALOGY PERSON: Baixinho
-- Generated: 2026-01-11
-- ============================================================
-- NOTE: This is Mestre Baixinho (José Eloy de Oliveira) from
-- São Paulo/Taboão da Serra, co-founder of Grupo de Capoeira
-- Angola Irmãos Guerreiros.
--
-- There is ANOTHER Mestre Baixinho associated with Milan, Italy
-- who trained with Mestres Sombra and Brasília - that is a
-- DIFFERENT person. This profile is for the São Paulo Baixinho.
-- ============================================================
-- BIRTH YEAR ESTIMATION (1946, month precision):
-- Portal Capoeira article (2006) states Baixinho celebrated his
-- 60th birthday in July 2006: "Mestre Baixinho, que neste mês
-- completa seu 60º aniversário." 2006 - 60 = 1946.
-- Birth month confirmed as July by the celebration timing.
-- ============================================================
-- DEPENDENCIES:
-- - Mestre Pé de Chumbo (supervisor) - in persons-backlog.md
-- - Grupo Irmãos Guerreiros - in groups-backlog.md
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'José Eloy de Oliveira',
  'Baixinho',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://portalcapoeira.com/capoeira/eventos-agenda/irmaos-guerreiros-mestre-baixinho-comemora-seu-60o-aniversario/', 'https://www.lalaue.com/taboao_da_serra/irmaos-guerreiros-sao-paulo/', 'https://irmaosguerreiros.wixsite.com/saopaulo/sobre']::text[],
  'angola'::genealogy.style,
  E'Mestre Baixinho practices and teaches traditional Capoeira Angola. He migrated from Bahia to São Paulo in the 1970s, bringing capoeira traditions from the cradle of the art to the periphery of Greater São Paulo. For several years, the group he founded received supervision from Mestre Pé-de-Chumbo, one of the first angoleiros to develop Capoeira Angola work in this new phase of the art in São Paulo. This established a lineage connection to the traditional Bahian Angola masters through Pé-de-Chumbo''s training with Mestre João Pequeno de Pastinha.',
  E'Mestre Baixinho pratica e ensina Capoeira Angola tradicional. Ele migrou da Bahia para São Paulo nos anos 70, trazendo as tradições da capoeira do berço da arte para a periferia da Grande São Paulo. Durante alguns anos, o grupo que fundou recebeu a supervisão do Mestre Pé-de-Chumbo, um dos primeiros angoleiros a desenvolver trabalho de Capoeira Angola nesta nova fase da arte em São Paulo. Isso estabeleceu uma conexão de linhagem com os mestres angoleiros tradicionais da Bahia através do treinamento de Pé-de-Chumbo com Mestre João Pequeno de Pastinha.',
  1946,
  'month'::genealogy.date_precision,
  'Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'José Eloy de Oliveira, known as Mestre Baixinho, was born in July 1946 in Bahia, Brazil. In the early 1970s, he migrated from Bahia to São Paulo, settling in Taboão da Serra, a peripheral municipality of Greater São Paulo characterized by limited housing infrastructure and social marginalization. There, he built a house whose garage would later become the legendary "Senzalinha" headquarters of his capoeira group.

Baixinho brought capoeira traditions from Bahia—the acknowledged cradle of the art—to the outskirts of Brazil''s largest metropolis. Along with his brothers Guerreiro and Macete, he transplanted the Bahian capoeira culture to a new environment, creating a cultural oasis in an area where many families lived on the margins of social inclusion.

Baixinho began teaching capoeira to his son Marrom (Ronaldo Alves de Oliveira) in 1978, when the boy was just eight years old. Training took place at the family home, where the garage space served as an informal academy. This father-son transmission exemplifies the traditional oral and familial passing of capoeira knowledge.

In 1983, Baixinho co-founded the Grupo de Capoeira Angola Irmãos Guerreiros (GCAIG) along with his son Marrom (then approximately 13 years old) and his brothers Guerreiro and Macete. The group''s name—"Warrior Brothers"—references the founding brothers and emphasizes the familial bonds and warrior spirit that define the organization. The headquarters, affectionately nicknamed "Senzalinha" (Little Senzala), was established in the garage of Baixinho''s house, which was adapted and decorated to create a conducive environment for capoeira practice and other cultural manifestations.

For several years, the Irmãos Guerreiros received supervision from Mestre Pé-de-Chumbo (Gidalto Pereira Dias), one of the first angoleiros to develop Capoeira Angola work in this new phase of the art in São Paulo. Pé-de-Chumbo, a student of Mestre João Pequeno de Pastinha, helped establish a lineage connection to the traditional Bahian Angola masters, grounding the group''s practice in the Pastinha lineage despite their geographic distance from Salvador.

Baixinho taught capoeira classes in various locations and trained students who would eventually take the group''s activities forward. His teaching extended beyond his son to include Mestre Perna (Márcio Lourenço de Araújo), who began training at age 9 with Baixinho and Marrom and would later bring GCAIG to Europe in 2002.

In July 2006, the group celebrated Mestre Baixinho''s 60th birthday with a three-day event at Senzalinha in Taboão da Serra. The celebration included simultaneous classes with Baixinho and visiting Mestre Bigo (Mestre Francisco), the traditional Friday roda, and the birthday celebration itself—a testament to his standing in the capoeira community.

In 2010, Baixinho was recognized by IPHAN (Brazil''s National Historical and Artistic Heritage Institute) as a qualified candidate for the "Prêmio Viva Meu Mestre" award, which honors capoeira masters aged 55 or older whose life trajectory has contributed fundamentally to the transmission and continuity of capoeira in Brazil. This recognition placed him among 152 qualified masters nationwide, acknowledging his decades of work preserving and disseminating Capoeira Angola.

Today, while Mestre Marrom is "at the forefront of the group''s activities," Mestre Baixinho remains the founding patriarch of GCAIG, with his legacy extending across multiple continents through the núcleos in Portugal, Germany, Austria, Poland, Slovakia, and Norway.',
  E'José Eloy de Oliveira, conhecido como Mestre Baixinho, nasceu em julho de 1946 na Bahia, Brasil. No início dos anos 70, migrou da Bahia para São Paulo, estabelecendo-se em Taboão da Serra, um município periférico da Grande São Paulo caracterizado por infraestrutura habitacional limitada e marginalização social. Lá, construiu uma casa cuja garagem mais tarde se tornaria a lendária sede "Senzalinha" de seu grupo de capoeira.

Baixinho trouxe as tradições da capoeira da Bahia—o berço reconhecido da arte—para os arredores da maior metrópole do Brasil. Junto com seus irmãos Guerreiro e Macete, transplantou a cultura da capoeira baiana para um novo ambiente, criando um oásis cultural em uma área onde muitas famílias viviam às margens da inclusão social.

Baixinho começou a ensinar capoeira para seu filho Marrom (Ronaldo Alves de Oliveira) em 1978, quando o menino tinha apenas oito anos. O treinamento acontecia na casa da família, onde o espaço da garagem servia como uma academia informal. Essa transmissão de pai para filho exemplifica a passagem tradicional oral e familiar do conhecimento da capoeira.

Em 1983, Baixinho co-fundou o Grupo de Capoeira Angola Irmãos Guerreiros (GCAIG) junto com seu filho Marrom (então com aproximadamente 13 anos) e seus irmãos Guerreiro e Macete. O nome do grupo—"Irmãos Guerreiros"—faz referência aos irmãos fundadores e enfatiza os laços familiares e o espírito guerreiro que definem a organização. A sede, carinhosamente apelidada de "Senzalinha", foi estabelecida na garagem da casa de Baixinho, que foi adaptada e decorada para criar um ambiente propício para a prática da capoeira e outras manifestações culturais.

Durante alguns anos, os Irmãos Guerreiros receberam a supervisão do Mestre Pé-de-Chumbo (Gidalto Pereira Dias), um dos primeiros angoleiros a desenvolver trabalho de Capoeira Angola nesta nova fase da arte em São Paulo. Pé-de-Chumbo, aluno de Mestre João Pequeno de Pastinha, ajudou a estabelecer uma conexão de linhagem com os mestres angoleiros tradicionais da Bahia, fundamentando a prática do grupo na linhagem de Pastinha apesar da distância geográfica de Salvador.

Baixinho deu aulas de capoeira em vários locais e treinou alunos que eventualmente levariam as atividades do grupo adiante. Seu ensino se estendeu além de seu filho para incluir Mestre Perna (Márcio Lourenço de Araújo), que começou a treinar aos 9 anos com Baixinho e Marrom e mais tarde levaria o GCAIG para a Europa em 2002.

Em julho de 2006, o grupo celebrou o 60º aniversário de Mestre Baixinho com um evento de três dias na Senzalinha em Taboão da Serra. A celebração incluiu aulas simultâneas com Baixinho e o visitante Mestre Bigo (Mestre Francisco), a roda tradicional de sexta-feira, e a celebração do aniversário em si—um testemunho de sua posição na comunidade da capoeira.

Em 2010, Baixinho foi reconhecido pelo IPHAN (Instituto do Patrimônio Histórico e Artístico Nacional) como candidato habilitado para o "Prêmio Viva Meu Mestre", que homenageia mestres de capoeira com 55 anos ou mais cuja trajetória de vida contribuiu fundamentalmente para a transmissão e continuidade da capoeira no Brasil. Este reconhecimento o colocou entre 152 mestres habilitados em todo o país, reconhecendo suas décadas de trabalho preservando e disseminando a Capoeira Angola.

Hoje, enquanto Mestre Marrom está "à frente das atividades do grupo", Mestre Baixinho permanece como o patriarca fundador do GCAIG, com seu legado se estendendo por múltiplos continentes através dos núcleos em Portugal, Alemanha, Áustria, Polônia, Eslováquia e Noruega.',
  E'- Co-founder of Grupo de Capoeira Angola Irmãos Guerreiros (1983)
- Founding patriarch and principal teacher of GCAIG
- Built Senzalinha headquarters (family home garage converted to cultural space)
- Brought capoeira traditions from Bahia to periphery of São Paulo
- Trained next generation including son Mestre Marrom and Mestre Perna
- Recognized by IPHAN as qualified candidate for Prêmio Viva Meu Mestre (2010)
- 60th birthday celebrated with community event (July 2006)
- Group''s international expansion to 7 countries traces to his founding work',
  E'- Co-fundador do Grupo de Capoeira Angola Irmãos Guerreiros (1983)
- Patriarca fundador e professor principal do GCAIG
- Construiu a sede Senzalinha (garagem da casa familiar convertida em espaço cultural)
- Trouxe tradições da capoeira da Bahia para a periferia de São Paulo
- Treinou a próxima geração incluindo o filho Mestre Marrom e Mestre Perna
- Reconhecido pelo IPHAN como candidato habilitado para o Prêmio Viva Meu Mestre (2010)
- 60º aniversário celebrado com evento comunitário (julho 2006)
- Expansão internacional do grupo para 7 países remonta ao seu trabalho fundador',
  E'NOTE: There is ANOTHER Mestre Baixinho in Italy who trained with Mestres Sombra and Brasília, and founded the first Capoeira academia in Milan. That is a DIFFERENT person.

BIRTH YEAR CONFIRMATION (1946, month precision):
Portal Capoeira article about his 60th birthday celebration in July 2006 states: "Mestre Baixinho, que neste mês completa seu 60º aniversário" (Mestre Baixinho, who this month completes his 60th birthday). 2006 - 60 = 1946, July birth.

FULL NAME CONFIRMATION:
Found in capoeira.jex.com.br article about Maré de Março CD: "Mestre Baixinho (José Eloy de Oliveira - Pai)" paired with "Contramestre Marrom (Ronaldo Alves de Oliveira - filho)".
Also confirmed in IPHAN Prêmio Viva Meu Mestre 2010 list as "José Eloy de Oliveira" (Baixinho) from São Paulo/SP.

IPHAN RECOGNITION (2010):
Listed as #76 among 152 qualified candidates for "Prêmio Viva Meu Mestre – Edição 2010", an award honoring capoeira masters aged 55+ who have contributed fundamentally to the transmission and continuity of capoeira in Brazil.

BAHIAN ORIGIN:
Multiple sources confirm Baixinho migrated from Bahia to São Paulo. The specific city in Bahia is not documented. He is described as part of "uma família baiana recém chegada à São Paulo" (a Bahian family recently arrived in São Paulo).

FAMILY RELATIONSHIPS:
- Son: Mestre Marrom (Ronaldo Alves de Oliveira), born ~1970
- Brothers: Guerreiro and Macete (co-founders of GCAIG)

LINEAGE/SUPERVISION:
Baixinho''s own teachers in Bahia are NOT documented. However, "O Irmãos Guerreiros recebeu, durante alguns anos, a supervisão do Mestre Pé-de-Chumbo, um dos primeiros angoleiros a desenvolver trabalho nesta nova fase da Capoeira de Angola em São Paulo." Pé-de-Chumbo is a student of Mestre João Pequeno de Pastinha, placing GCAIG within Pastinha lineage through this supervisory relationship.

STUDENTS:
- Mestre Marrom (son) - started training 1978 at age 8
- Mestre Perna (Márcio Lourenço de Araújo) - started age 9 with Baixinho & Marrom; titled 2013; European coordinator

SENZALINHA HEADQUARTERS:
Address: Av. Arlindo Genário de Freitas, 692, Taboão da Serra/SP
The house was built by Baixinho''s family in the 1970s; garage adapted as capoeira space.
Traditional roda: Fridays

GROUP COLORS: Brown (earth/nourishment) and White (peace)

60TH BIRTHDAY CELEBRATION (July 2006):
Three-day event in Taboão da Serra:
- Thursday July 13: Simultaneous class with Baixinho and Mestre Bigo
- Friday July 14: Traditional roda at Senzalinha
- Saturday July 15: Simultaneous class, roda, and 60th birthday celebration
Guest of honor: Mestre Bigo (Mestre Francisco 45)

TITLE DOCUMENTATION:
Referred to as "Mestre Baixinho" in all sources from 2005 onwards. The date and circumstances of his receiving the mestre title are not documented.',
  E'NOTA: Existe OUTRO Mestre Baixinho na Itália que treinou com Mestres Sombra e Brasília, e fundou a primeira academia de Capoeira em Milão. Essa é uma pessoa DIFERENTE.

CONFIRMAÇÃO ANO DE NASCIMENTO (1946, precisão de mês):
Artigo do Portal Capoeira sobre sua celebração de 60º aniversário em julho de 2006 afirma: "Mestre Baixinho, que neste mês completa seu 60º aniversário". 2006 - 60 = 1946, nascimento em julho.

CONFIRMAÇÃO DO NOME COMPLETO:
Encontrado no artigo capoeira.jex.com.br sobre CD Maré de Março: "Mestre Baixinho (José Eloy de Oliveira - Pai)" pareado com "Contramestre Marrom (Ronaldo Alves de Oliveira - filho)".
Também confirmado na lista do IPHAN Prêmio Viva Meu Mestre 2010 como "José Eloy de Oliveira" (Baixinho) de São Paulo/SP.

RECONHECIMENTO IPHAN (2010):
Listado como #76 entre 152 candidatos habilitados para o "Prêmio Viva Meu Mestre – Edição 2010", um prêmio que homenageia mestres de capoeira com 55+ anos que contribuíram fundamentalmente para a transmissão e continuidade da capoeira no Brasil.

ORIGEM BAIANA:
Múltiplas fontes confirmam que Baixinho migrou da Bahia para São Paulo. A cidade específica na Bahia não está documentada. Ele é descrito como parte de "uma família baiana recém chegada à São Paulo".

RELAÇÕES FAMILIARES:
- Filho: Mestre Marrom (Ronaldo Alves de Oliveira), nascido ~1970
- Irmãos: Guerreiro e Macete (co-fundadores do GCAIG)

LINHAGEM/SUPERVISÃO:
Os próprios mestres de Baixinho na Bahia NÃO estão documentados. Porém, "O Irmãos Guerreiros recebeu, durante alguns anos, a supervisão do Mestre Pé-de-Chumbo, um dos primeiros angoleiros a desenvolver trabalho nesta nova fase da Capoeira de Angola em São Paulo." Pé-de-Chumbo é aluno de Mestre João Pequeno de Pastinha, colocando o GCAIG dentro da linhagem de Pastinha através desta relação de supervisão.

ALUNOS:
- Mestre Marrom (filho) - começou a treinar em 1978 aos 8 anos
- Mestre Perna (Márcio Lourenço de Araújo) - começou aos 9 anos com Baixinho & Marrom; titulado 2013; coordenador europeu

SEDE SENZALINHA:
Endereço: Av. Arlindo Genário de Freitas, 692, Taboão da Serra/SP
A casa foi construída pela família de Baixinho nos anos 70; garagem adaptada como espaço de capoeira.
Roda tradicional: Sextas-feiras

CORES DO GRUPO: Marrom (terra/nutrição) e Branco (paz)

CELEBRAÇÃO 60º ANIVERSÁRIO (Julho 2006):
Evento de três dias em Taboão da Serra:
- Quinta 13 de julho: Aula simultânea com Baixinho e Mestre Bigo
- Sexta 14 de julho: Roda tradicional na Senzalinha
- Sábado 15 de julho: Aula simultânea, roda e celebração do 60º aniversário
Convidado de honra: Mestre Bigo (Mestre Francisco 45)

DOCUMENTAÇÃO DO TÍTULO:
Referido como "Mestre Baixinho" em todas as fontes de 2005 em diante. A data e circunstâncias de receber o título de mestre não estão documentadas.'
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
