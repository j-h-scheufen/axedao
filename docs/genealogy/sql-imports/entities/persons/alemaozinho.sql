-- ============================================================
-- GENEALOGY PERSON: Alemãozinho
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
  NULL,  -- Full name unknown
  'Alemãozinho',
  NULL,  -- Pre-formal title era
  NULL,  -- No historical portrait available
  ARRAY['https://capoeirahistory.com/classical-texts-of-capoeira-history-placido-de-abreu-1886/']::text[],
  -- Capoeira-specific
  NULL,  -- Pre-Angola/Regional distinction
  'Active before the codification of capoeira styles. Practiced capoeira carioca during the malta era in Rio de Janeiro.',
  'Ativo antes da codificação dos estilos de capoeira. Praticava a capoeira carioca durante a era das maltas no Rio de Janeiro.',
  -- Life dates
  1840,
  'decade'::genealogy.date_precision,
  'Rio de Janeiro, Brazil',  -- Presumed based on activity location
  1870,
  'year'::genealogy.date_precision,
  'Near Teatro Lírico do Campo, Rio de Janeiro, Brazil',
  -- bio_en
  E'Alemãozinho (Portuguese for "Little German") was a capoeirista in Rio de Janeiro who became another victim in the violent cycle of vendetta killings that swept through the capoeira maltas in 1870.

Plácido de Abreu documented his death in "Os Capoeiras" (1886), placing it in a sequence of reprisals: "After this, followed the death of the caboclo Jacó, in the celebration at Paula Matos, (being murdered in the street of Riachuelo); after this came the death of the Alemãozinho [Small German], next to the old Lyrical Theatre do Campo, by the famous César-Maneta that, shortly after was also murdered on the Peixe Beach, by João-Lagalhé".

His nickname "Alemãozinho" suggests German ancestry or characteristics—perhaps blond hair, light skin, or an accent—that distinguished him from the primarily Afro-Brazilian and mixed-race population of the capoeira maltas. The presence of European immigrants and their descendants in the Rio capoeira scene was well-documented by the late 19th century; the practice had spread beyond its African origins to incorporate Portuguese, Irish, German, and other immigrants who found themselves in the marginalized urban underclass.

The "old Lyrical Theatre do Campo" referenced by Abreu was the Teatro Lírico, one of several theaters in the Campo de Santana area of central Rio de Janeiro. This was a public, prominent location—suggesting Alemãozinho''s death was either a brazen public assassination or the result of a confrontation that escalated fatally.

His killer, the "famous César-Maneta", was evidently a notable figure in the capoeira world—famous enough that Abreu names him specifically. César-Maneta would himself soon fall victim to the same cycle of violence, killed on Praia do Peixe (Fish Beach) by João-Lagalhé.

Alemãozinho''s death represents one link in a chain of violence that Abreu wrote "have continued until today"—a reminder that in the capoeira maltas of 19th century Rio de Janeiro, reputation was paid for in blood, and debts were settled with the blade.',
  -- bio_pt
  E'Alemãozinho foi um capoeirista no Rio de Janeiro que se tornou mais uma vítima no violento ciclo de mortes por vingança que varreu as maltas de capoeira em 1870.

Plácido de Abreu documentou sua morte em "Os Capoeiras" (1886), colocando-a em uma sequência de represálias: "Após isso, seguiu-se a morte do caboclo Jacó, na festa de Paula Matos, (sendo assassinado na rua do Riachuelo); depois disso veio a morte do Alemãozinho, perto do velho Teatro Lírico do Campo, pelo famoso César-Maneta que, pouco depois também foi assassinado na Praia do Peixe, por João-Lagalhé".

Seu apelido "Alemãozinho" sugere ascendência ou características alemãs—talvez cabelo louro, pele clara, ou um sotaque—que o distinguia da população principalmente afro-brasileira e mestiça das maltas de capoeira. A presença de imigrantes europeus e seus descendentes na cena de capoeira do Rio era bem documentada no final do século XIX; a prática havia se espalhado além de suas origens africanas para incorporar portugueses, irlandeses, alemães e outros imigrantes que se encontravam na classe baixa urbana marginalizada.

O "velho Teatro Lírico do Campo" referenciado por Abreu era o Teatro Lírico, um dos vários teatros na área do Campo de Santana no centro do Rio de Janeiro. Este era um local público e proeminente—sugerindo que a morte de Alemãozinho foi ou um assassinato público descarado ou o resultado de um confronto que escalou fatalmente.

Seu assassino, o "famoso César-Maneta", era evidentemente uma figura notável no mundo da capoeira—famoso o suficiente para que Abreu o nomeie especificamente. O apelido "Maneta" tipicamente significa "sem um braço" ou "sem uma mão", sugerindo que César pode ter tido uma deficiência física que não o impediu de ser um lutador mortal. César-Maneta ele próprio logo cairia vítima do mesmo ciclo de violência, morto na Praia do Peixe por João-Lagalhé.

A morte de Alemãozinho representa um elo em uma cadeia de violência que Abreu escreveu "tem continuado até hoje"—um lembrete de que nas maltas de capoeira do Rio de Janeiro do século XIX, reputação era paga com sangue, e dívidas eram acertadas com a lâmina.',
  -- achievements_en
  NULL,  -- No specific achievements documented
  -- achievements_pt
  NULL,  -- No specific achievements documented
  -- Researcher notes (English)
  E'NAME: Known only as "Alemãozinho" (Little German) - full name unknown. Nickname suggests German ancestry or Germanic physical characteristics.

DEATH DATE: 1870 (year precision). Killed after Jacó and before César-Maneta. Exact date unknown.

DEATH LOCATION: Near the old Teatro Lírico do Campo (Campo de Santana area, central Rio de Janeiro).

BIRTH YEAR ESTIMATION (1840, decade precision): Active capoeirista killed in 1870 vendetta cycle. If 25-40 years old at death, birth was 1830s-1840s. Using 1840 as midpoint.

AFFILIATION: Malta affiliation (Nagoa or Guaiamum) unknown.

KILLER: César-Maneta (the "famous" capoeirista). César-Maneta was subsequently killed by João-Lagalhé on Praia do Peixe.

SOURCES: Plácido de Abreu "Os Capoeiras" (1886) - only known source for this individual.

PENDING RELATIONSHIPS:
- associated_with Jacó (vendetta sequence - previous victim)
- associated_with Pinta Preta da Lapa (vendetta sequence - first in chain)
- associated_with César-Maneta (killer - Import? = yes, capoeirista)
- associated_with João-Lagalhé (killed César-Maneta - Import? = yes, capoeirista)',
  -- Researcher notes (Portuguese)
  E'NOME: Conhecido apenas como "Alemãozinho" - nome completo desconhecido. Apelido sugere ascendência alemã ou características físicas germânicas.

DATA DA MORTE: 1870 (precisão de ano). Morto após Jacó e antes de César-Maneta. Data exata desconhecida.

LOCAL DA MORTE: Perto do velho Teatro Lírico do Campo (área do Campo de Santana, centro do Rio de Janeiro).

ESTIMATIVA DO ANO DE NASCIMENTO (1840, precisão de década): Capoeirista ativo morto no ciclo de vingança de 1870. Se tinha 25-40 anos na morte, nasceu nos anos 1830-1840. Usando 1840 como ponto médio.

AFILIAÇÃO: Afiliação à malta (Nagoa ou Guaiamum) desconhecida.

ASSASSINO: César-Maneta (o "famoso" capoeirista). César-Maneta foi posteriormente morto por João-Lagalhé na Praia do Peixe.

FONTES: Plácido de Abreu "Os Capoeiras" (1886) - única fonte conhecida para este indivíduo.

RELACIONAMENTOS PENDENTES:
- associated_with Jacó (sequência de vingança - vítima anterior)
- associated_with Pinta Preta da Lapa (sequência de vingança - primeiro da cadeia)
- associated_with César-Maneta (assassino - Import? = yes, capoeirista)
- associated_with João-Lagalhé (matou César-Maneta - Import? = yes, capoeirista)'
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
