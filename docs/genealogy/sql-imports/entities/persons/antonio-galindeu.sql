-- ============================================================
-- GENEALOGY PERSON: Antônio Galindeu (Antonio Galindo)
-- Generated: 2025-12-15
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- Galindeu died at 80 years old. If active as a founding mestre of Gengibirra
-- in the 1920s (age 30-40), death around 1940s-1950s suggests birth around
-- 1860-1870. However, if he was older at Gengibirra's founding (age 50-60),
-- he could have been born around 1870-1880. Using the information that he
-- died at 80 years old and was an established mestre by 1920s, estimating
-- birth year at ~1860 with decade precision.
-- ============================================================

INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links,
  style, style_notes_en, style_notes_pt,
  birth_year, birth_year_precision, birth_place,
  death_year, death_year_precision, death_place,
  bio_en, bio_pt, achievements_en, achievements_pt,
  notes_en, notes_pt
) VALUES (
  'Antônio',
  'Galindeu',
  NULL,
  NULL,
  NULL,
  'angola'::genealogy.style,
  NULL,
  NULL,
  1860,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL,
  NULL,
  E'Antônio Galindeu, also known as Antonio Galindo, was one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola, the historic gathering at Ladeira de Pedra in the Gengibirra area of Salvador''s Liberdade neighborhood. This center, established in the 1920s during the era when capoeira was still criminalized in Brazil, served as the primary meeting place for traditional capoeira angola practitioners.\n\nGalindeu was described as "velho mestre do passado, praticante de ritos africanos" (old master of the past, practitioner of African rites), indicating his deep connection to African spiritual traditions. He was particularly respected in the Cabrito region of the Recôncavo Baiano, where he had a large following among devotees of Iansã (Oyá), the Yoruba orisha of winds, storms, and transformation.\n\nAccording to Mestre Noronha''s manuscripts, Galindeu organized the annual Yemanjá celebrations held on February 2nd in Cabrito. These festivities were major community events where a platform would be set up in the churchyard, and the celebrations included samba, batuque, and capoeira, lasting for three days. Galindeu''s role as organizer of these events demonstrates his standing as a community leader who bridged capoeira, African spiritual practices, and popular culture.\n\nGalindeu lived to be eighty years old, making him one of the elder statesmen among the Gengibirra founders. His longevity and respect in both the capoeira and religious communities of the Recôncavo made him an important bridge between generations of practitioners.',
  E'Antônio Galindeu, também conhecido como Antonio Galindo, foi um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola, a histórica reunião na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade em Salvador. Este centro, estabelecido na década de 1920 durante a era em que a capoeira ainda era criminalizada no Brasil, serviu como o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nGalindeu foi descrito como "velho mestre do passado, praticante de ritos africanos", indicando sua profunda conexão com as tradições espirituais africanas. Ele era particularmente respeitado na região de Cabrito no Recôncavo Baiano, onde tinha grande número de seguidores entre os devotos de Iansã (Oyá), a orixá iorubá dos ventos, tempestades e transformação.\n\nSegundo os manuscritos de Mestre Noronha, Galindeu organizava as celebrações anuais de Yemanjá realizadas no dia 2 de fevereiro em Cabrito. Essas festividades eram grandes eventos comunitários onde um tablado era montado no adro da igreja, e as celebrações incluíam samba, batuque e capoeira, durando três dias. O papel de Galindeu como organizador desses eventos demonstra sua posição como líder comunitário que conectava a capoeira, as práticas espirituais africanas e a cultura popular.\n\nGalindeu viveu até os oitenta anos de idade, tornando-se um dos veteranos mais velhos entre os fundadores do Gengibirra. Sua longevidade e respeito tanto nas comunidades de capoeira quanto religiosas do Recôncavo fizeram dele uma importante ponte entre gerações de praticantes.',
  E'Co-founder of the Centro Nacional de Capoeira de Origem Angola (Gengibirra), the first organized center for Capoeira Angola in the state of Bahia. Respected spiritual leader and organizer of major cultural celebrations in Cabrito, Recôncavo Baiano.',
  E'Cofundador do Centro Nacional de Capoeira de Origem Angola (Gengibirra), o primeiro centro organizado de Capoeira Angola no estado da Bahia. Respeitado líder espiritual e organizador de grandes celebrações culturais em Cabrito, Recôncavo Baiano.',
  E'Birth year estimated at ~1860 (decade precision) based on dying at age 80 and being an established mestre by 1920s. Also known as "Antonio Galindo" (spelling variation). First name "Antônio" is known. Recognized as "velho mestre do passado, praticante de ritos africanos" with strong following among Iansã devotees in Cabrito. Organized annual Yemanjá celebrations on February 2nd in Cabrito featuring samba, batuque, and capoeira lasting three days. Information sourced primarily from Mestre Noronha''s manuscripts.',
  E'Ano de nascimento estimado em ~1860 (precisão de década) baseado no fato de ter falecido aos 80 anos e ser um mestre estabelecido na década de 1920. Também conhecido como "Antonio Galindo" (variação ortográfica). Primeiro nome "Antônio" é conhecido. Reconhecido como "velho mestre do passado, praticante de ritos africanos" com grande número de seguidores entre os devotos de Iansã em Cabrito. Organizava celebrações anuais de Yemanjá em 2 de fevereiro em Cabrito com samba, batuque e capoeira durando três dias. Informações provenientes principalmente dos manuscritos de Mestre Noronha.'
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
