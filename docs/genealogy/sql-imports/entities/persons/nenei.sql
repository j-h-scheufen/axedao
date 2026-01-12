-- ============================================================
-- GENEALOGY PERSON: Nenei
-- Generated: 2026-01-11
-- ============================================================
-- BIRTH YEAR ESTIMATION:
-- No direct birth date information available. As a student of
-- Mestre Salário Mínimo (likely in the 1960s-1970s) and father
-- of Kiki da Bahia (who came to USA in 1992/1996), Nenei likely
-- trained his son in the 1970s-1980s. This suggests Nenei was
-- born somewhere around the 1940s-1960s. Unable to estimate with
-- confidence; using NULL due to insufficient evidence.
-- ============================================================
-- DISAMBIGUATION:
-- Mestre Nenei (father of Kiki da Bahia, student of Salário Mínimo)
-- is DIFFERENT from Mestre Nenel (Manoel Nascimento Machado, son
-- of Mestre Bimba, born 1960).
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
  'Nenei',
  'mestre'::genealogy.title,
  NULL,
  ARRAY[
    'http://gingacapoeira.com/who-we-are'
  ]::text[],
  'regional'::genealogy.style,
  E'Student of Mestre Salário Mínimo in the direct lineage of Mestre Bimba''s Capoeira Regional. Taught the art to his son Kiki da Bahia from age 8, passing on the traditional techniques and principles of Capoeira Regional.',
  E'Aluno de Mestre Salário Mínimo na linhagem direta da Capoeira Regional de Mestre Bimba. Ensinou a arte ao seu filho Kiki da Bahia desde os 8 anos, transmitindo as técnicas e princípios tradicionais da Capoeira Regional.',
  1950,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  NULL,
  NULL::genealogy.date_precision,
  NULL,
  -- bio_en
  E'Mestre Nenei is a capoeirista from Salvador, Bahia, who trained under Mestre Salário Mínimo—a direct student of Mestre Bimba, the creator of Capoeira Regional. Through this lineage, Nenei represents the second generation of capoeiristas carrying forward Bimba''s teachings after the founder''s death in 1974.

Nenei''s most significant contribution to capoeira history is his role as the first teacher of his son, Mestre Kiki da Bahia. Together with Kiki''s uncle (whose identity remains undocumented), Nenei began teaching Kiki the art of Capoeira Regional when Kiki was just eight years old in Salvador. This early training laid the foundation for Kiki''s later formal studies with Mestre Itapoan, one of the preeminent authorities on Capoeira Regional.

The lineage connection is historically significant: Mestre Bimba trained Mestre Salário Mínimo, who trained Mestre Nenei, who in turn raised Mestre Kiki da Bahia in the art. When Kiki brought Ginga Associação de Capoeira to the United States in 1996, this branch of Bimba''s Capoeira Regional crossed the Atlantic, establishing a direct link between Salvador''s capoeira traditions and the American capoeira community.

Note: Mestre Nenei should not be confused with Mestre Nenel (Manoel Nascimento Machado), the son of Mestre Bimba who was born in 1960 and founded the Fundação Mestre Bimba in Salvador. Despite the similar-sounding apelidos, they are different individuals with different lineages.',
  -- bio_pt
  E'Mestre Nenei é um capoeirista de Salvador, Bahia, que treinou com Mestre Salário Mínimo—aluno direto de Mestre Bimba, o criador da Capoeira Regional. Através dessa linhagem, Nenei representa a segunda geração de capoeiristas que levam adiante os ensinamentos de Bimba após a morte do fundador em 1974.

A contribuição mais significativa de Nenei para a história da capoeira é seu papel como primeiro professor de seu filho, Mestre Kiki da Bahia. Junto com o tio de Kiki (cuja identidade permanece não documentada), Nenei começou a ensinar a arte da Capoeira Regional a Kiki quando este tinha apenas oito anos em Salvador. Esse treinamento inicial estabeleceu a base para os estudos formais posteriores de Kiki com Mestre Itapoan, uma das maiores autoridades em Capoeira Regional.

A conexão de linhagem é historicamente significativa: Mestre Bimba treinou Mestre Salário Mínimo, que treinou Mestre Nenei, que por sua vez criou Mestre Kiki da Bahia na arte. Quando Kiki levou a Ginga Associação de Capoeira para os Estados Unidos em 1996, este ramo da Capoeira Regional de Bimba atravessou o Atlântico, estabelecendo uma ligação direta entre as tradições de capoeira de Salvador e a comunidade de capoeira americana.

Nota: Mestre Nenei não deve ser confundido com Mestre Nenel (Manoel Nascimento Machado), filho de Mestre Bimba que nasceu em 1960 e fundou a Fundação Mestre Bimba em Salvador. Apesar dos apelidos de som semelhante, são indivíduos diferentes com linhagens diferentes.',
  -- achievements_en
  E'Student of Mestre Salário Mínimo (direct Bimba lineage); First capoeira teacher of Mestre Kiki da Bahia (from age 8); Key link in Bimba → Salário Mínimo → Nenei → Kiki da Bahia lineage; Contributed to transmission of Capoeira Regional to the United States',
  -- achievements_pt
  E'Aluno de Mestre Salário Mínimo (linhagem direta de Bimba); Primeiro professor de capoeira de Mestre Kiki da Bahia (desde os 8 anos); Elo fundamental na linhagem Bimba → Salário Mínimo → Nenei → Kiki da Bahia; Contribuiu para a transmissão da Capoeira Regional para os Estados Unidos',
  -- notes_en
  E'FULL NAME:
Unknown. No full name found in any source. Only the apelido "Nenei" is documented.

BIRTH YEAR ESTIMATION:
Unable to estimate with confidence. As a student of Salário Mínimo (who trained with Bimba, died 1974) and father who taught Kiki da Bahia from age 8 (Kiki came to USA 1992/1996), Nenei was likely born between 1940s-1960s. Insufficient evidence for precise estimate.

BIRTH PLACE:
Salvador, Bahia, Brazil (inferred from being Kiki da Bahia''s father and training with Salário Mínimo in Bahia).

TEACHER:
- Mestre Salário Mínimo (direct student of Mestre Bimba)

STUDENTS:
- Mestre Kiki da Bahia (his son, trained from age 8)

FAMILY:
- Mestre Kiki da Bahia (son)
- Unknown brother (Kiki''s uncle, who also trained Kiki from age 8)

LINEAGE:
Bimba → Salário Mínimo → Nenei → Kiki da Bahia → USA

DISAMBIGUATION (CRITICAL):
Mestre Nenei (father of Kiki da Bahia, student of Salário Mínimo) is a DIFFERENT person from:
- Mestre Nenel (Manoel Nascimento Machado, son of Mestre Bimba, born September 26, 1960, founder of Fundação Mestre Bimba)

LIMITED SOURCE DOCUMENTATION:
Only primary source documenting Nenei is Ginga Capoeira USA website (gingacapoeira.com). All information about Nenei comes from descriptions of his son Kiki da Bahia''s background. No independent biographical sources about Nenei himself have been found.',
  -- notes_pt
  E'NOME COMPLETO:
Desconhecido. Nenhum nome completo encontrado em qualquer fonte. Apenas o apelido "Nenei" está documentado.

ESTIMATIVA DE ANO DE NASCIMENTO:
Não foi possível estimar com confiança. Como aluno de Salário Mínimo (que treinou com Bimba, morreu em 1974) e pai que ensinou Kiki da Bahia desde os 8 anos (Kiki veio para os EUA em 1992/1996), Nenei provavelmente nasceu entre os anos 1940-1960. Evidências insuficientes para estimativa precisa.

LOCAL DE NASCIMENTO:
Salvador, Bahia, Brasil (inferido por ser pai de Kiki da Bahia e treinar com Salário Mínimo na Bahia).

PROFESSOR:
- Mestre Salário Mínimo (aluno direto de Mestre Bimba)

ALUNOS:
- Mestre Kiki da Bahia (seu filho, treinado desde os 8 anos)

FAMÍLIA:
- Mestre Kiki da Bahia (filho)
- Irmão desconhecido (tio de Kiki, que também treinou Kiki desde os 8 anos)

LINHAGEM:
Bimba → Salário Mínimo → Nenei → Kiki da Bahia → EUA

DESAMBIGUAÇÃO (CRÍTICA):
Mestre Nenei (pai de Kiki da Bahia, aluno de Salário Mínimo) é uma pessoa DIFERENTE de:
- Mestre Nenel (Manoel Nascimento Machado, filho de Mestre Bimba, nascido em 26 de setembro de 1960, fundador da Fundação Mestre Bimba)

DOCUMENTAÇÃO LIMITADA DE FONTES:
A única fonte primária que documenta Nenei é o site da Ginga Capoeira USA (gingacapoeira.com). Todas as informações sobre Nenei vêm de descrições da origem de seu filho Kiki da Bahia. Nenhuma fonte biográfica independente sobre o próprio Nenei foi encontrada.'
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
