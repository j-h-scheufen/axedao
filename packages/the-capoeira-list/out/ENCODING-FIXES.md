# Portuguese Encoding Issues - Quality Assurance Report

## Executive Summary

Found **34 groups** with encoding issues across **9 different Portuguese words**. These are instances where Portuguese special characters (é, ã, ç, ão) were lost, likely from the original source data.

## Detailed Findings

### 1. "Axe" → "Axé" (8 groups)
- Axe Capoeira
- Axe Capoeira Comox
- Axe Richmond
- Axe Capoeira Toronto
- AXE Capoeira Vancouver
- Grupo Axe Capoeira Victoria Academy
- Axe Capoeira Tucson
- Axe Capoeira Kansas City

### 2. "Cordao" → "Cordão" (11 groups)
- Capoeira Cordao de Ouro
- Cordao de Ouro, Birmingham Brazilian Cultural Centre
- Gingarte Capoeira - Capoeira Cordao de Ouro
- Roots Capoeira De Ouro - Cordao de Ouro
- Cordao de Ouro South Carolina
- Grand Rapids Capoeira - West Michigan Cordao de Ouro
- Capoeira North West - Capoeira Cordao De Ouro
- Cordao de Ouro - Cedar Falls
- The Canadian Centre for Capoeira - Cordao de Ouro
- Dendê Arts - Capoeira Cordao de Ouro
- Capoeira Cordao de Ouro Perth

### 3. "Mao no Chao" → "Mão no Chão" (4 groups)
- Mao no Chao Capoeira Angola
- Mao no Chao Capoeira Angola Edinburgh
- Mao no Chao Capoeira Angola Glasgow
- Mao no Chao Capoeira Angola Dundee

### 4. "Associacao" → "Associação" (3 groups)
- ASCAB [Associacao Santista de Capoeira Areia Branca]
- Associacao Kadara Capoeira
- Capoeira Mestre Bimba Oakland - Associacao de Capoeira Mestre Bimba

### 5. "Sao Jose" → "São José" (1 group)
- Grupo De Capoeira Sao Jose Dos Carpinteiros

### 6. "Resistencia" → "Resistência" (1 group)
- Capoeira Resistencia

### 7. "Expressao" → "Expressão" (1 group)
- Com Expressao

## Recommended Fix Strategy

**Option 1: SQL File Search & Replace (RECOMMENDED)**

Pros:
- Quick and simple
- Only affects final output
- Easy to verify
- No need to rerun entire pipeline

Cons:
- Doesn't fix upstream data
- Changes not reflected in intermediate files

**Option 2: Fix in Processing Scripts**

Pros:
- Fixes propagate through all output files
- More "correct" approach

Cons:
- Requires rerunning entire pipeline (01- through 06-)
- More complex changes
- Higher risk of introducing new issues
- Overkill for 34 instances

## SQL Fix Commands

```sql
-- Axe → Axé (8 instances)
UPDATE groups SET name = REPLACE(name, 'Axe Capoeira', 'Axé Capoeira') WHERE name LIKE '%Axe Capoeira%';
UPDATE groups SET name = REPLACE(name, 'Axe Richmond', 'Axé Richmond') WHERE name = 'Axe Richmond';
UPDATE groups SET name = REPLACE(name, 'AXE Capoeira', 'AXÉ Capoeira') WHERE name LIKE '%AXE Capoeira%';
UPDATE groups SET name = REPLACE(name, 'Grupo Axe Capoeira', 'Grupo Axé Capoeira') WHERE name LIKE '%Grupo Axe Capoeira%';

-- Cordao → Cordão (11 instances)
UPDATE groups SET name = REPLACE(name, 'Cordao de Ouro', 'Cordão de Ouro') WHERE name LIKE '%Cordao de Ouro%';

-- Mao no Chao → Mão no Chão (4 instances)
UPDATE groups SET name = REPLACE(name, 'Mao no Chao', 'Mão no Chão') WHERE name LIKE '%Mao no Chao%';

-- Associacao → Associação (3 instances)
UPDATE groups SET name = REPLACE(name, 'Associacao', 'Associação') WHERE name LIKE '%Associacao%';

-- Sao Jose → São José (1 instance)
UPDATE groups SET name = REPLACE(name, 'Sao Jose', 'São José') WHERE name LIKE '%Sao Jose%';

-- Resistencia → Resistência (1 instance)
UPDATE groups SET name = 'Capoeira Resistência' WHERE name = 'Capoeira Resistencia';

-- Expressao → Expressão (1 instance)
UPDATE groups SET name = 'Com Expressão' WHERE name = 'Com Expressao';
```

## Search & Replace for SQL File

For direct file editing:

```bash
# Backup first
cp out/import-groups.sql out/import-groups.sql.backup

# Apply fixes
sed -i '' "s/Axe Capoeira/Axé Capoeira/g" out/import-groups.sql
sed -i '' "s/AXE Capoeira/AXÉ Capoeira/g" out/import-groups.sql
sed -i '' "s/Axe Richmond/Axé Richmond/g" out/import-groups.sql
sed -i '' "s/Cordao de Ouro/Cordão de Ouro/g" out/import-groups.sql
sed -i '' "s/Mao no Chao/Mão no Chão/g" out/import-groups.sql
sed -i '' "s/Associacao/Associação/g" out/import-groups.sql
sed -i '' "s/Sao Jose/São José/g" out/import-groups.sql
sed -i '' "s/Capoeira Resistencia/Capoeira Resistência/g" out/import-groups.sql
sed -i '' "s/Com Expressao/Com Expressão/g" out/import-groups.sql

# Verify changes
diff out/import-groups.sql.backup out/import-groups.sql
```

## Conclusion

**Total: 34 groups with encoding issues**

Given the small number (34 out of 236 groups = 14%), **fixing directly in the SQL file is the most pragmatic approach**. The issues stem from the original source data, not from the processing pipeline.

**Recommendation**: Apply the search & replace commands to `out/import-groups.sql` and verify the changes.
