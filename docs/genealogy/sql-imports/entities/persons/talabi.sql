-- ============================================================
-- GENEALOGY PERSON: Talabi
-- Migrated: 2025-12-11
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
  NULL, -- Full name unknown; known only by apelido
  'Talabi',
  'de Periperi', -- Location-based context to distinguish from other Talabis
  NULL, -- Proto-mestre; formal titles didn't exist in his era
  NULL, -- No portrait available
  ARRAY['https://velhosmestres.com/br/waldemar-1989-2', 'http://velhosmestres.com/br/waldemar-1970']::text[],
  -- Capoeira-specific
  NULL, -- Pre-codification era; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. His capoeira would have been the undifferentiated style of urban Salvador in the 1920s-1930s.',
  'Era pré-codificação. Praticava a capoeira tradicional baiana antes da divisão Angola/Regional. Sua capoeira seria o estilo indiferenciado da Salvador urbana dos anos 1920-1930.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Periperi, Salvador, Bahia, Brazil',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Talabi was a capoeira mestre from Periperi, a working-class neighborhood in Salvador''s Subúrbio Ferroviário (railway suburbs). He taught at what became known as the "roda danada"—the "mad roda" or "wild roda"—where the old mestres of Salvador gathered in the 1930s to play capoeira before the era of formal academies.

Mestre Waldemar da Paixão identified Talabi as his third teacher in a 1989 interview: "I learned capoeira in 1936 in Periperi and my name is Waldemar Rodrigues da Paixão. I had four mestres: Siri de Mangue, one; Canário Pardo, two; Talavi, three, and Ricardo from Ilha de Maré, four." The 1970 Diário de Notícias article about Waldemar also references him as "a student of Mestre Talabi de Periperi," confirming the teaching relationship.

Waldemar described discovering capoeira when he saw the roda at Periperi: "All the old Mestres were there and I asked to learn." This was a time when capoeira had just been legalized (1937) but was still practiced informally in the streets and empty lots. As Waldemar recalled, "At those times there wasn''t any Academy. There was only that roda in Periperi and the Academy was everywhere there was a good shadow from the sun."

The "roda danada" at Periperi was one of the key gathering points for capoeiristas in Salvador before the academy era. Mestres like Siri de Mangue, Canário Pardo, Talabi, and others would come together on Sundays and holidays to play. This was rough, street capoeira—the kind that would later be refined and preserved by Mestre Pastinha and others as Capoeira Angola, but in the 1930s it existed in a less codified form.

Talabi''s apelido has multiple spelling variations in the historical record: Talabi, Talavi, Telabi, and sometimes "Calabi." The phrase "de Periperi" (of Periperi) appears frequently with his name, indicating his strong association with that neighborhood. This location-based identification was common among capoeiristas of this era, distinguishing them from others who might share the same nickname.

Beyond his role teaching Waldemar, almost nothing else is documented about Talabi''s life. Like many capoeiristas of his generation, he left no written records, no photographs, and only the memories preserved in oral testimony. Yet his influence lives on through Mestre Waldemar, whose Barracão in Liberdade became one of the most important sites in capoeira history. Waldemar''s students—including figures who would shape capoeira''s global expansion—carry forward the teachings that Talabi helped transmit at that mad roda in Periperi.

The fact that Waldemar sought out four different mestres to learn from speaks to the diversity of capoeira knowledge in Salvador during the 1930s. Each mestre had his own style, his own tricks, his own philosophy. Talabi was one of those keepers of knowledge in the critical years when capoeira was transforming from an outlawed practice to a cultural tradition.',
  -- bio_pt
  E'Talabi era um mestre de capoeira de Periperi, um bairro popular no Subúrbio Ferroviário de Salvador. Ele ensinava no que ficou conhecida como a "roda danada"—a roda louca ou selvagem—onde os mestres antigos de Salvador se reuniam nos anos 1930 para jogar capoeira antes da era das academias formais.

Mestre Waldemar da Paixão identificou Talabi como seu terceiro mestre em uma entrevista de 1989: "Aprendi capoeira em 1936 em Periperi e me chamo Waldemar Rodrigues da Paixão. Tive quatro mestres: Siri de Mangue, um; Canário Pardo, dois; Talavi, três e Ricardo de Ilha de Maré, quatro." O artigo do Diário de Notícias de 1970 sobre Waldemar também o referencia como "aluno de Mestre Talabi de Periperi," confirmando a relação de ensino.

Waldemar descreveu a descoberta da capoeira quando viu a roda em Periperi: "Todos os Mestres antigos estavam lá e eu pedi para aprender." Era uma época em que a capoeira havia acabado de ser legalizada (1937) mas ainda era praticada informalmente nas ruas e terrenos baldios. Como Waldemar recordou, "Naquele tempo não havia Academia. Havia apenas aquela roda em Periperi e a Academia era em todo lugar que havia uma boa sombra do sol."

A "roda danada" de Periperi era um dos principais pontos de encontro para capoeiristas em Salvador antes da era das academias. Mestres como Siri de Mangue, Canário Pardo, Talabi e outros se reuniam aos domingos e feriados para jogar. Era uma capoeira dura, de rua—o tipo que mais tarde seria refinado e preservado por Mestre Pastinha e outros como Capoeira Angola, mas nos anos 1930 existia em uma forma menos codificada.

O apelido de Talabi tem múltiplas variações ortográficas no registro histórico: Talabi, Talavi, Telabi e às vezes "Calabi." A frase "de Periperi" aparece frequentemente com seu nome, indicando sua forte associação com aquele bairro. Esta identificação baseada em localização era comum entre capoeiristas desta época, distinguindo-os de outros que poderiam compartilhar o mesmo apelido.

Além de seu papel ensinando Waldemar, quase nada mais está documentado sobre a vida de Talabi. Como muitos capoeiristas de sua geração, ele não deixou registros escritos, nem fotografias, apenas as memórias preservadas em testemunho oral. No entanto, sua influência vive através de Mestre Waldemar, cujo Barracão na Liberdade se tornou um dos locais mais importantes da história da capoeira. Os alunos de Waldemar—incluindo figuras que moldariam a expansão global da capoeira—levam adiante os ensinamentos que Talabi ajudou a transmitir naquela roda danada em Periperi.

O fato de Waldemar ter procurado quatro mestres diferentes para aprender fala da diversidade do conhecimento da capoeira em Salvador durante os anos 1930. Cada mestre tinha seu próprio estilo, seus próprios truques, sua própria filosofia. Talabi foi um desses guardiões do conhecimento nos anos críticos quando a capoeira estava se transformando de uma prática proibida em uma tradição cultural.',
  -- achievements_en
  'Teacher of Mestre Waldemar da Paixão; active at the legendary "roda danada" in Periperi during the 1930s; preserved traditional street capoeira during the transition to legalization',
  -- achievements_pt
  'Mestre de Mestre Waldemar da Paixão; ativo na lendária "roda danada" em Periperi durante os anos 1930; preservou a capoeira tradicional de rua durante a transição para a legalização',
  -- Researcher notes (English)
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Talabi was teaching at the Periperi roda when Waldemar began learning in 1936. If he was an established mestre at that time (likely 40-60 years old), this places his birth around 1876-1896. Using 1890 as midpoint estimate. This is consistent with his contemporaries Siri de Mangue (b. ~1880) and Neco Canário Pardo (b. ~1880) who also taught Waldemar.

DEATH: Unknown. No records of his death have been found.

NAME: Full name unknown. Known by apelido only. Name variations in sources include:
- Talabi (most common spelling)
- Talavi (used in some Waldemar interviews)
- Telabi (used in some online sources)
- Calabi (variant spelling)
All confirmed to refer to the same person through context.

LOCATION: Strongly associated with Periperi neighborhood, hence "Talabi de Periperi." Periperi is located in Salvador''s Subúrbio Ferroviário (railway suburbs), a working-class area that was a center of Afro-Brazilian culture.

TEACHING CONTEXT: Part of the informal street roda culture of pre-academy capoeira. The "roda danada" (mad/wild roda) at Periperi was one of several key gathering points for capoeiristas in 1930s Salvador.

TIMELINE: Active teaching at Periperi roda by 1936 when Waldemar began learning. Waldemar trained for approximately 4 years (1936-1940) under his four mestres.

PENDING RELATIONSHIPS (require SQL imports):
- Mestre Waldemar: student_of Talabi (~1936-1940)
- Ricardo de Ilha de Maré: possible associated_with (both taught Waldemar at same roda)

ACTIVE RELATIONSHIPS (entities already imported):
- Siri de Mangue: associated_with (both taught at Periperi roda)
- Neco Canário Pardo: associated_with (both taught at Periperi roda)',
  -- Researcher notes (Portuguese)
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Talabi ensinava na roda de Periperi quando Waldemar começou a aprender em 1936. Se ele era um mestre estabelecido naquela época (provavelmente 40-60 anos), isso coloca seu nascimento por volta de 1876-1896. Usando 1890 como estimativa do ponto médio. Isso é consistente com seus contemporâneos Siri de Mangue (n. ~1880) e Neco Canário Pardo (n. ~1880) que também ensinaram Waldemar.

MORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.

NOME: Nome completo desconhecido. Conhecido apenas pelo apelido. Variações de nome nas fontes incluem:
- Talabi (ortografia mais comum)
- Talavi (usado em algumas entrevistas de Waldemar)
- Telabi (usado em algumas fontes online)
- Calabi (variante ortográfica)
Todos confirmados como referindo-se à mesma pessoa através do contexto.

LOCAL: Fortemente associado ao bairro de Periperi, daí "Talabi de Periperi." Periperi está localizado no Subúrbio Ferroviário de Salvador, uma área popular que era um centro da cultura afro-brasileira.

CONTEXTO DE ENSINO: Parte da cultura informal de roda de rua da capoeira pré-academia. A "roda danada" em Periperi era um dos vários pontos-chave de encontro para capoeiristas na Salvador dos anos 1930.

LINHA DO TEMPO: Ensinando ativamente na roda de Periperi por volta de 1936 quando Waldemar começou a aprender. Waldemar treinou por aproximadamente 4 anos (1936-1940) sob seus quatro mestres.

RELACIONAMENTOS PENDENTES (requerem importações SQL):
- Mestre Waldemar: student_of Talabi (~1936-1940)
- Ricardo de Ilha de Maré: possível associated_with (ambos ensinaram Waldemar na mesma roda)

RELACIONAMENTOS ATIVOS (entidades já importadas):
- Siri de Mangue: associated_with (ambos ensinavam na roda de Periperi)
- Neco Canário Pardo: associated_with (ambos ensinavam na roda de Periperi)'
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
