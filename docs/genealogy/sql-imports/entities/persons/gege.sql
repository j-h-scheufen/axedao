-- ============================================================
-- GENEALOGY PERSON: Gegê
-- Generated: 2025-12-30
-- ============================================================
-- Mestre Gegê is a prominent capoeira composer, historian, and
-- instrumentalist from Maragojipe, Bahia. He moved to Rio de Janeiro
-- in 1965 and became one of the pioneers of capoeira in Duque de
-- Caxias alongside Mestre Barbosa. Founder of Grupo Maragojipe de
-- Capoeira, he is recognized as one of the hundred principal masters
-- of capoeira in the world and one of the "mestres imprescindíveis"
-- of Caxias who contributed to the Museu Vivo da Capoeira.
-- ============================================================
--
-- BIRTH DATE: April 9, 1948 (primary) or 1949 (alternative)
-- BIRTH PLACE: Maragojipe, Bahia, Brazil
--
-- NAME DISCREPANCY (UNRESOLVED):
-- Two official sources give different full names for "Mestre Gegê" in Rio:
-- 1. Conselho de Mestres de Capoeira do Estado do Rio de Janeiro (2015):
--    "Geraldo Costa Filho - Mestre Gegê" (Mestre Suplente, Região Metropolitana)
-- 2. IPHAN Prêmio Viva Meu Mestre 2010:
--    "Alexandre dos Santos Marques - Mestre Gege" (Duque de Caxias/RJ)
--
-- Detailed biographical sources (aldeiacapoeira.com, capoeirahistory.com)
-- consistently use "Geraldo Costa Filho" born April 9, 1948 in Maragojipe.
--
-- POSSIBLE EXPLANATIONS:
-- a) Same person with name change/variation between 2010-2015
-- b) Two different mestres named Gegê in Rio metro area (unlikely)
-- c) One source has registration error
--
-- Using "Geraldo Costa Filho" as it appears in:
-- - Conselho de Mestres official document (2015)
-- - Multiple detailed biographical sources
-- Cannot definitively resolve without direct verification.
--
-- TEACHERS (Training timeline):
-- - Mestre Sete (Bahia, childhood) - first exposure via Afro-Brazilian culture
--   NOTE: Mestre Sete learned from Onça Preta and Cobrinha Verde (Rafael)
-- - Mestre Waldemar (Salvador) - learned berimbau fabrication
-- - Mestre Fernandinho (Rio de Janeiro, 1965+) - student of Caiçara
-- - Mestre Zé Pedro (Bonsucesso, Rio) - affiliated with Guaiamuns Nagôs
--
-- LINEAGE (via Sete):
-- Onça Preta / Cobrinha Verde → Mestre Sete → Mestre Gegê
--
-- GROUPS:
-- - Founded Grupo Maragojipe de Capoeira (own group)
-- - Affiliated with Guaiamuns Nagôs of Mestre Zé Pedro (Bonsucesso)
--
-- KEY RECORDINGS:
-- - Muzenza first LP (1988) - organized by Mestre Burguês
-- - CD with Mestre Paulão (Grupo Muzenza founder)
-- - Song "Adeus Bonsucesso" celebrating North Zone Rio capoeira
--
-- EDUCATION:
-- University degree in History from Rio de Janeiro
--
-- PRÊMIO VIVA MEU MESTRE (2010):
-- Listed as habilitado (qualified) by IPHAN
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Geraldo Costa Filho',
  'Gegê',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'http://www.aldeiacapoeira.com/mestregege.html',
    'https://capoeirahistory.com/general/the-cockerel-has-crowed-the-history-of-capoeira-in-rio-de-janeiro-in-verse-and-song/'
  ]::text[],
  'angola'::genealogy.style,
  E'Gegê''s capoeira blends multiple influences: his Bahian foundation through Mestre Sete (who trained under Onça Preta and Cobrinha Verde), his berimbau craftsmanship learned from Mestre Waldemar, and his Rio de Janeiro training under Mestre Fernandinho (a student of Mestre Caiçara known for acrobatic play) and later affiliation with Mestre Zé Pedro''s Guaiamuns Nagôs group. Beyond physical technique, he is renowned as a musical historian who composes songs documenting capoeira''s past. His singing style is described as "unique" and his voice as "contagious and hypnotic," with songs that preserve collective memory of fundamental moments in Rio de Janeiro capoeira history.',
  E'A capoeira de Gegê mescla múltiplas influências: sua base baiana através de Mestre Sete (que treinou com Onça Preta e Cobrinha Verde), seu artesanato de berimbau aprendido com Mestre Waldemar, e seu treinamento no Rio de Janeiro com Mestre Fernandinho (aluno de Mestre Caiçara conhecido pelo jogo acrobático) e posterior filiação ao grupo Guaiamuns Nagôs de Mestre Zé Pedro. Além da técnica física, é renomado como historiador musical que compõe canções documentando o passado da capoeira. Seu estilo de canto é descrito como "único" e sua voz como "contagiante e hipnótica," com canções que preservam a memória coletiva de momentos fundamentais na história da capoeira carioca.',
  1948,
  'year'::genealogy.date_precision,
  'Maragojipe, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Geraldo Costa Filho, known as Mestre Gegê, was born on April 9, 1948, in Maragojipe, a city in the Recôncavo Baiano region of Bahia. His first experience with capoeira and Afro-Brazilian culture came through Mestre Sete, who had learned capoeira from two legendary figures: Mestre Onça Preta and Mestre Rafael (Cobrinha Verde). This placed Gegê in a distinguished lineage connecting him to the pre-persecution era of Bahian capoeira.

In Salvador, Gegê encountered Mestre Waldemar da Liberdade, the legendary craftsman who invented the practice of painting and decorating berimbaus. Under Waldemar, Gegê learned not just capoeira but the art of fabricating the painted berimbaus that Waldemar had made famous throughout Bahia.

In 1965, at around seventeen years of age, Gegê moved to Rio de Janeiro. He began training capoeira in Duque de Caxias shortly after his arrival. His teacher in Rio was Mestre Fernandinho (Fernando Olímpio Paes Filho, 1948-2001), a student of the formidable Mestre Caiçara who was famous for his solid game and acrobatic skills, particularly his high-speed relógio. When Fernandinho departed Rio de Janeiro to tour Europe with a Brazilian folklore show, Gegê affiliated with the group Guaiamuns Nagôs led by Mestre Zé Pedro, who held his famous roda in Bonsucesso in the North Zone.

Together with Mestre Barbosa (José Barbosa da Silva), Gegê is considered one of the pioneers of capoeira in Duque de Caxias. While Barbosa focused on organizing and formalizing academy-based capoeira, Gegê pursued a different path—he created his own group, Grupo Maragojipe de Capoeira, named after his birthplace, and traveled extensively in the capoeira world, becoming known to mestres across Brazil and internationally.

Gegê''s most enduring contribution has been his role as capoeira''s musical chronicler. He has written many songs in a unique singing style, using them to tell stories about capoeira''s past and spread its history and traditions. His song "Adeus Bonsucesso" celebrates the North Zone of Rio de Janeiro and particularly the Bonsucesso neighborhood where Zé Pedro''s famous roda took place. As the Contemporary Capoeira project noted, the song "managed to crystallize something of his individual memory, and also of the collective memory of this rich moment that was fundamental for the development of contemporary capoeira in Rio de Janeiro."

His song was recorded on Muzenza''s first LP in 1988, issued by Ariola and organized by Mestre Burguês. Many of his compositions appear on subsequent Muzenza LPs and CDs, and he collaborated on a CD with Mestre Paulão, the founder of Grupo Muzenza.

Seeking to deepen his understanding of the art, Gegê pursued formal education and obtained a university degree in History from an institution in Rio de Janeiro. This academic training reinforced his role as a researcher and authority on capoeira''s historical development.

When speaking of capoeira in Caxias, Gegê is named as one of the "mestres imprescindíveis" (indispensable masters) alongside Mestre Raimundo and Mestre Levi. These three traditions, originating from the pioneer era, have built remarkable cultural initiatives including the Museu Vivo da Capoeira (Living Museum of Capoeira), based mainly in the second and third districts of Duque de Caxias.

Mestre Gegê has traveled the world teaching and performing capoeira, visiting countries including Portugal, England, and Australia, where he met with the Minister of Culture. He is recognized as one of the hundred principal masters of capoeira in the world, and is considered one of the most respected researchers in the art—a historian, instrumentalist, and composer who bridges the traditional Bahian heritage with the contemporary development of capoeira in Rio de Janeiro.

In 2010, he was listed among the habilitados (qualified candidates) for IPHAN''s "Prêmio Viva Meu Mestre" award, which honors capoeira masters aged 55 or older whose life trajectory has fundamentally contributed to the transmission and continuity of capoeira in Brazil.',
  E'Geraldo Costa Filho, conhecido como Mestre Gegê, nasceu em 9 de abril de 1948 em Maragojipe, cidade da região do Recôncavo Baiano. Sua primeira experiência com capoeira e cultura afro-brasileira veio através de Mestre Sete, que havia aprendido capoeira com duas figuras lendárias: Mestre Onça Preta e Mestre Rafael (Cobrinha Verde). Isso colocou Gegê em uma linhagem distinta conectando-o à era pré-perseguição da capoeira baiana.

Em Salvador, Gegê conheceu Mestre Waldemar da Liberdade, o lendário artesão que inventou a prática de pintar e decorar berimbaus. Com Waldemar, Gegê aprendeu não apenas capoeira mas a arte de fabricar os berimbaus pintados que Waldemar havia tornado famosos em toda a Bahia.

Em 1965, com cerca de dezessete anos, Gegê mudou-se para o Rio de Janeiro. Começou a treinar capoeira em Duque de Caxias logo após sua chegada. Seu professor no Rio foi Mestre Fernandinho (Fernando Olímpio Paes Filho, 1948-2001), aluno do formidável Mestre Caiçara, famoso por seu jogo sólido e habilidades acrobáticas, particularmente seu relógio em alta velocidade. Quando Fernandinho deixou o Rio de Janeiro para excursionar pela Europa com um show de folclore brasileiro, Gegê se afiliou ao grupo Guaiamuns Nagôs liderado por Mestre Zé Pedro, que realizava sua famosa roda em Bonsucesso na Zona Norte.

Junto com Mestre Barbosa (José Barbosa da Silva), Gegê é considerado um dos pioneiros da capoeira em Duque de Caxias. Enquanto Barbosa focava em organizar e formalizar a capoeira baseada em academias, Gegê seguiu um caminho diferente—criou seu próprio grupo, Grupo Maragojipe de Capoeira, nomeado em homenagem ao seu local de nascimento, e viajou extensivamente pelo mundo da capoeira, tornando-se conhecido por mestres em todo o Brasil e internacionalmente.

A contribuição mais duradoura de Gegê tem sido seu papel como cronista musical da capoeira. Ele escreveu muitas canções em um estilo de canto único, usando-as para contar histórias sobre o passado da capoeira e difundir sua história e tradições. Sua canção "Adeus Bonsucesso" celebra a Zona Norte do Rio de Janeiro e particularmente o bairro de Bonsucesso onde acontecia a famosa roda de Zé Pedro. Como o projeto Contemporary Capoeira observou, a canção "conseguiu cristalizar algo de sua memória individual, e também da memória coletiva deste momento rico que foi fundamental para o desenvolvimento da capoeira contemporânea no Rio de Janeiro."

Sua canção foi gravada no primeiro LP da Muzenza em 1988, lançado pela Ariola e organizado por Mestre Burguês. Muitas de suas composições aparecem em LPs e CDs subsequentes da Muzenza, e ele colaborou em um CD com Mestre Paulão, o fundador do Grupo Muzenza.

Buscando aprofundar sua compreensão da arte, Gegê cursou educação formal e obteve diploma universitário em História por uma instituição no Rio de Janeiro. Esta formação acadêmica reforçou seu papel como pesquisador e autoridade sobre o desenvolvimento histórico da capoeira.

Quando se fala de capoeira em Caxias, Gegê é nomeado como um dos "mestres imprescindíveis" ao lado de Mestre Raimundo e Mestre Levi. Essas três tradições, originadas da era pioneira, construíram iniciativas culturais notáveis incluindo o Museu Vivo da Capoeira, baseado principalmente no segundo e terceiro distritos de Duque de Caxias.

Mestre Gegê viajou o mundo ensinando e apresentando capoeira, visitando países incluindo Portugal, Inglaterra e Austrália, onde se encontrou com o Ministro da Cultura. É reconhecido como um dos cem principais mestres de capoeira do mundo, e é considerado um dos pesquisadores mais conceituados na arte—um historiador, instrumentista e compositor que faz a ponte entre a herança tradicional baiana e o desenvolvimento contemporâneo da capoeira no Rio de Janeiro.

Em 2010, foi listado entre os habilitados para o "Prêmio Viva Meu Mestre" do IPHAN, que homenageia mestres de capoeira com 55 anos ou mais cuja trajetória de vida contribuiu fundamentalmente para a transmissão e continuidade da capoeira no Brasil.',
  E'- Founded Grupo Maragojipe de Capoeira
- Pioneer of capoeira in Duque de Caxias (alongside Mestre Barbosa)
- Recognized as one of the hundred principal capoeira masters in the world
- One of the "mestres imprescindíveis" of Caxias (with Raimundo and Levi)
- Contributed to Museu Vivo da Capoeira (Duque de Caxias)
- Composed song "Adeus Bonsucesso" documenting North Zone Rio capoeira history
- Songs recorded on Muzenza LPs from 1988 onwards (first LP organized by Mestre Burguês)
- CD collaboration with Mestre Paulão (founder of Grupo Muzenza)
- University degree in History (Rio de Janeiro)
- IPHAN "Prêmio Viva Meu Mestre" 2010 - habilitado (qualified)
- International teaching in Portugal, England, Australia',
  E'- Fundou Grupo Maragojipe de Capoeira
- Pioneiro da capoeira em Duque de Caxias (ao lado de Mestre Barbosa)
- Reconhecido como um dos cem principais mestres de capoeira do mundo
- Um dos "mestres imprescindíveis" de Caxias (com Raimundo e Levi)
- Contribuiu para o Museu Vivo da Capoeira (Duque de Caxias)
- Compôs a canção "Adeus Bonsucesso" documentando a história da capoeira na Zona Norte do Rio
- Canções gravadas em LPs da Muzenza desde 1988 (primeiro LP organizado por Mestre Burguês)
- CD em colaboração com Mestre Paulão (fundador do Grupo Muzenza)
- Diploma universitário em História (Rio de Janeiro)
- IPHAN "Prêmio Viva Meu Mestre" 2010 - habilitado
- Ensino internacional em Portugal, Inglaterra, Austrália',
  E'BIRTH DATE DISCREPANCY (1948, year precision):
- aldeiacapoeira.com: April 9, 1948
- Some other sources: April 9, 1949
Using 1948 as primary date from most detailed source.

NAME DISCREPANCY (UNRESOLVED):
Two official sources give different full names for "Mestre Gegê" in Rio:
1. Conselho de Mestres de Capoeira do Estado do Rio de Janeiro (2015):
   "Geraldo Costa Filho - Mestre Gegê" (Mestre Suplente, Região Metropolitana)
2. IPHAN Prêmio Viva Meu Mestre 2010:
   "Alexandre dos Santos Marques - Mestre Gege" (Duque de Caxias/RJ)

Detailed biographical sources (aldeiacapoeira.com, capoeirahistory.com)
consistently use "Geraldo Costa Filho" born April 9, 1948 in Maragojipe.

POSSIBLE EXPLANATIONS:
a) Same person with name change/variation between 2010-2015
b) Two different mestres named Gegê in Rio metro area (unlikely given unique apelido)
c) One source has registration error

Using "Geraldo Costa Filho" as it appears in Conselho de Mestres official
document (2015) and multiple detailed biographical sources.
Cannot definitively resolve without direct verification (interview, ID documents).

TEACHERS (chronological):
- Mestre Sete (Bahia, childhood): First exposure to capoeira; Sete trained under Onça Preta and Cobrinha Verde
- Mestre Waldemar (Salvador): Learned berimbau fabrication and painting
- Mestre Fernandinho (Rio de Janeiro, 1965+): Student of Mestre Caiçara; famous for acrobatics; left Rio to tour Europe
- Mestre Zé Pedro (Bonsucesso, Rio): Affiliated with Guaiamuns Nagôs group after Fernandinho departed

MEDIA APPEARANCES:
- 1988: Muzenza first LP (Ariola, organized by Mestre Burguês) - song recorded
- Ongoing: Multiple Muzenza LPs and CDs
- CD: Collaboration with Mestre Paulão (Grupo Muzenza founder)

RELATIONSHIP TO CAXIAS PIONEERS:
Gegê is distinct from but contemporary with:
- Mestre Barbosa (Duque de Caxias) - co-pioneer of Caxias capoeira
- Mestre Josias da Silva - pioneer of Baixada Fluminense academies
- Mestre Raimundo (Caxias) - fellow "mestre imprescindível"
- Mestre Levi - fellow "mestre imprescindível"

CULTURAL INITIATIVES:
- Museu Vivo da Capoeira - based in 2nd and 3rd districts of Duque de Caxias
- Contributed alongside Raimundo and Levi

INTERNATIONAL TRAVEL:
- Portugal, England, Australia confirmed
- Met with Minister of Culture in Australia

SOURCES:
- aldeiacapoeira.com/mestregege.html (primary biographical)
- capoeirahistory.com/general/the-cockerel-has-crowed-the-history-of-capoeira-in-rio-de-janeiro-in-verse-and-song/
- portalcapoeira.com (IPHAN 2010 list)
- soundcloud.com (Grupo Maragogipe de Capoeira playlist)',
  E'DISCREPÂNCIA DE DATA DE NASCIMENTO (1948, precisão de ano):
- aldeiacapoeira.com: 9 de abril de 1948
- Algumas outras fontes: 9 de abril de 1949
Usando 1948 como data principal da fonte mais detalhada.

DISCREPÂNCIA DE NOME (NÃO RESOLVIDA):
Duas fontes oficiais fornecem nomes completos diferentes para "Mestre Gegê" no Rio:
1. Conselho de Mestres de Capoeira do Estado do Rio de Janeiro (2015):
   "Geraldo Costa Filho - Mestre Gegê" (Mestre Suplente, Região Metropolitana)
2. IPHAN Prêmio Viva Meu Mestre 2010:
   "Alexandre dos Santos Marques - Mestre Gege" (Duque de Caxias/RJ)

Fontes biográficas detalhadas (aldeiacapoeira.com, capoeirahistory.com)
usam consistentemente "Geraldo Costa Filho" nascido em 9 de abril de 1948 em Maragojipe.

EXPLICAÇÕES POSSÍVEIS:
a) Mesma pessoa com mudança/variação de nome entre 2010-2015
b) Dois mestres diferentes chamados Gegê na região do Rio (improvável dado o apelido único)
c) Uma das fontes tem erro de registro

Usando "Geraldo Costa Filho" conforme aparece no documento oficial do Conselho
de Mestres (2015) e em múltiplas fontes biográficas detalhadas.
Não é possível resolver definitivamente sem verificação direta (entrevista, documentos de identidade).

MESTRES (cronológico):
- Mestre Sete (Bahia, infância): Primeira exposição à capoeira; Sete treinou com Onça Preta e Cobrinha Verde
- Mestre Waldemar (Salvador): Aprendeu fabricação e pintura de berimbau
- Mestre Fernandinho (Rio de Janeiro, 1965+): Aluno de Mestre Caiçara; famoso por acrobacias; saiu do Rio para excursionar pela Europa
- Mestre Zé Pedro (Bonsucesso, Rio): Afiliou-se ao grupo Guaiamuns Nagôs após partida de Fernandinho

APARIÇÕES NA MÍDIA:
- 1988: Primeiro LP da Muzenza (Ariola, organizado por Mestre Burguês) - canção gravada
- Contínuo: Múltiplos LPs e CDs da Muzenza
- CD: Colaboração com Mestre Paulão (fundador do Grupo Muzenza)

RELAÇÃO COM PIONEIROS DE CAXIAS:
Gegê é distinto mas contemporâneo de:
- Mestre Barbosa (Duque de Caxias) - co-pioneiro da capoeira de Caxias
- Mestre Josias da Silva - pioneiro das academias da Baixada Fluminense
- Mestre Raimundo (Caxias) - companheiro "mestre imprescindível"
- Mestre Levi - companheiro "mestre imprescindível"

INICIATIVAS CULTURAIS:
- Museu Vivo da Capoeira - baseado no 2º e 3º distritos de Duque de Caxias
- Contribuiu ao lado de Raimundo e Levi

VIAGENS INTERNACIONAIS:
- Portugal, Inglaterra, Austrália confirmados
- Encontrou-se com Ministro da Cultura na Austrália

FONTES:
- aldeiacapoeira.com/mestregege.html (biográfico principal)
- capoeirahistory.com/general/the-cockerel-has-crowed-the-history-of-capoeira-in-rio-de-janeiro-in-verse-and-song/
- portalcapoeira.com (lista IPHAN 2010)
- soundcloud.com (playlist Grupo Maragogipe de Capoeira)'
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
