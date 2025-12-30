-- ============================================================
-- GENEALOGY PERSON: Gigante
-- Generated: 2025-12-29
-- ============================================================
-- BIRTH YEAR: October 4, 1920 (Santo Amaro) - velhosmestres.com
-- confirms exact date. Obituary 2016 says "95 anos" (1920).
-- One secondary source says 1922, but majority confirm 1920.
-- DEATH YEAR: May 30, 2016 - confirmed by multiple obituaries.
-- Died at Hospital Teresa de Lisieux, buried at Cemitério Campo Santo.
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
  'Francisco de Assis',
  'Gigante',
  'mestre'::genealogy.title,
  NULL, -- No public domain portrait available
  ARRAY['https://velhosmestres.com/en/featured-7', 'https://velhosmestres.com/br/destaques-7']::text[],
  -- Capoeira-specific
  'mixed'::genealogy.style,
  E'Trained in both Angola and Regional traditions. Started with Cobrinha Verde (Angola), continued under Pastinha (Angola), then "changed parties" to Mestre Bimba''s Regional academy. Known in Angola rodas as "Bigodinho", in Regional rodas as "Gigante", and by older practitioners as "Pequenininho." Considered by Bimba to be "the best berimbau player in Bahia." Created the berimbau rhythm "Cinco Salomão" for low, ground-level play (jogo miudinho).',
  E'Treinado nas tradições Angola e Regional. Iniciou com Cobrinha Verde (Angola), continuou sob Pastinha (Angola), depois "mudou de partido" para a academia Regional de Mestre Bimba. Conhecido nas rodas de Angola como "Bigodinho", nas rodas de Regional como "Gigante", e pelos mais velhos como "Pequenininho." Considerado por Bimba "o melhor tocador de berimbau da Bahia." Criou o toque de berimbau "Cinco Salomão" para jogo baixo, no chão (jogo miudinho).',
  -- Life dates
  1920,
  'exact'::genealogy.date_precision,
  'Santo Amaro, Bahia, Brazil',
  2016,
  'exact'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- bio_en
  E'Francisco de Assis, known as Mestre Gigante, was born on October 4, 1920, in Santo Amaro, Bahia—the same town that produced Besouro Mangangá, Cobrinha Verde, and generations of legendary capoeiristas. He lived for 95 years, becoming at the time of his death the oldest living capoeirista in the world.

He began learning capoeira in a backyard at Jardim Suspenso da Barra in Salvador, under Mestre Cobrinha Verde—the legendary figure who had learned from Besouro himself. Later, Gigante became a student of Mestre Pastinha at the Centro Esportivo de Capoeira Angola. Then, in a move that showed the fluidity of the early capoeira world, he "changed parties" and went to train at Mestre Bimba''s Regional academy. This cross-lineage experience gave him unique insight into both traditions.

Gigante was closely associated with Menino Gordo da Curva Grande—so closely that sources note they "looked very similar" and were often confused with each other. They were "parceiros" (partners/companions) in the Salvador capoeira scene.

He began his teaching career at the Seminário Central and later founded his own academy, "Academia Capoeira São Gonçalo", headquartered at Rua Rodrigues Ferreira 226 in the Federação neighborhood of Salvador.

Mestre Bimba himself considered Gigante "the best berimbau player in Bahia"—high praise from the founder of Regional. His musical mastery led to the creation of a distinctive berimbau rhythm called "Cinco Salomão", which he described as being for "jogo miudinho, embaixo, jogo miudinho no chão, só embaixo" (the small game, low, the small game on the ground, only low). According to Waldeloir Rego''s 1968 research, the Cinco Salomão rhythm was "performed when there is a crime among capoeiristas, so that the criminal can escape." The name derives from "Signo Salomão" (Solomon''s Seal/Star), the five-pointed star used in protective amulets.

In June 1980, Gigante participated in researcher Frede Abreu''s landmark "First Regional Capoeira Seminar and Festival of Capoeira Rhythms", held June 4-8 in Barris, Salvador. This event, attended by some 1,500 people, reunited the old guard of Capoeira Angola—Mestre Cobrinha Verde (who was "rediscovered" at this event), Mestre João Grande, Mestre Curió, Mestre Eziquiel, and others. It was a pivotal moment for the revival of traditional capoeira.

Throughout the 1940s and beyond, Gigante conviveu (lived alongside) with the famous capoeiristas of that era: Aberrê, Noronha, Barbosa, Traíra, Najé, and many others. He was a regular presence at the Sunday rodas at Lar das Pombas and at the Jardim Baiano in Barra.

In the 1950s, Gigante appears in photographs by the legendary photographers Pierre Verger and Marcel Gautherot—visual documentation of Salvador''s capoeira scene during its golden age. In 1964, he also appears in photographs together with Mestre Pastinha. In 1968, he participated in the film "Dança de Guerra" (War Dance), playing berimbau, and was also noted to have participated in the film "Os Cangaceiros."

Besides being an exceptional musician, Gigante was renowned as a skilled storyteller and seresteiro (serenade singer) who "doesn''t reject a good guitar to sing and recall the adventures of the past." In 2007, he recorded the CD "O Canto do Berimbauman" (The Song of the Berimbau Man), a project by researcher and writer Frede Abreu (who died in 2013). According to Frede himself, the disc presented the "perfection of Gigante''s berimbau playing."

Francisco de Assis, Mestre Gigante, died on May 30, 2016, at Hospital Teresa de Lisieux in Salvador after losing a battle with a respiratory infection. He was 95 years old. Despite being one of the most important names in capoeira—an art that in 2014 received the title of UNESCO Intangible Cultural Heritage of Humanity—Gigante died in poverty. The capoeira community and family members had to pool money to pay for his funeral. His body was buried at Cemitério Campo Santo in Salvador. His fate echoed that of other great masters like Bimba, Pastinha, Waldemar, and Cobrinha Verde—legendary figures who ended their lives without proper governmental recognition or support.',
  -- bio_pt
  E'Francisco de Assis, conhecido como Mestre Gigante, nasceu em 4 de outubro de 1920, em Santo Amaro, Bahia—a mesma cidade que produziu Besouro Mangangá, Cobrinha Verde e gerações de lendários capoeiristas. Viveu 95 anos, tornando-se no momento de sua morte o capoeirista vivo mais velho do mundo.

Começou a aprender capoeira em um quintal no Jardim Suspenso da Barra em Salvador, sob Mestre Cobrinha Verde—a figura lendária que tinha aprendido com o próprio Besouro. Depois, Gigante tornou-se aluno de Mestre Pastinha no Centro Esportivo de Capoeira Angola. Então, em um movimento que mostrava a fluidez do mundo da capoeira antiga, ele "mudou de partido" e foi treinar na academia Regional de Mestre Bimba. Essa experiência entre linhagens deu-lhe uma visão única de ambas as tradições.

Gigante era intimamente associado com Menino Gordo da Curva Grande—tão intimamente que fontes notam que eles "eram muito parecidos" e eram frequentemente confundidos um com o outro. Eram "parceiros" na cena da capoeira de Salvador.

Iniciou sua carreira de ensino no Seminário Central e mais tarde fundou sua própria academia, "Academia Capoeira São Gonçalo", com sede na Rua Rodrigues Ferreira 226 no bairro da Federação em Salvador.

O próprio Mestre Bimba considerava Gigante "o melhor tocador de berimbau da Bahia"—alto elogio vindo do fundador da Regional. Sua maestria musical levou à criação de um toque de berimbau distintivo chamado "Cinco Salomão", que ele descrevia como sendo para "jogo miudinho, embaixo, jogo miudinho no chão, só embaixo." Segundo a pesquisa de Waldeloir Rego de 1968, o toque Cinco Salomão era "executado quando há um crime entre capoeiristas, para que o criminoso possa escapar." O nome deriva de "Signo Salomão" (Selo/Estrela de Salomão), a estrela de cinco pontas usada em amuletos de proteção.

Em junho de 1980, Gigante participou do histórico "Primeiro Seminário Regional de Capoeira e Festival de Ritmos da Capoeira" do pesquisador Frede Abreu, realizado de 4 a 8 de junho em Barris, Salvador. Este evento, com cerca de 1.500 pessoas, reuniu a velha guarda da Capoeira Angola—Mestre Cobrinha Verde (que foi "redescoberto" neste evento), Mestre João Grande, Mestre Curió, Mestre Eziquiel e outros. Foi um momento crucial para o renascimento da capoeira tradicional.

Ao longo dos anos 1940 e além, Gigante conviveu com os famosos capoeiristas daquela era: Aberrê, Noronha, Barbosa, Traíra, Najé e muitos outros. Era presença regular nas rodas de domingo no Lar das Pombas e no Jardim Baiano na Barra.

Nos anos 1950, Gigante aparece em fotografias dos lendários fotógrafos Pierre Verger e Marcel Gautherot—documentação visual da cena da capoeira de Salvador durante sua era dourada. Em 1964, também aparece em fotografias junto com Mestre Pastinha. Em 1968, participou do filme "Dança de Guerra", tocando berimbau, e também foi notado ter participado do filme "Os Cangaceiros."

Além de ser um músico excepcional, Gigante era renomado como um hábil contador de histórias e seresteiro que "não rejeita um bom violão para cantar e recordar as aventuras do passado." Em 2007, gravou o CD "O Canto do Berimbauman" (O Canto do Homem do Berimbau), um projeto do pesquisador e escritor Frede Abreu (que morreu em 2013). Segundo o próprio Frede, o disco apresentava a "perfeição do toque do berimbau de Gigante."

Francisco de Assis, Mestre Gigante, morreu em 30 de maio de 2016, no Hospital Teresa de Lisieux em Salvador após perder uma batalha contra uma infecção respiratória. Tinha 95 anos. Apesar de ser um dos nomes mais importantes da capoeira—uma arte que em 2014 recebeu o título de Patrimônio Cultural Imaterial da Humanidade pela UNESCO—Gigante morreu na pobreza. A comunidade da capoeira e familiares tiveram que juntar dinheiro para pagar seu funeral. Seu corpo foi enterrado no Cemitério Campo Santo em Salvador. Seu destino ecoou o de outros grandes mestres como Bimba, Pastinha, Waldemar e Cobrinha Verde—figuras lendárias que terminaram suas vidas sem o devido reconhecimento ou apoio governamental.',
  -- achievements_en
  'Created the berimbau rhythm "Cinco Salomão" for low, ground-level play; considered by Mestre Bimba to be "the best berimbau player in Bahia"; founded Academia Capoeira São Gonçalo in Federação, Salvador; participated in 1980 First Regional Capoeira Seminar; appeared in photographs by Pierre Verger and Marcel Gautherot (1950s); participated in films "Dança de Guerra" (1968) and "Os Cangaceiros"; recorded CD "O Canto do Berimbauman" (2007); oldest living capoeirista at time of death (95 years)',
  -- achievements_pt
  'Criou o toque de berimbau "Cinco Salomão" para jogo baixo no chão; considerado por Mestre Bimba "o melhor tocador de berimbau da Bahia"; fundou Academia Capoeira São Gonçalo na Federação, Salvador; participou do Primeiro Seminário Regional de Capoeira de 1980; apareceu em fotografias de Pierre Verger e Marcel Gautherot (anos 1950); participou dos filmes "Dança de Guerra" (1968) e "Os Cangaceiros"; gravou CD "O Canto do Berimbauman" (2007); capoeirista vivo mais velho no momento de sua morte (95 anos)',
  -- notes_en
  E'BIRTH DATE: October 4, 1920 (exact) - velhosmestres.com confirms exact date. Birth place is Santo Amaro, Bahia. One secondary source (negrosdesinha) gives 1922, but obituaries saying "95 anos" in 2016 confirm 1920.

DEATH DATE: May 30, 2016 (exact) - confirmed by multiple obituaries. Died at Hospital Teresa de Lisieux, Salvador, from respiratory infection. Buried at Cemitério Campo Santo.

APELIDO VARIATIONS:
- "Gigante" - used in Regional rodas
- "Bigodinho" - used in Angola rodas (DISTINCT from Reinaldo Santana/Bigodinho who trained under Waldemar)
- "Pequenininho" - used by older capoeiristas

TEACHERS:
- Mestre Cobrinha Verde (initial training at Jardim Suspenso da Barra)
- Mestre Pastinha (continued training at CECA)
- Mestre Bimba (later "changed parties" to Regional academy)

ASSOCIATE:
- Menino Gordo da Curva Grande - "parceiro" (partner); they were often confused because they looked very similar

CINCO SALOMÃO DOCUMENTATION:
- Documented in Waldeloir Rego''s 1968 "Capoeira Angola" as a toque used by Bigodinho (Francisco de Assis)
- Purpose: "performed when there is a crime among capoeiristas, so that the criminal can escape"
- Name derives from "Signo Salomão" (Solomon''s Sign/Seal), a five-pointed star used in protective amulets

MEDIA APPEARANCES:
- 1950s: Photographs by Pierre Verger (at Ribeira) and Marcel Gautherot
- 1964: Photographs with Mestre Pastinha
- 1968: Film "Dança de Guerra" (playing berimbau)
- Film "Os Cangaceiros" (date uncertain)
- 2007: CD "O Canto do Berimbauman" (15 tracks; project by Frede Abreu)

1980 SEMINAR PARTICIPANTS:
Mestre Cobrinha Verde, Mestre João Grande, Mestre Curió, Mestre Gigante, Mestre Eziquiel

TEACHING LOCATIONS:
- Seminário Central (initial teaching)
- Academia Capoeira São Gonçalo (founded; Rua Rodrigues Ferreira 226, Federação)

REGULAR RODAS:
- Lar das Pombas (Sundays)
- Jardim Baiano (Barra)

FAMILY: Survived by two daughters and three grandchildren (per 2016 obituary)',
  -- notes_pt
  E'DATA DE NASCIMENTO: 4 de outubro de 1920 (exata) - velhosmestres.com confirma data exata. Local de nascimento é Santo Amaro, Bahia. Uma fonte secundária (negrosdesinha) dá 1922, mas obituários dizendo "95 anos" em 2016 confirmam 1920.

DATA DE MORTE: 30 de maio de 2016 (exata) - confirmada por múltiplos obituários. Morreu no Hospital Teresa de Lisieux, Salvador, de infecção respiratória. Enterrado no Cemitério Campo Santo.

VARIAÇÕES DE APELIDO:
- "Gigante" - usado nas rodas de Regional
- "Bigodinho" - usado nas rodas de Angola (DISTINTO de Reinaldo Santana/Bigodinho que treinou com Waldemar)
- "Pequenininho" - usado pelos capoeiristas mais velhos

MESTRES:
- Mestre Cobrinha Verde (treinamento inicial no Jardim Suspenso da Barra)
- Mestre Pastinha (treinamento continuado no CECA)
- Mestre Bimba (depois "mudou de partido" para academia Regional)

ASSOCIADO:
- Menino Gordo da Curva Grande - "parceiro"; eram frequentemente confundidos porque eram muito parecidos

DOCUMENTAÇÃO DO CINCO SALOMÃO:
- Documentado na obra "Capoeira Angola" de Waldeloir Rego de 1968 como um toque usado por Bigodinho (Francisco de Assis)
- Propósito: "executado quando há um crime entre capoeiristas, para que o criminoso possa escapar"
- Nome deriva de "Signo Salomão" (Selo/Estrela de Salomão), estrela de cinco pontas usada em amuletos de proteção

APARIÇÕES EM MÍDIA:
- Anos 1950: Fotografias de Pierre Verger (na Ribeira) e Marcel Gautherot
- 1964: Fotografias com Mestre Pastinha
- 1968: Filme "Dança de Guerra" (tocando berimbau)
- Filme "Os Cangaceiros" (data incerta)
- 2007: CD "O Canto do Berimbauman" (15 faixas; projeto de Frede Abreu)

PARTICIPANTES DO SEMINÁRIO DE 1980:
Mestre Cobrinha Verde, Mestre João Grande, Mestre Curió, Mestre Gigante, Mestre Eziquiel

LOCAIS DE ENSINO:
- Seminário Central (ensino inicial)
- Academia Capoeira São Gonçalo (fundou; Rua Rodrigues Ferreira 226, Federação)

RODAS REGULARES:
- Lar das Pombas (domingos)
- Jardim Baiano (Barra)

FAMÍLIA: Deixou duas filhas e três netos (conforme obituário de 2016)'
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
