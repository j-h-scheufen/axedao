-- ============================================================
-- GENEALOGY PERSON: Brás Amansa Brabo
-- Generated: 2025-12-18
-- Updated: 2025-12-18 (added birth year estimate)
-- ============================================================
-- BIRTH YEAR ESTIMATION (1920, decade):
-- Contemporary of Atenilo (born 1918) in Bimba's inner circle.
-- Active as recognized mestre in Salvador in 1982 (O Globo).
-- If similar generation to Atenilo and started training with
-- Bimba in 1930s-1940s as teenager/young adult, birth ~1915-1930.
-- Using 1920 with decade precision as central estimate.
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
  'Brás Amansa Brabo',
  'mestre'::genealogy.title,
  NULL,
  ARRAY['https://velhosmestres.com/br/cobrinha-1982-3', 'http://velhosmestres.com/en/cobrinha-1982-3']::text[],
  'regional'::genealogy.style,
  E'Trained directly under Mestre Bimba in the Capoeira Regional tradition. Part of Bimba''s inner circle of trusted companions.',
  E'Treinado diretamente com Mestre Bimba na tradição da Capoeira Regional. Parte do círculo íntimo de companheiros de confiança de Bimba.',
  1920,
  'decade'::genealogy.date_precision,
  NULL,
  NULL,
  NULL,
  NULL,
  -- bio_en
  E'Brás Amansa Brabo was a direct student and trusted companion of Mestre Bimba, the founder of Capoeira Regional. His apelido—which translates roughly to "Brás who tames the wild one" or "Brás the wild-tamer"—suggests his reputation for handling aggressive or unruly opponents with skill and composure, a quality valued in the rodas of Salvador.

He appears in the historical record as part of Bimba''s inner circle. According to Mestre Atenilo''s testimony (preserved in Mestre Itapoan''s writings), Brás Amansa Brabo was among Bimba''s most trusted companions, mentioned in the same breath as Atenilo himself and Crispim, Bimba''s eldest son. This places him among a small group of students who had particularly close relationships with the master.

In February 1982, O Globo newspaper published an article titled "Capoeira - A great controversy in the Bahia rodas" documenting the state of capoeira in Salvador. The article categorized the active mestres by lineage, listing those in the "regional" branch—"almost all direct disciples of the legendary Bimba"—and specifically naming Brás Amansa Brabo among the most prominent. He appears alongside Itapuã, Vinte e Nove, Vermelho 27, Medicina, Banduê, Capazans, Ezequiel, and Hélio Xaréu. This 1982 documentation confirms he was active as a mestre in Salvador at that time and was recognized as a significant figure in the Regional lineage.

Beyond these two references, little else has been preserved about his life. His full name, birth and death dates, and the details of his training under Bimba remain undocumented in available sources. He represents one of many mestres from Bimba''s academy whose individual stories have been overshadowed by the more extensively documented figures like Itapoan, Ezequiel, and Vermelho 27. His presence in both Atenilo''s testimony and the 1982 press coverage confirms his historical significance, even as the specifics of his life await further research.',
  -- bio_pt
  E'Brás Amansa Brabo foi aluno direto e companheiro de confiança de Mestre Bimba, o fundador da Capoeira Regional. Seu apelido—que se traduz aproximadamente como "Brás que amansa o bravo" ou "Brás o domador de valentes"—sugere sua reputação de lidar com oponentes agressivos ou indisciplinados com habilidade e compostura, uma qualidade valorizada nas rodas de Salvador.

Ele aparece no registro histórico como parte do círculo íntimo de Bimba. Segundo o testemunho de Mestre Atenilo (preservado nos escritos de Mestre Itapoan), Brás Amansa Brabo estava entre os companheiros mais confiáveis de Bimba, mencionado junto com o próprio Atenilo e Crispim, o filho mais velho de Bimba. Isso o coloca entre um pequeno grupo de alunos que tinha relações particularmente próximas com o mestre.

Em fevereiro de 1982, o jornal O Globo publicou um artigo intitulado "Capoeira - Uma grande controvérsia nas rodas da Bahia" documentando o estado da capoeira em Salvador. O artigo categorizou os mestres ativos por linhagem, listando aqueles no ramo "regional"—"quase todos discípulos diretos do lendário Bimba"—e nomeando especificamente Brás Amansa Brabo entre os mais proeminentes. Ele aparece ao lado de Itapuã, Vinte e Nove, Vermelho 27, Medicina, Banduê, Capazans, Ezequiel e Hélio Xaréu. Esta documentação de 1982 confirma que ele estava ativo como mestre em Salvador naquela época e era reconhecido como uma figura significativa na linhagem Regional.

Além dessas duas referências, pouco mais foi preservado sobre sua vida. Seu nome completo, datas de nascimento e morte, e os detalhes de seu treinamento com Bimba permanecem não documentados nas fontes disponíveis. Ele representa um dos muitos mestres da academia de Bimba cujas histórias individuais foram ofuscadas por figuras mais extensivamente documentadas como Itapoan, Ezequiel e Vermelho 27. Sua presença tanto no testemunho de Atenilo quanto na cobertura da imprensa de 1982 confirma sua significância histórica, mesmo enquanto os detalhes de sua vida aguardam pesquisa adicional.',
  -- achievements_en
  E'Direct disciple of Mestre Bimba; Member of Bimba''s inner circle of trusted companions; Active and recognized mestre of Capoeira Regional in Salvador as of 1982',
  -- achievements_pt
  E'Discípulo direto de Mestre Bimba; Membro do círculo íntimo de companheiros de confiança de Bimba; Mestre ativo e reconhecido de Capoeira Regional em Salvador em 1982',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1920, decade):
Contemporary of Atenilo (born 1918) in Bimba''s inner circle. Active as recognized mestre in Salvador in 1982 (O Globo article). If similar generation to Atenilo and started training with Bimba in 1930s-1940s as teenager/young adult, birth approximately 1915-1930. Using 1920 with decade precision as central estimate. This would make him approximately 62 years old in 1982.

LIMITED DOCUMENTATION:
This profile is based on only two primary source references:
1. O Globo newspaper article (Feb 16, 1982) via velhosmestres.com
2. Mestre Atenilo''s testimony (preserved in Mestre Itapoan''s writings, in our dataset)

APELIDO MEANING:
"Amansa Brabo" literally means "tames the wild/fierce one" - a capoeira war name suggesting skill at subduing aggressive opponents. "Brás" is his first name (Portuguese version of Blaise).

CONTEMPORARIES (from 1982 O Globo article):
Listed alongside these Bimba students as prominent Regional mestres in Salvador:
- Itapuã (Itapoan)
- Vinte e Nove
- Vermelho 27
- Medicina
- Banduê
- Capazans
- Ezequiel
- Hélio Xaréu

INNER CIRCLE:
According to Atenilo, Brás Amansa Brabo was one of Bimba''s most trusted companions, alongside:
- Atenilo himself
- Crispim (Bimba''s eldest son)

UNKNOWN:
- Full civil name
- Birth year (now estimated as 1920, decade precision)
- Death year
- Birth place
- When he began training with Bimba
- Whether he achieved formal graduation (lenço) status
- Whether he founded or led any group

RESEARCH NEEDED:
- Mestre Itapoan''s archive (30,000+ documents) may contain additional information
- Interviews with surviving Bimba students from the 1960s-70s era
- Bahian newspaper archives from 1950s-1980s',
  -- notes_pt
  E'ESTIMATIVA DE ANO DE NASCIMENTO (1920, década):
Contemporâneo de Atenilo (nascido em 1918) no círculo íntimo de Bimba. Ativo como mestre reconhecido em Salvador em 1982 (artigo O Globo). Se da mesma geração de Atenilo e começou a treinar com Bimba nos anos 1930-1940 como adolescente/jovem adulto, nascimento aproximadamente 1915-1930. Usando 1920 com precisão de década como estimativa central. Isso o colocaria com aproximadamente 62 anos em 1982.

DOCUMENTAÇÃO LIMITADA:
Este perfil é baseado em apenas duas referências de fontes primárias:
1. Artigo do jornal O Globo (16 fev 1982) via velhosmestres.com
2. Testemunho de Mestre Atenilo (preservado nos escritos de Mestre Itapoan, em nosso banco de dados)

SIGNIFICADO DO APELIDO:
"Amansa Brabo" significa literalmente "amansa o bravo/feroz" - um nome de guerra da capoeira sugerindo habilidade em subjugar oponentes agressivos. "Brás" é seu primeiro nome.

CONTEMPORÂNEOS (do artigo O Globo de 1982):
Listado junto com estes alunos de Bimba como mestres proeminentes da Regional em Salvador:
- Itapuã (Itapoan)
- Vinte e Nove
- Vermelho 27
- Medicina
- Banduê
- Capazans
- Ezequiel
- Hélio Xaréu

CÍRCULO ÍNTIMO:
Segundo Atenilo, Brás Amansa Brabo era um dos companheiros mais confiáveis de Bimba, junto com:
- O próprio Atenilo
- Crispim (filho mais velho de Bimba)

DESCONHECIDO:
- Nome civil completo
- Ano de nascimento (agora estimado como 1920, precisão de década)
- Ano de morte
- Local de nascimento
- Quando começou a treinar com Bimba
- Se alcançou status de graduação formal (lenço)
- Se fundou ou liderou algum grupo

PESQUISA NECESSÁRIA:
- Arquivo de Mestre Itapoan (30.000+ documentos) pode conter informações adicionais
- Entrevistas com alunos sobreviventes de Bimba da era 1960s-70s
- Arquivos de jornais baianos de 1950s-1980s'
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
