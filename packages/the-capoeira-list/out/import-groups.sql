-- Capoeira Groups Import SQL
-- Generated: 2025-11-14T23:59:36.873Z
-- Source: The Capoeira List (http://home.znet.com/capoeira_list/)

BEGIN;

-- Batch: batch-01.json (35 groups)

-- Group: Capoeira Cordão de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2bd28679-399c-43dc-8fa4-18fb341eb32d', NOW(), NOW(), 'Capoeira Cordão de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Manhoso (Van Robbins)
Notes: SOURCE: website facebook. 8/3/18', 'smithmr75@gmail.com', '[{"type":"website","url":"http://a2capoeira.wixsite.com/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ef57ecef-f3eb-4b0b-bc5c-cca3f336aef0', '2bd28679-399c-43dc-8fa4-18fb341eb32d', 'Trotter Multicultural Center', 'Schedule: Wed & Thurs 6:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-83.7100389,42.2942142]},"properties":{"address":"University of Michigan","displayName":"University of Michigan, 500, South State Street, Old Fourth Ward, Ann Arbor, Washtenaw County, Michigan, 48109, United States of America","country_code":"US","boundingBox":[42.242226,42.3125148,-83.7502236,-83.6649743]}}'::jsonb);

-- Group: Axé Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('be54c8ef-0dd8-4bd3-811a-f0560a4589ef', NOW(), NOW(), 'Axé Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Catatau (Bayu Wicaksono)
Main Contact: - 240-281-7828
Notes: under the guidance of instrutor Bambu[Chicago]. SOURCE. website / 3/30/18', 'axemaryland@gmail.com', '[{"type":"website","url":"http://www.axemaryland.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e2d71744-c56d-4cc2-9f4a-0da464c5d2e6', 'be54c8ef-0dd8-4bd3-811a-f0560a4589ef', 'Anne Arundel Community College', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.5171673,39.0491168]},"properties":{"address":"101 College Parkway, Arnold, MD 21012-1895","displayName":"Dr. Martin Luther King, Jr. Memorial, 101, College Parkway, College Station, Arnold, Anne Arundel County, Maryland, 21012, United States of America","country_code":"US","boundingBox":[39.0490668,39.0491668,-76.5172173,-76.5171173]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a70af100-32f7-4748-a2c7-8f1efe45951e', 'be54c8ef-0dd8-4bd3-811a-f0560a4589ef', 'Wulin Institute', 'Phone: 240-281-7828', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.6127958,39.1814379]},"properties":{"address":"7164 E Furnace Branch Road, Glen Burnie, MD 21061","displayName":"7164, East Furnace Branch Road, Furnace Branch, Rippling Ridge, Glen Burnie, Anne Arundel County, Maryland, 21060, United States of America","country_code":"US","boundingBox":[39.1813879,39.1814879,-76.6128458,-76.6127458]}}'::jsonb);

-- Group: Capoeria Karkara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a451a4a3-d66d-42ee-9455-c0c727fd5a3e', NOW(), NOW(), 'Capoeria Karkara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMADO Band-aid (Matt Strobel)
Main Contact: - [202] 368-5325
Notes: Charles County, Waldorf. SOURCE: websites 5/15/18', 'formadobandaid@gmail.com', '[{"type":"website","url":"http://capoeirakarkara.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1c2cb5e0-f340-42bb-9787-90af3c5ea332', 'a451a4a3-d66d-42ee-9455-c0c727fd5a3e', 'The Studio Cooperative', 'Schedule: (See website for schedule)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.9106581,38.6263882]},"properties":{"address":"Waldorf, MD 20603","displayName":"Waldorf, Charles County, Maryland, 20601, United States of America","country_code":"US","boundingBox":[38.4663882,38.7863882,-77.0706581,-76.7506581]}}'::jsonb);

-- Group: FICA
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a69b142a-b603-40f8-a59a-5d5da60d9f6a', NOW(), NOW(), 'FICA', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE BabaJan (Livaldi da Cruz)
Main Contact: - 301.704.4703
Notes: Prince George''s County, Hyattsville, Capital Heights. SOURCE: website 5/16/18', 'sambatrovao@gmail.com', '[{"type":"website","url":"https://www.sambatrovao.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8746490c-d34a-433f-915c-d59abe5b4996', 'a69b142a-b603-40f8-a59a-5d5da60d9f6a', 'Espaço Cultural Samba Trovão', 'Schedule: Ages 14- up: Mon & Wed 7:00 - 9:00pm; Sat11:00am-1:00pm; Ages 5 - 13: Tues & Thurs 6:00pm - 7:00pm; Sat 10:00- 11:00am; Ages 5-under with parents:(3 families needed for class to started)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.9411874,38.953644]},"properties":{"address":"4318 Hamilton Street, Hyattsville 20781","displayName":"180 Degree Club, 4318, Hamilton Street, Ellaville, Hyattsville, Prince George''s County, Maryland, 20781, United States of America","country_code":"US","boundingBox":[38.953594,38.953694,-76.9412374,-76.9411374]}}'::jsonb);

-- Group: Capoeira Barro Vermelho
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d3918452-68c8-4f5e-bf67-dbe471f17080', NOW(), NOW(), 'Capoeira Barro Vermelho', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Bomba
Main Contact: - +1 [202] 838-3907
Notes: Montgomery County. Mail: 4103 18th St., NW Washington, DC 20011. SOURCE: website 5/19/18', 'bombabahia@gmail.com', '[{"type":"website","url":"http://www.capoeirafitnessdc.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ecfeb17c-1ef0-4f2e-9f0e-1889d9c9e61f', 'd3918452-68c8-4f5e-bf67-dbe471f17080', 'Brookmont Church', 'Schedule: Ages 4-6 : Mon 4:00-4:40 pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0942447,38.9846816]},"properties":{"address":"Bethesda, MD 20816","displayName":"Bethesda, Montgomery County, Maryland, 22814, United States of America","country_code":"US","boundingBox":[38.8246816,39.1446816,-77.2542447,-76.9342447]}}'::jsonb);

-- Group: Abadá Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c7a420d4-eae5-479d-a284-637c58262eb5', NOW(), NOW(), 'Abadá Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Yara (Yara Cordeiro)
Main Contact: - 301-947-5806
Notes: SOURCE: website 11/30/19', 'info@abadadc.org', '[{"type":"website","url":"http://abadadc.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1cf16623-9b8e-435a-ac28-525e6c926805', 'c7a420d4-eae5-479d-a284-637c58262eb5', 'Rendevouz Social Dance Studio', 'Schedule: Children: Tues & Thurs 5:30 – 6:30 pm; Sat 1:00-2:00pm; Adolescents / Adults:: Tues & Thurs7:30 – 9:00; Sat 2:00 – 3:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.1013265,39.0477777]},"properties":{"address":"11910 Parklawn Drive, Rockville, Maryland","displayName":"Maryland School of Dance, 11711, Parklawn Drive, Nebel District, Rockville, Montgomery County, Maryland, 20852, United States of America","country_code":"US","boundingBox":[39.0477277,39.0478277,-77.1013765,-77.1012765]}}'::jsonb);

-- Group: Grupo De Capoeira São José Dos Carpinteiros
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b0666513-fdfd-4cdb-9844-0ebff2a91d07', NOW(), NOW(), 'Grupo De Capoeira São José Dos Carpinteiros', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUCTOR Polaco
Main Contact: - 0772 390 9107
Notes: Berkshire. SOURCE: website 11/3/16', NULL, '[{"type":"website","url":"https://sites.google.com/site/capoeirareading/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('187a250b-657d-4e74-9b82-c6f0457c27fb', 'b0666513-fdfd-4cdb-9844-0ebff2a91d07', 'St Lukes Church Hall', 'Schedule: Tues 6:30-8:00pm; Fri 8:00-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.9573367,51.45098]},"properties":{"address":"4 Erleigh Road Reading, Berkshire RG1 5LH","displayName":"Erleigh Road, Newtown, Reading, England, RG1 5DG, United Kingdom","country_code":"GB","boundingBox":[51.4509332,51.4510269,-0.9574326,-0.9572408]}}'::jsonb);

-- Group: Capoeira UK - Capoeira Senzala de Santos
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('87c2b6fa-f934-46b0-ab41-bd4b92170ffa', NOW(), NOW(), 'Capoeira UK - Capoeira Senzala de Santos', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUCTOR Michel Neves
Main Contact: - 01628 672256, 07905 463 145
Notes: Berkshire. under Mestre Sombra "Roberto Teles de Oliveira" [Sao Paulo, Brazil]. (The information above is still on the website.. However the class information page has no content, and the information below is not currently on the website. We have kept it listed since it is possible, although very unlikely, that it is still valid. Please contact us 11/3/16). SOURCE: website 5/18/11', 'capoeirauk@hotmail.com', '[{"type":"website","url":"http://www.capoeirauk.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ede2ecc1-fd1f-4dcb-a303-82aac044d317', '87c2b6fa-f934-46b0-ab41-bd4b92170ffa', 'WRVS York Center', 'Schedule: Tues 7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.7173796,51.5210868]},"properties":{"address":"42 York Road Maidenhead SL6 1SH","displayName":"York Road, Fishery, Maidenhead, Windsor and Maidenhead, England, SL6 1LF, United Kingdom","country_code":"GB","boundingBox":[51.5210031,51.5211595,-0.7178091,-0.7169481]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d383b1db-f305-47e8-82d8-303c858d0f1a', '87c2b6fa-f934-46b0-ab41-bd4b92170ffa', 'Windor Leisure Center', 'Schedule: Fri 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.6040419,51.4837886]},"properties":{"address":"Windsor, Berkshire, SL4 5JB, UK","displayName":"Windsor Castle, West Steps, Clewer New Town, Clewer Village, Windsor, Windsor and Maidenhead, England, SL4 1PR, United Kingdom","country_code":"GB","boundingBox":[51.4828451,51.484747,-0.608327,-0.5999439]}}'::jsonb);

-- Group: Cordão de Ouro, Birmingham Brazilian Cultural Centre
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2653c88b-62ee-4e9f-b9ac-954e4030d33e', NOW(), NOW(), 'Cordão de Ouro, Birmingham Brazilian Cultural Centre', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Mascote (Samuel Mascote)
Main Contact: - +44 [0] 7812 99 17 69
Notes: West Midlands, Birmingham, Leamington Spa, Coventry, Wolverhampton. SOURCE: website 11/7/16', 'info.cdob@gmail.com', '[{"type":"website","url":"http://www.cdob.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('97e00ef9-e6f7-4039-ab99-1771ff34caab', '2653c88b-62ee-4e9f-b9ac-954e4030d33e', 'Arch 32 Water Street', 'Schedule: Beginners: Mon 7:00-9:00pm; All Levels: Tues, Wed, & Fri 7:00-8:30pm; Kids: Tues & Thurs 5:00-6:00pm; Acrobatics: Tues 8:30-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.902412,52.4859021]},"properties":{"address":"Arch 32 Water Street, Birmingham B3 1HL","displayName":"The Barrel Store by Attic, Water Street, Jewellery Quarter, Birmingham, West Midlands, England, B3 1HL, United Kingdom","country_code":"GB","boundingBox":[52.4858521,52.4859521,-1.902462,-1.902362]}}'::jsonb);

-- Group: Birmingham University Capoeira Society - Grupo Uniao na Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ab6954b5-9c5e-41b6-ace5-c00ab7f70105', NOW(), NOW(), 'Birmingham University Capoeira Society - Grupo Uniao na Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: West Midlands. SOURCE: website 11/21/16', NULL, '[{"type":"website","url":"http://capsoc.wixsite.com/capsoc"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('92ad6bcf-365e-450e-adab-0513c8ea2d20', 'ab6954b5-9c5e-41b6-ace5-c00ab7f70105', 'Lecture Room 5, The Arts Building', 'Schedule: Movements: Tues & Thurs 6:30- 8:30pm; Music & Roda: Fri 6:30- 8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.9286195,52.446975]},"properties":{"address":"Bristol Rd, Birmingham, B15 2TT, UK","displayName":"Bristol Road, Bournbrook, Metchley, Birmingham, West Midlands, England, B29 7BQ, United Kingdom","country_code":"GB","boundingBox":[52.4469305,52.4469927,-1.9286846,-1.928542]}}'::jsonb);

-- Group: Capoeira Volta ao Mundo
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9ab895b0-803b-498d-8337-57c5750d5bb0', NOW(), NOW(), 'Capoeira Volta ao Mundo', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: SOURCE: webpage 9/16/17', NULL, '[{"type":"website","url":"https://www.capovam.com/locations/lakewood-ranch/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b245834d-4ba8-4945-8e18-ae55dc4879e6', '9ab895b0-803b-498d-8337-57c5750d5bb0', 'Lakewood Ranch location', 'Schedule: Full schedule of classes', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.4269007,27.430912]},"properties":{"address":"11534 Palmbrush Trail Lakewood Ranch, FL 34202","displayName":"11534, Palmbrush Trail, Summerfield, Lakewood Ranch, Manatee County, Florida, 34202, United States of America","country_code":"US","boundingBox":[27.430862,27.430962,-82.4269507,-82.4268507]}}'::jsonb);

-- Group: Capo Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('84b9285f-3b83-4109-a5bb-ed99a96f9596', NOW(), NOW(), 'Capo Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Mangueria
Main Contact: - [954] 755-9424
Notes: SOURCE: website 10/11/17', 'info@capo.rocks', '[{"type":"website","url":"http://www.capocapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('56d2a8f3-dc53-4da0-be7a-6ae7b82b5c1e', '84b9285f-3b83-4109-a5bb-ed99a96f9596', 'Coral Springs location', 'Schedule: Full schedule of classes for kids and adults', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.2360823,26.2869178]},"properties":{"address":"8256 Wiles Road, Coral Springs FL 33067","displayName":"8256, Wiles Road, Coral Springs, Broward County, Florida, 33067, United States of America","country_code":"US","boundingBox":[26.2868678,26.2869678,-80.2361323,-80.2360323]}}'::jsonb);

-- Group: Grupo Capoeira Males
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d901ae85-409f-44af-8923-3f6203b631c7', NOW(), NOW(), 'Grupo Capoeira Males', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Lua Branca
Main Contact: Camarao - [647] 283-0462
Notes: Contra Mestre Lua Branca is based in Toronto. SOURCE: website 3/18/17', 'camarao_capoeira@hotmail.com', '[{"type":"website","url":"http://capoeiraschool.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fd1d53e6-4a7c-4b46-9e7f-429ebef8134b', 'd901ae85-409f-44af-8923-3f6203b631c7', 'Sidekicks School of Martial Arts', 'Schedule: Mon 8:00-9:30pm; Wed. 7:30pm - 9:00pm; Sat. 12:30pm - 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.7860267,43.3379312]},"properties":{"address":"2421 New Street, Burlington, Ontario","displayName":"2421, New Street, Roseland, Burlington, Halton Region, Golden Horseshoe, Ontario, L7R 1J6, Canada","country_code":"CA","boundingBox":[43.3378812,43.3379812,-79.7860767,-79.7859767]}}'::jsonb);

-- Group: Capoeira Ache Brasil Calgary
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5291ad9f-8227-4479-8834-b7eedad10cc8', NOW(), NOW(), 'Capoeira Ache Brasil Calgary', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Manteiga (Mike Darling)
Main Contact: Manteiga - 403-808-6924
Notes: Instrutor Manteiga and Monitor Suassuna under Mestre Eclilson De Jesus [Vancouver]. Calgary location. SOURCES: website 3/18/17', 'info@capoeiraabc.com', '[{"type":"website","url":"https://capoeiraabc.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('10eea8e1-1d2d-4add-9962-a22b8aac3ddc', '5291ad9f-8227-4479-8834-b7eedad10cc8', 'Capoeira Ache Brasil Calgary', 'Schedule: Beginner Class: Mon 6:15pm-7:15pm; Intermediate Class: Wed & Fri 7:00pm-8:30pm; Advanced Class: Mon 7:15pm-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-114.0520169,51.0866044]},"properties":{"address":"3811 Edmonton Trail NE, Calgary, Alberta, T2E 8J9","displayName":"Next 2 New, 3811, Edmonton Trail NE, Greenview Industrial, Calgary, Alberta, T2E 8J9, Canada","country_code":"CA","boundingBox":[51.0865544,51.0866544,-114.0520669,-114.0519669]}}'::jsonb);

-- Group: ASCAB Capoeira Chico
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d93559a6-9a53-4c60-ac07-25024ebb9fe9', NOW(), NOW(), 'ASCAB Capoeira Chico', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMADO Pato (Mason Rapacz)
Main Contact: Formado Pato - [928] 600-9189
Notes: Chico, California (Butte County). Formado Pato (Mason Rapacz). SOURCE: website 6/11/18', 'ascabpato@gmail.com', '[{"type":"website","url":"https://www.ascabcapoeirachico.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5e91839c-3f6a-48fb-8ac5-5f8ed17b2852', 'd93559a6-9a53-4c60-ac07-25024ebb9fe9', 'ASCAB Capoeira Chico', 'Schedule: Kids: Mon 7:00-8:00pm; Adults Training: Mon 8:00-9:00pm; Adults Beginner: Tues & Fri 10:00am-12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-121.8378071,39.7414152]},"properties":{"address":"1108 Mangrove Ave, Chico, California 95926","displayName":"1108, Mangrove Avenue, Chico, Butte County, California, 95926, United States of America","country_code":"US","boundingBox":[39.7413652,39.7414652,-121.8378571,-121.8377571]}}'::jsonb);

-- Group: Capoeira Brasil East Bay - Richmond
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('69cbd4d0-86cd-42d5-bf08-0c8d364f6141', NOW(), NOW(), 'Capoeira Brasil East Bay - Richmond', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Sagui
Main Contact: - 646-265-8800
Notes: Richmond, California (Contra Costa County). Instrutor Sagui. SOURCE: website 12/3/16', 'capoeastbay@gmail.com', '[{"type":"website","url":"http://www.capoeirabrasileastbay.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('07ac8d97-e94c-4548-a808-1fd9e6476f6d', '69cbd4d0-86cd-42d5-bf08-0c8d364f6141', 'Capoeira Brasil Richmond', 'Schedule: Wed 8:00-9:30pm; Sat 12:30-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3237358,37.9317796]},"properties":{"address":"4820 Bissell Ave, Richmond CA","displayName":"4820, Bissell Avenue, Richmond, Contra Costa County, California, 94805, United States of America","country_code":"US","boundingBox":[37.9317296,37.9318296,-122.3237858,-122.3236858]}}'::jsonb);

-- Group: Capoeira Omulu - Walnut Creek
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0a36a3a7-ac09-411c-9176-c7e2951ccdbc', NOW(), NOW(), 'Capoeira Omulu - Walnut Creek', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Preguica
Main Contact: Instructor Uri - 415-834-8135
Notes: Walnut Creek, California (Contra Costa County). Instructor Uri under Mestre Preguica. SOURCE: website 12/12/16', 'wccapoeira@gmail.com', '[{"type":"website","url":"http://www.wcomulucapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('41724505-0b7c-492d-9fd9-025c0b1028c7', '0a36a3a7-ac09-411c-9176-c7e2951ccdbc', 'Epic Martial Arts', 'Schedule: Children ages 4-7: Sat 12:00-12:40pm; Thurs 3:00-3:40pm; Kids ages 8-13: Sun 9:30-10:30am; Tues 3:00-3:50am; Adults: Tues 8:10-9:30pm Fri 7:00-8:30pm; Sun 10:30am - 12:00pm; Teens: ages 15+: Sat 12:00-1:00pm (Schedule subject to change)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.0680205,37.8970181]},"properties":{"address":"2029 Mt. Diablo Blvd. Walnut Creek, CA 94596","displayName":"2029, Mount Diablo Boulevard, Walnut Creek, Contra Costa County, California, 94596, United States of America","country_code":"US","boundingBox":[37.8969681,37.8970681,-122.0680705,-122.0679705]}}'::jsonb);

-- Group: Omulu Capoeira Concord
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bd6e71cf-abdc-4694-88b9-ea3d99f6477a', NOW(), NOW(), 'Omulu Capoeira Concord', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Espantalho (Eugene King)
Main Contact: Professor Espantalho - [925] 408-6052
Notes: Concord, California (Contra Costa County). Professor Espantalho (Eugene King). SOURCE: website 12/13/16', NULL, '[{"type":"website","url":"https://concordcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('52b312f8-c988-43e3-a75c-b8cefda7ba84', 'bd6e71cf-abdc-4694-88b9-ea3d99f6477a', 'UFC Gym', 'Schedule: Wed 6:00-7:00pm; Sat 12:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.0566118,37.9690949]},"properties":{"address":"1975 Diamond Blvd, Concord, CA","displayName":"Half Price Books, 1975, Diamond Boulevard, Willows Shopping Center, The Veranda Shopping Center, Concord, Contra Costa County, California, 94520, United States of America","country_code":"US","boundingBox":[37.9690449,37.9691449,-122.0566618,-122.0565618]}}'::jsonb);

-- Group: Capoeira Besouro - Los Angeles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('373e5acf-d247-42a7-9b98-bee85e2087d6', NOW(), NOW(), 'Capoeira Besouro - Los Angeles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Batata
Main Contact: Mestre Batata - [310] 709-9409
Notes: Santa Monica, Los Angeles, California (Los Angeles County). Mestre Batata. Instrutor Cabeca de Coco (Steve Williams) 951-662-5434. Please contact us 6/8/17. SOURCE: websites 6/8/17, capoeira.com personal message 8/7/09', 'mestrebatata@capoeirabesouro.com', '[{"type":"website","url":"http://www.capoeirabesouro.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c43fcfc1-2c5d-4451-8b32-d3d75deb9b11', '373e5acf-d247-42a7-9b98-bee85e2087d6', 'Capoeira Besouro', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.4546257,34.0200815]},"properties":{"address":"2901 Ocean Park Blvd. Santa Monica, CA 90405","displayName":"Subway, 2901, Ocean Park Boulevard, Santa Monica, Los Angeles County, California, 90405, United States of America","country_code":"US","boundingBox":[34.0200315,34.0201315,-118.4546757,-118.4545757]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2009bb46-cdbb-470b-b0c7-c60befcd75c9', '373e5acf-d247-42a7-9b98-bee85e2087d6', 'Ginga Arts - EXPO Center', 'Phone: [310] 709-2797
Email: info@gingaarts.org', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.2893793,33.9138537]},"properties":{"address":"3980 S. Menlo Ave, Los Angeles, CA 90037","displayName":"South Menlo Avenue, Los Angeles, Los Angeles County, California, 90247, United States of America","country_code":"US","boundingBox":[33.9112767,33.9164307,-118.2893893,-118.2893653]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b9881213-0b9d-4870-924b-52b60895a73d', '373e5acf-d247-42a7-9b98-bee85e2087d6', 'Accelerated Charter Elementary School', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.2731179,34.0149806]},"properties":{"address":"119 E. 37th Street, Los Angeles, CA 90011","displayName":"119, East 37th Street, Jefferson, Historic South-Central, Los Angeles, Los Angeles County, California, 90011, United States of America","country_code":"US","boundingBox":[34.0149306,34.0150306,-118.2731679,-118.2730679]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e6921966-146d-485a-b049-5fed8f40d788', '373e5acf-d247-42a7-9b98-bee85e2087d6', 'Mar Vista Family Center', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.397968,33.9890247]},"properties":{"address":"5075 S Slauson Ave, Culver City, CA 90230","displayName":"Slauson Avenue, Fox Hills, Culver City, Los Angeles County, California, 90056, United States of America","country_code":"US","boundingBox":[33.988905,33.9891359,-118.398532,-118.3974058]}}'::jsonb);

-- Group: Capoeira Batuque - Los Angeles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1af9aa3a-3d81-4d85-b79d-149acc057279', NOW(), NOW(), 'Capoeira Batuque - Los Angeles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Amen
Notes: Los Angeles, California (Los Angeles County). Mestre Amen. Multiple instructors. SOURCE: facebook 6/13/17, website 6/13/17, website 3/25/16, website 6/15/17, website 7/22/17', NULL, '[{"type":"website","url":"http://capoeirabatuque.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('81a21e2d-3ade-4c76-bae4-21bbc3a15438', '1af9aa3a-3d81-4d85-b79d-149acc057279', 'Brasil Brasil Cultural Center', 'Schedule: (Full schedule of classes)
Phone: 310-397-3667
Email: bbcc@brasilbrasil.org', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.3168307,34.0399971]},"properties":{"address":"2453 Washington Blvd. Los Angeles, Ca 90066","displayName":"2453, West Washington Boulevard, Arlington Heights, Los Angeles, Los Angeles County, California, 90018, United States of America","country_code":"US","boundingBox":[34.0399471,34.0400471,-118.3168807,-118.3167807]}}'::jsonb);

-- Group: Capoeira Brasil - Los Angeles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2aebf8f5-e10d-47d6-a54e-144356ee875f', NOW(), NOW(), 'Capoeira Brasil - Los Angeles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Boneco
Main Contact: Mestre Boneco - 323.935.2224
Notes: Los Angeles, California (Los Angeles County). Mestre Boneco. Multiple locations and instructors. SOURCE: websites 6/15/17', 'capoeirabrasil@gmail.com', '[{"type":"website","url":"http://www.capoeirabrasil.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fa24c969-8e22-449b-a6f7-7b661c10c46b', '2aebf8f5-e10d-47d6-a54e-144356ee875f', 'Capoeira Brasil Los Angeles', 'Schedule: (Full schedule of classes at this location for adults and children)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.3173567,34.0399132]},"properties":{"address":"5557 Washington Blvd, Los Angeles, 90016","displayName":"West Washington Boulevard, Arlington Heights, Los Angeles, Los Angeles County, California, 90016, United States of America","country_code":"US","boundingBox":[34.039911,34.0399154,-118.3177032,-118.3170101]}}'::jsonb);

-- Group: ArteLuta Capoeira Academy
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('50c97029-5334-49ca-8162-d51e53d98994', NOW(), NOW(), 'ArteLuta Capoeira Academy', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Varal (Luiz Otavio Pereira)
Main Contact: Contra-Mestre Varal - 1 [310] 947-4015
Notes: Lomita, California (Los Angeles County). Contra-Mestre Varal (Luiz Otavio Pereira). SOURCE: website 7/10/17', 'artelutacapoeira@gmail.com', '[{"type":"website","url":"http://www.artelutacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fb8a2886-037c-4a76-8d67-a5a3c7cda8f9', '50c97029-5334-49ca-8162-d51e53d98994', 'ArteLuta Capoeira Academy', 'Schedule: (Full schedule of classes)
Phone: [213] 344-9435', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.3194981,33.8058776]},"properties":{"address":"24100 Narbonne Avenue, Lomita, CA 90717","displayName":"24100, Narbonne Avenue, Lomita, Los Angeles County, California, 90717, United States of America","country_code":"US","boundingBox":[33.8057466,33.8062214,-118.3198108,-118.3194013]}}'::jsonb);

-- Group: Senavox Academy - Afro Brazilian Capoeira Association-Los Angeles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('dd850c58-1e66-4bd7-b51b-028f0f4961d9', NOW(), NOW(), 'Senavox Academy - Afro Brazilian Capoeira Association-Los Angeles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Holofote (Alex Rand)
Main Contact: Professor Holofote - 310.752.3775
Notes: Los Angeles, California (Los Angeles County). Professor Holofote (Alex Rand) under the vision and guidance of Mestre Yoji Senna [Minneapolis]. SOURCE: facebook website 7/10/17', 'am.rand@hotmail.com', '[{"type":"website","url":"http://www.abcapoeira.com/home/losangeles"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7cea817c-dd60-406b-924a-8ae6752c83b3', 'dd850c58-1e66-4bd7-b51b-028f0f4961d9', 'D.C Dance Center', 'Schedule: Tues 6:00-8:00pm; Thurs; Sat', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.4658692,34.0395204]},"properties":{"address":"12422 Santa Monica Blvd, Los Angeles, California","displayName":"12422, Santa Monica Boulevard, Sawtelle, Los Angeles, Los Angeles County, California, 90025, United States of America","country_code":"US","boundingBox":[34.0394704,34.0395704,-118.4659192,-118.4658192]}}'::jsonb);

-- Group: Grupo Negaça Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d2530922-1d11-48c7-9240-cae5d66d79bf', NOW(), NOW(), 'Grupo Negaça Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chitaozinho
Notes: SOURCE: website 11/8/16', 'negaca@capoeiracambridge.co.uk', '[{"type":"website","url":"http://www.capoeiracambridge.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9a1d1c90-387b-43c9-8d9d-38959ded85af', 'd2530922-1d11-48c7-9240-cae5d66d79bf', 'Arbury Community Centre', 'Schedule: General Level Class Adults: Tues 7:00-8:00pm, £5', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.1289179,52.2266913]},"properties":{"address":"Campkin Rd, Cambridge, CB4 2LD","displayName":"Campkin Road, Chesterton, Cambridge, Cambridgeshire, Cambridgeshire and Peterborough, England, CB4 2LD, United Kingdom","country_code":"GB","boundingBox":[52.2259266,52.2274753,0.1275557,0.1302669]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3ffd1d0f-065d-452d-abf6-d9c86818dc0a', 'd2530922-1d11-48c7-9240-cae5d66d79bf', '28th Scout Hut', 'Schedule: General Level Class Adults: Thurs 7:00-8:30pm; Children Class [6 to 10 years]: Fri 6:15-7:00pm; Children Class [11 to 15 years]: Fri 7:05-8:00pm
Email: enganosa.gnc@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.1186637,52.2055314]},"properties":{"address":"Cambridge, CB1 3QU, UK","displayName":"Cambridge, Cambridgeshire, Cambridgeshire and Peterborough, England, United Kingdom","country_code":"GB","boundingBox":[52.1579417,52.2372296,0.0686389,0.184552]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2dee221b-3a5e-4f85-ba9c-0eea2bd3e233', 'd2530922-1d11-48c7-9240-cae5d66d79bf', 'Stapleford Pavillion', 'Schedule: Children Class [6 to 12 years]: Fri 6:00-7:00pm
Email: manuela.gnc@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.1628,52.1389]},"properties":{"address":"69 Gog Magog Way, Cambridge CB22 5BQ","displayName":"69 Gog Magog Way, Stapleford, Cambridge CB22 5BQ, United Kingdom","country_code":"us"}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('76528661-a660-4c46-a3b0-537ae10ff10b', 'd2530922-1d11-48c7-9240-cae5d66d79bf', 'Golden Acre Community Centre', 'Schedule: Children Class [6 to 12 years]: Wed 6:30-7:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.2450889,52.0100723]},"properties":{"address":"Long Horse Croft, Saffron Walden, CB11 4BL","displayName":"Longhorse Croft, Pleasant Valley, Saffron Walden, Uttlesford, Essex, England, CB11 4BL, United Kingdom","country_code":"GB","boundingBox":[52.0098192,52.0106175,0.2447218,0.2463543]}}'::jsonb);

-- Group: Capoeira Ache Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('186bcb79-cf2d-42bc-b746-f537d16b74b9', NOW(), NOW(), 'Capoeira Ache Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: (Julie Budgen)
Main Contact: Julie Budgen - 403.609.2019
Notes: Under Mestre Eclison de Jesus [Vancouver]. SOURCE: website 3/19/17 information not changed since Feb 20, 2011', 'jbudgen@corvidaeenv.com', '[{"type":"website","url":"http://achebrasil.ca"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b5ca2ceb-08fe-4b8d-89c1-daee6e8e3ee0', '186bcb79-cf2d-42bc-b746-f537d16b74b9', 'LifeWorks', 'Schedule: Tues & Thurs 5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-115.3587906,51.094582]},"properties":{"address":"1412 Railway Ave, Canmore AB","displayName":"Railway Avenue, Railway, Palliser, Canmore, Town of Canmore, Alberta, T1W 1P6, Canada","country_code":"CA","boundingBox":[51.0932763,51.095891,-115.3589476,-115.3586444]}}'::jsonb);

-- Group: Gingarte Capoeira - Capoeira Cordão de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0313d66b-6791-49d1-8189-f2f455887f9d', NOW(), NOW(), 'Gingarte Capoeira - Capoeira Cordão de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRA Marisa (Marisa Cordeiro)
Main Contact: Mestra Marisa - 3l2-768-85O7
Notes: Chicago, Illinois. Mestra Marisa (Marisa Cordeiro). SOURCE: website 2/18/18', 'info@gingartecapoeira.org', '[{"type":"website","url":"http://gingartecapoeira.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('eab2bc84-5367-43d1-8efa-74ab0b2ab87a', '0313d66b-6791-49d1-8189-f2f455887f9d', 'Ruth Page Center of the Arts', 'Schedule: Tues & Thurs 7:00-9:00pm; Sun 11:00am-1:00pm; Ages 3-12: (see website)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6303341,41.901191]},"properties":{"address":"1016 North Dearborn Street Chicago IL","displayName":"Ruth Page Foundation School of Dance, 1016, North Dearborn Street, Gold Coast, Near North Side, Chicago, North Chicago Township, Cook County, Illinois, 60610, United States of America","country_code":"US","boundingBox":[41.9011048,41.9012772,-87.6306064,-87.6300626]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('eabba577-b2ab-42f6-8d1a-48d96c4c3bb8', '0313d66b-6791-49d1-8189-f2f455887f9d', 'Old Town School of Folk Music', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6845671,41.9623325]},"properties":{"address":"4454 N. Lincoln Avenue Chicago IL","displayName":"4454, North Lincoln Avenue, Ravenswood, Lincoln Square, Chicago, Lake View Township, Cook County, Illinois, 60625, United States of America","country_code":"US","boundingBox":[41.9622825,41.9623825,-87.6846171,-87.6845171]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7af0ff6a-15f3-4717-91ef-74c8377a23f6', '0313d66b-6791-49d1-8189-f2f455887f9d', 'University of Chicago - Gingarte Capoeira Club', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.5956067,41.7882054]},"properties":{"address":"1212 E 59th St, Chicago, IL 60637","displayName":"Ida Noyes Hall, 1212, East 59th Street, Hyde Park, Chicago, Hyde Park Township, Cook County, Illinois, 60637, United States of America","country_code":"US","boundingBox":[41.7879373,41.7884615,-87.596028,-87.595122]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('46ddb7bd-befd-4e0d-8b46-1b5309a7c730', '0313d66b-6791-49d1-8189-f2f455887f9d', 'CombatZone', 'Email: info@risetrainingacademy.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6051711,41.7449954]},"properties":{"address":"8242 S Cottage Grove Ave, Chicago","displayName":"8242, South Cottage Grove Avenue, Avalon Highlands, Chatham, Chicago, Hyde Park Township, Cook County, Illinois, 60619, United States of America","country_code":"US","boundingBox":[41.7449454,41.7450454,-87.6052211,-87.6051211]}}'::jsonb);

-- Group: Capoeira Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('30de5afc-8a5c-48fa-a244-e575cd1c80d7', NOW(), NOW(), 'Capoeira Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMADA Colibri (Katia Da Conceicao)
Main Contact: Formada Colibri - [347] 952-6047
Notes: Chicago, Illinois. Formada Colibri (Katia Da Conceicao). SOURCE: website 2/23/18', 'katiacolibri@gmail.com', '[{"type":"website","url":"https://colibricb.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('07f0294a-c884-4a03-a9c3-d5399cfa2634', '30de5afc-8a5c-48fa-a244-e575cd1c80d7', 'Chicago Capoeira Center', 'Schedule: Beginners: Sun 3:00-4:00pm; Tues & Thurs 5:45-6:45pm; Kids[7-12] Sat 12:00-12:45pm; All levels: Sat 1:00-2:30; Sun 5:00-6:30pm; Mon & Wed 6:00-7:30pm; Mon & Wed 7:30-9:00pm; Music: Sun 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6752851,41.9579358]},"properties":{"address":"1802 W Berteau, Chicago, IL 60613","displayName":"1802, West Berteau Avenue, North Center, Chicago, Lake View Township, Cook County, Illinois, 60613, United States of America","country_code":"US","boundingBox":[41.9578858,41.9579858,-87.6753351,-87.6752351]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bc436b94-ae09-4dd5-9623-deee7c2f3dc0', '30de5afc-8a5c-48fa-a244-e575cd1c80d7', 'Japanese Culture Center', 'Schedule: All levels: Tues & Thurs 7;30-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.654907,41.9401365]},"properties":{"address":"1016 W. Belmont Ave, Chicago IL","displayName":"1016, West Belmont Avenue, Northalsted, Lake View, Chicago, Lake View Township, Cook County, Illinois, 60657, United States of America","country_code":"US","boundingBox":[41.9399913,41.9402931,-87.654953,-87.6548614]}}'::jsonb);

-- Group: Grupo Axé Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('90069c04-b600-4eaa-826d-0506f375e5a7', NOW(), NOW(), 'Grupo Axé Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Barrão
Main Contact: Professor Bambu (Steven Kolhouse) - [773] 368-4777
Notes: Chicago, Illinois. Professor Bambu (Steven Kolhouse), graduated student of Mestre Barrão [Vancouver]. SOURCE: website 2/18/18', NULL, '[{"type":"website","url":"http://axechicago.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bbbed7e8-970e-47d1-a77b-f3c715c2aac6', '90069c04-b600-4eaa-826d-0506f375e5a7', 'Axé Capoeira Academy', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6665595,41.8958657]},"properties":{"address":"1543 W Chicago Ave, Chicago, IL 60642","displayName":"1543, West Chicago Avenue, Noble Square, Chicago, West Chicago Township, Cook County, Illinois, 60622, United States of America","country_code":"US","boundingBox":[41.8957528,41.8959773,-87.6666066,-87.6665134]}}'::jsonb);

-- Group: Capoeira Camara Cork
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9661218c-f4ee-42f3-9bae-75b5a8d38757', NOW(), NOW(), 'Capoeira Camara Cork', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Curioso (Paulo Farinha)
Main Contact: Paulo Farinha - 087 171 2394
Notes: Under Mestre Bola. Mail: St Vincent''s Secondary School, St Mary''s Road, Blackpool, Cork, County Cork, Ireland. SOURCE: website 12/30/19', 'Paulo.Curioso@gmail.com', '[{"type":"website","url":"http://www.capoeiracork.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cf0bdd68-85c4-4414-8cd5-b745401c551a', '9661218c-f4ee-42f3-9bae-75b5a8d38757', 'Camara Studios', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-8.4734429,51.9096324]},"properties":{"address":"Watercourse Rd. Cork 00","displayName":"Watercourse Road, Blackpool, Farranferris A, Cork, County Cork, Munster, T23 V38R, Éire / Ireland","country_code":"IE","boundingBox":[51.9090836,51.9101958,-8.4735922,-8.4734355]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3eb721de-b50a-4e09-9a65-1feb24841842', '9661218c-f4ee-42f3-9bae-75b5a8d38757', 'St Vincent''s Secondary School', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-9.1145552,51.7240648]},"properties":{"address":"St Mary''s Road, Cork, Ireland","displayName":"St. Mary’s Road, Dunmanway North, West Cork, County Cork, Munster, P47 X259, Éire / Ireland","country_code":"IE","boundingBox":[51.723805,51.7243251,-9.1145754,-9.1145432]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b842ba41-4df0-46e9-b13b-64bd6aed8acb', '9661218c-f4ee-42f3-9bae-75b5a8d38757', 'Midleton Educate Together National School', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-8.1828232,51.9262485]},"properties":{"address":"Mill Road, Midleton, County Cork, Ireland","displayName":"Mill Road, Midleton Rural, The Municipal District of East Cork, County Cork, Munster, P25 YY72, Éire / Ireland","country_code":"IE","boundingBox":[51.9223531,51.9310009,-8.1843203,-8.1796103]}}'::jsonb);

-- Group: Axé Capoeira Comox
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('96745d5f-f121-45d7-8264-9407ed9f5840', NOW(), NOW(), 'Axé Capoeira Comox', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADA Alisha (Alicia Fennell)
Main Contact: - 250-898-7918
Notes: Under Mestre Barrao [Vancouver]. SOURCE: website 5/2/17', 'axecomox@hotmail.com', '[{"type":"website","url":"http://www.capoeiracomox.com/index.html"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e612ae24-df9f-4ad5-ab77-9fded37387f9', '96745d5f-f121-45d7-8264-9407ed9f5840', '5th street', 'Schedule: See Website for classes for Adults and Children', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-124.9963177,49.6918724]},"properties":{"address":"129 5th street, Courtenay, British Columbia","displayName":"Comox Valley Boxing Club, 129, 5th Street, Old Orchard, Courtenay, Comox Valley Regional District, British Columbia, V9N 2J5, Canada","country_code":"CA","boundingBox":[49.6918224,49.6919224,-124.9963677,-124.9962677]}}'::jsonb);

-- Group: Capoiera Luanda
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5e4b4715-4399-433d-a58d-cd012de1bada', NOW(), NOW(), 'Capoiera Luanda', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADO Vampiro (Slade Weidl)
Main Contact: - 720.275.7507
Notes: Under the Instruction and Supervision of Contramestre Esquilo Preto. SOURCE: website facebook 8/24/17', 'capoeiraluandadenver@gmail.com', '[{"type":"website","url":"http://www.capoeiradenver.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3f85763d-ebab-4f0d-997c-18d7cec48940', '5e4b4715-4399-433d-a58d-cd012de1bada', 'Qi Flow', 'Schedule: Mon & Wed 7:30-9:00pm; Fri 6:30-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.9499986,39.7697416]},"properties":{"address":"3827 Steele St Denver, CO 80205","displayName":"3827, Steele Street, Clayton, Denver, Colorado, 80205, United States of America","country_code":"US","boundingBox":[39.7696916,39.7697916,-104.9500486,-104.9499486]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('03c79c13-d9db-44e2-bc32-50ae0d15143a', '5e4b4715-4399-433d-a58d-cd012de1bada', 'Colorado New Style Dance', 'Schedule: Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.9918393,39.7247468]},"properties":{"address":"520 Cherokee St. Denver, CO 80204","displayName":"520, Cherokee Street, Baker, Denver, Colorado, 80204, United States of America","country_code":"US","boundingBox":[39.7246738,39.7247867,-104.9920391,-104.9916395]}}'::jsonb);

-- Group: Brazilian Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b20342b3-b37a-453c-aafa-56e5a7d24849', NOW(), NOW(), 'Brazilian Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 720-882-7809
Notes: The websites disagree on details. SOURCE: website 8/24/17', 'support@cap-denver.com', '[{"type":"website","url":"http://cap-denver.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6599575b-f6c9-4607-9914-3bf564683e70', 'b20342b3-b37a-453c-aafa-56e5a7d24849', 'E Evans Ave. Denver', 'Schedule: Mon-Thurs 5:45-7:30pm; Sat 10:00am-12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.9369999,39.6783683]},"properties":{"address":"4362 E Evans Ave. Denver, CO 80222","displayName":"4362, East Evans Avenue, University Hills, Denver, Colorado, 80222, United States of America","country_code":"US","boundingBox":[39.6783183,39.6784183,-104.9370499,-104.9369499]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5b490977-acbf-412e-85b0-a2cc2cf20731', 'b20342b3-b37a-453c-aafa-56e5a7d24849', 'Enshin Karate School', 'Schedule: Kids: Wed 6:00pm; Adult Beginners: Mon & Wed 7:00pm; Tues & Thurs 8:00pm; Intermediate: Wed 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.9135218,39.6785432]},"properties":{"address":"6441 E Evans Ave Denver CO","displayName":"6441, East Evans Avenue, Denver, Colorado, 80222, United States of America","country_code":"US","boundingBox":[39.6784932,39.6785932,-104.9135718,-104.9134718]}}'::jsonb);

-- Group: Roots Capoeira De Ouro - Cordão de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('dbffd51e-8fc3-4cbf-a01c-e97a025fac6c', NOW(), NOW(), 'Roots Capoeira De Ouro - Cordão de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 1-515-661-4556
Notes: Overseen by Mestre Chicote [Paris]. Monitora Caju "Rebecca Schleuger-Valadao", Graduada Dim Dim "Shalina Wallace", Graduado Piriquito "EJ Wallace". SOURCE: website 3/17/18', 'iowarootscapoeira@gmail.com', '[{"type":"website","url":"http://www.rootscapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9e748d49-d4f3-438e-be36-08cdbc644973', 'dbffd51e-8fc3-4cbf-a01c-e97a025fac6c', 'Grubb YMCA', 'Schedule: Children ages 4-11 years old: Thurs 5:30-6:30pm; Adults: Thurs 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-93.6317088,41.6079228]},"properties":{"address":"1611 11th St, Des Moines, IA 50314","displayName":"1611, 11th Street, Prospect Park, Des Moines, Polk County, Iowa, 50314, United States of America","country_code":"US","boundingBox":[41.6078728,41.6079728,-93.6317588,-93.6316588]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('696a14fe-195f-41e0-a750-ed993f3435e6', 'dbffd51e-8fc3-4cbf-a01c-e97a025fac6c', 'Moulton Elementary', 'Schedule: Kids 7-12: Tues & Thurs 3:40-4:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-93.6275774,41.6067828]},"properties":{"address":"Moulton Elementary, Des Moines, IA","displayName":"Moulton Elementary, 7th Street, River Bend, Des Moines, Polk County, Iowa, 50314, United States of America","country_code":"US","boundingBox":[41.6059086,41.6076537,-93.628141,-93.6264308]}}'::jsonb);

-- Group: Michigan Center for Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ea8ba195-c0c9-46cd-b8fb-6c9d89f1e11e', NOW(), NOW(), 'Michigan Center for Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Baz (Baz Michaeli)
Main Contact: - 248-225-7349
Notes: Rochester, Farmington Hills, St. Clair Shores, Ferndale. SOURCE: website 8/18/18', 'tmcc.info@gmail.com', '[{"type":"website","url":"https://www.tmc4c.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('216314c3-195a-4537-9691-57441b3bf9d5', 'ea8ba195-c0c9-46cd-b8fb-6c9d89f1e11e', 'Orchard Lake Rd. Farmington Hills', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-83.3590229,42.5048076]},"properties":{"address":"27881 Orchard Lake Rd. Farmington Hills, MI 48334","displayName":"27881, Orchard Lake Road, Farmington Hills, Oakland County, Michigan, 48334, United States of America","country_code":"US","boundingBox":[42.5047576,42.5048576,-83.3590729,-83.3589729]}}'::jsonb);

-- Group: Association of Capoeira Engenho da Rainha
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('34e71d92-0f40-45b9-9d4a-f08bcaa3c076', NOW(), NOW(), 'Association of Capoeira Engenho da Rainha', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Rodrigo
Main Contact: - 44 [0] 7921 66 77 26
Notes: LINEAGE: Mestre Nenem > Mestre Paizinho > Mestre Artu Emidio > Mestre Celso > Contra Mestre Rodrigo. ACER Kids program. SOURCE: website 10/30/16', 'e.rodrigo@acercapoeira.com', '[{"type":"website","url":"http://www.capoeiracornwall.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f7aa6672-b417-4cc6-b29d-a9893eac78da', '34e71d92-0f40-45b9-9d4a-f08bcaa3c076', 'St Stephen''s Hill', 'Schedule: 5 to 11yrs: Mon 3:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.4096087,50.6281448]},"properties":{"address":"Tregadillett, PL15 7EU, UK","displayName":"Tregadillett Primary School, Prouts Way, Kestle, St. Thomas the Apostle Rural, Tregadillet, Cornwall, England, PL15 7EU, United Kingdom","country_code":"GB","boundingBox":[50.6275495,50.6289881,-4.4101977,-4.4084773]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5c37abbe-5346-4cf1-8a32-f2472b4f07d3', '34e71d92-0f40-45b9-9d4a-f08bcaa3c076', 'Phoenix Leisure Centre', 'Schedule: 12yrs+: Mon', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.3587854,50.6310351]},"properties":{"address":"Coronation Pk, Launceston PL15 9DQ","displayName":"Coronation Skate Park, Windmill Hill, Launceston, Cornwall, England, PL15 9AF, United Kingdom","country_code":"GB","boundingBox":[50.630792,50.6311418,-4.3590567,-4.3585361]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fc17f149-4fde-4229-86b0-af09c4a092b8', '34e71d92-0f40-45b9-9d4a-f08bcaa3c076', 'Sands End Community Centre', 'Schedule: Mon 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2109249,51.4708886]},"properties":{"address":"66 High Street, Fulham, London, SW6 3LJ, UK","displayName":"Fulham High Street, Hurlingham, Fulham, London Borough of Hammersmith and Fulham, London, Greater London, England, SW6 3LQ, United Kingdom","country_code":"GB","boundingBox":[51.4705411,51.4712772,-0.2110829,-0.2106859]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b4b17c04-08b9-4fbc-b88d-27aeba0a288f', '34e71d92-0f40-45b9-9d4a-f08bcaa3c076', 'Greyhound Community Centre', 'Schedule: Wed 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2305592,51.4654018]},"properties":{"address":"Dryburgh Road, Putney, London, SW15 1BL, UK","displayName":"Dryburgh Road, Putney, London Borough of Wandsworth, London, Greater London, England, SW15 1BL, United Kingdom","country_code":"GB","boundingBox":[51.4651916,51.4659956,-0.2335588,-0.2293608]}}'::jsonb);

-- Batch: batch-02.json (35 groups)

-- Group: Mundo Capoeira Ireland
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('31c5024a-ba0a-4e82-bb29-4017607cbb13', NOW(), NOW(), 'Mundo Capoeira Ireland', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Sansao
Main Contact: - [+353] 086 1079313
Notes: Graduada Smorfete "Daniela Quaresima" [+353] 086 8875119 daniela@capoeiraireland.com. Location: 48, the Weavers, South Earl St, Dublin 8. SOURCE: website 12/31/19', 'info@capoeiraireland.com', '[{"type":"website","url":"http://www.capoeiraireland.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ec9e2ea1-0df1-43f7-8441-a5c03ee47da3', '31c5024a-ba0a-4e82-bb29-4017607cbb13', 'Charlemont Community Resource Centre', 'Schedule: Tue 7:00pm-9:00pm; Sat 10:45am-11:45am (Kids); Sat 11:45am-1:15pm (Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.2616947,53.331467599999996]},"properties":{"address":"Charlemont Street, Dublin 2, Ireland","displayName":"Charlemont Street, Saint Kevins Ward 1986, Dublin, County Dublin, Leinster, D02 Y993, Éire / Ireland","country_code":"ie","boundingBox":[53.3305855,53.3324182,-6.2630178,-6.2603245]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0e5b9695-f609-4dad-9692-8163c52d3d12', '31c5024a-ba0a-4e82-bb29-4017607cbb13', 'ALSAA Sports Centre', 'Schedule: Mon 6:00pm-7:00pm (Kids); Mon 7:00pm-8:00pm (Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.249166222181791,53.417997435136904]},"properties":{"address":"Old Airport Road, Dublin, Ireland","displayName":"Collinstown Lane, Airport ED, Fingal, County Dublin, Leinster, K67 A0K7, Éire / Ireland","country_code":"ie","boundingBox":[53.4178438,53.4182048,-6.2508855,-6.2474421]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('97c1ee58-1fb6-4521-8eee-3f88834508f3', '31c5024a-ba0a-4e82-bb29-4017607cbb13', 'IMAAL HALL', 'Schedule: Tue 4:00pm-5:00pm (Kids & Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.6831,53.0011]},"properties":{"address":"1, Upper Stephen St., Dunlavin Upper, Dunlavin, West Wicklow, Co. Wicklow W91N8H7","displayName":"1 Upper Stephen Street, Dunlavin, Co. Wicklow W91 N8H7, Ireland","country_code":"us"}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f40bf24c-fb04-4e70-ab0b-d4d722d6f07d', '31c5024a-ba0a-4e82-bb29-4017607cbb13', 'SPOTLIGHT STUDIOS "The Anchorage"', 'Schedule: Wed 6:30pm-7:30pm (Kids); Wed 7:30pm-8:30pm (Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.1463819770052694,52.79592638294406]},"properties":{"address":"North Quay, Wicklow, A67 XR58","displayName":"North Quay, Arklow No 2 Urban ED, The Municipal District of Arklow, County Wicklow, Leinster, Y14 WE22, Éire / Ireland","country_code":"ie","boundingBox":[52.7950934,52.7979841,-6.149136,-6.1442661]}}'::jsonb);

-- Group: Grupo Candeias Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c0e1db60-8611-487a-81fe-5abff2dfefce', NOW(), NOW(), 'Grupo Candeias Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Pele
Main Contact: - 087 1531355
Notes: SOURCE: website 12/31/19', 'pelecandeias@hotmail.com', '[{"type":"website","url":"https://candeiasdublin.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0cdd0dae-d353-4ecd-820b-b2c00afbc14e', 'c0e1db60-8611-487a-81fe-5abff2dfefce', 'Carmelite Communite centre', 'Schedule: Beginners: Mon 9:00 to 10:00; Mixed With Roda. Wed 8:00 to 9:00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.2660262,53.3399826]},"properties":{"address":"56 Aungier street, Dublin 2","displayName":"Carmelite Community Centre, 56, Aungier Street, Royal Exchange A Ward 1986, Dublin, County Dublin, Leinster, D02 RW67, Éire / Ireland","country_code":"IE","boundingBox":[53.3398635,53.3401797,-6.2661703,-6.2658673]}}'::jsonb);

-- Group: Mão no Chão Capoeira Angola
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('fcd40e32-c87a-4bad-9ecd-1189bd7820af', NOW(), NOW(), 'Mão no Chão Capoeira Angola', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Stephen - 07807 693298
Notes: Associated with Mestre Marrom e Alunos [Rio de Janiero]. No longer appears to have classes in Dundee 12/30/19. SOURCE: website 6/20/13', 'maonochao.edinburgh@googlemail.com', '[{"type":"website","url":"https://maonochao.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3c4a4165-1493-483c-b683-93d3f0a14d15', 'fcd40e32-c87a-4bad-9ecd-1189bd7820af', 'Showcase The Street', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-2.9795461,56.4605161]},"properties":{"address":"42 Brown St Dundee, Dundee City DD1 5EF","displayName":"Brown Street, University of Dundee Campus, Dudhope, Dundee, Dundee City, Alba / Scotland, DD1 5EJ, United Kingdom","country_code":"GB","boundingBox":[56.4599907,56.4610451,-2.9797198,-2.9793613]}}'::jsonb);

-- Group: Grupo Senzala North East
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1070ba00-3b41-4ca0-b75f-c2dc0ba9dcc7', NOW(), NOW(), 'Grupo Senzala North East', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Tasmania (Jimi McAvoy)
Main Contact: - +44 [0] 191 5860691
Notes: Under the guidance of Mestre Gato [Rio de Janeiro]. Professor Caranguejo "Peter" (peter@groupsenzala.co.uk), Professor Scuzzi "Rob" (rob@groupsenzala.co.uk, 07917440093). SOURCE: website 11/18/16', 'jimi@groupsenzala.co.uk', '[{"type":"website","url":"http://www.groupsenzala.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('49b833cb-e3ea-4a59-ae12-b008ccf323d9', '1070ba00-3b41-4ca0-b75f-c2dc0ba9dcc7', 'Heaton Community Centre', 'Schedule: Tue 7:00pm-8:30pm (with music practice 7:00pm-7:30pm)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.5706731,54.987702]},"properties":{"address":"Trewhitt Road, Heaton, Newcastle Upon Tyne NE6 5DY","displayName":"Trewhitt Road, Heaton, Newcastle upon Tyne, Tyne and Wear, North East, England, NE6 5DT, United Kingdom","country_code":"GB","boundingBox":[54.9876845,54.9877215,-1.5711115,-1.5702347]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('218158ea-58d1-4ffd-a79b-665953c38fa1', '1070ba00-3b41-4ca0-b75f-c2dc0ba9dcc7', 'Aria Art and Movement CIC', 'Schedule: Mon 7:30pm-8:30pm (Children 6+ and Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.396946111458243,54.906320611346445]},"properties":{"address":"Wentworth Terrace, Sunderland SR4 7AD, UK","displayName":"Wentworth Terrace, Millfield, Sunderland, North East, England, SR4 7AD, United Kingdom","country_code":"gb","boundingBox":[54.9059241,54.9067115,-1.3972087,-1.396692]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7412b214-1d2a-49c4-89dd-2788e9598496', '1070ba00-3b41-4ca0-b75f-c2dc0ba9dcc7', 'Brancepeth Village Hall', 'Schedule: Sun 10:00am-11:00am (Kids); Sun 11:00am-12:00pm (All Levels)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.6563185557685909,54.73599369091818]},"properties":{"address":"The Village, Brancepeth, Durham, DH7 8DD","displayName":"The Village, Brancepeth, County Durham, North East, England, DH7 8DG, United Kingdom","country_code":"gb","boundingBox":[54.7356261,54.7363613,-1.6568973,-1.6557398]}}'::jsonb);

-- Group: Mão no Chão Capoeira Angola Edinburgh
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('467658e3-8c1b-4f01-a37e-87ba86e013be', NOW(), NOW(), 'Mão no Chão Capoeira Angola Edinburgh', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Associated with Mestre Marrom e Alunos [Rio de Janiero]. SOURCE: website 12/30', 'maonochao.edinburgh@googlemail.com', '[{"type":"website","url":"https://maonochao.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a98091a7-9024-4d6a-9b5d-34b1a8bf2edf', '467658e3-8c1b-4f01-a37e-87ba86e013be', 'Out of the Blue Arts Center', 'Schedule: Tues 8:00-9.30pm (in Rehearsal Studio [Buzz 041])', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.1743617,55.9644431]},"properties":{"address":"36 Dalmeny St, Leith Edinburgh, EH6 8RG","displayName":"The Out of the Blue Drill Hall, 36, Dalmeny Street, Lorne, Leith, City of Edinburgh, Alba / Scotland, EH6 8RG, United Kingdom","country_code":"GB","boundingBox":[55.9641446,55.9647529,-3.1746998,-3.174016]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f6a6028d-53a0-4daf-ac82-72c821ee4334', '467658e3-8c1b-4f01-a37e-87ba86e013be', 'Tollcross Community Centre', 'Schedule: Fri 6.30-8.30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.170804,55.8432796]},"properties":{"address":"Tollcross","displayName":"Tollcross, Glasgow, Glasgow City, Alba / Scotland, G32 8HD, United Kingdom","country_code":"GB","boundingBox":[55.8232796,55.8632796,-4.190804,-4.150804]}}'::jsonb);

-- Group: Capoeira Brazil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('87d57f05-4b2b-47f9-96f1-0a14632e8dd1', NOW(), NOW(), 'Capoeira Brazil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Biscuim (Licio Aurelio De Oliveira Bezerra)
Notes: Professora Sininha "Emma Gibbs De Oliveira" - Call | Text: [English & Portuguese] +44 [0] 7894 716 833. SOURCE: website 11/12/16', 'info@brazilarte.org', '[{"type":"website","url":"http://brazilarte.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fcebef26-ba4e-4fe6-9ac4-33007f85785f', '87d57f05-4b2b-47f9-96f1-0a14632e8dd1', 'BrazilArte Academy', 'Schedule: Full schedule of classes', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.7323058,51.5369422]},"properties":{"address":"Kensington Road, Southend on Sea, Essex, SS1 2TA","displayName":"Kensington Road, Kursaal Estate, Southchurch, Southend-on-Sea, Essex, England, SS1 2TA, United Kingdom","country_code":"GB","boundingBox":[51.535529,51.5383554,0.7321059,0.7325058]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bd23b70b-d1a6-46c8-8447-7f0241128cf8', '87d57f05-4b2b-47f9-96f1-0a14632e8dd1', 'Nuffield Health & Fitness', 'Schedule: Beginners: Tues 20.00-21.00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.478929,51.7364725]},"properties":{"address":"Unit 6 Victoria Road, Chelmsford, Essex CM1 1AN","displayName":"Victoria Road, Springfield Park, Chelmsford, Essex, England, CM2 6LJ, United Kingdom","country_code":"GB","boundingBox":[51.7364181,51.7365186,0.4788398,0.4790132]}}'::jsonb);

-- Group: ABADA Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('55f73047-6e07-4743-8a90-985913b5e4a8', NOW(), NOW(), 'ABADA Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Coco (Marcelo Fagundes)
Main Contact: - [907]388-0122 & [907]347-5262
Notes: Instructor Coco "Marcelo Fagundes". SOURCES: blog websites 3/4/11', 'abada.alaska@gmail.com', '[{"type":"website","url":"http://abadacapoeiraalaska.blogspot.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d2ce2ba9-1943-4aee-9fd9-a405e371fe0a', '55f73047-6e07-4743-8a90-985913b5e4a8', 'University of Alaska - Great Hall / Student Recreation Center', 'Schedule: Meeting times vary by sources
Email: ssalazar2@alaska.edu', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-83.6312623,41.3782901]},"properties":{"address":"Student Recreation Center - 2nd floor","displayName":"Student Recreation Center Turnaround, Athletics District, Bowling Green, Wood County, Ohio, 43403, United States of America","country_code":"US","boundingBox":[41.3781407,41.3782912,-83.631557,-83.630975]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b7bc5590-b404-4f3d-93f2-d93678a4540b', '55f73047-6e07-4743-8a90-985913b5e4a8', 'Infinit8yoga', 'Schedule: Tues & Thurs 8:00-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.4071049,33.993185]},"properties":{"address":"Mar Vista Family Center, Los Angeles, CA","displayName":"Mar Vista Family Center, Ballona Creek Bike Path, Los Angeles, Los Angeles County, California, 90096, United States of America","country_code":"US","boundingBox":[33.992989,33.9933795,-118.4072602,-118.4066923]}}'::jsonb);

-- Group: Capoeira Vadiacao de Oxossi
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('450fab0c-d357-4f05-9809-2383b38c6fa9', NOW(), NOW(), 'Capoeira Vadiacao de Oxossi', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Girafa
Notes: Instructor: Girafa under Perere [Port Townsend WA]. SOURCE: website 3/17/18', 'capoeiragirafa@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/vadiacaodeoxossi/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6489eff4-c90a-46d8-9307-04598898725f', '450fab0c-d357-4f05-9809-2383b38c6fa9', 'Maharishi University of Management Recreation Center', 'Schedule: Age 14 and up: Mon & Wed 7:30-9:00pm; Sat 3:00-4:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-91.963967,41.023532]},"properties":{"address":"Maharishi University of Management, Fairfield, IA 52557","displayName":"Maharishi International University, 1000, North 4th Street, Fairfield, Jefferson County, Iowa, 52557, United States of America","country_code":"US","boundingBox":[41.014892,41.0320579,-91.971762,-91.9586887]}}'::jsonb);

-- Group: Cordão de Ouro South Carolina
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ae9cc3b8-bdc4-4f04-bcd6-dd68e5f1cfd3', NOW(), NOW(), 'Cordão de Ouro South Carolina', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Neguinho
Notes: Greenville/Spartanburg, South Carolina. Mestre Neguinho. SOURCE: website 7/10/19', NULL, '[{"type":"website","url":"https://neguinhocdo.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4881d08a-d923-4f04-b391-4d18b50e06e8', 'ae9cc3b8-bdc4-4f04-bcd6-dd68e5f1cfd3', 'Raja Martial Arts Academy', 'Schedule: Beginners: Tues & Thur 5:30-6:30pm; Kids: Tues & Thurs 4:30-5:20pm; Sat 2:00-3:00pm; Adults: Tues & Thurs 6:30-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.2899651,34.8221418]},"properties":{"address":"1200 Woodruff Road, Greenville, SC","displayName":"Busy Beez Movers LLC, 1200, Woodruff Road, Merovan Business Center, Greenville County, South Carolina, 29607, United States of America","country_code":"US","boundingBox":[34.8220918,34.8221918,-82.2900151,-82.2899151]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('81f5bad0-c12f-45a5-8900-35291343799a', 'ae9cc3b8-bdc4-4f04-bcd6-dd68e5f1cfd3', 'Ethos Combatives', 'Schedule: Adults: Tues 8:00-9:00pm (kids welcome as well)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.8948813,35.0250235]},"properties":{"address":"2306 Chesnee Highway, Spartanburg, SC","displayName":"2306, Chesnee Highway, Spartanburg County, South Carolina, 29303, United States of America","country_code":"US","boundingBox":[35.02488,35.025167,-81.895077,-81.894686]}}'::jsonb);

-- Group: Capoeira Fundo da Mata - United Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2e75a319-50de-42b9-b8ee-028430d7705c', NOW(), NOW(), 'Capoeira Fundo da Mata - United Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Avestruz (Joe Williams)
Notes: Knoxville, Tennessee. Mestre Avestruz (Joe Williams) under Mestre Acordeon[Berkeley]. SOURCE: website 7/21/19', NULL, '[{"type":"website","url":"http://www.capoeiraknoxville.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a4bbe2b9-c8ab-43b9-a929-974755f11ffb', '2e75a319-50de-42b9-b8ee-028430d7705c', 'Emporium Center for Arts and Culture', 'Schedule: Open Levels with Mestre Avestruz: Tues 6:00-8:00 pm; Student-led Conditioning Class: Thurs 6:00-7:00 pm
Email: info@capoeiraknoxville.org', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-83.920052,35.9680804]},"properties":{"address":"100 S Gay St Knoxville, TN 37902","displayName":"South Gay Street, Knoxville Central Business District, Mechanicsville, Knoxville, Knox County, East Tennessee, Tennessee, 37902, United States of America","country_code":"US","boundingBox":[35.9672189,35.9688228,-83.9207907,-83.9194659]}}'::jsonb);

-- Group: Capoeira Abolicao Knoxville
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2e2f5bbd-589c-456e-9ab5-89306586e7ba', NOW(), NOW(), 'Capoeira Abolicao Knoxville', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRANDO Anao (Alejandro Florez)
Main Contact: Mestrando Anao - [865] 321-1106
Notes: Knoxville, Tennessee. Mestrando Anao (Alejandro Florez) under Master Delei[Miami]. SOURCE: website facebook 7/23/19', 'mimadacapo@gmail.com', '[{"type":"website","url":"http://www.capoeiraknoxville.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('50e40327-d03f-46cd-9800-95596d91304b', '2e2f5bbd-589c-456e-9ab5-89306586e7ba', 'The FitBox Knox', 'Schedule: Adults: Mon, Tues, Wed, & Thurs: 7:30pm; Kids: Tues & Thurs 5:30pm; Music and Roda: Fri 6:30pm
Phone: [865] 312-9782
Email: fitboxknox@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-84.0923611,35.9105592]},"properties":{"address":"9294 Kingston Pike, Knoxville, TN 37922","displayName":"9294, Kingston Pike, Knoxville, Knox County, East Tennessee, Tennessee, 37922, United States of America","country_code":"US","boundingBox":[35.9105092,35.9106092,-84.0924111,-84.0923111]}}'::jsonb);

-- Group: Capoeira Ginga Brasil - Cordão de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7545cc94-c212-4019-8643-e048ed36dacf', NOW(), NOW(), 'Capoeira Ginga Brasil - Cordão de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Pinga Fogo (Guilherme Torres)
Notes: Austin, Texas. Mestre Pinga Fogo (Guilherme Torres). SOURCE: facebook website 7/29/19', NULL, '[{"type":"website","url":"http://www.capoeiraustin.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8f958dda-3d25-43cc-bbcb-eb43b324eb64', '7545cc94-c212-4019-8643-e048ed36dacf', 'Rising Sun Aikido', 'Schedule: All Levels: Mon 6:00-7:00pm; Wed 8:00-9:00pm; Kids[2 1/2 - 4]: Mon 4:30-5:00pm; Kids[4 - 7]: Mon 5:00-5:45pm
Phone: 203 444 7142', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.7720492,30.2507394]},"properties":{"address":"2125-C Goodrich Avenue, Austin, TX 78704","displayName":"Goodrich Avenue, Zilker, Austin, Travis County, Texas, 78704, United States of America","country_code":"US","boundingBox":[30.2483403,30.253143,-97.7736188,-97.770486]}}'::jsonb);

-- Group: Capoeira Evolução
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('90158737-f596-4255-aa77-7ee80d426eb0', NOW(), NOW(), 'Capoeira Evolução', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Metido (Alex Rodriguez)
Main Contact: Contra Mestre Metido - 512-715-4373
Notes: Austin, Texas. Contra Mestre Metido (Alex Rodriguez) under Mestre Rodrigo Zerlotti. Full schedule of classes. See website. LINEAGE: Betinho>Mestre Bimba > Mestre Suassuna>Mestre Jurema >MestreWilton Pereira >Mestre Rodrigo Zerlotti. SOURCE: website 7/24/19', 'alex@capoeiraevolucao.com', '[{"type":"website","url":"http://www.capoeiraevolucao.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d74c0286-ef7d-46af-88d6-b0493a65840c', '90158737-f596-4255-aa77-7ee80d426eb0', 'Capoeira Evolução', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.7679494,30.2153029]},"properties":{"address":"4619 South Congress Avenue, Austin, TX 78745","displayName":"4619, South Congress Avenue, St. Elmo, Austin, Travis County, Texas, 78745, United States of America","country_code":"US","boundingBox":[30.214896,30.2155227,-97.7683269,-97.7675751]}}'::jsonb);

-- Group: Capoeira Luanda- Austin
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('76d7eb84-1062-42c8-9a12-09c33ec17e55', NOW(), NOW(), 'Capoeira Luanda- Austin', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Austin, Texas. SOURCE: website 7/30/19', NULL, '[{"type":"website","url":"http://austincapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2e5b7a9d-242c-44ff-b275-369243c2ad9d', '76d7eb84-1062-42c8-9a12-09c33ec17e55', 'Austin Recreation Center', 'Schedule: Mon 6:00-7:30pm; Thursday 7:30-9:00pm; Music: Sat 9:00-10:30am
Phone: 512-827-7618
Email: info@austincapoeira.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.7489593,30.2782451]},"properties":{"address":"1301 Shoal Creek Blvd, Austin, TX 78701","displayName":"Austin Recreation Center, 1301, Shoal Creek Boulevard, Austin, Travis County, Texas, 78701, United States of America","country_code":"US","boundingBox":[30.2781172,30.2785067,-97.7491567,-97.7488019]}}'::jsonb);

-- Group: Raça em Movimento
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b7d74b96-fa84-4bae-bebf-4bf93738d3dc', NOW(), NOW(), 'Raça em Movimento', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Graveto (Tyrone Phelipa)
Main Contact: Professor Graveto - +1[956] 371 1666
Notes: Brownsville, McAllen, Texas. Professor Graveto (Tyrone Phelipa) under Mestre Efraim[New Haven CT]. Next to the Kuk Sool Won Academy, across from Lotus Chinese Restaurant. SOURCE: website 8/4/19', 'professor.graveto@southtexascapoeira.com', '[{"type":"website","url":"http://www.southtexascapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('25c34216-afac-4e5f-a498-da5504bccfd0', 'b7d74b96-fa84-4bae-bebf-4bf93738d3dc', 'Raça em Movimento', 'Schedule: Kids Group 1: Tues & Thurs 5:00-5:45pm; Kids Group 2: Tues & Thurs 5:45-630pm; Adults Fundamentals: Tues & Thurs 6:30-7:00pm; Adults: 7:00-8:30pm; All ages Review:Sat 5:00-5:45pm; All ages Muisic: Sat 6:30-7:00pm; All ages Acrobatics: Sat 5:45-630pm; All ages Roda: Sat 5;30-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.4963908,25.9800881]},"properties":{"address":"1601 E Alton Gloor Blvd, Brownsville, TX 78526","displayName":"East Alton Gloor Boulevard, Brownsville, Cameron County, Texas, 78526, United States of America","country_code":"US","boundingBox":[25.9793024,25.9808411,-97.5046322,-97.4881675]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('925d9719-6e15-4115-8bd6-d8d6fa622470', 'b7d74b96-fa84-4bae-bebf-4bf93738d3dc', 'Eternamente Bella Spa', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-98.2368903,26.2024525]},"properties":{"address":"217 S. 16th St. McAllen, TX","displayName":"217, South 16th Street, College Heights, McAllen, Hidalgo County, Texas, 78501, United States of America","country_code":"US","boundingBox":[26.2024025,26.2025025,-98.2369403,-98.2368403]}}'::jsonb);

-- Group: Fort Worth Capoeira Regional
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('88254887-b65e-4559-8f94-9a2afc9ae568', NOW(), NOW(), 'Fort Worth Capoeira Regional', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Borboleta (Lindsay Puente)
Main Contact: Professora Borboleta - 817-586-2146
Notes: Dallas-Ft. Worth, Texas. Professora Borboleta (Lindsay Puente). SOURCE: email 3/19/16', 'ftwcapo@gmail.com', '[{"type":"website","url":"http://www.ftwcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f92acad4-abc2-409a-9cf4-7b5ad027dfe4', '88254887-b65e-4559-8f94-9a2afc9ae568', 'Fort Worth Capoeira Regional', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.3327459,32.753177]},"properties":{"address":"Fort Worth, TX 76110","displayName":"Fort Worth, Tarrant County, Texas, United States of America","country_code":"US","boundingBox":[32.551584,33.049529,-97.592388,-97.0335808]}}'::jsonb);

-- Group: Os Malandros de Mestre Touro -Capoeira Angola de São Bento Grande
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('12310cc3-b32b-4502-87e8-1057c039aca6', NOW(), NOW(), 'Os Malandros de Mestre Touro -Capoeira Angola de São Bento Grande', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Preto Velho (Dennis Newsome)
Main Contact: Zumbi Malandro - 972-415-5103
Notes: Dallas, Texas. Under Mestre Preto Velho (Dennis Newsome) [San Diego]. Zumbi Malandro. SOURCE: website 3/20/16', 'info@dallasmalandros.com', '[{"type":"website","url":"http://www.dallasmalandros.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f4b6d4da-2235-4637-bab8-946295b71baf', '12310cc3-b32b-4502-87e8-1057c039aca6', 'South Dallas Cultural Center', 'Schedule: Tues & Thurs 7:00-8:45pm; Sat 10:00am-12:00pm
Phone: [214] 939 2787', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-96.7574052,32.771362]},"properties":{"address":"3400 S. Fitzhugh, Dallas, Texas 76210","displayName":"South Dallas Cultural Center, 3400, South Fitzhugh Avenue, Wheatley Place Historic District, Dallas, Dallas County, Texas, 75210, United States of America","country_code":"US","boundingBox":[32.7710161,32.7716707,-96.7576773,-96.7570244]}}'::jsonb);

-- Group: Capoeira Resistência
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('583adf90-cf25-4ae5-9e06-212624ac6601', NOW(), NOW(), 'Capoeira Resistência', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Molejo (Diogo Rodrigues da Costa Oliveira)
Main Contact: Professor Molejo - 469.734.8281
Notes: Dallas, Texas. Professor Molejo (Diogo Rodrigues da Costa Oliveira) under Mestre Panão[Richmond]. SOURCE: website 3/24/16', NULL, '[{"type":"website","url":"http://www.capoeiraallen.blogspot.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c3e1e517-cbb8-4122-b852-8838e5b86c13', '583adf90-cf25-4ae5-9e06-212624ac6601', 'Capoeira Resistência', 'Schedule: Adults: Mon-Thurs 3:00-4:00pm, 7:00-7:50pm, 7:50-8:40pm 8:40-9:40pm; Sat 1:00-2:00pm; Kids: Mon-Thurs 4:00-4:45 pm, 4:45-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-96.6580883,33.1056144]},"properties":{"address":"410 N. Greenville Ave - - Allen, TX 75002","displayName":"410, North Greenville Avenue, Allen, Collin County, Texas, 75002, United States of America","country_code":"US","boundingBox":[33.1055644,33.1056644,-96.6581383,-96.6580383]}}'::jsonb);

-- Group: United Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('99efae6c-3b62-4608-b8f1-649d9f0475a3', NOW(), NOW(), 'United Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: El Paso, Texas. United Capoeira Association. SOURCE: website 4/10/19', NULL, '[{"type":"website","url":"https://www.capoeiraelpaso.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('14ba8c2d-34c3-4c15-a609-db360839a7b1', '99efae6c-3b62-4608-b8f1-649d9f0475a3', 'SoL Studio', 'Phone: [915] 996-1814
Email: ucaelpaso@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-106.4432986,31.7835557]},"properties":{"address":"4106 Montana Ave El Paso, TX 79903","displayName":"4106, Montana Avenue, El Paso, El Paso County, Texas, 79903, United States of America","country_code":"US","boundingBox":[31.7835057,31.7836057,-106.4433486,-106.4432486]}}'::jsonb);

-- Group: Centro Cultural Aruandê Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8a47023a-cc37-42ec-a809-62b30300fc81', NOW(), NOW(), 'Centro Cultural Aruandê Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Demetrius (Demétrius Pereira Dos Santos)
Main Contact: Mestre Demetrius - +1-832-303-0319
Notes: Houston, Spring, Texas. Mestre Demetrius (Demétrius Pereira Dos Santos). SOURCE: website 8/11/19', 'capoeira@aruande.com', '[{"type":"website","url":"https://www.zumzumzum.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1b40a326-a483-45d6-8210-7feda8a07059', '8a47023a-cc37-42ec-a809-62b30300fc81', 'Danz Fit X', 'Schedule: Ages 12 and under: 5:00pm Thurs & Sat; Ages 12 & up: 8:15pm Tues, Thurs & Sat', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-95.6450369,29.8056946]},"properties":{"address":"6110 N. Hwy 6, Houston, TX 77084","displayName":"North Highway 6, Addicks, Houston, Harris County, Texas, 77084, United States of America","country_code":"US","boundingBox":[29.7980892,29.8132865,-95.6453897,-95.644945]}}'::jsonb);

-- Group: Capoeira Luanda
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cd22b32b-14f9-4199-8b80-2c9ff8f6fa95', NOW(), NOW(), 'Capoeira Luanda', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Gringo (Mauricio Campos)
Notes: Houston, Texas. Gringo (Mauricio Campos) under Mestre Jelon Viera. See website for schedule. SOURCE: website 3/23/13', NULL, '[{"type":"website","url":"http://brazilianarts.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ec0cdeb2-3aa3-475d-9470-d7c7ad25eeb0', 'cd22b32b-14f9-4199-8b80-2c9ff8f6fa95', 'Brazilian Arts Foundation', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-95.3745185,29.7905406]},"properties":{"address":"316 Pecore St, Houston TX, 77009","displayName":"316, Pecore Street, Woodland Heights, Houston Heights, Houston, Harris County, Texas, 77009, United States of America","country_code":"US","boundingBox":[29.7904906,29.7905906,-95.3745685,-95.3744685]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('baf5cea5-22cc-4dc0-90e1-6c5bc958c9aa', 'cd22b32b-14f9-4199-8b80-2c9ff8f6fa95', 'Midtown Park', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-95.3759601,29.7445057]},"properties":{"address":"2811 Travis Street, Houston, Texas 77006","displayName":"2811, Travis Street, Midtown, Houston, Harris County, Texas, 77006, United States of America","country_code":"US","boundingBox":[29.7444557,29.7445557,-95.3760101,-95.3759101]}}'::jsonb);

-- Group: Kalunga N'Golo
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2b7e7a56-b9ba-4d8c-a85f-2d543791629e', NOW(), NOW(), 'Kalunga N''Golo', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Ezell, Marrio, Osakwe - [832] 814-8928, [512] 909-0892, [832] 971-2395
Notes: Houston, Texas. Ezell: [832] 814-8928, Marrio: [512] 909-0892, Osakwe [832] 971-2395. SOURCE: website 3/2/13', NULL, '[{"type":"website","url":"http://www.ngolohouston.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('54152e82-395f-44e6-b40f-0acc2dbccca3', '2b7e7a56-b9ba-4d8c-a85f-2d543791629e', 'Shape Community Center - Family Center', 'Schedule: Wed 7:30-9:00pm Sat 1:00-3:00pm, Sun 2:00-4:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-95.3663875,29.7290807]},"properties":{"address":"3815 Live Oak Street Houston, TX 77004","displayName":"Shape Community Center, 3815, Live Oak Street, Washington Terrace, Third Ward, Houston, Harris County, Texas, 77004, United States of America","country_code":"US","boundingBox":[29.728918,29.7292411,-95.3665873,-95.3661878]}}'::jsonb);

-- Group: Central Cultural Aruandê Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('34d9bf56-82fe-43fd-b463-91b9afc58905', NOW(), NOW(), 'Central Cultural Aruandê Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADO Violão (Carlos A. Morales, Jr.)
Main Contact: Graduado Violão - [956] 220 - 7449 / [956] 319 - 4133
Notes: Laredo, Texas. Graduado Violão (Carlos A. Morales, Jr.). SOURCE: websites 8/118/19', 'info@moralesfpa.com', '[{"type":"website","url":"https://www.zumzumzum.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0ce65df6-27f2-4f1f-ace3-0ec2242df3b3', '34d9bf56-82fe-43fd-b463-91b9afc58905', 'Morales Fine & Performaning Arts', 'Schedule: Beg./Adv. [All Ages]: Mon & Wed 6:00-7:30 p.m.', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-99.4998491,27.5580792]},"properties":{"address":"800 E Mann Rd, Laredo, TX 78041","displayName":"East Mann Road, Nye, Laredo, Webb County, Texas, 78041, United States of America","country_code":"US","boundingBox":[27.5567322,27.5594231,-99.5032525,-99.4964444]}}'::jsonb);

-- Group: Capoeira Luanda San Antonio
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('33aeb55d-92d6-453e-b17c-967a215f4fac', NOW(), NOW(), 'Capoeira Luanda San Antonio', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: San Antonio, Texas. SOURCE website 8/19/19', NULL, '[{"type":"website","url":"http://www.capoeiratexas.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('51a9b594-52c0-405c-b544-db141dc7daa9', '33aeb55d-92d6-453e-b17c-967a215f4fac', 'Capoeira Luanda San Antonio', 'Schedule: Music: Mon 7:00-8:00pm; Adults Tues & Thurs 7:00-8:00pm: Sat 2:00-4:00pm; Children: Wed 6:30pm-7:30pm; Sat 1:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-98.5048533,29.4511045]},"properties":{"address":"925 West Russell Pl, San Antonio TX 78212","displayName":"925, West Russell Place, Alta Vista, San Antonio, Bexar County, Texas, 78212, United States of America","country_code":"US","boundingBox":[29.4510545,29.4511545,-98.5049033,-98.5048033]}}'::jsonb);

-- Group: CapuraGinga Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cbe6eab2-753d-4fa2-93c2-4146c22be100', NOW(), NOW(), 'CapuraGinga Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITOR Advogado (Nathan Sparrow)
Main Contact: Monitor Advogado - 210-535-4577
Notes: San Antonio, Texas. Monitor Advogado (Nathan Sparrow) under Mestre Loka. SOURCE: website 8/19/19', 'info@go-cap.com', '[{"type":"website","url":"http://www.go-cap.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2ddefe97-b211-432e-9074-2127cf738195', 'cbe6eab2-753d-4fa2-93c2-4146c22be100', 'CapuraGinga Capoeira', 'Schedule: Beg Kids Tues & Thurs 5:00pm; Adv Kids: Mon & Wed 6:00pm; Beg Adults: Tues & Thurs 6:00pm; Adults: Mon, Wed, & Fri 6:00am; Sat 10:am; Ad/Inter Adults: Mon, Tues & Wed7:00pm; RODA Thurs: 7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-98.5259367,29.5144559]},"properties":{"address":"8005 West Avenue, San Antonio TX 78213","displayName":"West Avenue, San Antonio, Bexar County, Texas, 78213, United States of America","country_code":"US","boundingBox":[29.5141143,29.5147974,-98.5259399,-98.5259334]}}'::jsonb);

-- Group: Mão no Chão Capoeira Angola Glasgow
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('50879efc-1153-4f93-afe8-21a7c6e21a77', NOW(), NOW(), 'Mão no Chão Capoeira Angola Glasgow', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Associated with Mestre Marrom e Alunos [Rio de Janiero]. SOURCE: website 12/29/19', NULL, '[{"type":"website","url":"https://maonochao.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('79f403b7-393b-4c13-940b-f2eb3289c2d8', '50879efc-1153-4f93-afe8-21a7c6e21a77', 'Overnewton Recreation Centre', 'Schedule: Thurs 7:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.2909928,55.8658667]},"properties":{"address":"2 Overnewton Square, Glasgow, G3 8RW","displayName":"Overnewton Square, Stobcross, Kelvinhaugh, Glasgow, Glasgow City, Alba / Scotland, G3 8TW, United Kingdom","country_code":"GB","boundingBox":[55.8658586,55.8658747,-4.2912315,-4.290754]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7aaaf996-8a8e-4305-befd-acfc05f4eacc', '50879efc-1153-4f93-afe8-21a7c6e21a77', 'Garnethill Multicultural Centre', 'Schedule: Kids and adults, Mon 7.30-9.30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.2616269,55.866268]},"properties":{"address":"21 Rose Street, Glasgow","displayName":"Garnethill Multicultural Comunity Centre, 21, Rose Street, Garnethill, Glasgow, Glasgow City, Alba / Scotland, G3 6RE, United Kingdom","country_code":"GB","boundingBox":[55.8661786,55.8663572,-4.2617428,-4.2615101]}}'::jsonb);

-- Group: Grand Rapids Capoeira - West Michigan Cordão de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('25e66398-3e4c-4999-90c6-f176c32b2b19', NOW(), NOW(), 'Grand Rapids Capoeira - West Michigan Cordão de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITOR Talento
Notes: Under the supervision of Instrutor Show Grande. Allendale. SOURCE: website 7/29/18', 'talentocdo@gmail.com', '[{"type":"website","url":"https://www.grcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d26d6696-6a7a-4ff8-8d89-ae21d09d24c5', '25e66398-3e4c-4999-90c6-f176c32b2b19', 'Armentality Movement Arts Center', 'Schedule: All Levels: Tues 7:15-8:30pm; Family Classes: 3rd Sat 3:00-4:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-85.6804535,42.9633171]},"properties":{"address":"233 E Fulton, Grand Rapids, MI","displayName":"Fulton Street West, Grand Rapids, Kent County, Michigan, 49503, United States of America","country_code":"US","boundingBox":[42.9633023,42.96339,-85.681517,-85.679385]}}'::jsonb);

-- Group: Capoeira MarAzul
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7e6cd8d4-67a1-40bd-be35-606744be8310', NOW(), NOW(), 'Capoeira MarAzul', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Joãozinho (Joãozinho da Figueira)
Main Contact: Suzannah - [+44] 07731 833 819
Notes: Mestre''s phone (Portuguese only): [+44] 0787 119 3871. SOURCE: website 10/25/16', 'info@marazul.co.uk', '[{"type":"website","url":"http://www.marazul.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('77666bae-9a4c-4fd4-b816-f948275d302a', '7e6cd8d4-67a1-40bd-be35-606744be8310', 'Highfield Residents Gardens Pavilion', 'Schedule: Children: Tues 4.00-4.45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.3951985,50.9275054]},"properties":{"address":"13 Abbotts Way, Southampton, SO17 1QU","displayName":"13, Abbotts Way, Portswood Park, Portswood, Southampton, England, SO17 1NU, United Kingdom","country_code":"GB","boundingBox":[50.9274368,50.9275911,-1.3953024,-1.3950761]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('946affda-3a5c-4f0f-9f86-a5e5b18bb63f', '7e6cd8d4-67a1-40bd-be35-606744be8310', 'The Café', 'Schedule: Adults Movement & Music: Mon 5:00-7:00; Wed 6:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.3974844,50.9341804]},"properties":{"address":"University of Southampton Students Union, Southampton, SO17 1BJ, UK","displayName":"University of Southampton Students'' Union (SUSU), Courtyard, Highfield, Southampton, England, SO17 1BJ, United Kingdom","country_code":"GB","boundingBox":[50.9337731,50.9345962,-1.3981197,-1.3968993]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1c5bf231-92e5-454e-bb97-e57ab11864a6', '7e6cd8d4-67a1-40bd-be35-606744be8310', 'Activities Studio', 'Schedule: Adults Movement & Music Sun 12:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.3974844,50.9341804]},"properties":{"address":"University of Southampton Students Union, Southampton, SO17 1BJ, UK","displayName":"University of Southampton Students'' Union (SUSU), Courtyard, Highfield, Southampton, England, SO17 1BJ, United Kingdom","country_code":"GB","boundingBox":[50.9337731,50.9345962,-1.3981197,-1.3968993]}}'::jsonb);

-- Group: Origens do Brasil Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('19f1f89e-52d5-4d5e-88dc-360132df26a9', NOW(), NOW(), 'Origens do Brasil Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Bia (Beatriz Viana Rosa)
Main Contact: - [0044]07729133051
Notes: Under Mestre Adelmo [Sao Paulo]. New website 10/30/18. KIDS CLASS ARE IN BLOCKS AND MUST BE BOOKED IN ADVANCE. Additional contacts: Aluno Graduado Rob (+44 7989 542595, robertjkeit@outlook.com), Aluna Graduada Voltagem (+44 7876 736390, docvoltagem@gmail.com). SOURCE: website 11/12/16', 'bia_origens@hotmail.com', '[{"type":"website","url":"http://www.ajitucapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5f4ef7d9-8e30-4202-9c91-6f89be30bfdb', '19f1f89e-52d5-4d5e-88dc-360132df26a9', 'Pavilion Dance South West', 'Schedule: Mon 7.15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.8759707,50.7187029]},"properties":{"address":"Bournemouth, Westover Road, BH1 2BU","displayName":"Bournemouth Aviary, 26-29, Westover Road, Lansdowne, West Cliff, Bournemouth, Bournemouth, Christchurch and Poole, England, BH1 2BU, United Kingdom","country_code":"GB","boundingBox":[50.7186529,50.7187529,-1.8760207,-1.8759207]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6e110d83-4937-42f9-8ec0-bca8d14ed1c7', '19f1f89e-52d5-4d5e-88dc-360132df26a9', 'BH Live', 'Schedule: Adults: Thurs 20.00; Sat 11.00 Kids Class', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.8456749,50.7371626]},"properties":{"address":"Queens Park South Drive BH8 9BJ","displayName":"Queen''s Park South Drive, Springbourne, Bournemouth, Bournemouth, Christchurch and Poole, England, BH8 9BJ, United Kingdom","country_code":"GB","boundingBox":[50.7366953,50.7371651,-1.8468618,-1.844606]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c1a8bec0-3aba-455d-a392-ffe7092d7993', '19f1f89e-52d5-4d5e-88dc-360132df26a9', 'The City of Portsmouth Girls'' School', 'Schedule: Adults: Mon 7.15pm; Kids: Mon 6.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.071864,50.8032249]},"properties":{"address":"St Marys Road, Portsmouth, PO1 5PF, UK","displayName":"St Marys Road, Kingston, Fratton, Portsmouth, England, PO1 5PJ, United Kingdom","country_code":"GB","boundingBox":[50.8029077,50.8040957,-1.0763874,-1.0672615]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('53dba26b-c2a2-440a-b1a8-2179b77b5f3f', '19f1f89e-52d5-4d5e-88dc-360132df26a9', 'Cantell School', 'Schedule: Kids: Tues 5.45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.3975873,50.9409368]},"properties":{"address":"Violet road, Southampton, SO16 3GJ","displayName":"Violet Road, Glen Eyre, Southampton, England, SO16 3GS, United Kingdom","country_code":"GB","boundingBox":[50.9405508,50.9410683,-1.3982153,-1.3970812]}}'::jsonb);

-- Group: Centro Cultural Senzala London
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('044b9362-ebe8-4599-866e-b4a98c462de7', NOW(), NOW(), 'Centro Cultural Senzala London', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Sanhaco (Julio Cesar Alves de Oliveira)
Main Contact: - 07834 553975
Notes: A student of Mestre Peixinho. Time not on current website as of 10/26/16. SOURCE: website 11/6/09, 10/26/16', 'gingasanha@gmail.com', '[{"type":"website","url":"http://senzala-london.co.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('02f70736-cce0-40d0-8698-4732290c6767', '044b9362-ebe8-4599-866e-b4a98c462de7', 'National Audit Office (Victoria)', 'Schedule: Mon 5:30pm (Mixed); Wed 5:30pm (Mixed)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.14827859999999998,51.4915987]},"properties":{"address":"157-197 Buckingham Palace Road, London, SW1W 9SP","displayName":"National Audit Office, 157-197, Buckingham Palace Road, Victoria, City of Westminster, Greater London, England, SW1W 9SP, United Kingdom","country_code":"gb","boundingBox":[51.4909736,51.4922323,-0.1491108,-0.1473421]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('781dd6e3-e9b9-43a6-afc1-6d2148c050e4', '044b9362-ebe8-4599-866e-b4a98c462de7', 'Artizan Community Centre (Liverpool Street)', 'Schedule: Mon 7:15pm-8:15pm (Mixed)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.07709379548635459,51.51539064391416]},"properties":{"address":"1 Artizan St, London, E1 7AF","displayName":"Artizan Street, Devonshire Square, City of London, Greater London, England, E1 7BS, United Kingdom","country_code":"gb","boundingBox":[51.5153262,51.5154551,-0.0771807,-0.0770069]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2bdcc9b7-3942-4da3-9561-fea3b9b12dcd', '044b9362-ebe8-4599-866e-b4a98c462de7', 'And Soul Sanctuary (Shoreditch)', 'Schedule: Tue 12pm-1pm (Beginners); Sun 12:30pm-1:30pm (Beginners)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.06664649609648063,51.52371895]},"properties":{"address":"114 Cheshire Street, London, E2 6EJ","displayName":"Reflection House, 112a-114, Cheshire Street, Spitalfields, Whitechapel, London Borough of Tower Hamlets, Greater London, England, E2 6HE, United Kingdom","country_code":"gb","boundingBox":[51.5235304,51.5239186,-0.0667393,-0.0665559]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('00f570ae-03e0-4933-9eec-0ee908f696a4', '044b9362-ebe8-4599-866e-b4a98c462de7', 'The Upper Room (Camden)', 'Schedule: Tue 7pm-8:30pm (Mixed); Sat 1:30pm-3pm (Mixed)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.14137059999999999,51.5384162]},"properties":{"address":"8 Greenland Street, London, NW1 0ND","displayName":"St Michael''s Church Community Space for Camden Town, 8, Greenland Street, Chalk Farm, Camden Town, London Borough of Camden, Greater London, England, NW1 0ND, United Kingdom","country_code":"gb","boundingBox":[51.5383152,51.5385104,-0.1415836,-0.1412108]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6d4af972-3b03-42a6-8564-efec528c3abd', '044b9362-ebe8-4599-866e-b4a98c462de7', 'Cecil Sharp House (Camden)', 'Schedule: Thu 6:30pm-7:30pm (Beginners); Thu 7:30pm-9:30pm (Mixed)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.14932189657075226,51.538146600000005]},"properties":{"address":"2 Regent''s Park Road, London, NW1 7AY","displayName":"Cecil Sharp House, 2, Regent''s Park Road, Primrose Hill, Chalk Farm, Camden Town, London Borough of Camden, Greater London, England, NW1 7AY, United Kingdom","country_code":"gb","boundingBox":[51.537996,51.538323,-0.1495841,-0.1490597]}}'::jsonb);

-- Group: Grupo Capoeira Brasil Hong Kong
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1a7ce988-0ab0-4336-a0fa-ae2ab2f43cfd', NOW(), NOW(), 'Grupo Capoeira Brasil Hong Kong', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - +852 9197 4429
Notes: Classes also in Mong Kok, Wan Chai, and Tsuen Wan. SOURCE: website facebook 3/8/17', 'info@capoeira.hk', '[{"type":"website","url":"http://capoeira.hk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('442e586e-cad4-4345-ac77-cf6407eb122e', '1a7ce988-0ab0-4336-a0fa-ae2ab2f43cfd', 'Capri Building', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[114.173653,22.3031362]},"properties":{"address":"130 Austin Road, Tsim Sha Tsui, Kowloon, Hong Kong","displayName":"嘉碧大廈 Capri Building, 130, 柯士甸道 Austin Road, 官涌 Kwun Chung, 尖沙咀 Tsim Sha Tsui, 油尖旺區 Yau Tsim Mong District, 九龍 Kowloon, 香港 Hong Kong, 中国","country_code":"CN","boundingBox":[22.3030731,22.3032872,114.1736021,114.1736993]}}'::jsonb);

-- Group: Capoeira Mandinga Aotearoa
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('dd5da5df-820f-4e4f-a8a8-b7166ddf62b2', NOW(), NOW(), 'Capoeira Mandinga Aotearoa', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Brabo (Grant Cole)
Main Contact: Colette Hanley - 0273242688
Notes: New Zealand. PO Box 68403 Newton, Auckland. Additional Facebook: http://www.facebook.com/groups/capoeiraotautahi/. SOURCE: website 2/9/17', 'capoeira@capoeira.org.nz', '[{"type":"website","url":"http://www.capoeira.org.nz/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('12e1c2d5-3413-4b29-9063-b98f4790fe8d', 'dd5da5df-820f-4e4f-a8a8-b7166ddf62b2', 'National Academy', 'Schedule: Full schedule of classes
Phone: 027 327 9716 or 06 752 4065
Email: taranaki@capoeira.org.nz', '{"type":"Feature","geometry":{"type":"Point","coordinates":[174.7566876,-36.8622298]},"properties":{"address":"29 Randolph St, Newton, Auckland","displayName":"29, Randolph Street, Newton, Eden Terrace, Waitematā, Auckland, 1002, New Zealand / Aotearoa","country_code":"NZ","boundingBox":[-36.8622798,-36.8621798,174.7566376,174.7567376]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d77392f6-4a69-4576-828b-c84b39edf43d', 'dd5da5df-820f-4e4f-a8a8-b7166ddf62b2', 'Central Primary School Hall', 'Phone: 0226800801
Email: capoeira@capoeira.org.nz', '{"type":"Feature","geometry":{"type":"Point","coordinates":[174.082271,-39.0592113]},"properties":{"address":"Pendarves Street, New Plymouth, New Zealand","displayName":"Pendarves Street, Strandon, New Plymouth, New Plymouth District, Taranaki, 4310, New Zealand / Aotearoa","country_code":"NZ","boundingBox":[-39.0605825,-39.0578233,174.077738,174.0867983]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('eefd0adf-45d1-41af-94a1-b16bbee5eeb2', 'dd5da5df-820f-4e4f-a8a8-b7166ddf62b2', 'Aro Valley community center', 'Schedule: Mon 6:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[174.7688892,-41.2953096]},"properties":{"address":"48 Aro St; Wellington","displayName":"Aro Valley Preschool, 48, Aro Street, Aro Valley, Wellington, Wellington City, Wellington, 6040, New Zealand / Aotearoa","country_code":"NZ","boundingBox":[-41.2953757,-41.2952366,174.7686367,174.7689955]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a3e3af69-eb10-4df6-8333-606f8c964fca', 'dd5da5df-820f-4e4f-a8a8-b7166ddf62b2', 'Thistle Hall', 'Schedule: Thurs 6:00-8:00pm
Email: Stephen@vital.org.nz', '{"type":"Feature","geometry":{"type":"Point","coordinates":[174.7736646,-41.2973613]},"properties":{"address":"293 Cuba St, Wellington","displayName":"Thistle Hall, 293, Cuba Street, Mount Cook, Wellington, Wellington City, Wellington, 6040, New Zealand / Aotearoa","country_code":"NZ","boundingBox":[-41.2974325,-41.2972782,174.7735252,174.7738041]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d3842953-6454-4eb2-be01-44f82df3df20', 'dd5da5df-820f-4e4f-a8a8-b7166ddf62b2', 'White Elephant HQ', 'Schedule: Tues & Thurs 6:00-8:00pm
Phone: 021774426', '{"type":"Feature","geometry":{"type":"Point","coordinates":[172.6550987,-43.5356106]},"properties":{"address":"442 Tuam Street. Christchurch","displayName":"442, Tuam Street, Phillipstown, Christchurch, Christchurch City, Canterbury, 8011, New Zealand / Aotearoa","country_code":"NZ","boundingBox":[-43.5356606,-43.5355606,172.6550487,172.6551487]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b554b5af-d413-43b2-8b11-85bde3e47f06', 'dd5da5df-820f-4e4f-a8a8-b7166ddf62b2', 'Taipa area school hall', 'Schedule: Tue & Wed, 4:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[173.9470106,-35.3755091]},"properties":{"address":"Northland","displayName":"Northland, New Zealand / Aotearoa","country_code":"NZ","boundingBox":[-36.5586286,-34.1935434,172.3928404,174.9935714]}}'::jsonb);

-- Group: Miami Capoeira Sol e Lua-United Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3329ebf7-202a-4da3-9539-e5ae42e4bb66', NOW(), NOW(), 'Miami Capoeira Sol e Lua-United Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRA Índia
Main Contact: - 305-332-1636
Notes: Miami Dade County, Florida. SOURCE: website 10/4/17', 'indiauca@gmail.com', '[{"type":"website","url":"http://www.miamicapoeirasolelua.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d267c9e7-5367-4559-80d0-0e6f43ac1851', '3329ebf7-202a-4da3-9539-e5ae42e4bb66', 'Miami location', 'Schedule: Full schedule of classes', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.2308184,25.7578202]},"properties":{"address":"2200 SW 16th St Miami Fl 33145","displayName":"2200, Southwest 16th Street, Miami, Miami-Dade County, Florida, 33145, United States of America","country_code":"US","boundingBox":[25.7577702,25.7578702,-80.2308684,-80.2307684]}}'::jsonb);

-- Group: Cordão de Ouro Miami
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('52e9c8bd-4766-42b4-974c-09e3023cdadf', NOW(), NOW(), 'Cordão de Ouro Miami', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTORA Rebelde
Main Contact: - 305 606 9191
Notes: Miami Dade County, Florida. Under Contra Mestre Espirrinho. Professora Casca Dura "Tania de Jesus" is living in Pembroke Pines, but does not appear to be teaching (facebook 11/5/17). SOURCE: webpage 11/3/17', 'rebeldecdo@gmail.com', '[{"type":"website","url":"https://cdomiami.wordpress.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fd230f44-ae10-4502-9c20-498a99e9815a', '52e9c8bd-4766-42b4-974c-09e3023cdadf', 'Little Haiti Cultural Center', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.1914299,25.8301861]},"properties":{"address":"212 NE 59th Terrace, Miami, FL","displayName":"Little Haiti Cultural Center, 212, Northeast 59th Terrace, Little Haiti, Bayshore, Miami, Miami-Dade County, Florida, 33137, United States of America","country_code":"US","boundingBox":[25.8298759,25.8304927,-80.1915825,-80.1911011]}}'::jsonb);

-- Group: Morro Verde Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('acfc336d-11de-4468-b9f3-04162610fcfe', NOW(), NOW(), 'Morro Verde Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRA Gata Brava (Leigh Robinson)
Main Contact: - [858] 688-0316
Notes: New Hope, PA. Under Mestre Doutor. Estagiário Rolha "Corky Brown" (galaxyblur@gmail.com, [856] 237-930m). SOURCE: website 4/3/19', 'gatabravacapoeira@gmail.com', '[{"type":"website","url":"http://www.newhopecapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('376b4351-a8d2-4f34-8a5c-e754187fc1f3', 'acfc336d-11de-4468-b9f3-04162610fcfe', 'New Hope location', 'Schedule: Adults: Mon 7:30-9:00pm; Tues 6:30-8:00pm; Thurs 7:00-8:30pm; Music: Wed 5:30-6:30pm; Kids 6 and up: Tues 5:30-6:30pm; Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.9512785,40.3642728]},"properties":{"address":"New Hope, PA 18938","displayName":"New Hope, Bucks County, Pennsylvania, United States of America","country_code":"US","boundingBox":[40.3497411,40.3735144,-74.9685192,-74.9454628]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3d2e8126-b6dc-4cd8-b1f1-218edb88fee3', 'acfc336d-11de-4468-b9f3-04162610fcfe', 'New Hope Fitness', 'Schedule: Wed 12:00-1:00pm (Please contact if you''re interested in this class)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.9757146,40.3559836]},"properties":{"address":"6542-K Lower York Road, New Hope, PA 18938","displayName":"New Hope Fitness, 6542, Lower York Road, Reeder, New Hope, Bucks County, Pennsylvania, 18938, United States of America","country_code":"US","boundingBox":[40.3557761,40.356188,-74.9759667,-74.9754678]}}'::jsonb);

-- Batch: batch-03.json (38 groups)

-- Group: ASCAB [Associação Santista de Capoeira Areia Branca]
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cc5ac8ea-9deb-46d2-8532-e9aa9b8a6f5d', NOW(), NOW(), 'ASCAB [Associação Santista de Capoeira Areia Branca]', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Doutor (Adenilson dos Santos)
Main Contact: - 215-601-9117
Notes: Philadelphia, PA. Formado Canguru "Antonio Marcos Correa" - Website offline 6/28/19, 2l5-9OO-977O, email has been disabled 7/3/19 (SOURCE: website 6/27/06). SOURCE: website 6/29/19', NULL, '[{"type":"website","url":"http://www.projectcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('059cb6d3-6d37-414b-8b6f-c9fee9c29755', 'cc5ac8ea-9deb-46d2-8532-e9aa9b8a6f5d', 'Philadelphia Capoeira Arts Center', 'Schedule: Full Schedule of classes, kids teens beginners all levels. See website for details', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-75.1595353,39.9559105]},"properties":{"address":"1213 Race Street, Philadelphia, PA 19107","displayName":"1213, Race Street, Chinatown, Fashion District Philadelphia, Center City, Philadelphia, Philadelphia County, Pennsylvania, 19107, United States of America","country_code":"US","boundingBox":[39.9558605,39.9559605,-75.1595853,-75.1594853]}}'::jsonb);

-- Group: ICAF-Philadelphia Chapter
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('263b7ad4-2805-42cd-8e03-b3ca7f808ebc', NOW(), NOW(), 'ICAF-Philadelphia Chapter', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 215.500.5987
Notes: Philadelphia, PA. SOURCE: website 6/29/19', 'Info@ficaphiladelphia.org', '[{"type":"website","url":"http://www.ficaphiladelphia.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5955d32d-d27c-4be2-83c6-bb3bccd81ec6', '263b7ad4-2805-42cd-8e03-b3ca7f808ebc', 'Martin Luther King Recreation Center', 'Schedule: Classes Tues & Thurs 6:30-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-75.1651867,39.9796396]},"properties":{"address":"22nd Street & Cecil B. Moore Avenue Philadelphia","displayName":"Cecil B Moore Avenue, Sharswood, North Philadelphia, Philadelphia, Philadelphia County, Pennsylvania, 19121, United States of America","country_code":"US","boundingBox":[39.9786738,39.9806198,-75.1724979,-75.1578703]}}'::jsonb);

-- Group: Capoeira Angola of Mestre João Grande
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0a6d92cb-3883-4d98-bbca-2eb1624b4ec1', NOW(), NOW(), 'Capoeira Angola of Mestre João Grande', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Chris Young
Notes: Pittsburgh, PA. Kung Fu. "Chris Young." under Mestre João Grande [New York]. SOURCE: email website 7/3/19', NULL, '[{"type":"website","url":"http://www.steel-dragon.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6d44f3bd-83cc-41ac-a919-0bd89fe5b8d7', '0a6d92cb-3883-4d98-bbca-2eb1624b4ec1', 'Steel Dragon Kung Fu', 'Schedule: Adults Fri 7:00-9:00pm; Sun 3:00-5:00pm; Kids: Mon & Wed 5:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.964289,40.473366]},"properties":{"address":"100 43rd St, Pittsburgh, PA 15201","displayName":"100, 43rd Street, Lawrenceville, Central Lawrenceville, Pittsburgh, Allegheny County, Pennsylvania, 15201, United States of America","country_code":"US","boundingBox":[40.473316,40.473416,-79.964339,-79.964239]}}'::jsonb);

-- Group: Ecole d'Arts Martiaux Bresiliens de Laval
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9b676bb1-fe53-4c46-a6d7-1b7b8fc21a3f', NOW(), NOW(), 'Ecole d''Arts Martiaux Bresiliens de Laval', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Perninha (Vitor Silva Dos Santos)
Main Contact: - +1 514-814-4530
Notes: Laval, Quebec, Canada. SOURCE: website 3/22/17, email 7/30/12', 'info@ecolecapoeiralaval.com', '[{"type":"website","url":"https://www.ecolecapoeiralaval.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('12756322-f34c-4acd-8b55-b0fce8be9f8b', '9b676bb1-fe53-4c46-a6d7-1b7b8fc21a3f', 'Laval location', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.6985976,45.5670147]},"properties":{"address":"103 Boulevard de la Concorde Ouest, Laval, QC, H7N 1H8, Canada","displayName":"103, Boulevard de la Concorde Ouest, Laval-des-Rapides, Laval (région administrative), Québec, H7N 2C8, Canada","country_code":"CA","boundingBox":[45.5669647,45.5670647,-73.6986476,-73.6985476]}}'::jsonb);

-- Group: Grupo Forca Rara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('95a3db67-b4c1-469d-9b4d-4c848e7fab9f', NOW(), NOW(), 'Grupo Forca Rara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Ninja (Luis Felipe Pinto)
Notes: Lenexa, Kansas. Under Mestre Saracura, Indaiatuba-SP Brazil. SOURCE: website 3/27/16', NULL, '[{"type":"website","url":"http://www.brazilacademyusa.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('954d46f0-7b66-466b-be38-fc37c6773cc5', '95a3db67-b4c1-469d-9b4d-4c848e7fab9f', 'Brazil Academy', 'Schedule: Full schedule of classes
Phone: [913]220-2153', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-94.7599216,38.9211916]},"properties":{"address":"11441 Strang Line Rd. Lenexa, KS 66215","displayName":"11441, Strang Line Road, Lackmans, Lenexa, Johnson County, Kansas, 66215, United States of America","country_code":"US","boundingBox":[38.9211416,38.9212416,-94.7599716,-94.7598716]}}'::jsonb);

-- Group: Filhos de Bimba
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('eef3f3d8-fdbd-455d-b1f5-cb8599ca19b6', NOW(), NOW(), 'Filhos de Bimba', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 07873 847703.
Notes: SOURCE: website 11/7/16  1/16/20', 'mestre.pelicano@gmail.com', '[{"type":"website","url":"https://mestrepelicano.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b67258b5-391e-4253-acf3-7a5c89f9f93e', 'eef3f3d8-fdbd-455d-b1f5-cb8599ca19b6', 'Mulberry Sports and Leisure Centre', 'Schedule: Thurs  7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0602945,51.514594]},"properties":{"address":"Richard Street, Shadwell, London, E1 2JP, UK","displayName":"Richard Street, St. George in the East, Whitechapel, London Borough of Tower Hamlets, London, Greater London, England, E1 2FE, United Kingdom","country_code":"GB","boundingBox":[51.5144756,51.5147125,-0.0603144,-0.0602757]}}'::jsonb);

-- Group: Mojuba Capoeria
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('03bd2eca-0b6c-45bb-9e94-eefdf72a1439', NOW(), NOW(), 'Mojuba Capoeria', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Ponciano Almeida
Main Contact: - 368
Notes: SOURCE: website 1/19/20', NULL, '[{"type":"website","url":"http://www.mojuba.co.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('80519db7-b3fb-4c63-8df6-dd283698f339', '03bd2eca-0b6c-45bb-9e94-eefdf72a1439', 'North End Road', 'Schedule: All Levels: Mon 20.30-22.00; Wed 18.00-19.20,; All Levels:  Thurs 18:00-19:00; Fri 18.30-20:30; Sun 10:30-12:00; Music: Wed 19:30-20:30; Sun 12:30-13:30; All Levels: Tues & Thurs 20:00-21.30; All Levels: Sat 17:00-18:30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1996097,51.4811645]},"properties":{"address":"368 North End Road, London, SW6 1LY, UK","displayName":"Dance Attic Studios, 368, North End Road, Walham Green, Fulham, London Borough of Hammersmith and Fulham, London, Greater London, England, SW6 1LY, United Kingdom","country_code":"GB","boundingBox":[51.4810326,51.481279,-0.199971,-0.1992752]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8f2c46b8-6b6f-4fb6-9e93-54c6d575136a', '03bd2eca-0b6c-45bb-9e94-eefdf72a1439', 'Duke''s Road', 'Schedule: All Levels: Mon 20.30-22.00; Wed 18.00-19.20,; All Levels:  Thurs 18:00-19:00; Fri 18.30-20:30; Sun 10:30-12:00; Music: Wed 19:30-20:30; Sun 12:30-13:30; All Levels: Tues & Thurs 20:00-21.30; All Levels: Sat 17:00-18:30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1286962,51.5273868]},"properties":{"address":"17 Duke''s Road, London, WC1H 9PY, UK","displayName":"The Place, 17, Duke''s Road, St Pancras, London Borough of Camden, London, Greater London, England, WC1H 9PY, United Kingdom","country_code":"GB","boundingBox":[51.527042,51.5278322,-0.1292357,-0.1282312]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('55b94cb8-638b-4688-ae13-d0bccca31746', '03bd2eca-0b6c-45bb-9e94-eefdf72a1439', 'Langley Street', 'Schedule: All Levels: Mon 20.30-22.00; Wed 18.00-19.20,; All Levels:  Thurs 18:00-19:00; Fri 18.30-20:30; Sun 10:30-12:00; Music: Wed 19:30-20:30; Sun 12:30-13:30; All Levels: Tues & Thurs 20:00-21.30; All Levels: Sat 17:00-18:30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1252772,51.5132082]},"properties":{"address":"7 Langley Street, Covent Garden, London, WC2H 9JA, UK","displayName":"Langley Street, Seven Dials, Bloomsbury, City of Westminster, Greater London, England, WC2H 9JA, United Kingdom","country_code":"GB","boundingBox":[51.5128625,51.5135599,-0.1257552,-0.1247948]}}'::jsonb);

-- Group: Danca Da Liberdade
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c38ebfe5-1d12-4238-937b-4d36632a19ab', NOW(), NOW(), 'Danca Da Liberdade', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 07 739 973 890
Notes: SOURCE: website  1/19/20', 'info@ddluk.org', '[{"type":"website","url":"http://www.dancadaliberdade.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('150d3b5e-147b-42f4-951c-06cccd3fdd25', 'c38ebfe5-1d12-4238-937b-4d36632a19ab', 'Kennington Park Centre', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.12828,51.4341658]},"properties":{"address":"136 Streatham High Road, London, SW16 1BW, UK","displayName":"Streatham High Road, Streatham, London Borough of Lambeth, London, Greater London, England, SW16 1BW, United Kingdom","country_code":"GB","boundingBox":[51.4340125,51.4343195,-0.1282962,-0.1282602]}}'::jsonb);

-- Group: Olorum Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e0c2e7b5-3aaf-453d-b7f1-9d71e13bc0e5', NOW(), NOW(), 'Olorum Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Danny Kearns
Main Contact: - +44 [0]79 7712 3581
Notes: SOURCE: website 1/22/20', NULL, '[{"type":"website","url":"http://www.olorumcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bdc85235-a163-4fb5-a4bf-3ab482d458ad', 'e0c2e7b5-3aaf-453d-b7f1-9d71e13bc0e5', 'Northcote Road', 'Schedule: Adults [All levels]: Thurs 20:10-21:40; Sat 10:30-12:30; Adults [Advanced Class]Wed 19:00-21:00; Kids [from 5 years old all levels]: Sat 9:30-10:30Professora Boca Rica "Raquel Pereira"; Wed 16:30-17:30 - Kids  [all levels - from 5 years old]; Harmony Hall; Mon 16:30-17:30 - Kids [all levels - from 5 years old] with Professor Seguidor "Danny Kearns"; Harmony Hall; Thurs 16:30-17:30 - Kids  [from 5 years old -  * all levels] with', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0302913,51.5852869]},"properties":{"address":"Northcote Road, Walthamstow, London, E17 6PQ, UK","displayName":"Northcote Road, London Borough of Waltham Forest, London, Greater London, England, E17 7DU, United Kingdom","country_code":"GB","boundingBox":[51.5851224,51.5854515,-0.0308938,-0.0296889]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3adcc125-5417-4023-b276-156b9142ee56', 'e0c2e7b5-3aaf-453d-b7f1-9d71e13bc0e5', 'Leswin Road', 'Schedule: Adults [All levels]: Thurs 20:10-21:40; Sat 10:30-12:30; Adults [Advanced Class]Wed 19:00-21:00; Kids [from 5 years old all levels]: Sat 9:30-10:30Professora Boca Rica "Raquel Pereira"; Wed 16:30-17:30 - Kids  [all levels - from 5 years old]; Harmony Hall; Mon 16:30-17:30 - Kids [all levels - from 5 years old] with Professor Seguidor "Danny Kearns"; Harmony Hall; Thurs 16:30-17:30 - Kids  [from 5 years old -  * all levels] with', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0730045,51.5599625]},"properties":{"address":"61 Leswin Road, London, N16 7NX, UK","displayName":"Leswin Road, West Hackney, London Borough of Hackney, London, Greater London, England, N16 7NX, United Kingdom","country_code":"GB","boundingBox":[51.5592987,51.56062,-0.0730148,-0.0729873]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('89f85039-0926-4616-9b2d-9f33d1659333', 'e0c2e7b5-3aaf-453d-b7f1-9d71e13bc0e5', 'Truro Road', 'Schedule: Adults [All levels]: Thurs 20:10-21:40; Sat 10:30-12:30; Adults [Advanced Class]Wed 19:00-21:00; Kids [from 5 years old all levels]: Sat 9:30-10:30Professora Boca Rica "Raquel Pereira"; Wed 16:30-17:30 - Kids  [all levels - from 5 years old]; Harmony Hall; Mon 16:30-17:30 - Kids [all levels - from 5 years old] with Professor Seguidor "Danny Kearns"; Harmony Hall; Thurs 16:30-17:30 - Kids  [from 5 years old -  * all levels] with', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0261758,51.5838888]},"properties":{"address":"10 Truro Road, Walthamstow, E17 7BY, UK","displayName":"Truro Road, London Borough of Waltham Forest, London, Greater London, England, E17 7BY, United Kingdom","country_code":"GB","boundingBox":[51.5836583,51.5841194,-0.0263584,-0.0259931]}}'::jsonb);

-- Group: UR Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('09e44ba3-e909-4055-a159-ab869c275ea3', NOW(), NOW(), 'UR Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Simon Atkinson
Main Contact: - 07779031273
Notes: SOURCE: website 1020/20', NULL, '[{"type":"website","url":"http://www.capoeira.co.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('af58f18b-7d12-4f65-b919-f86eeef13986', '09e44ba3-e909-4055-a159-ab869c275ea3', 'Stonebridge Gardens', 'Schedule: Mon 7:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0744177,51.5395585]},"properties":{"address":"Haggerston Road, Hackney, London, E8 4EP, UK","displayName":"Haggerston Road, De Beauvoir Town, Haggerston, London Borough of Hackney, London, Greater London, England, E8 4EX, United Kingdom","country_code":"GB","boundingBox":[51.539546,51.5395709,-0.0744309,-0.0744045]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1d997bb8-4433-4ae7-ad0c-9e7db94b166a', '09e44ba3-e909-4055-a159-ab869c275ea3', 'SPACe Gym', 'Schedule: Tues 8:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0789463,51.5307898]},"properties":{"address":"31 Falkirk Street, Hoxton, London, N1 6HF, UK","displayName":"Falkirk Street, Shoreditch, London Borough of Hackney, London, Greater London, England, N1 6SA, United Kingdom","country_code":"GB","boundingBox":[51.5307237,51.5308505,-0.0801919,-0.0777011]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3438e069-6b1b-4bc3-a88e-087f33cfda92', '09e44ba3-e909-4055-a159-ab869c275ea3', 'Rhodes Community Hall', 'Schedule: Thurs 7:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.072611,51.5455927]},"properties":{"address":"Kirkland Walk, Hackney, London, UK","displayName":"Kirkland Walk, Rhodes Estate, Dalston, London Borough of Hackney, London, Greater London, England, E8 3SY, United Kingdom","country_code":"GB","boundingBox":[51.54551,51.5456754,-0.0726115,-0.0726106]}}'::jsonb);

-- Group: Capoeira Angola Palmares
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('6d71dcab-4db0-494e-9a76-e1e4b42c11f8', NOW(), NOW(), 'Capoeira Angola Palmares', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 07813 554785
Notes: SOURCE:   website 1/28/20', 'info@capoeirapalmares.co.uk', '[{"type":"website","url":"http://capoeirapalmares.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5b1fa6c7-ceea-4b58-a447-2fdd5c9d30a2', '6d71dcab-4db0-494e-9a76-e1e4b42c11f8', 'St. Mildred''s Church Hall', 'Schedule: Mon 7:15-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0612255,51.3914253]},"properties":{"address":"5 Albert Road, Addiscombe, Croydon, CR0 5PE, UK","displayName":"Albert Road, Woodside, London Borough of Croydon, London, Greater London, England, SE25 4RN, United Kingdom","country_code":"GB","boundingBox":[51.3907112,51.3921543,-0.0619136,-0.0605227]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cbb4a90d-26d6-44cc-b8e5-94215d054328', '6d71dcab-4db0-494e-9a76-e1e4b42c11f8', 'University of Law Bloomsbury', 'Schedule: Tues 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1193869,51.5178134]},"properties":{"address":"100 High Holborn, London, WC1V 6LJ, UK","displayName":"Caffè Nero, 100-110, High Holborn, Gray''s Inn, Holborn, London Borough of Camden, London, Greater London, England, WC1V 6QL, United Kingdom","country_code":"GB","boundingBox":[51.5177634,51.5178634,-0.1194369,-0.1193369]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e63c55b7-70d5-4085-9f44-b004cd3aa289', '6d71dcab-4db0-494e-9a76-e1e4b42c11f8', 'Queens Park Community School', 'Schedule: Wed 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2039971,51.5335275]},"properties":{"address":"Salusbury Road, London, UK","displayName":"Salusbury Road, Queen''s Park, London Borough of Brent, London, Greater London, England, NW6 6BF, United Kingdom","country_code":"GB","boundingBox":[51.5334063,51.5336461,-0.2041281,-0.2038686]}}'::jsonb);

-- Group: Association of Capoeira Engenho da Rainha
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('66b76627-0fa0-4579-8961-ae7f1ffa0299', NOW(), NOW(), 'Association of Capoeira Engenho da Rainha', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 44 [0] 7921 66 77 26
Notes: SOURCE: website 10/30/16
SOURCE: website 2/5/20', 'e.rodrigo@acercapoeira.com', '[{"type":"website","url":"http://www.capoeiraworld.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1fe7cc4e-c0ad-4427-a3bb-6a20ea417312', '66b76627-0fa0-4579-8961-ae7f1ffa0299', 'Sands End Community Centre', 'Schedule: Mon 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2109249,51.4708886]},"properties":{"address":"66 High Street, Fulham, London, SW6 3LJ, UK","displayName":"Fulham High Street, Hurlingham, Fulham, London Borough of Hammersmith and Fulham, London, Greater London, England, SW6 3LQ, United Kingdom","country_code":"GB","boundingBox":[51.4705411,51.4712772,-0.2110829,-0.2106859]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('869925a7-4663-415b-9985-ba07fcc7d573', '66b76627-0fa0-4579-8961-ae7f1ffa0299', 'Greyhound Community Centre', 'Schedule: Wed 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2305592,51.4654018]},"properties":{"address":"Dryburgh Road, Putney, London, SW15 1BL, UK","displayName":"Dryburgh Road, Putney, London Borough of Wandsworth, London, Greater London, England, SW15 1BL, United Kingdom","country_code":"GB","boundingBox":[51.4651916,51.4659956,-0.2335588,-0.2293608]}}'::jsonb);

-- Group: Capoeira Muzenza
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c8f57104-683a-403b-9df8-203b1cadc08e', NOW(), NOW(), 'Capoeira Muzenza', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR
Main Contact: - 078 4134 2874
Notes: SOURCE: websites 2/26/20
SOURCE:  website  2/26/20', 'capoeiracademyuk@gmail.com', '[{"type":"website","url":"http://capoeiracademyuk.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('05aa6bf7-85d9-42bd-b422-861205ec3676', 'c8f57104-683a-403b-9df8-203b1cadc08e', 'The Broadway', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3339538,51.6004812]},"properties":{"address":"25 The Broadway, HA7 4DA, UK","displayName":"27,25,23,21, The Broadway, Wealdstone, London Borough of Harrow, London, Greater London, England, HA3 7EH, United Kingdom","country_code":"GB","boundingBox":[51.6003188,51.6006435,-0.3341103,-0.3337972]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('91a3a887-6937-4899-9dfd-40e2908700ee', 'c8f57104-683a-403b-9df8-203b1cadc08e', 'Mycenae Road', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.0162807,51.4796406]},"properties":{"address":"90 Mycenae Road, Blackheath, SE3 7SE, UK","displayName":"Woodlands House, 90, Mycenae Road, Blackheath Royal Standard, Blackheath, Royal Borough of Greenwich, London, Greater London, England, SE3 7SE, United Kingdom","country_code":"GB","boundingBox":[51.4795204,51.4797507,0.0160341,0.0165082]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0199f8c6-371f-46fa-83bd-df477d9ced01', 'c8f57104-683a-403b-9df8-203b1cadc08e', 'Kings Cross', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1175506,51.5312377]},"properties":{"address":"Kings Cross, London, N1 9GA, UK","displayName":"Kings cross, Pentonville Road, Pentonville, Barnsbury, London Borough of Islington, London, Greater London, England, N1 9UZ, United Kingdom","country_code":"GB","boundingBox":[51.5311877,51.5312877,-0.1176006,-0.1175006]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6e6d0bdb-6bb3-4fdc-9cde-839d73d54cc6', 'c8f57104-683a-403b-9df8-203b1cadc08e', 'City Road', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1027165,51.5310801]},"properties":{"address":"361-373 City Road, London, EC1, UK","displayName":"City Road, Angel, Islington, London Borough of Islington, London, Greater London, England, EC1V 1LR, United Kingdom","country_code":"GB","boundingBox":[51.5309015,51.5312587,-0.1034045,-0.1020284]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e3b9541f-44ac-4945-9f81-23a8d982bb03', 'c8f57104-683a-403b-9df8-203b1cadc08e', 'Ainsworth Road', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0507183,51.5396756]},"properties":{"address":"Ainsworth Road, London, UK","displayName":"Ainsworth Road, Victoria Park Village, Hackney, London Borough of Hackney, London, Greater London, England, E9 7LP, United Kingdom","country_code":"GB","boundingBox":[51.5388225,51.5405177,-0.0512788,-0.0501748]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('aaf3fba5-5039-42ef-90fc-07c93d0bca3f', 'c8f57104-683a-403b-9df8-203b1cadc08e', 'James Lane', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.0042018,51.5755155]},"properties":{"address":"James Lane, Leytonstone, London, E11 1NS, UK","displayName":"James Lane, Whipps Cross, Leytonstone, London Borough of Waltham Forest, London, Greater London, England, E11 1NS, United Kingdom","country_code":"GB","boundingBox":[51.5750804,51.575915,0.0035823,0.0048447]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('77e95e79-8210-4350-9aaa-cded6ec52684', 'c8f57104-683a-403b-9df8-203b1cadc08e', 'Woodville Road', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0816084,51.5508423]},"properties":{"address":"Woodville Road, London, N16 8NA, UK","displayName":"Woodville Road, Mayville Estate, Islington, London Borough of Islington, London, Greater London, England, N16 8NE, United Kingdom","country_code":"GB","boundingBox":[51.5502039,51.5514732,-0.0820579,-0.0811602]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('81212907-b160-47a0-85c4-8097632a3c53', 'c8f57104-683a-403b-9df8-203b1cadc08e', 'Kayani Avenue', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0918882,51.5707101]},"properties":{"address":"Kayani Avenue, London, N4 2HF, UK","displayName":"Kayani Avenue, Brownswood Park, Stoke Newington, London Borough of Hackney, London, Greater London, England, N4 2GU, United Kingdom","country_code":"GB","boundingBox":[51.5701859,51.5712464,-0.0920284,-0.0917419]}}'::jsonb);

-- Group: Capoeira Science
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('05b3c218-17a3-43e0-864d-ae85515f3d7f', NOW(), NOW(), 'Capoeira Science', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 07853611496
Notes: SOURCE: website 2/28/2020', 'info@capoeirascience.co.uk', '[{"type":"website","url":"http://www.capoeirascience.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c0f3487c-65e7-4393-b04d-e14e3e3c80d7', '05b3c218-17a3-43e0-864d-ae85515f3d7f', 'Wandsworth Road', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1437744,51.4683931]},"properties":{"address":"283-291 Wandsworth Road, London,","displayName":"Wandsworth Road, Clapham, London Borough of Lambeth, London, Greater London, England, SW8 3JE, United Kingdom","country_code":"GB","boundingBox":[51.4681047,51.4686523,-0.1443861,-0.1431497]}}'::jsonb);

-- Group: Capoeira Ceara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('feadee97-b1b1-43f8-97e6-1cf05ccd4fb0', NOW(), NOW(), 'Capoeira Ceara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITORA
Main Contact: - 44 78233 33962
Notes: SOURCE: website 1/21/20', 'frangolino@capoeira-ceara.co.uk', '[{"type":"website","url":"http://capoeira-ceara.co.uk."}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('db18f3c3-1fe0-4ab9-925e-c077215bd257', 'feadee97-b1b1-43f8-97e6-1cf05ccd4fb0', 'Parish Church of St. Jude on the Hill', 'Schedule: Mon 7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0999825,51.5024846]},"properties":{"address":"1 Pocock Street, London, NW11, UK","displayName":"1-15, Pocock Street, Bankside, Southwark, London Borough of Southwark, London, Greater London, England, SE1 0BJ, United Kingdom","country_code":"GB","boundingBox":[51.5023043,51.5027477,-0.1008825,-0.099083]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('554ccf38-8251-4fd9-a51a-2186f53781cd', 'feadee97-b1b1-43f8-97e6-1cf05ccd4fb0', 'Orchard Hall', 'Schedule: Wed 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2660186,51.6088906]},"properties":{"address":"145 Orange Hill Road, Burnt Oak, Edgware, HA8 0TW, UK","displayName":"Watling Community Centre, 145, Orange Hill Road, Burnt Oak, Edgware, London, Greater London, England, HA8 0TR, United Kingdom","country_code":"GB","boundingBox":[51.6087187,51.6090606,-0.2663074,-0.2657497]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3e34d6fe-5431-46b6-810d-8e26bc728461', 'feadee97-b1b1-43f8-97e6-1cf05ccd4fb0', 'Clissold Park', 'Schedule: Sat 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0857374,51.5603672]},"properties":{"address":"Clissold Road, Stoke Newington, London, N16 9HJ, UK","displayName":"Clissold Road, Stoke Newington, London Borough of Hackney, London, Greater London, England, N16 9HD, United Kingdom","country_code":"GB","boundingBox":[51.5603466,51.5603852,-0.0857639,-0.0857132]}}'::jsonb);

-- Group: Capoeira Angola - South London
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('edb96d73-440f-4ce8-9f1e-9671c4594bd2', NOW(), NOW(), 'Capoeira Angola - South London', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 50
Notes: SOURCE: website 2/21/20', NULL, '[{"type":"website","url":"http://www.capoeiradeangola.net"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('63cb5609-07b7-490c-b00d-d7c12b3e041b', 'edb96d73-440f-4ce8-9f1e-9671c4594bd2', '50A Corry Dr', 'Schedule: Wed 7.30-9.00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1066799,51.4605046]},"properties":{"address":"50A Corry Dr, Brixton, London SW9 8QT","displayName":"Corry Drive, Brixton, London Borough of Lambeth, London, Greater London, England, SW9 8QT, United Kingdom","country_code":"GB","boundingBox":[51.4599525,51.4612441,-0.1074557,-0.1063773]}}'::jsonb);

-- Group: Capoeira Volta Ao Mundo Louisville
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d628b401-0c94-42c8-960d-0cb00c343e20', NOW(), NOW(), 'Capoeira Volta Ao Mundo Louisville', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 502-641-7218
Notes: Louisville, Kentucky. The information on Derby City Martial Arts page (http://www.derbycitymartialarts.com/app_pages/capoeira.php) appears to be out of date as of 4/22/18. SOURCE: website 4/22/18', NULL, '[{"type":"website","url":"https://www.capovam.com/locations/louisville/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('61d0a7c7-5263-4f60-ba95-45dcfe37be2c', 'd628b401-0c94-42c8-960d-0cb00c343e20', 'Freestyle Fitness', 'Schedule: Adults: Mon 8:00-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-85.6866547,38.2547294]},"properties":{"address":"2920 Frankfort Ave, Louisville, KY, 40206","displayName":"2920, Frankfort Avenue, Louisville, Jefferson County, Kentucky, 40206, United States of America","country_code":"US","boundingBox":[38.2546794,38.2547794,-85.6867047,-85.6866047]}}'::jsonb);

-- Group: Capoeira North West - Capoeira Cordao De Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('db4e680e-2e2f-4f05-b548-8cc44f885e46', NOW(), NOW(), 'Capoeira North West - Capoeira Cordao De Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Parente
Main Contact: - +44 7949 711 745
Notes: Manchester, England. SOURCE: website 11/17/16', 'cdonorthwest@gmail.com', '[{"type":"website","url":"http://cdonw.co.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('98eab53d-d811-45f3-9b8e-b0081e5f38db', 'db4e680e-2e2f-4f05-b548-8cc44f885e46', 'The Trinity Centre', 'Schedule: All Levels: Thurs 7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-2.2382108,53.4663415]},"properties":{"address":"Higher Cambridge St, Hulme. M15 6HP","displayName":"Higher Cambridge Street, First Street, Hulme, Manchester, Greater Manchester, England, M15 6AR, United Kingdom","country_code":"GB","boundingBox":[53.4662796,53.4664035,-2.2382653,-2.2381564]}}'::jsonb);

-- Group: Cordo de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f89b65fe-3bb7-4140-a307-a559cbacd5b7', NOW(), NOW(), 'Cordo de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Cascao
Notes: Norfolk, England. Professor Cascao under Mestre Papa-Leguas [Patos de Minas, Minas Gerais]. SOURCE: website 11/18/16', NULL, '[{"type":"website","url":"http://capocoms.org.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1d8ac940-0e4e-4116-8ad2-3df0132df682', 'f89b65fe-3bb7-4140-a307-a559cbacd5b7', 'Trinity church hall', 'Schedule: Adults, All levels: 19:00-20:30pm; Age 4-7 years: Tues 15:30-16:15 pm; Age 8 upwards: Tues 16:15-17:15 pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[1.2710178,52.6203078]},"properties":{"address":"1,Unthank road, Norwich, NR2 2PA","displayName":"1-6 Pym House, 260, Unthank Road, Mount Pleasant, Eaton, Norwich, Norfolk, England, NR2 2AJ, United Kingdom","country_code":"GB","boundingBox":[52.6202229,52.6203795,1.2709014,1.2711955]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cacf9cbc-655d-48d4-b384-768407dd904c', 'f89b65fe-3bb7-4140-a307-a559cbacd5b7', 'Sportspark Dance Studio', 'Schedule: Wed & Fri 3.15-5.15 pm; Sun 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[1.2409256,52.6245439]},"properties":{"address":"Sportspark, University of East Anglia, Norwich, UK","displayName":"Sportspark, University of East Anglia, Norwich, Norfolk, England, NR4 7TJ, United Kingdom","country_code":"GB","boundingBox":[52.6236661,52.6249165,1.2405376,1.2421443]}}'::jsonb);

-- Group: ABADA-Capoeira Marin
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8229548c-b073-4a89-bf58-d8ae5f1560b7', NOW(), NOW(), 'ABADA-Capoeira Marin', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Prego (Diego Freitas)
Main Contact: - 415 420 9350
Notes: Marin County, California. Instrutor Prego and Graduada Ciranda ''Lisa Willoughby'' under Mestra Cigarra [San Francisco]. SOURCE: website 7/13/17', 'abadamarin@gmail.com', '[{"type":"website","url":"https://abadamarin.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ea7b3fd4-51d1-4f6b-a1df-95792bb82673', '8229548c-b073-4a89-bf58-d8ae5f1560b7', 'San Rafael Community Services', 'Schedule: Toddler 2-4 y/o: Tues 4:15-4:45pm: Sat 9:00-9:30am; Youth 5-12 y/o Tues 5:00-6:00pm; Sat 9:45-10:45am; Teen/Adult13 and up: Tues 6:30-8:00pm; Sat 9:45-11:15am
Phone: 415 485 3333', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.5292452,37.9694571]},"properties":{"address":"618 B Street, San Rafael, CA 94901","displayName":"San Rafael Community Center, 618, B Street, San Rafael, Marin County, California, 94902, United States of America","country_code":"US","boundingBox":[37.9692018,37.9697162,-122.5294175,-122.5288381]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3ee25248-61c0-49eb-94db-5012da342d4b', '8229548c-b073-4a89-bf58-d8ae5f1560b7', 'Strawberry Community Center', 'Schedule: 5-12 y/o: Mon 3:45-4:45pm
Phone: 415 420 9350', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.5449763,37.9060368]},"properties":{"address":"Mill Valley, CA 94941","displayName":"Mill Valley, Marin County, California, United States of America","country_code":"US","boundingBox":[37.886477,37.9296329,-122.5769802,-122.5143818]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cb449e6f-88c9-4802-9dd2-f2d8b8c0fea8', '8229548c-b073-4a89-bf58-d8ae5f1560b7', 'Marinwood Community Services', 'Schedule: 2-4 y/o: Wed 2:15pm-2:45pm; 5-7 y/o: Wed 3:00pm-3:50pm; 8-12 y/o: Wed 3:50-4:50pm
Phone: 415 479 7751', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.5523632,38.0279059]},"properties":{"address":"775 Miller Creek Road San Rafael, CA 94903","displayName":"Marinwood Community Center, 775, Miller Creek Road, Lucas Valley, Lucas Valley-Marinwood, San Rafael, Marin County, California, 94903, United States of America","country_code":"US","boundingBox":[38.0278559,38.0279559,-122.5524132,-122.5523132]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('914346ad-5b1a-46d4-b4a3-ff2e09671d03', '8229548c-b073-4a89-bf58-d8ae5f1560b7', 'Corte Madera Recreation. Center', 'Schedule: 3-5 y/o: Thurs3 3:15-3:45pm; 6-12 y/o: Thurs 3 4:00-5:00pm
Phone: 415 927 5071', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.5241174,37.9257182]},"properties":{"address":"498 Tamalpais Dr. Corte Madera, CA 94924","displayName":"Corte Madera Community Center, 498;500, Tamalpais Drive, Corte Madera, Marin County, California, 94925, United States of America","country_code":"US","boundingBox":[37.9255644,37.9259161,-122.5242747,-122.5239601]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9ce9380d-c180-460f-a311-89927d473a9e', '8229548c-b073-4a89-bf58-d8ae5f1560b7', 'Manor Elementary School', 'Schedule: 5-12 y/o Thurs 1:50-2:50pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.594082,37.99794]},"properties":{"address":"150 Oak Manor Drive, Fairfax, CA 94930","displayName":"150, Oak Manor Drive, Manor, Fairfax, Marin County, California, 94930, United States of America","country_code":"US","boundingBox":[37.99789,37.99799,-122.594132,-122.594032]}}'::jsonb);

-- Group: Capoeira Yokayo-United Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f69f77bb-6af8-4a9b-b83a-95d9260bb5c4', NOW(), NOW(), 'Capoeira Yokayo-United Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRAMESTRE Maluco (Mario Ackerberg)
Main Contact: Contramestre Maluco - 707-472-0332
Notes: Mendicino County, California. Mestre Amunka passed away 1/24/2013. Contramestre Maluco land: 707-621-2911, cell: 707-472-0332. Professor Carranca ''Calvin Turnwall'' (mail: 430 West Stephenson St, Ukaih California 95482, cell: 707-621-0183, calvinturnwall@hotmail.com). SOURCE: website 7/14/17', 'mariomaluco2000@icloud.com', '[{"type":"website","url":"http://www.capoeirayokayo.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('db1bda57-73e7-4c82-b995-0c8f129f2668', 'f69f77bb-6af8-4a9b-b83a-95d9260bb5c4', 'S.P.A.C.E.', 'Schedule: All Levels: Mon 7:00-8:30pm;Wed 6:30-8:00pm; Fri10:00am-12:00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.211659,39.149432]},"properties":{"address":"500 West Perkins Street Ukiah, CA 95482","displayName":"500, West Perkins Street, Downtown, Downtown Ukiah, Ukiah, Mendocino County, California, 95482, United States of America","country_code":"US","boundingBox":[39.149382,39.149482,-123.211709,-123.211609]}}'::jsonb);

-- Group: Raizes do Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1cf9876c-b5f8-42eb-9608-e056c1d78396', NOW(), NOW(), 'Raizes do Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Quati
Main Contact: - [831] 818-4811
Notes: Monterey County, California. Professor Quati under Mestre Papiba [Santa Cruz]. SOURCE: website 7/17/17', 'capoeira.quati@gmail.com', '[{"type":"website","url":"http://capoeiramonterey.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3a0f51d9-5ad7-4880-8e7e-93a07351879e', '1cf9876c-b5f8-42eb-9608-e056c1d78396', 'Monterey Yoga Shala', 'Schedule: Kids [4+ yrs]: Mon 4:30-5:30 pm; Adults: Mon 6:45-7:45 pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-121.8925012,36.5947654]},"properties":{"address":"724 Abrego Street, Monterey, CA 93940","displayName":"El Palomar Monterey, 724, Abrego Street, Monterey, Monterey County, California, 93940, United States of America","country_code":"US","boundingBox":[36.5947154,36.5948154,-121.8925512,-121.8924512]}}'::jsonb);

-- Group: Capoeira Eastside
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2cf17945-a009-4c2f-87df-48330c59a9ef', NOW(), NOW(), 'Capoeira Eastside', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Fabricio
Main Contact: - [954] 652-8433
Notes: Bellevue, Kirkland, Redmond, Washington. SOURCE: website 12/24/19', 'capoeiraeastside@gmail.com', '[{"type":"website","url":"http://www.capoeiraeastside.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c9b8544e-c03b-4481-942a-3af4bc3334a2', '2cf17945-a009-4c2f-87df-48330c59a9ef', 'Gracie Barra', 'Schedule: Adults: Tues & Thurs 8:00-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.1382377,47.6330499]},"properties":{"address":"2505 152nd Ave NE, Redmond, WA 98052","displayName":"2505, 152nd Avenue Northeast, Overlake, Redmond, King County, Washington, 98052, United States of America","country_code":"US","boundingBox":[47.6329999,47.6330999,-122.1382877,-122.1381877]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ec22ebb4-4813-43d0-a863-bd03d74969b4', '2cf17945-a009-4c2f-87df-48330c59a9ef', 'Northwest Aerials', 'Schedule: Kids: Mon & Wed 6:45-7:45pm; Adults Mon 8:00-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.1694434,47.7116355]},"properties":{"address":"12440 128th Lane NE Kirkland, WA 98034","displayName":"12440, 128th Lane Northeast, Kirkland, King County, Washington, 98034, United States of America","country_code":"US","boundingBox":[47.7114673,47.7118049,-122.169807,-122.169078]}}'::jsonb);

-- Group: WWU Capoeira Club-FICA Bellingham Study Group
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('209979ac-966a-41a3-b844-6dee436ad395', NOW(), NOW(), 'WWU Capoeira Club-FICA Bellingham Study Group', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Bellingham, Washington. SOURCE: blog 12/24/19', 'capoeirawwu@yahoo.com', '[{"type":"website","url":"http://bellinghamcapoeira.blogspot.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('627b8ea3-2525-4e44-8363-0db8f7ef5dfd', '209979ac-966a-41a3-b844-6dee436ad395', 'Western Washington University - Viking Union multipurpose room', 'Schedule: Mon 6:00-8:00pm (when school is in session; free and open to all)
Email: ficabellingham@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4874638,48.734141]},"properties":{"address":"Western Washington University, Bellingham, WA","displayName":"Western Washington University, 516, High Street, Bellingham, Whatcom County, Washington, 98225, United States of America","country_code":"US","boundingBox":[48.7264107,48.7413577,-122.4917467,-122.4804349]}}'::jsonb);

-- Group: FICA - Olympia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bc21ce3b-aa6f-4fc1-820e-c7a1dd5d7b87', NOW(), NOW(), 'FICA - Olympia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Silvinho
Main Contact: Mestre Silvinho - 206-669-0273
Notes: Olympia, Washington. International Capoeira Angola Foundation. Mestre Silvinho [Seattle]. Treinel Caxambu: treneucaxambu@yahoo.}com, 206-937-5849. SOURCE: website 12/24/19', 'silvioaleixo@hotmail[D0T}com', '[{"type":"website","url":"http://www.ficanorthwest.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('14c0b362-086a-429e-bce7-f2a4ff7c2ec5', 'bc21ce3b-aa6f-4fc1-820e-c7a1dd5d7b87', 'Evergreen Capoeira Angola Club', 'Schedule: Wed 1:00-3:00pm; Sat 12:00-2:00pm
Phone: 206-937-5849
Email: treneucaxambu@yahoo.}com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-101.8632454,35.2110044]},"properties":{"address":"CRC Room 117","displayName":"Circus Room, 2309, Southwest 6th Avenue, Original Town of Amarillo, Amarillo, Potter County, Texas, 79106, United States of America","country_code":"US","boundingBox":[35.2109544,35.2110544,-101.8632954,-101.8631954]}}'::jsonb);

-- Group: Grupo de Capoeira Moringa de Barro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('42ad99e6-d2ef-4025-a4a1-462cc8cb9a6c', NOW(), NOW(), 'Grupo de Capoeira Moringa de Barro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Pitta (Daniel Nery Dos Santos Filho)
Main Contact: - 206-819-3334
Notes: Seattle, Washington. SOURCE: website 12/24/19', 'studio@bahiainmotion.com', '[{"type":"website","url":"http://bahiainmotion.com/capoeira/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e368d070-29a1-43a5-b5b7-74ff1868cc58', '42ad99e6-d2ef-4025-a4a1-462cc8cb9a6c', 'Balance Studio', 'Schedule: Adult Beginner [Age 13+]: Mon 6:30-7:30pm; Adult -Intermed/Adv [Age 13+]: Mon & Wed 7:30-9:00pm; Sat 11:30am-1:00pm; Little Tots [Age 3-4]: Wed 4:45-5:20pm; Youth Capoeira Level 1: [Age 5-12]: Wed 5:30-6:20pm; Youth Level 2: [Age 6-12]: Mon5:30-6:20pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3535964,47.6514877]},"properties":{"address":"418 N 35th St, Fremont - Seattle, 98103","displayName":"418, North 35th Street, Fremont, Seattle, King County, Washington, 98103, United States of America","country_code":"US","boundingBox":[47.6513601,47.6516152,-122.3537165,-122.3534763]}}'::jsonb);

-- Group: FICA - International Capoeira Angola Foundation - Seattle
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2f177799-c155-46b0-be34-7a1e4c5c5e09', NOW(), NOW(), 'FICA - International Capoeira Angola Foundation - Seattle', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Silvinho
Main Contact: Mestre Silvinho - 206-669-0273
Notes: Seattle, Washington. Founded by and under the guidance of Mestre Jurandir. Treneu Caxambu: treneucaxambu@yahoo.com, 206-937-5849. SOURCE: website 4/16/16', 'silvioaleixo@hotmail.com', '[{"type":"website","url":"http://www.ficanorthwest.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8551bd2d-a806-41b0-81a1-23cd7c43a48f', '2f177799-c155-46b0-be34-7a1e4c5c5e09', 'Union Cultural Center', 'Schedule: Tues & 7:00-9:00pm; Thurs 6:00-9:00; Sun 4:00-6:00pm; Open Roda: 1st Sun
Phone: 206-937-5849
Email: treneucaxambu@yahoo.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3222172,47.5982279]},"properties":{"address":"803 S King St. Seattle, Wa 98104","displayName":"803, South King Street, Chinatown, Chinatown International District, Seattle, King County, Washington, 98104, United States of America","country_code":"US","boundingBox":[47.5981779,47.5982779,-122.3222672,-122.3221672]}}'::jsonb);

-- Group: Capoeira Malês - Seattle
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a6dcb8cb-6894-4764-834a-568aa1828d60', NOW(), NOW(), 'Capoeira Malês - Seattle', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Curisco
Main Contact: - +1 [206] 643-0075
Notes: Seattle, Washington. Instructor Ninja ''Ali Mojallal''. SOURCE: website 4/16/16', 'capoeira.seattle@gmail.com', '[{"type":"website","url":"http://www.curisco.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5770b282-c387-4286-906d-5c676e23fde3', 'a6dcb8cb-6894-4764-834a-568aa1828d60', 'SoDo STUDIO - Old Rainier Brewery / Tully''s Building', 'Schedule: All Levels: Mon & Wed 7:30-9:00pm; Sat 1:30-3:30pm; Parents: Fri 7:30-9:00pm; Kids: Mon 6:00-7:30pm; Sat 12:00-1:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3204572,47.5761333]},"properties":{"address":"3150 Airport Way S Seattle 98134","displayName":"3150, Airport Way South, Beacon Hill, Seattle, King County, Washington, 98134, United States of America","country_code":"US","boundingBox":[47.5760833,47.5761833,-122.3205072,-122.3204072]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6d7f73e4-974f-4f91-afd4-b8258aa32e8d', 'a6dcb8cb-6894-4764-834a-568aa1828d60', 'Compfit', 'Schedule: Fri 7:30-8:30pm
Phone: [ 206 ] 696-0680', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3408719,47.6618619]},"properties":{"address":"4501 Interlake Ave. North #6 | Seattle, WA 98103","displayName":"Compfit Dance & Fitness Studio, 4501, Interlake Avenue North, Wallingford, Seattle, King County, Washington, 98103, United States of America","country_code":"US","boundingBox":[47.6618119,47.6619119,-122.3409219,-122.3408219]}}'::jsonb);

-- Group: Seattle Capoeira Center - Capoeira Angola Palmares
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('765ec9b1-725e-4028-a82c-bb7ca883f86b', NOW(), NOW(), 'Seattle Capoeira Center - Capoeira Angola Palmares', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Mangangá (Syed Taqi)
Main Contact: - + 1 206 372 2691
Notes: Seattle, Washington. Professor Mangangá under Mestre No. SOURCE: website 4/16/16', 'seattlecapoeira@gmail.com', '[{"type":"website","url":"http://seattlecapoeiracenter.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('67bf60f9-8bee-4197-9d26-00f02adfcf3b', '765ec9b1-725e-4028-a82c-bb7ca883f86b', 'Seattle Capoeira Center', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2976967,47.5773334]},"properties":{"address":"2909 Rainier Avenue South Seattle, WA 98144","displayName":"2909, Rainier Avenue South, Mount Baker, Seattle, King County, Washington, 98144, United States of America","country_code":"US","boundingBox":[47.5772834,47.5773834,-122.2977467,-122.2976467]}}'::jsonb);

-- Group: Grupo Semente do jogo de Angola
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('295141f6-3c44-42f2-b7ea-b3ac1c3b1317', NOW(), NOW(), 'Grupo Semente do jogo de Angola', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Colette (Colette Desilets)
Main Contact: - [514] 270-5853
Notes: Montreal, Quebec, Canada. See also Laval. SOURCE: website 3/28/17', 'colette@capoeiraangola.ca', '[{"type":"website","url":"http://www.capoeiraangola.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('10ca46fe-c9ae-40f7-a653-f264aa6a3c65', '295141f6-3c44-42f2-b7ea-b3ac1c3b1317', 'Montreal location', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.567163,45.5055686]},"properties":{"address":"372 Sainte-Catherine Ouest, Montreal, QC, Canada","displayName":"Belgo, 372, Rue Sainte-Catherine Ouest, Quartier des Spectacles, Ville-Marie, Montréal, Agglomération de Montréal, Montréal (région administrative), Québec, H3B 1A2, Canada","country_code":"CA","boundingBox":[45.5051668,45.5061857,-73.5676107,-73.5665504]}}'::jsonb);

-- Group: Capoeira Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e2eb5b70-b54c-4fca-a7a8-0c82a8f73ad2', NOW(), NOW(), 'Capoeira Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Mortal
Main Contact: - [438] 394 8401
Notes: Montreal, Quebec, Canada. Professor Mortal under the supervision of Mestre Paulinho Sabia. SOURCE: website 3/24/17', 'info@capoeirabrasil.ca', '[{"type":"website","url":"http://www.capoeirabrasil.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fb0e8aaa-781a-4549-bbbd-5f56c3b251b7', 'e2eb5b70-b54c-4fca-a7a8-0c82a8f73ad2', 'Karate Taikido Longueuil', 'Schedule: Mon, 7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.4604091,45.5206565]},"properties":{"address":"2755 Chemin de Chambly, Longueuil, J4L 1M7, QC","displayName":"2755, Chemin de Chambly, Le Vieux-Longueuil, Longueuil, Agglomération de Longueuil, Montérégie, Québec, J3L 1N3, Canada","country_code":"CA","boundingBox":[45.5206065,45.5207065,-73.4604591,-73.4603591]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e77e296b-5d4b-4442-9a0c-325bc0136a08', 'e2eb5b70-b54c-4fca-a7a8-0c82a8f73ad2', 'Club de Boxe One X One', 'Schedule: Thurs; 7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.4445046,45.4758002]},"properties":{"address":"5556 Grande Allee, Saint-Hubert, QC, J3Y 1A8, Canada","displayName":"5556, Grande Allée, Saint-Hubert, Longueuil, Agglomération de Longueuil, Montérégie, Québec, J3Y 1A5, Canada","country_code":"CA","boundingBox":[45.4757502,45.4758502,-73.4445546,-73.4444546]}}'::jsonb);

-- Group: FICA Study Group Montreal
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1ed9a0ba-6c87-4284-ad31-63abe81a0762', NOW(), NOW(), 'FICA Study Group Montreal', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Montreal, Quebec, Canada. SOURCE: website 3/31/17', 'capoeiragcam@gmail.com', '[{"type":"website","url":"http://jogodeangola-mtl.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('62bdee31-5d6f-473d-bb1e-b48e313f4cfa', '1ed9a0ba-6c87-4284-ad31-63abe81a0762', 'MAI - Montreal arts interculturels - studio 460', 'Schedule: Mon & Thurs 6:30-9:00pm
Phone: 514-982-1812', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.5763331,45.5115985]},"properties":{"address":"3680, rue Jeanne-Mance Montreal QC H2X 2K5","displayName":"Ex aequo, 3680, Rue Jeanne-Mance, Le Plateau-Mont-Royal, Montréal, Agglomération de Montréal, Montréal (région administrative), Québec, H2X 2K5, Canada","country_code":"CA","boundingBox":[45.5115485,45.5116485,-73.5763831,-73.5762831]}}'::jsonb);

-- Group: New Orleans Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7b1265ab-1a30-451e-9a94-a56f119e613b', NOW(), NOW(), 'New Orleans Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRANDO Cocada (Rogerio Valencio da Silva)
Notes: New Orleans, Louisiana. Mestrando Cocada (Rogerio Valencio da Silva), Instrutor Molejo. SOURCE: website 4/29/18', 'capoeirawestbank@gmail.com', '[{"type":"website","url":"http://nolacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ccbea963-5a3e-4fe3-9bab-1d3b90132664', '7b1265ab-1a30-451e-9a94-a56f119e613b', 'NOLA BJJ studio', 'Schedule: Adult Beginner: Mon & Wed 8:00-9:00pm; Kids: Mon & Wed 5;00-6:00pm
Email: capoeirawestbank@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.02919,29.927937]},"properties":{"address":"2901 General de Gaulle Dr, New Orleans, LA 70114","displayName":"2901, General de Gaulle Drive, New Orleans, Orleans Parish, Louisiana, 70114, United States of America","country_code":"US","boundingBox":[29.927887,29.927987,-90.02924,-90.02914]}}'::jsonb);

-- Group: Grupo Besouro Capoeira Angola New Orleans
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('57e9ba60-eaf2-45ab-8a04-53402fb199fc', NOW(), NOW(), 'Grupo Besouro Capoeira Angola New Orleans', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Curtis Pierre - [1] 504-236-7479
Notes: New Orleans, Louisiana. Instructor: Curtis Pierre. SOURCE: websites 4/29/18', 'casasambaneworleans@gmail.com', '[{"type":"website","url":"http://capoeiraangolaneworleans.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3b0fa428-5ba6-4069-bc20-c6cabeb83756', '57e9ba60-eaf2-45ab-8a04-53402fb199fc', 'Annunciation Cente', 'Schedule: Capoeira Angola Kids: Wed & Fri 6:00-7:00pm; Capoeira Angola Adults: Wed & Fri 7:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.068854,29.933527]},"properties":{"address":"800 Race Street, New Orleans, LA, 70130","displayName":"800, Race Street, The Saulet Apartment Homes, Garden District, New Orleans, Orleans Parish, Louisiana, 70130, United States of America","country_code":"US","boundingBox":[29.933477,29.933577,-90.068904,-90.068804]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bf3ace37-c541-4a6b-8398-96bbb5740d31', '57e9ba60-eaf2-45ab-8a04-53402fb199fc', 'Tulane University Capoeira Angola Club - Uptown Gym of the Reily Center', 'Schedule: Tues 8:00-10:00pm; Fri 5:00-7:00pm
Email: capoeira@tulane.edu', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.1201009,29.9412196]},"properties":{"address":"Tulane University, New Orleans, LA 70118","displayName":"Tulane University, 6823, Saint Charles Avenue, Black Pearl, Greenville, New Orleans, Orleans Parish, Louisiana, 70118, United States of America","country_code":"US","boundingBox":[29.9342635,29.948289,-90.1238755,-90.1143296]}}'::jsonb);

-- Group: Beira-Mar Capoeira Florida
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b85d49b9-7426-4aaf-9fc8-484f9e0fb974', NOW(), NOW(), 'Beira-Mar Capoeira Florida', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Bundo
Main Contact: - [502] 229-9182', NULL, '[{"type":"website","url":"http://www.gbantu.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e649378f-2dec-47c1-b88f-82367d265978', 'b85d49b9-7426-4aaf-9fc8-484f9e0fb974', 'Peak Physiques, Jacksonville, FL', 'Schedule: Mon/Wed/Fri 6:00-7:00 PM (Kids); Mon/Wed/Fri 7:00-8:00 PM (Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.5158216,30.2153088]},"properties":{"address":"11048 Baymeadows Road, Jacksonville, Florida, USA","displayName":"11048, Baymeadows Road, Jacksonville, Duval County, Florida, 32256, United States of America","country_code":"us","boundingBox":[30.2150806,30.2154919,-81.5162267,-81.5154164]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('50210577-50b9-491a-b834-c980cdf8071d', 'b85d49b9-7426-4aaf-9fc8-484f9e0fb974', 'J Renaissance 4:13 Boxing & Fitness, Jacksonville, FL', 'Schedule: Sat 10:15-11:00 AM (Kids, Adults welcomed)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.5644121,30.3056505]},"properties":{"address":"8802 Corporate Square Court, Jacksonville, Florida, USA","displayName":"8802, Corporate Square Court, Jacksonville, Duval County, Florida, 32216, United States of America","country_code":"us","boundingBox":[30.3056005,30.3057005,-81.5644621,-81.5643621]}}'::jsonb);

-- Group: Beira-Mar Capoeira Kentucky
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('eb1b38e0-1437-4215-a044-5e85475ba41c', NOW(), NOW(), 'Beira-Mar Capoeira Kentucky', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Gafanhoto (Stan Marshall)
Main Contact: - [502] 229-9182', NULL, '[{"type":"website","url":"http://www.gbantu.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fcebfb61-1935-47e0-9ab2-a021bf4ca9f6', 'eb1b38e0-1437-4215-a044-5e85475ba41c', 'Freestyle Fitness', 'Schedule: Kids and Adults: Tues & Thurs 8:00-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-85.7132066,38.2627901]},"properties":{"address":"1860 Mellwood Ave, Louisville, KY 40206","displayName":"Mellwood Art Center, 1860, Mellwood Avenue, Clifton, Louisville, Jefferson County, Kentucky, 40206, United States of America","country_code":"US","boundingBox":[38.2620065,38.2635747,-85.7137558,-85.7120802]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('815cacea-7b75-4980-8864-45e605ae2c1c', 'eb1b38e0-1437-4215-a044-5e85475ba41c', 'Eastern Kentucky University', 'Schedule: Students and Adults: Mon 6:00-8:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-84.2946539,37.7478572]},"properties":{"address":"Richmond, KY","displayName":"Richmond, Madison County, Kentucky, 40475, United States of America","country_code":"US","boundingBox":[37.623519,37.794517,-84.34202,-84.24014]}}'::jsonb);

-- Group: Beira-Mar Capoeira Colorado
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('47924acc-3c04-4c22-9c9c-a5226e2b04bb', NOW(), NOW(), 'Beira-Mar Capoeira Colorado', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Perna de Pau (Tim Roberts)
Main Contact: - [502] 229-9182', NULL, '[{"type":"website","url":"http://www.gbantu.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4998704a-46ae-4bd4-aef9-eded30221e7f', '47924acc-3c04-4c22-9c9c-a5226e2b04bb', 'Mountain Beast MMA & Fitness, Granby, CO', 'Schedule: Wed/Fri 7:00-8:30 PM (Kids and Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-105.9394,40.085]},"properties":{"address":"62713 U.S. Highway 40, Granby, CO 80446","displayName":"62713 US Highway 40, Granby, CO 80446, United States","country_code":"us"}}'::jsonb);

-- Group: Beira-Mar Capoeira Daejeon
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2b4c53e4-53a4-400d-b4e2-8d877be3dd85', NOW(), NOW(), 'Beira-Mar Capoeira Daejeon', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Capitão (Carter Peyton)
Main Contact: - [502] 229-9182', NULL, '[{"type":"website","url":"http://www.gbantu.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('750110d6-684a-4513-94c0-52bf86db08e7', '2b4c53e4-53a4-400d-b4e2-8d877be3dd85', 'Wolpyeong Station, Daejeon, South Korea', 'Schedule: Sun 6:00-7:00 PM', '{"type":"Feature","geometry":{"type":"Point","coordinates":[127.3645813,36.3583201]},"properties":{"address":"Wolpyeong Station, Daejeon, South Korea","displayName":"월평, 한밭대로, 월평3동, 서구, 대전광역시, 35210, 대한민국","country_code":"kr","boundingBox":[36.3533201,36.3633201,127.3595813,127.3695813]}}'::jsonb);

-- Batch: batch-04.json (33 groups)

-- Group: Northampton Capoeira - Capoeira Rosa Rubra
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c8e6cc71-5e1e-437d-b275-4c3eda0beab5', NOW(), NOW(), 'Northampton Capoeira - Capoeira Rosa Rubra', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: ESTAGIARIO Bicicleta
Main Contact: Estagiario Bicicleta - +1 413 362 0642
Notes: Northampton, Massachusetts. Estagiario Bicicleta under Mestre Calango[Boston]. SOURCE: website 2/6/19', 'nohocapoeira@gmail.com', '[{"type":"website","url":"https://www.gunga.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('22074f88-0def-4c1a-9100-ed76b84169d6', 'c8e6cc71-5e1e-437d-b275-4c3eda0beab5', 'East Street Studios', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-72.5825266,42.3465082]},"properties":{"address":"47 East Street, Hadley, MA 01035","displayName":"47, East Street, Hadley Center Historic District, Hadley, Hampshire County, Massachusetts, 01035, United States of America","country_code":"US","boundingBox":[42.3461529,42.3467387,-72.5830886,-72.582327]}}'::jsonb);

-- Group: Associação de Capoeira Mandingueiros dos Palmares [Capoeira MdP] - Boston
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('591def9d-6700-4d28-aa01-ffcbe3c3e51b', NOW(), NOW(), 'Associação de Capoeira Mandingueiros dos Palmares [Capoeira MdP] - Boston', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisco
Main Contact: Mestre Chuvisco - [857] 230-9139
Notes: Boston, Massachusetts (Suffolk County). Mestre Chuvisco. SOURCE: email 1/31/20', 'contact@capoeiramdp.com', '[{"type":"website","url":"http://capoeiramdp.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d896cae3-6f29-43b0-8b5c-705eaa5220c6', '591def9d-6700-4d28-aa01-ffcbe3c3e51b', 'South Boston Yoga Center', 'Schedule: All Levels: Sun 2:00-3:30pm
Phone: [617] 315-7448', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0535296,42.3406776]},"properties":{"address":"36 W Broadway, Boston, MA 02127","displayName":"36, West Broadway, Seaport, South Boston, Boston, Suffolk County, Massachusetts, 02127, United States of America","country_code":"US","boundingBox":[42.3406276,42.3407276,-71.0535796,-71.0534796]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a7fa4f0e-1e05-44e4-9ba1-02a12e3d2876', '591def9d-6700-4d28-aa01-ffcbe3c3e51b', 'Boston University', 'Schedule: Mon & Wed 7:00 - 8:30pm (Boston University Students and Faculty Only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1006995,42.3478016]},"properties":{"address":"700 Beacon St Boston, MA 02215","displayName":"Beacon Street, Audubon Circle, Fenway, Boston, Suffolk County, Massachusetts, 02215, United States of America","country_code":"US","boundingBox":[42.347536,42.3481714,-71.1018535,-71.0995747]}}'::jsonb);

-- Group: SINHA' Capoeira - Boston
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1148adcf-cfdb-42ec-9b9f-2a6d546923d4', NOW(), NOW(), 'SINHA'' Capoeira - Boston', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisquinho (Lindemberg Souza)
Main Contact: Mestre Chuvisquinho - 857-417-9394
Notes: Boston, Massachusetts. Mestre Chuvisquinho (Lindemberg Souza). SOURCE: website 5/26/18', NULL, '[{"type":"website","url":"http://sinhacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6b782d82-4568-4f88-908b-0eac7c7fc262', '1148adcf-cfdb-42ec-9b9f-2a6d546923d4', 'Boston Martial Arts Center', 'Schedule: Adults: Sat 3:30 - 5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1319051,42.3514477]},"properties":{"address":"161 Harvard Ave Allston, MA","displayName":"Salsa y Control, 161, Harvard Avenue, Allston Village, Allston, Boston, Suffolk County, Massachusetts, 02134, United States of America","country_code":"US","boundingBox":[42.3513977,42.3514977,-71.1319551,-71.1318551]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5a00071f-ed11-44fe-abcd-8592bcd0394e', '1148adcf-cfdb-42ec-9b9f-2a6d546923d4', 'SINHA'' Capoeira Dorchester', 'Schedule: Kids & Teens: Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0594437,42.315411]},"properties":{"address":"48 Pleasant St, Dorchester, MA","displayName":"48, Pleasant Street, Uphams Corner, Dorchester, Boston, Suffolk County, Massachusetts, 02125, United States of America","country_code":"US","boundingBox":[42.3152763,42.3155415,-71.0595963,-71.0593602]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bc4d8729-7c75-4ae8-88bb-32d4ac5a03c9', '1148adcf-cfdb-42ec-9b9f-2a6d546923d4', 'Northeastern University', 'Schedule: Mon & Tues 2:00 - 3:30pm (NEU students only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0892579,42.3351053]},"properties":{"address":"Northeastern University, Boston, MA","displayName":"Northeastern University, 360, Huntington Avenue, Fenway, Boston, Suffolk County, Massachusetts, 02115, United States of America","country_code":"US","boundingBox":[42.334667,42.3458049,-71.0936211,-71.0830404]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ebd69cd4-1d25-43e3-97ed-7c73e32da299', '1148adcf-cfdb-42ec-9b9f-2a6d546923d4', 'University of Mass- Boston', 'Schedule: Mon & Wed 4:00 - 5:00pm ( UMB students & faculty only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0387132,42.314068]},"properties":{"address":"University of Massachusetts Boston, Boston, MA","displayName":"University of Massachusetts Boston, 150, Mount Vernon Street, Dorchester, Boston, Suffolk County, Massachusetts, 02125, United States of America","country_code":"US","boundingBox":[42.3103068,42.3178731,-71.046738,-71.0326914]}}'::jsonb);

-- Group: Associação de Capoeira Mandingueiros dos Palmares [Capoeira MdP] - Gloucester
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f1cfd348-19aa-4e8a-a6e7-6ba8d981a228', NOW(), NOW(), 'Associação de Capoeira Mandingueiros dos Palmares [Capoeira MdP] - Gloucester', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisco
Main Contact: Mestre Chuvisco - [857] 230-9139
Notes: Gloucester, Massachusetts (Essex County). Mestre Chuvisco. SOURCE: email 1/31/20', 'contact@capoeiramdp.com', '[{"type":"website","url":"http://capoeiramdp.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('feb2cadd-60c3-4b34-b5ec-cf4beb5de358', 'f1cfd348-19aa-4e8a-a6e7-6ba8d981a228', 'Movement Arts Gloucester Massachusetts [MAGMA]', 'Schedule: Tues 8:00- 9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-70.6617982,42.6139065]},"properties":{"address":"11 Pleasant St,Gloucester, MA 01930","displayName":"11, Pleasant Street, Central Gloucester Historic District, Five Pound Island, Gloucester, Essex County, Massachusetts, 01930, United States of America","country_code":"US","boundingBox":[42.6138565,42.6139565,-70.6618482,-70.6617482]}}'::jsonb);

-- Group: Group Capoeira Camara Angola - Cambridge
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('12d38a93-b719-4d8a-ab80-5c0209341120', NOW(), NOW(), 'Group Capoeira Camara Angola - Cambridge', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Deraldo Ferreira
Main Contact: Mestre Deraldo Ferreira - 857.246.4090
Notes: Cambridge, Massachusetts (Middlesex County). Mestre Deraldo Ferreira. SOURCE: website 7/18/18', 'deraldoferr@gmail.com', '[{"type":"website","url":"http://www.capoeira-angola.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('754189af-bef8-4cb6-b248-ec5158f6b1cb', '12d38a93-b719-4d8a-ab80-5c0209341120', 'Dance Complex', 'Schedule: Wed 7:00-8:30pm; Sat 3:00-5:00 pm; Sun 11:30am-1:00pm
Phone: [617]547-9363', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1023016,42.3642314]},"properties":{"address":"536 Massachusetts Avenue, Cambridge, MA 02139-4029","displayName":"Odd Fellows Hall, 534;536;538, Massachusetts Avenue, Central Square, Cambridge, Middlesex County, Massachusetts, 02139, United States of America","country_code":"US","boundingBox":[42.3640931,42.3643696,-71.1024769,-71.1021262]}}'::jsonb);

-- Group: Associação de Capoeira Mandingueiros dos Palmares - Cambridge
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('6101b162-5a30-415e-8b63-03195d06cd92', NOW(), NOW(), 'Associação de Capoeira Mandingueiros dos Palmares - Cambridge', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisco
Main Contact: Mestre Chuvisco - [857] 230-9139
Notes: Cambridge, Massachusetts (Middlesex County). Mestre Chuvisco. SOURCE: email 1/31/20', 'contact@capoeiramdp.com', '[{"type":"website","url":"http://capoeiramdp.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c8d2793d-4296-405e-9544-a77ebcf5e785', '6101b162-5a30-415e-8b63-03195d06cd92', 'Dance Complex', 'Schedule: Mon 6:30 - 8:30pm (studio 2); Sat 10:30am-12:00pm (studio 6)
Phone: [617] 547-9363', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1023016,42.3642314]},"properties":{"address":"536 Massachusetts Avenue, Cambridge, MA","displayName":"Odd Fellows Hall, 534;536;538, Massachusetts Avenue, Central Square, Cambridge, Middlesex County, Massachusetts, 02139, United States of America","country_code":"US","boundingBox":[42.3640931,42.3643696,-71.1024769,-71.1021262]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0547d417-6920-402d-8e9a-05eccafe84b6', '6101b162-5a30-415e-8b63-03195d06cd92', 'Windsor Community Art Center', 'Schedule: Children[8+] Wed & Thurs 6:30-7:30pm; Adults: Wed & Thurs 7:30-8:30pm
Phone: [617] 868-7100', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0966449,42.3646976]},"properties":{"address":"119 Windsor St, Cambridge, MA 02139","displayName":"Windsor St. Health & Community Center, 119, Windsor Street, The Port, Cambridge, Middlesex County, Massachusetts, 02139, United States of America","country_code":"US","boundingBox":[42.3646476,42.3647476,-71.0966949,-71.0965949]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e10924c5-08d4-406e-b9ed-cb3c646615b6', '6101b162-5a30-415e-8b63-03195d06cd92', 'Harvard Capoeira Regional Club', 'Schedule: Mon 8:30-9:55pm[ (Fitness Room 2)]; Wed 8:30-9:55pm[(Mezzanine)] (Harvard Faculty and Students only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1190632,42.3713205]},"properties":{"address":"39 Holyoke St, Cambridge, MA 02139","displayName":"39, Holyoke Street, Cambridge, Middlesex County, Massachusetts, 02138, United States of America","country_code":"US","boundingBox":[42.3712705,42.3713705,-71.1191132,-71.1190132]}}'::jsonb);

-- Group: SINHA' Capoeira - Cambridge
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f06badf1-3596-45b4-a027-ca53173b8a09', NOW(), NOW(), 'SINHA'' Capoeira - Cambridge', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisquinho (Lindemberg Souza)
Main Contact: Mestre Chuvisquinho - 857-417-9394
Notes: Cambridge, Massachusetts (Middlesex County). Mestre Chuvisquinho (Lindemberg Souza). SOURCE: website 5/26/18', NULL, '[{"type":"website","url":"http://sinhacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e4b343ca-bf81-45b6-82ca-42ae642fe345', 'f06badf1-3596-45b4-a027-ca53173b8a09', 'New England Aikikai', 'Schedule: Ages 5-12: Tues & Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1214997,42.3902286]},"properties":{"address":"2000 Massachusetts Ave, Cambridge MA","displayName":"2000, Massachusetts Avenue, Cambridge, Middlesex County, Massachusetts, 02140, United States of America","country_code":"US","boundingBox":[42.3900666,42.3904157,-71.1217366,-71.1212628]}}'::jsonb);

-- Group: SINHA' Capoeira - Brookline
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8941c5a7-4c71-4ab0-875a-ed971ba2c8ca', NOW(), NOW(), 'SINHA'' Capoeira - Brookline', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisquinho (Lindemberg Souza)
Main Contact: Mestre Chuvisquinho - 857-417-9394
Notes: Brookline, Massachusetts (Norfolk County). Mestre Chuvisquinho (Lindemberg Souza). SOURCE: website 5/26/18', NULL, '[{"type":"website","url":"http://sinhacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7336e8cf-3ba7-4450-9e48-72123f18333e', '8941c5a7-4c71-4ab0-875a-ed971ba2c8ca', 'Jean Paige Dance Studio', 'Schedule: Adults: Mon & Wed 8:30 to 10:300pm; Teens: Sat 12:30-1:30pm; ages 3.5-12: Sat 1:30-2:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1261463,42.3406599]},"properties":{"address":"1431 Beacon Street, Brookline MA","displayName":"1431, Beacon Street, Coolidge Corner, North Brookline, Brookline, Norfolk County, Massachusetts, 02446, United States of America","country_code":"US","boundingBox":[42.3406099,42.3407099,-71.1261963,-71.1260963]}}'::jsonb);

-- Group: Associação de Capoeira Mandingueiros dos Palmares - Abington
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('002a3a7c-c77f-4707-9c32-b6a148421cba', NOW(), NOW(), 'Associação de Capoeira Mandingueiros dos Palmares - Abington', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisco
Main Contact: Mestre Chuvisco - [857] 230-9139
Notes: Abington, Massachusetts (Plymouth County). Mestre Chuvisco. SOURCE: email 1/21/20', 'contact@capoeiramdp.com', '[{"type":"website","url":"http://capoeiramdp.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('da1b3c47-29e0-4247-8c51-6ecd78ad2df0', '002a3a7c-c77f-4707-9c32-b6a148421cba', 'Boston Taekwondo Academy', 'Schedule: Sat 3:00 - 4:30pm; Sun | 10:30am - 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-70.9538067,42.1457805]},"properties":{"address":"1501 Bedford St Abington, MA 02351","displayName":"1501, Bedford Street, North Abington, Abington, Plymouth County, Massachusetts, 02351, United States of America","country_code":"US","boundingBox":[42.1457305,42.1458305,-70.9538567,-70.9537567]}}'::jsonb);

-- Group: Xango Capoeira Darwin Academy
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('303c31d6-b972-4926-8d55-b5a3d705b61a', NOW(), NOW(), 'Xango Capoeira Darwin Academy', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: (Enrique Saldana)
Main Contact: - 0416 565 136
Notes: Darwin, Northern Territory, Australia. SOURCE: website 1/27/17', 'jenrique@xangocapoeira.com.au', '[{"type":"website","url":"http://xangocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7863adbb-5799-4490-80a1-9be23866b07b', '303c31d6-b972-4926-8d55-b5a3d705b61a', 'The Gym At CDU', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[130.8823639,-12.3737641]},"properties":{"address":"Casuarina, Northern Territory, Australia","displayName":"Casuarina, Darwin, City of Darwin, Northern Territory, 0810, Australia","country_code":"AU","boundingBox":[-12.377589,-12.369968,130.876531,130.886235]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0d3df057-77d3-417c-83cc-f12d50339bc2', '303c31d6-b972-4926-8d55-b5a3d705b61a', 'Chambers Crescent Theatre', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[130.9064409,-12.3976602]},"properties":{"address":"Chambers Crescent, Malak, NT, Australia","displayName":"Chambers Crescent, Malak, Darwin, City of Darwin, Northern Territory, 0812, Australia","country_code":"AU","boundingBox":[-12.3978089,-12.3942011,130.9025959,130.9080322]}}'::jsonb);

-- Group: Grupo Capoeira Aruanda
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('baafb3e6-f024-490e-a805-2df8e56234ca', NOW(), NOW(), 'Grupo Capoeira Aruanda', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Borracha (Jose de Amorim)
Main Contact: - 0414 745 161
Notes: New South Wales, Australia. SOURCE: website 1/14/17', 'info@CapoeiraAruanda.com', '[{"type":"website","url":"http://aruanda.com.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('37c69e86-3da4-457c-a8b0-d89dcd104baf', 'baafb3e6-f024-490e-a805-2df8e56234ca', 'Ultimo Public School', 'Schedule: All Levels: Mon & Wed 7:30-8:30pm; Beginners: Mon & Wed 6:30-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[151.1953938,-33.8773438]},"properties":{"address":"Quarry St, Ultimo NSW 2007","displayName":"Quarry Street, Ultimo, Sydney CBD, Sydney, Council of the City of Sydney, New South Wales, 2007, Australia","country_code":"AU","boundingBox":[-33.8775558,-33.8771291,151.1948569,151.1959296]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('602ea234-d2a7-465c-aa62-11ac4fb4362e', 'baafb3e6-f024-490e-a805-2df8e56234ca', 'Coogee Senior Citizens Hall', 'Schedule: Kids Class [7-12 years]: Thurs6:00 – 6:45pm; Adult Class: Thurs 7:00 – 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[151.2542053,-33.921437]},"properties":{"address":"97 Brook St, Coogee NSW","displayName":"Brook Street, Coogee, Eastern Suburbs, Sydney, Randwick City Council, New South Wales, 2034, Australia","country_code":"AU","boundingBox":[-33.9223863,-33.920485,151.2539973,151.2544005]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dd405441-330f-4791-9a31-0ff40c1b7194', 'baafb3e6-f024-490e-a805-2df8e56234ca', '218 Church', 'Schedule: Mon 6:15-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[151.003444,-33.8168759]},"properties":{"address":"218 Church St, Parramatta NSW","displayName":"Church Street, Parramatta, Sydney, City of Parramatta Council, New South Wales, 2150, Australia","country_code":"AU","boundingBox":[-33.8169249,-33.8168266,151.0034338,151.0034555]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8485e419-f860-4fa5-a495-ccff6bd35967', 'baafb3e6-f024-490e-a805-2df8e56234ca', 'Nova Flow Academy', 'Schedule: Women Class Only / All Levels Mon 6:00 – 7:00 pm; children: Tues & Thurs 6:00 – 6:30pm; Open class: Tues & Thurs 6:30 – 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[151.7764374,-32.9268854]},"properties":{"address":"180 King Street, Newcastle, NSW 2300, Australia","displayName":"devFU, 180, King Street, Newcastle, Newcastle-Maitland, City of Newcastle, New South Wales, 2300, Australia","country_code":"AU","boundingBox":[-32.9269354,-32.9268354,151.7763874,151.7764874]}}'::jsonb);

-- Group: Xango Capoeira - Queensland
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('943f6224-b3ad-4029-95e2-3654a96389d2', NOW(), NOW(), 'Xango Capoeira - Queensland', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Luizinho Barravento
Main Contact: - [07] 5578 6353
Notes: Queensland, Australia. Formerly Zambiacongo. Phone: 0417 613 787. Professor Caracol: 0421 179 359. SOURCE: website 11/27/10', 'barraventoau@yahoo.com.au', '[{"type":"website","url":"http://xangocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fc9a0491-0eac-4053-b2c6-17edefc094f2', '943f6224-b3ad-4029-95e2-3654a96389d2', 'Queensland location', 'Schedule: (Full schedule of classes)
Phone: 0421 179 359', '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.4353906,-28.0664251]},"properties":{"address":"10/23 Hillcrest Parade Miami, Gold Coast","displayName":"Hillcrest Parade, Miami, Gold Coast City, Queensland, 4220, Australia","country_code":"AU","boundingBox":[-28.0675205,-28.0651885,153.4350582,153.4360251]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('89833fc8-47ed-49fa-b8bf-07c3755bcee3', '943f6224-b3ad-4029-95e2-3654a96389d2', 'Xango Capoeira Brisbane Academy', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.003176,-27.4828544]},"properties":{"address":"349 Montague Road West End, QLD","displayName":"349, Montague Road, Hill End, West End, Greater Brisbane, Queensland, 4101, Australia","country_code":"AU","boundingBox":[-27.4829804,-27.4827154,153.003003,153.0033489]}}'::jsonb);

-- Group: Capoeira Brasil- Townsvilles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b30cec81-6305-4c8c-9224-f7781d40592a', NOW(), NOW(), 'Capoeira Brasil- Townsvilles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMANDO Uakari (Matthew Eales)
Main Contact: - [07] 4773 6877
Notes: Queensland, Australia. Formando Uakari under Mestre Peixe. Postal Address: PO Box 4355, Kirwan Qld 4817. Mob: 0416 100 377. SOURCE: website 1/27/17', 'info@capoeiraschool.com.au', '[{"type":"website","url":"http://www.capoeiraschool.com.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('14c5dab5-b280-4ad6-a05c-3554e3b4defb', 'b30cec81-6305-4c8c-9224-f7781d40592a', 'Townsville location', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[146.7688958,-19.2932835]},"properties":{"address":"17 Fleming St, Aitkenvale QLD 4812","displayName":"Fleming Street, Aitkenvale, Townsville, Townsville City, Queensland, 4814, Australia","country_code":"AU","boundingBox":[-19.2937236,-19.2928683,146.7670419,146.7707552]}}'::jsonb);

-- Group: Kadara Capoeira Gold Coast
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ebbf1170-924c-4616-8425-a1af8a068580', NOW(), NOW(), 'Kadara Capoeira Gold Coast', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Tamandua (Phellipe Mello)
Main Contact: - 0423 293 771
Notes: Queensland, Australia. Instrutor Tamandua, student of Mestre Cicatriz. SOURCE: website 1/20/17', NULL, '[{"type":"website","url":"http://www.learncapoeira.com.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f1fefc39-9c78-49bc-a5a4-7aca3ce28404', 'ebbf1170-924c-4616-8425-a1af8a068580', 'Surfer''s Paradise Primary School', 'Schedule: Tues: 6.00-7.00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.4228479,-28.0115443]},"properties":{"address":"St Andrews Ave, Isle of Capri","displayName":"Church of Jesus Christ of Latter-Day Saints - Isle Of Capri Chapel, St Andrews Avenue, Surfers Paradise, Gold Coast City, Queensland, 4217, Australia","country_code":"AU","boundingBox":[-28.0117169,-28.0113638,153.4225966,153.4230992]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2030ab49-1c90-49fd-a15b-dd882f91e1df', 'ebbf1170-924c-4616-8425-a1af8a068580', 'Bellevue Park Primary School', 'Schedule: Thurs : 5.45-7.00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.4066696,-27.9687807]},"properties":{"address":"Southport, QLD 4215, Australia","displayName":"Southport, Gold Coast City, Queensland, 4215, Australia","country_code":"AU","boundingBox":[-27.998492,-27.951279,153.376002,153.422794]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4e650466-6b4f-4fb8-9dbf-79479edac61e', 'ebbf1170-924c-4616-8425-a1af8a068580', 'Ashmore PCYC', 'Schedule: KIDS: Sat 10.00-11.00am; ADULTS: Sat11.00-12.00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.383882,-27.9802444]},"properties":{"address":"Dominions Rd, Ashmore","displayName":"Dominions Road, Ashmore, Gold Coast City, Queensland, 4214, Australia","country_code":"AU","boundingBox":[-27.9822643,-27.9782359,153.3836254,153.3842479]}}'::jsonb);

-- Group: Academia Grupo Capoeira Cordão de Ouro Malaysia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0d81c9a0-f9d7-43ef-be7a-4c8999c5f8c3', NOW(), NOW(), 'Academia Grupo Capoeira Cordão de Ouro Malaysia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Braulio
Notes: Singapore and Malaysia. SOURCE: website 3/17/17', NULL, '[{"type":"website","url":"http://www.capoeira.my"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dfac8896-8691-4b02-8c05-3aedf3074829', '0d81c9a0-f9d7-43ef-be7a-4c8999c5f8c3', 'Malaysia location', 'Schedule: Mon, Wed, & Fri 8:30-10:00pm; Kids Sat 4:30-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[101.6340073,3.1112064]},"properties":{"address":"Jalan 14/22, Section 14, Petaling Jaya, Selangor, Malaysia","displayName":"Jalan 14/22, Seksyen 14, Petaling Jaya, Petaling, Selangor, 46200, Malaysia","country_code":"MY","boundingBox":[3.1106254,3.1118253,101.6338987,101.6343121]}}'::jsonb);

-- Group: Capoeira Angoleiros do Mar
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f466088a-3abd-494e-8588-686d8882a1f7', NOW(), NOW(), 'Capoeira Angoleiros do Mar', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Marcelo Angola
Main Contact: Grandao - 07521298488
Notes: Oxfordshire, England. Under Mestre Marcelo Angola [Itaparica, Bahia, Brazil.]. Lobinho: 07411776771, maurizio_1984@msn.com. SOURCE: websites 11/19/16', 'chrisgraham10@gmail.com', '[{"type":"website","url":"http://www.oxfordcapoeira.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a1321422-2939-42ab-85f9-19329f35da6c', 'f466088a-3abd-494e-8588-686d8882a1f7', 'Warneford Chapel', 'Schedule: Tues & Thurs 7:00-9:00pm; Sat 9:30-10:30am; Music: Thurs 6;00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.2228935,51.7516089]},"properties":{"address":"Warneford Lane, Headington OX3 7JX","displayName":"Warneford Lane, Headington, Oxford, Oxfordshire, England, OX3 7QJ, United Kingdom","country_code":"GB","boundingBox":[51.7506824,51.7524776,-1.2243886,-1.2213668]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e8c4a7d8-84ca-4341-9f45-2bba76af8d14', 'f466088a-3abd-494e-8588-686d8882a1f7', 'Brookes University Sports Centre', 'Schedule: Beginners: Mon 6:45-8:00pm; Wed 5:00-6:00pm (during Brookes University Term time)
Phone: 07411776771
Email: maurizio_1984@msn.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.2303058,51.7529353]},"properties":{"address":"Cheney Lane, Headington, Oxford, OX3 0BD, UK","displayName":"Cheney Lane, Headington Hill, Headington, Oxford, Oxfordshire, England, OX3 0BF, United Kingdom","country_code":"GB","boundingBox":[51.7526041,51.753358,-1.2322215,-1.2283714]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f8d74d3e-0223-4bec-a4a2-4fb62e0e4ef4', 'f466088a-3abd-494e-8588-686d8882a1f7', 'The University Club', 'Schedule: Mixed ability: Sun 4:00-7:00pm; Beginners: Wed6.30-7.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.2513538,51.7571363]},"properties":{"address":"11 Mansfield Road, Oxford OX1 3SZ","displayName":"University Club, 11, Mansfield Road, Holywell, City Centre, Oxford, Oxfordshire, England, OX1 3SZ, United Kingdom","country_code":"GB","boundingBox":[51.756948,51.7573321,-1.2515715,-1.2511067]}}'::jsonb);

-- Group: QMC Escuela de Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a37d2266-ca70-483e-aa06-b71238977134', NOW(), NOW(), 'QMC Escuela de Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRAMESTRE Marcus Cabeça
Main Contact: - 0208 617 9570
Notes: Surrey, England. Formerly Grupo Axé Capoeira. Mobile: 07931 770 153. SOURCE: website 2/1/20', 'info{/\T}pmc-capoeirauk.com', '[{"type":"website","url":"http://www.qmc-capoeirauk.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d68fb994-e8d8-4de2-921f-0a98aa939c67', 'a37d2266-ca70-483e-aa06-b71238977134', 'Kingston University - Fitness Centre', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3043901,51.4034409]},"properties":{"address":"Penrhyn Road, Kingston upon Thames, KT1 2EE, UK","displayName":"Penrhyn Road, Surbiton, Royal Borough of Kingston upon Thames, London, Greater London, England, KT1 2ED, United Kingdom","country_code":"GB","boundingBox":[51.402976,51.4039044,-0.3044653,-0.3043023]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9ef5e4a6-2917-49fe-845b-415d2dc0c13f', 'a37d2266-ca70-483e-aa06-b71238977134', 'Tiffin Girls'' School', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3048099,51.4255308]},"properties":{"address":"Richmond Road, Kingston upon Thames KT2 5PL","displayName":"Richmond Road, Royal Borough of Kingston upon Thames, London, Greater London, England, KT2 5PW, United Kingdom","country_code":"GB","boundingBox":[51.4250351,51.4259985,-0.3051848,-0.3044731]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1b3773fe-3544-4e9c-8a3a-e9b85081c8de', 'a37d2266-ca70-483e-aa06-b71238977134', 'Piper Hall Community Centre', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2896103,51.4066506]},"properties":{"address":"Piper Road, Kingston upon Thames, KT1 3EX","displayName":"Piper Road, Norbiton, Royal Borough of Kingston upon Thames, London, Greater London, England, KT1 3EX, United Kingdom","country_code":"GB","boundingBox":[51.4062535,51.4070477,-0.2896307,-0.2895898]}}'::jsonb);

-- Group: London School of Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2be364ec-baaf-4f3a-84ee-7525eb132ee8', NOW(), NOW(), 'London School of Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 44 [0] 20 7281 2020
Notes: Surrey, England. No class information on website. Please contact us 11/20/16. SOURCE: website 6/9/12', 'info@londonschoolofcapoeira.co', '[{"type":"website","url":"http://www.londonschoolofcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('87a19842-b09e-4652-b715-eb9841958cb6', '2be364ec-baaf-4f3a-84ee-7525eb132ee8', 'Cannons Health Club', 'Schedule: 8:00-9.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3013365,51.4662488]},"properties":{"address":"Kew Foot Road, Richmond, TW9 2SS, UK","displayName":"Kew Foot Road, Kew, London Borough of Richmond upon Thames, London, Greater London, England, TW9 2TA, United Kingdom","country_code":"GB","boundingBox":[51.4652253,51.4671822,-0.3021765,-0.3003272]}}'::jsonb);

-- Group: ABADA Capoeira Orange County
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9f251e45-469f-4e01-9d85-f01f6487a4a8', NOW(), NOW(), 'ABADA Capoeira Orange County', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRA
Main Contact: - 16582
Notes: SOURCE: website 7/7/17', NULL, '[{"type":"website","url":"http://www.capoeiraoc.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bc3f0940-7da0-463e-bf05-ed08f2e6a073', '9f251e45-469f-4e01-9d85-f01f6487a4a8', 'Gothard St', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-117.9996851,33.7213998]},"properties":{"address":"16582 Gothard St, Huntington Beach, CA 92647","displayName":"16582, Gothard Street, Wintersburg, Huntington Beach, Orange County, California, 92647, United States of America","country_code":"US","boundingBox":[33.7207516,33.7218645,-117.9998298,-117.9995542]}}'::jsonb);

-- Group: Capoeira IJEXÁ
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('63ad32b3-05a9-4ed5-989b-070ce743d661', NOW(), NOW(), 'Capoeira IJEXÁ', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Urubu Malandro
Main Contact: - (415) 506-9624
Notes: SOURCE: websites 7/17/17', 'info@capoeiraijexa.com', '[{"type":"website","url":"http://www.capoeiraijexa.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('789eb018-71c3-4272-806b-2b8ba3194f38', '63ad32b3-05a9-4ed5-989b-070ce743d661', 'Smuin Center, San Francisco', 'Schedule: Wed 7pm
Phone: (415) 506-9624
Email: urubumalandro@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.40202558987929,37.765057850000005]},"properties":{"address":"1830 17th St., San Francisco, California","displayName":"1830, 17th Street, Potrero Hill, San Francisco, California, 90103, United States of America","country_code":"us","boundingBox":[37.7649148,37.7651906,-122.4021409,-122.4018104]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e6f31153-35cb-4033-ab3a-abfb8b6166d0', '63ad32b3-05a9-4ed5-989b-070ce743d661', 'Circus Center, San Francisco', 'Schedule: Fri 5:30pm (5th-12th grade)
Phone: (415) 350-2222
Email: jarrelp@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4569911,37.7655524]},"properties":{"address":"755 Frederick St., San Francisco, California","displayName":"San Francisco Circus Center, 755, Frederick Street, Cole Valley, San Francisco, California, 94117, United States of America","country_code":"us","boundingBox":[37.7653299,37.7657748,-122.4571758,-122.4568064]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7612d497-f755-43fb-878c-25374ccbb2b5', '63ad32b3-05a9-4ed5-989b-070ce743d661', 'Raul Castillo Martial Arts Academy, Half Moon Bay', 'Schedule: Wed 7pm
Phone: (650) 483-7743
Email: rgmolyneaux@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.428586,37.4635519]},"properties":{"address":"Half Moon Bay, California","displayName":"Half Moon Bay, San Mateo County, California, 94019, United States of America","country_code":"us","boundingBox":[37.423903,37.522908,-122.4774867,-122.415842]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('378ff982-b2be-41ff-ba51-254ac80cce70', '63ad32b3-05a9-4ed5-989b-070ce743d661', 'Thrive Jiu Jitsu, Pacifica', 'Schedule: Mon 6:30pm
Phone: (650) 483-7743
Email: rgmolyneaux@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4995234,37.5980374]},"properties":{"address":"Pacifica, California","displayName":"Pacifica, San Mateo County, California, 94044, United States of America","country_code":"us","boundingBox":[37.5663417,37.6666377,-122.515384,-122.4439341]}}'::jsonb);

-- Group: Capoeira Agua de Beber-United Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c1bd0a02-8b22-4637-80ad-a59bc3278ab9', NOW(), NOW(), 'Capoeira Agua de Beber-United Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Patrick Hilligan (under Mestre Acordeon Berkeley)
Main Contact: - 600
Notes: SOURCE: website  7/24/17', 'saccap@hotmail.com', '[{"type":"website","url":"http://www.adbcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('edc3010f-ace0-46ea-9a4b-a90411ba7565', 'c1bd0a02-8b22-4637-80ad-a59bc3278ab9', 'Broadway', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-121.505794,38.565114]},"properties":{"address":"600 Broadway, Sacramento, CA 95818","displayName":"600, Broadway, Upper Land Park, Sacramento, Sacramento County, California, 95818, United States of America","country_code":"US","boundingBox":[38.565064,38.565164,-121.505844,-121.505744]}}'::jsonb);

-- Group: Allied Capoeira League
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('6dd8da5c-0c47-4995-b397-4de5bb33b205', NOW(), NOW(), 'Allied Capoeira League', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 4128
Notes: SOURCE: website 7/23/17', NULL, '[{"type":"website","url":"http://www.sacramentocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1feb96de-7b52-4ebc-a3e4-1eb6c246e781', '6dd8da5c-0c47-4995-b397-4de5bb33b205', 'El Camino Ave', 'Schedule: Kids  [age 7-12]: Fri 5:30-6:20pm; Adult/Teen: Mon, Tues & Wed 6:30-7:45pm; Adult/Teen Roda: Fri  6:30-7:45pm (For ACL members only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-121.367733,38.610197]},"properties":{"address":"4128 El Camino Ave, Sacramento, CA 95821","displayName":"4128, El Camino Avenue, Arden-Arcade, Sacramento County, California, 95821, United States of America","country_code":"US","boundingBox":[38.610147,38.610247,-121.367783,-121.367683]}}'::jsonb);

-- Group: Capoeira Mandinga
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('179dd5e0-7c80-495e-9498-345f732d570a', NOW(), NOW(), 'Capoeira Mandinga', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Paulo Lima (with the consent of Mestre CaveirinhaOakland)
Main Contact: - 3780
Notes: SOURCE: website 7/26/17', NULL, '[{"type":"website","url":"http://capoeirasd.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('308ccb42-74a7-432f-8c6d-5016c0fd0942', '179dd5e0-7c80-495e-9498-345f732d570a', 'Hancock Street', 'Schedule: Adult All Levels:  Tues 7:00-8:30pm; 7:00-8:15pm:  11:30-1:00am; Children:  Mon & Fri 4:45-5:45pm; Adult Beginners: Mon  8:30-10:00pm;  Wed  7:00-8:30pm; Adult  All Levels: Wed 8:30-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-117.2121269,32.7584019]},"properties":{"address":"3780 Hancock Street, San Diego, CA 92110","displayName":"3780, Hancock Street, Midway District, San Diego, San Diego County, California, 92110, United States of America","country_code":"US","boundingBox":[32.7583519,32.7584519,-117.2121769,-117.2120769]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('23cf099b-9053-4b26-b7ed-740ba22f91b4', '179dd5e0-7c80-495e-9498-345f732d570a', 'Garnet Ave', 'Schedule: Adult All Levels:  Tues 7:00-8:30pm; 7:00-8:15pm:  11:30-1:00am; Children:  Mon & Fri 4:45-5:45pm; Adult Beginners: Mon  8:30-10:00pm;  Wed  7:00-8:30pm; Adult  All Levels: Wed 8:30-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-117.2541174,32.7969475]},"properties":{"address":"880 Garnet Ave, San Diego, CA 92109","displayName":"880, Garnet Avenue, Pacific Beach, San Diego, San Diego County, California, 92109, United States of America","country_code":"US","boundingBox":[32.7968975,32.7969975,-117.2541674,-117.2540674]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f1b6135c-078c-4a2a-ab9d-b6126988169b', '179dd5e0-7c80-495e-9498-345f732d570a', 'La Jolla', 'Schedule: Adult All Levels:  Tues 7:00-8:30pm; 7:00-8:15pm:  11:30-1:00am; Children:  Mon & Fri 4:45-5:45pm; Adult Beginners: Mon  8:30-10:00pm;  Wed  7:00-8:30pm; Adult  All Levels: Wed 8:30-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-117.2740777,32.8401623]},"properties":{"address":"La Jolla, CA 92093","displayName":"La Jolla, San Diego, San Diego County, California, 92037, United States of America","country_code":"US","boundingBox":[32.8201623,32.8601623,-117.2940777,-117.2540777]}}'::jsonb);

-- Group: San Francisco Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3df6ce80-0542-4583-953b-e8bc49a1b371', NOW(), NOW(), 'San Francisco Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 640
Notes: SOURCE: website 1/9/18', 'Gingadocapoeira247@gmail.com', '[{"type":"website","url":"http://www.gingadocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('748b0d66-286e-445d-9052-4497b6cb9543', '3df6ce80-0542-4583-953b-e8bc49a1b371', 'Stanyan St. San Francisco', 'Schedule: Adults: Mon, Wed, & Fri 7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4535211,37.7703868]},"properties":{"address":"640 Stanyan St. San Francisco, CA 94417","displayName":"636;638;640;644, Stanyan Street, Cole Valley, San Francisco, California, 94117, United States of America","country_code":"US","boundingBox":[37.7702808,37.7704674,-122.4536662,-122.4532828]}}'::jsonb);

-- Group: ABADÁ-Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('42a7d79c-f963-46ae-a059-628c47525fb5', NOW(), NOW(), 'ABADÁ-Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTORA Jennifer Walsh (Excutive Director)
Main Contact: - 3221 22
Notes: SOURCE: website 7/31/17', 'info@abada.org', '[{"type":"website","url":"http://www.abada.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8788f047-184d-401d-9271-38805fc77aba', '42a7d79c-f963-46ae-a059-628c47525fb5', '22nd St. San Francisco', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4193161,37.7553182]},"properties":{"address":"3221 22nd St. San Francisco, 94110[","displayName":"3221, 22nd Street, Mission District, San Francisco, California, 94110, United States of America","country_code":"US","boundingBox":[37.7552682,37.7553682,-122.4193661,-122.4192661]}}'::jsonb);

-- Group: Grupo Omulu Capoeira Guanabara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ac8654af-80de-481e-aa03-e2e93b28c91b', NOW(), NOW(), 'Grupo Omulu Capoeira Guanabara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 415] 710-7416
Notes: SOURCE: website 6/6/17', 'omulusf@gmail.com', '[{"type":"website","url":"http://sfcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('08d8d46d-15d2-4896-b857-165ba2f73b40', 'ac8654af-80de-481e-aa03-e2e93b28c91b', 'Mission Street', 'Schedule: Kids 6-11: Tues 4:00-5:00pm; Thurs 4:30-5:45pm; Kids 6-11: Fri 5:00pm- 6:30pm; Adults: Wed 6:00-7:30pm; Adults: Tues & Thur 6:30- 8:00pm; Adults: Sun 12:45- 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4186067,37.7509758]},"properties":{"address":"2868 Mission Street, San Francisco, CA 94110","displayName":"Mission Cultural Center for Latino Arts, 2868, Mission Street, Mission District, San Francisco, California, 94110, United States of America","country_code":"US","boundingBox":[37.7508835,37.7510668,-122.4187347,-122.4184786]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fcaa8812-f59d-4ea2-a863-810f43c9aaab', 'ac8654af-80de-481e-aa03-e2e93b28c91b', 'Cesar Chavez Street', 'Schedule: Kids 6-11: Tues 4:00-5:00pm; Thurs 4:30-5:45pm; Kids 6-11: Fri 5:00pm- 6:30pm; Adults: Wed 6:00-7:30pm; Adults: Tues & Thur 6:30- 8:00pm; Adults: Sun 12:45- 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4190005,37.7480111]},"properties":{"address":"3435 Cesar Chavez Street, San Francisco, CA 94110","displayName":"3435, Cesar Chavez Street, Mission District, San Francisco, California, 94110, United States of America","country_code":"US","boundingBox":[37.7479611,37.7480611,-122.4190505,-122.4189505]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('edc84989-0d7e-46e0-9263-ed4a5d14ecb7', 'ac8654af-80de-481e-aa03-e2e93b28c91b', 'South Van Ness', 'Schedule: Kids 6-11: Tues 4:00-5:00pm; Thurs 4:30-5:45pm; Kids 6-11: Fri 5:00pm- 6:30pm; Adults: Wed 6:00-7:30pm; Adults: Tues & Thur 6:30- 8:00pm; Adults: Sun 12:45- 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4172124,37.7621456]},"properties":{"address":"672 South Van Ness, San Francisco, CA 94110","displayName":"South Van Ness Avenue, Mission District, San Francisco, California, 90110, United States of America","country_code":"US","boundingBox":[37.7619709,37.7623203,-122.4172286,-122.4171965]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('86613c6d-8cdd-42e0-b5b4-b2fbeaaacae8', 'ac8654af-80de-481e-aa03-e2e93b28c91b', '24th Street', 'Schedule: Kids 6-11: Tues 4:00-5:00pm; Thurs 4:30-5:45pm; Kids 6-11: Fri 5:00pm- 6:30pm; Adults: Wed 6:00-7:30pm; Adults: Tues & Thur 6:30- 8:00pm; Adults: Sun 12:45- 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4277022,37.7515215]},"properties":{"address":"3813 24th Street, San Francisco, CA 94110","displayName":"3801;3805;3807;3809;3811;3813, 24th Street, Noe Valley, Mission District, San Francisco, California, 94114, United States of America","country_code":"US","boundingBox":[37.7513439,37.7516161,-122.4278452,-122.4275607]}}'::jsonb);

-- Group: Capoeira Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b26d5f05-61f4-4f81-9ccd-2bd506770825', NOW(), NOW(), 'Capoeira Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR
Main Contact: - 3906
Notes: SOURCE: website 8/7/17', 'capoeirabrasilsf@gmail.com', '[{"type":"website","url":"http://www.aranhacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('10af2fe6-8750-40eb-872d-be152c15063b', 'b26d5f05-61f4-4f81-9ccd-2bd506770825', 'Irving St.', 'Schedule: Adult Basics: Mon 7:30 á 9:00pm; Kids[6 -12]: Tues & Thurs 5:45 á 6:45pm; Adult: Tues 7:00 á 8:30pm; Sat 11:00am á 12:30pm; Adult Instruments and Music: Thurs 7:00á 8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4998494,37.7627162]},"properties":{"address":"3906 Irving St., San Francisco, CA","displayName":"3900;3906, Irving Street, Sunset District, San Francisco, California, 94121, United States of America","country_code":"US","boundingBox":[37.7626715,37.7628164,-122.4999342,-122.4997685]}}'::jsonb);

-- Group: Capoeira Brasil,
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('85e8b35a-9867-4f7a-af8b-6e94a4e0b541', NOW(), NOW(), 'Capoeira Brasil,', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 415-793-2988
Notes: SOURCE: website 8/7/17', 'itabora@yahoo.com', '[{"type":"website","url":"http://www.institutebrazilianfitness.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f218595b-d1d0-4e04-b9ea-7b263292ac7d', '85e8b35a-9867-4f7a-af8b-6e94a4e0b541', 'Old County Road', 'Schedule: Adults: Mon 7:30-9:00pm; Wed 6:30-7:30pm; Sat 12:15-1:30pm 1; Kids:  Tues & Thurs  5:00-6:00pm; Music:  Thurs 8:15-9:00pm; Conditioning: Thurs  7:30-8:10pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2817744,37.5263093]},"properties":{"address":"409 Old County Road, Belmont, CA 94002","displayName":"409, Old County Road, Belmont, San Mateo County, California, 94002, United States of America","country_code":"US","boundingBox":[37.5262593,37.5263593,-122.2818244,-122.2817244]}}'::jsonb);

-- Group: Capoeira Batuque
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b19bb603-d7e0-4995-bc37-6578e3ddbe4c', NOW(), NOW(), 'Capoeira Batuque', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR
Main Contact: - 69
Notes: SOURCE: website 8/4/19', NULL, '[{"type":"website","url":"https://www.capoeiradalycity.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b16b4e31-1226-4f7c-afc3-ea27e0f68b97', 'b19bb603-d7e0-4995-bc37-6578e3ddbe4c', 'Washington Street', 'Schedule: All Levels All Styles:Tues & Thurs  6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4685092,37.6877957]},"properties":{"address":"69 Washington Street, Daly City, CA 94014","displayName":"69, Washington Street, Daly City, San Mateo County, California, 94014, United States of America","country_code":"US","boundingBox":[37.6877457,37.6878457,-122.4685592,-122.4684592]}}'::jsonb);

-- Group: The Brazilian Cultural Arts Center of Santa Barbara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9f1ce2a3-1e8c-4af5-b0c2-20c56d2f4372', NOW(), NOW(), 'The Brazilian Cultural Arts Center of Santa Barbara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 805.
Notes: SOURCE: website 3/14/16, 8/1/17', 'marianosbdance@yahoo.com', '[{"type":"website","url":"http://www.capoeira805.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1295010f-cbcb-4787-af05-e58f8355b7fa', '9f1ce2a3-1e8c-4af5-b0c2-20c56d2f4372', 'Hollister Ave', 'Schedule: All Levels: Mon 8:00; Wed 7:15; Kids & Parents: Fri 5:15; Beginners  Fri 6:15pm; Kids: Tues 6:15pm; All Levels Tues 6:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.8579716,34.4305224]},"properties":{"address":"370 Hollister Ave, Santa Barbara, CA 93117","displayName":"Hollister Avenue, Santa Barbara, Santa Barbara County, California, 93117, United States of America","country_code":"US","boundingBox":[34.430339,34.430643,-119.859598,-119.8563399]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('51f269ea-7801-42e9-b517-0441e9df29e5', '9f1ce2a3-1e8c-4af5-b0c2-20c56d2f4372', 'De La Vina St', 'Schedule: All Levels: Mon 8:00; Wed 7:15; Kids & Parents: Fri 5:15; Beginners  Fri 6:15pm; Kids: Tues 6:15pm; All Levels Tues 6:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.717435,34.428742]},"properties":{"address":"2009 De La Vina St, Santa Barbara, CA 93101","displayName":"2009, De La Vina Street, Santa Barbara, Santa Barbara County, California, 93105, United States of America","country_code":"US","boundingBox":[34.428692,34.428792,-119.717485,-119.717385]}}'::jsonb);

-- Group: Capoeira Sul da Bahia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('eadf1bf9-0816-4bc5-aeac-929edf246750', NOW(), NOW(), 'Capoeira Sul da Bahia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 805] 637-5355
Notes: SOURCE: website 8/1/17', 'capoeirasb@gmail.com', '[{"type":"website","url":"http://www.capoeirasantabarbara.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('25429d4f-8438-4a97-bae0-a8fbcb50a0ac', 'eadf1bf9-0816-4bc5-aeac-929edf246750', 'State Street', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.705397,34.424239]},"properties":{"address":"1230 State Street, Santa Barbara, CA  93101","displayName":"Yona Redz, 1230, State Street, Santa Barbara, Santa Barbara County, California, 93101, United States of America","country_code":"US","boundingBox":[34.424189,34.424289,-119.705447,-119.705347]}}'::jsonb);

-- Group: Raizes do Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('01cb6284-acbb-4ade-8a11-392b72e9dc4f', NOW(), NOW(), 'Raizes do Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Papiba
Main Contact: - 207
Notes: SOURCE: website 8/16/17
SOURCE: google 8/18/17', 'info@santacruzcapoeira.com', '[{"type":"website","url":"http://www.santacruzcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b6bd8668-d8a3-4a2d-a330-59c29c626972', '01cb6284-acbb-4ade-8a11-392b72e9dc4f', 'McPherson Street', 'Schedule: children ages 4-10:  Thurs  4:15pm; adults:  Thurs 5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.0478312,36.9601829]},"properties":{"address":"207 McPherson Street, Santa Cruz, CA 95060","displayName":"207, McPherson Street, Westside Industrial District, Westside, Santa Cruz, Santa Cruz County, California, 95060, United States of America","country_code":"US","boundingBox":[36.9601329,36.9602329,-122.0478812,-122.0477812]}}'::jsonb);

-- Group: Capoeira Mandinga Santa Rosa
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('6bc40c66-25cc-4563-b7ac-98c1dfefba55', NOW(), NOW(), 'Capoeira Mandinga Santa Rosa', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA
Main Contact: - 1.
Notes: SOURCE:  website 8/21/17', 'Indiomandinga@gmail.com', '[{"type":"website","url":"http://doncarlos1.googlepages.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c5b57e63-e888-4c35-8aee-46a55268a5a6', '6bc40c66-25cc-4563-b7ac-98c1dfefba55', 'N Main Street', 'Schedule: Tues & Thurs 7:00-8:30pm; Adult beg  Mon 2-3pm; Kids 5-12: Mon 3:30-4:30p; Sun  11:30am-1:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.8245184,38.402828]},"properties":{"address":"172 N Main Street, Sebastopol, CA 95472","displayName":"172, North Main Street, Sebastopol, Sonoma County, California, 95472, United States of America","country_code":"US","boundingBox":[38.402778,38.402878,-122.8245684,-122.8244684]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b3a5c271-c4a9-4bc6-9f41-f447f777cdae', '6bc40c66-25cc-4563-b7ac-98c1dfefba55', 'W 6th Street', 'Schedule: Tues & Thurs 7:00-8:30pm; Adult beg  Mon 2-3pm; Kids 5-12: Mon 3:30-4:30p; Sun  11:30am-1:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.7232759,38.4373798]},"properties":{"address":"56 W 6th Street, Santa Rosa, CA 95401","displayName":"56, West 6th Street, Santa Rosa, Sonoma County, California, 95401, United States of America","country_code":"US","boundingBox":[38.4373298,38.4374298,-122.7233259,-122.7232259]}}'::jsonb);

-- Batch: batch-05.json (35 groups)

-- Group: Capoeira Palmares Orlando
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('816db5a2-5f72-43c2-b85b-7fdbeb0889b3', NOW(), NOW(), 'Capoeira Palmares Orlando', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE George Palmares
Main Contact: - [407]-960-3104
Notes: Orlando, Florida. SOURCE: website 11/23/17', 'capoeirapalmaresorlando@gmail.com', '[{"type":"website","url":"http://capoeirapalmaresorlando.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('917c4ec3-b843-4ad1-998c-13f33373895b', '816db5a2-5f72-43c2-b85b-7fdbeb0889b3', 'Orlando location', 'Schedule: Kids: Mon, Wed, & Fri 6:30pm-7:30pm; All Levels: Mon, Wed, & Fri7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.379045,28.5421218]},"properties":{"address":"32807, Orlando, FL","displayName":"Orlando, Orange County, Florida, United States of America","country_code":"US","boundingBox":[28.3480634,28.614283,-81.5075377,-81.1241435]}}'::jsonb);

-- Group: Capoeira Brazilian Pelourinho
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c74af285-8c0f-40ae-b0d5-3fe437d1b7da', NOW(), NOW(), 'Capoeira Brazilian Pelourinho', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Lazaro da Bahia
Main Contact: - 407.226.3195
Notes: Orlando, Florida. SOURCE: website 11/23/17', 'CapoeiraBrazilPelo@gmail.com', '[{"type":"website","url":"http://www.capoeirabrazilpelo.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2d8b588b-c28d-4014-9c09-03ffd5242c1a', 'c74af285-8c0f-40ae-b0d5-3fe437d1b7da', 'Orlando location', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.4367924,28.4616696]},"properties":{"address":"7075 Kingspointe Parkway, Orlando, FL 32819","displayName":"7075, Kingspointe Parkway, Florida Center, Orlando, Orange County, Florida, 32819, United States of America","country_code":"US","boundingBox":[28.4616196,28.4617196,-81.4368424,-81.4367424]}}'::jsonb);

-- Group: Capoeira Guerreiros
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('28d50ec7-4ff7-4fe6-9f10-ad4d3856043f', NOW(), NOW(), 'Capoeira Guerreiros', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Folclore (Roberto Armien)
Main Contact: - 855-434-8675 ext 1
Notes: Orlando, Florida. Professor Folclore under Contramestre Gaivota [Bloomfield NJ]. SOURCE: website 11/14/17', NULL, '[{"type":"website","url":"http://www.capoeiraorlando.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('59e3aada-4d90-4fbf-907e-243767c00237', '28d50ec7-4ff7-4fe6-9f10-ad4d3856043f', 'Orlando location', 'Schedule: Adults[13+]: Mon, Tues, & Thurs 7;00-8:00pm; Kids: Tues & Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.1940077,28.5475701]},"properties":{"address":"829 Woodbury Rd Orlando, FL 32828","displayName":"Mid Florida Dermatology Associates, 829, Woodbury Road, Waterford Lakes, Orlando, Orange County, Florida, 32828, United States of America","country_code":"US","boundingBox":[28.5475201,28.5476201,-81.1940577,-81.1939577]}}'::jsonb);

-- Group: Capoeira Karkara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1a5c195f-5108-4164-b96a-9d6cd2652065', NOW(), NOW(), 'Capoeira Karkara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Betinho
Main Contact: - [561] 737-3425
Notes: Palm Beach County, Florida (Boynton Beach, Boca Raton, Melbourne, Palm Bay). Formado Ray: [321]-223-0062. SOURCE: website 9/16/17', 'info@capokusa.com', '[{"type":"website","url":"http://capoeirakarkara.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1f4f8aed-e0af-4128-a5f7-db88d3a5523c', '1a5c195f-5108-4164-b96a-9d6cd2652065', 'Boynton Beach location', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.0714913,26.5588834]},"properties":{"address":"106 Commerce Rd., Boynton Beach FL 33426","displayName":"106, Commerce Road, Boynton Beach, Palm Beach County, Florida, 33426, United States of America","country_code":"US","boundingBox":[26.5588334,26.5589334,-80.0715413,-80.0714413]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7cc7dad2-73a8-41e1-897e-ab16b717f852', '1a5c195f-5108-4164-b96a-9d6cd2652065', 'Melbourne Capoeira and World Class MMA', 'Phone: [321]-223-0062
Email: info@capofitclub.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.6531745,28.0789688]},"properties":{"address":"4185 W. New Haven Ave Melbourne, FL 32904","displayName":"New Haven Avenue, Melbourne, Brevard County, Florida, 32904, United States of America","country_code":"US","boundingBox":[28.0789676,28.07897,-80.6535477,-80.6528014]}}'::jsonb);

-- Group: Capoeira Volta Ao Mundo - Sarasota
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e334d0d7-1277-4747-b68a-ea64a086301c', NOW(), NOW(), 'Capoeira Volta Ao Mundo - Sarasota', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Rony Costa
Main Contact: - [941] 922-4520
Notes: Sarasota, Florida. SOURCE: website 11/29/17', NULL, '[{"type":"website","url":"http://www.capovam.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f7fd263b-2d34-4c12-979c-f976dcdc0cf2', 'e334d0d7-1277-4747-b68a-ea64a086301c', 'Sarasota location', 'Schedule: Martial Arts Preschool CapoKids Mon-Fri 7:30am-6:00pm; After School Program: Mon-Fri: 3:30-6:00pm; CapoKids Ages 3-6: Tues & Thurs; CapoKids Ages 7-11: Mon & Wed 5:00-6:00pm; Adult Class: Mon-Thurs 6:00-7:00pm; RODA!: Fri 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.4751798,27.299446]},"properties":{"address":"4672 McIntosh Lane Sarasota, FL 34232","displayName":"4672, McIntosh Lane, Sarasota County, Florida, 34232, United States of America","country_code":"US","boundingBox":[27.299396,27.299496,-82.4752298,-82.4751298]}}'::jsonb);

-- Group: Capoeria Tampa Bay - Grupo Maculele
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0f768cff-63c6-4c90-aef8-5f73b58da4b6', NOW(), NOW(), 'Capoeria Tampa Bay - Grupo Maculele', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRANDO Girino (Eduardo Torres)
Notes: St. Petersburg, Florida. Mestrando Girino under Mestre Fran. SOURCE: website 11/22/17', 'tampacapoeira@gmail.com', '[{"type":"website","url":"https://tampacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1c75b442-9577-43cc-a26c-a553234219a9', '0f768cff-63c6-4c90-aef8-5f73b58da4b6', 'Hip Expressions Studio', 'Schedule: Kids: Mon & Wed 6:00-7:00pm; Teens & adults: Mon & Wed 7:00-8:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.6397632,27.8212447]},"properties":{"address":"2033 54th Ave N, St. Petersburg, FL","displayName":"54th Avenue North, Bay Breeze Cove, Saint Petersburg, Pinellas County, Florida, 33703, United States of America","country_code":"US","boundingBox":[27.821169,27.821338,-82.6401515,-82.6393724]}}'::jsonb);

-- Group: Tallahassee Capoeira - Allied Capoeira League
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c3a38fac-f8a9-4b5c-9a87-70fb2d78b77a', NOW(), NOW(), 'Tallahassee Capoeira - Allied Capoeira League', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - [850] 264-6792
Notes: Talahassee, Florida. SOURCE: website 11/29/17', NULL, '[{"type":"website","url":"https://www.tallahasseecapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6746a6ce-2ff0-4465-9f9a-7bd5a8cf308c', 'c3a38fac-f8a9-4b5c-9a87-70fb2d78b77a', 'Tallahassee Martial Arts and Self Defense Academy', 'Schedule: Teens and Adults: Mon, Wed, & Fri 7:00-8:00pm; Little Kids 4-6: Mon & Wed 4:00-4:45pm; Big Kids 7-11 Mon & Wed 5:00-5:45pm; Adult Music Class: Mon 6:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-84.3005658,30.4787195]},"properties":{"address":"2706 N Monroe St, Tallahassee, FL 32303","displayName":"2706, North Monroe Street, Tallahassee, Leon County, Florida, 32303, United States of America","country_code":"US","boundingBox":[30.4786695,30.4787695,-84.3006158,-84.3005158]}}'::jsonb);

-- Group: West Island Capoeira - Equipe Capoeira Brasileira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('37fa71c5-2697-4cc9-9547-4951f65bf0c1', NOW(), NOW(), 'West Island Capoeira - Equipe Capoeira Brasileira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Pirata
Notes: Pierrefonds, Quebec, Canada. Professor Pirata under Mestre Peninha [Montreal]. SOURCE: website 4/22/17', NULL, '[{"type":"website","url":"http://www.westislandcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('79619ce9-afb5-40b0-b4c0-54c1472a3271', '37fa71c5-2697-4cc9-9547-4951f65bf0c1', 'San Tropez', 'Schedule: Sat 1:30-3:00pm; Mon 6:30-8:00pm; Wed 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.7979954,45.4821821]},"properties":{"address":"54 Brunswick, Pointe-Claire, QC H9B 2L3, Canada","displayName":"Boulevard Brunswick, Pointe-Claire, Agglomération de Montréal, Montréal (région administrative), Québec, H9B 2L3, Canada","country_code":"CA","boundingBox":[45.4821405,45.4822265,-73.7980832,-73.7979089]}}'::jsonb);

-- Group: Capoeira Alma do Mar
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('911c3271-2bfb-4fd9-968b-ec95d604196c', NOW(), NOW(), 'Capoeira Alma do Mar', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITORA Sonho (Pamela McGrath)
Main Contact: - [207] 409-6124
Notes: Biddeford/Portland, Maine. Monitora Sonho, a dedicated student of Mestre Beck. SOURCE: website 7/24/18', 'almadomarcapoeira@gmail.com', '[{"type":"website","url":"http://www.almacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9816ae38-c34d-4e7a-ae8e-787c347d7d35', '911c3271-2bfb-4fd9-968b-ec95d604196c', 'Hustle & Flow Studio', 'Schedule: Ages 5-8: Tues & Thurs 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-70.2663038,43.6508117]},"properties":{"address":"155 Brackett St Portland, Maine, ME 04102","displayName":"Fresh Approach Market, 155, Brackett Street, West End, Portland, Cumberland County, Maine, 04102, United States of America","country_code":"US","boundingBox":[43.6506697,43.6509543,-70.2664755,-70.266133]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('428b1051-5f08-41b7-ae2f-ab4aa4e259a8', '911c3271-2bfb-4fd9-968b-ec95d604196c', 'Metta Studios', 'Schedule: Adults: Tues, 6:00-7:00pm; Kids ages 5+: Mon 4:30-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-70.4530585,43.4928834]},"properties":{"address":"40 Main Street, Pepperell Mill, Biddeford, Maine 04005","displayName":"40, Main Street, Pepperell Mill Campus, Biddeford, York County, Maine, 04005, United States of America","country_code":"US","boundingBox":[43.4928334,43.4929334,-70.4531085,-70.4530085]}}'::jsonb);

-- Group: Grupo de Capoeira Esporão
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f17a0506-0628-46e8-a469-2913dd7dd6d9', NOW(), NOW(), 'Grupo de Capoeira Esporão', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Marinaldo
Main Contact: Contra Mestre Ubaldo (Ubaldo Teixeira Baleeiro) - 203.231.6931
Notes: Bridgeport, Fairfield County, Connecticut. Contra Mestre Ubaldo (Ubaldo Teixeira Baleeiro) under Mestre Marinaldo [Brazil]. Instrutora Capitã. SOURCE: website 8/27/17', 'capoeirainct@gmail.com', '[{"type":"website","url":"http://esporaomulticulturalcenter.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('614de970-b5b9-41b6-becc-41a9d403d603', 'f17a0506-0628-46e8-a469-2913dd7dd6d9', 'Esporão Multi-Cultural Center', 'Schedule: Adult: Mon, Wed & Fri 7:30-9:30pm; Youth: Mon & Wed 6:00-7:00pm
Phone: 203.615.4275', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.2104732,41.2125203]},"properties":{"address":"3768 Main Street, Bridgeport, Connecticut 06606","displayName":"Hancock Pharmacy III, 3768, Main Street, Bridgeport, Greater Bridgeport Planning Region, Connecticut, 06606, United States of America","country_code":"US","boundingBox":[41.2124703,41.2125703,-73.2105232,-73.2104232]}}'::jsonb);

-- Group: Capoeira Connecticut Ginga Brasil - Cordão de Ouro - West Hartford
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('28deb54e-1bc0-4ed1-be85-37e785c7bbe1', NOW(), NOW(), 'Capoeira Connecticut Ginga Brasil - Cordão de Ouro - West Hartford', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Pinga Fogo
Main Contact: Instrutor Suave (Joel Melendez) - 860.922.5343
Notes: West Hartford, Hartford County, Connecticut. Instrutor Suave (Joel Melendez). See also Harwinton location. SOURCE: website 9/3/17', 'Darin@teamplusone.com', '[{"type":"website","url":"http://www.teamplusone.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('39e53055-49e1-4726-acad-eb71c3e56705', '28deb54e-1bc0-4ed1-be85-37e785c7bbe1', 'Plus One Defense Systems', 'Schedule: Adults: Mon 8:00-9:30pm; Thurs 8:30-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-72.7184787,41.7361598]},"properties":{"address":"9 Tolles St West Hartford, CT 06110","displayName":"9, Tolles Street, Elmwood, West Hartford, Capitol Planning Region, Connecticut, 06110, United States of America","country_code":"US","boundingBox":[41.7361098,41.7362098,-72.7185287,-72.7184287]}}'::jsonb);

-- Group: Motumbaxé Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('378e353b-24a4-4fe3-ace7-ac91c38945d2', NOW(), NOW(), 'Motumbaxé Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Joao Bispo de Souza Neto, (Lampreia)
Main Contact: Professora Formiguinha (Leticia Monteiro) - 347-489-6058
Notes: West Hartford and Hartford, Hartford County, Connecticut. Professora Formiguinha (Leticia Monteiro). SOURCE: facebook 5/15/16 website 9/2/17', 'iheartcapoeiraformi@gmail.com', '[{"type":"website","url":"http://www.motumbaxecapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1e95dde5-bfe7-48d0-bfb7-a9a129c17654', '378e353b-24a4-4fe3-ace7-ac91c38945d2', 'Nevins Street', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9826228,40.6865053]},"properties":{"address":"76 Nevins Street, Brooklyn, NY 11217","displayName":"76, Nevins Street, Boerum Hill, Brooklyn, Kings County, City of New York, New York, 11217, United States of America","country_code":"US","boundingBox":[40.6864297,40.6865828,-73.982767,-73.9824835]}}'::jsonb);

-- Group: Ginga Associação de Capoeira USA
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2c05ffef-8639-48fc-817f-8f07dcb91976', NOW(), NOW(), 'Ginga Associação de Capoeira USA', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Kiki Da Bahia
Main Contact: Mestre Kiki Da Bahia - +1 917 725 0381
Notes: Kent, Litchfield County, Connecticut. Mestre Kiki Da Bahia. SOURCE: website 5/7/19', NULL, '[{"type":"website","url":"http://gingacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cea427f2-e040-4149-9b17-03b4ae8e5c59', '2c05ffef-8639-48fc-817f-8f07dcb91976', 'W Rhythm Fitness & Wellness Studio', 'Schedule: Sun 12:30pm
Phone: [203] 788-7818', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.4782244,41.7227369]},"properties":{"address":"25 Main St. Kent, Ct 06757","displayName":"25, South Main Street, Kent, Northwest Hills Planning Region, Connecticut, 06757, United States of America","country_code":"US","boundingBox":[41.7226869,41.7227869,-73.4782744,-73.4781744]}}'::jsonb);

-- Group: Cordão de Ouro - Cedar Falls
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('908e7602-4ccb-42fd-b469-b06c02e41a99', NOW(), NOW(), 'Cordão de Ouro - Cedar Falls', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Alan Huynh - 319-215-1140
Notes: Cedar Falls, Iowa. Contact: Busca Pe (Alan Huynh). Website has not been updated since 2015; facebook page is offline 3/14/18. Classes are on the schedule but do not agree with the above website 3/14/18. SOURCE: websites 3/14/18', 'cedarvalley@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/cedarvalleycapoeira"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9c58a1cc-623d-489f-8078-5553ac25f63f', '908e7602-4ccb-42fd-b469-b06c02e41a99', 'Heinz Academy', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-92.434082,42.5149668]},"properties":{"address":"6322 University Ave, Cedar Falls, IA 50613","displayName":"West Music, 6322, University Avenue, Cedar Falls, Black Hawk County, Iowa, 50613, United States of America","country_code":"US","boundingBox":[42.5148377,42.5152255,-92.4342076,-92.4339595]}}'::jsonb);

-- Group: Axé Richmond
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('06ef5e65-7652-4053-872f-b9ab5f598d06', NOW(), NOW(), 'Axé Richmond', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Polvo (Kenneth Clark)
Notes: Richmond BC, Canada. Instrutor Polvo (Kenneth Clark) under Mestre Barrao [Vancouver]. SOURCE: website 4/25/17', NULL, '[{"type":"website","url":"https://richmondcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fc326167-6a87-4497-bc9d-f107037e6f2b', '06ef5e65-7652-4053-872f-b9ab5f598d06', 'Richmond Olympic Oval', 'Schedule: Tues & Thurs 8:15 – 9:45pm; Sat 1:00 – 2:30pm
Phone: 778.296.1400
Email: axeprograms@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.1516226,49.1746162]},"properties":{"address":"6111 River Road, Richmond, BC V7C 0A2","displayName":"Richmond Olympic Oval, 6111, River Road, Oval Village, City Centre, Richmond, Metro Vancouver Regional District, British Columbia, V7C, Canada","country_code":"CA","boundingBox":[49.1740674,49.175336,-123.15314,-123.1501928]}}'::jsonb);

-- Group: Capoeira Brasil - Schaumburg
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4097eea8-7d1b-4494-b175-f67aee6fd363', NOW(), NOW(), 'Capoeira Brasil - Schaumburg', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMADA Colibri
Main Contact: Raphaela Augusto - [773] 554-8384
Notes: Schaumburg, Illinois. Formada Colibri. Contact: Raphaela Augusto. SOURCE: website 2/23/18', 'pretolcct@hotmail.com', '[{"type":"website","url":"https://colibricb.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8e169043-6526-43bb-8e63-468e5d263207', '4097eea8-7d1b-4494-b175-f67aee6fd363', 'Brazilian Jiu Jitsu', 'Schedule: All Levels: Thurs 7:30-8:30pm; Sat 10:30-11:30am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-88.0801773,42.0064286]},"properties":{"address":"1154 S Roselle Rd, Schaumburg, IL 60193","displayName":"1154, South Roselle Road, Schaumburg, Schaumburg Township, Cook County, Illinois, 60193, United States of America","country_code":"US","boundingBox":[42.0063786,42.0064786,-88.0802273,-88.0801273]}}'::jsonb);

-- Group: Capoeira Angola Beaufort
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('03c5cd12-34ab-4bb4-a87f-edb37890162d', NOW(), NOW(), 'Capoeira Angola Beaufort', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Emily Fader - 843-263-9335
Notes: Beaufort, South Carolina. Instructor Emily (Emily Fader). Bring white pants and t-shirt and athletic shoes. SOURCE: website 1/30/13', 'Emily.fader@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/capoeiraangolabeaufort/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('afad97d4-f6d4-446a-82f7-85ba2df40895', '03c5cd12-34ab-4bb4-a87f-edb37890162d', 'Burton Wells Recreation Center', 'Schedule: Tues & Thurs 5:30-6:45
Phone: 843-470-6200', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.6923169,32.3850708]},"properties":{"address":"Beaufort, SC 29906","displayName":"Beaufort County, South Carolina, United States of America","country_code":"US","boundingBox":[32.07689,32.704321,-81.016234,-80.3448069]}}'::jsonb);

-- Group: Axé Capoeira Toronto
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('fa6a5353-b78d-416e-8b9f-702bb477cc7f', NOW(), NOW(), 'Axé Capoeira Toronto', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Paraiba (Marcos Martins)
Main Contact: Professor Paraiba - 647.340.2293
Notes: Toronto, Ontario, Canada. Professor Paraiba (Marcos Martins). SOURCE: website 4/26/17', 'axetoronto@gmail.com', '[{"type":"website","url":"http://www.axecapoeira-to.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('00a32ac4-b239-42a6-b4d2-bff57e806291', 'fa6a5353-b78d-416e-8b9f-702bb477cc7f', 'Axé Capoeira Toronto Academy', 'Schedule: (Full schedule of classes. See website)
Phone: 647.340.2293', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.4392291,43.6786681]},"properties":{"address":"1069 St Clair Ave West, Toronto, Ontario, M6E 1A6, Canada","displayName":"1069, St. Clair Avenue West, Corso Italia-Davenport, Davenport, Toronto, Golden Horseshoe, Ontario, M6E 1A3, Canada","country_code":"CA","boundingBox":[43.6786181,43.6787181,-79.4392791,-79.4391791]}}'::jsonb);

-- Group: Associação Kadara Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('24910a62-6ad5-463c-8f5b-d74601e6466d', NOW(), NOW(), 'Associação Kadara Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUCTOR Soquete
Main Contact: Instructor Soquete - 647 522 4540
Notes: Toronto, Ontario, Canada (Scarborough, Vaughan). Instructor Soquete under Mestre Cicatriz[Sydney]. SOURCE: website 2/3/17', 'info@learncapoeira.ca', '[{"type":"website","url":"http://kadaracapoeira.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f23f68d4-b3f4-4524-965a-8ccb1511ebf6', '24910a62-6ad5-463c-8f5b-d74601e6466d', 'Southside Muay Thai', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.2706866,43.770218]},"properties":{"address":"2065 Midland Ave., Scarborough, ON M1P 4P8","displayName":"2065, Midland Avenue, Dorset Park, Scarborough Centre, Scarborough, Toronto, Golden Horseshoe, Ontario, M1P 2X3, Canada","country_code":"CA","boundingBox":[43.769919,43.770517,-79.271559,-79.270133]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6df9ed62-aec5-4d7b-aae8-76d5058dca1b', '24910a62-6ad5-463c-8f5b-d74601e6466d', 'Pantera Fitness', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.5360962,43.8205821]},"properties":{"address":"399 Four Valley Drive, Vaughan, ON.","displayName":"399, Four Valley Drive, Vaughan, York Region, Golden Horseshoe, Ontario, L4K 4Z7, Canada","country_code":"CA","boundingBox":[43.8199873,43.8209353,-79.5363164,-79.5351416]}}'::jsonb);

-- Group: Grupo Capoeira Males - Toronto
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4bc52e9f-4e20-4ce5-b22a-54b1a6b5f887', NOW(), NOW(), 'Grupo Capoeira Males - Toronto', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Lua Branca (Waldecir de Souza)
Main Contact: Contra Mestre Lua Branca - 416-537-RODA [7632]
Notes: Toronto, Ontario, Canada. Contra Mestre Lua Branca (Waldecir de Souza). See also Burlington. SOURCE: website 3/18/17', 'info@capoeiraschool.ca', '[{"type":"website","url":"http://capoeiraschool.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('985af442-245a-4a62-8fab-bafe861df871', '4bc52e9f-4e20-4ce5-b22a-54b1a6b5f887', 'Wu Xing Martial Arts', 'Schedule: Mon 8:00-9:30pm; Wed 8:45-10:15pm; Fri 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.4105211,43.6744418]},"properties":{"address":"374 Dupont St.","displayName":"374, Dupont Street, Annex, University—Rosedale, Toronto, Golden Horseshoe, Ontario, M5R 1V9, Canada","country_code":"CA","boundingBox":[43.674259,43.6746194,-79.4107294,-79.4103342]}}'::jsonb);

-- Group: The Canadian Centre for Capoeira - Cordão de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5a6f8b3b-7288-4b53-a7b0-2ba350a73106', NOW(), NOW(), 'The Canadian Centre for Capoeira - Cordão de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 647.892.5931
Notes: Toronto, Ontario, Canada. The Canadian Centre for Capoeira - Cordão de Ouro. SOURCE: website 12/13/16', 'cdo.toronto@gmail.com', '[{"type":"website","url":"http://www.tcc4c.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('81e74781-ec26-46b8-82ba-48d09d27ad6c', '5a6f8b3b-7288-4b53-a7b0-2ba350a73106', 'hook up Muay Thai Boxing gym', 'Schedule: Adult: Mon & Wed 8:00-9:00pm;', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.4588478,43.7269869]},"properties":{"address":"288 Bridgeland Avenue, M6A 1Z4, Toronto, ON","displayName":"Bridgeland Avenue, Yorkdale-Glen Park, Eglinton—Lawrence, North York, Toronto, Golden Horseshoe, Ontario, M3K 1E4, Canada","country_code":"CA","boundingBox":[43.7269067,43.7270672,-79.4592586,-79.458437]}}'::jsonb);

-- Group: Capoeira Ache Brasil - Vancouver
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4719a4fb-68bd-48cb-9a9e-23f7c5e640d2', NOW(), NOW(), 'Capoeira Ache Brasil - Vancouver', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Eclison de Jesus
Main Contact: Mestre Eclison de Jesus - 778 838 9801 or 604 322 0553
Notes: Vancouver, British Columbia, Canada. Mestre Eclison de Jesus. SOURCE: website 4/27/17', 'info.achebrasil@gmail.com', '[{"type":"website","url":"http://achebrasil.ca"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4bb44512-d0ec-4b18-87a8-66718621058d', '4719a4fb-68bd-48cb-9a9e-23f7c5e640d2', 'Capoeira Ache Brasil Academy', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.097841,49.2629659]},"properties":{"address":"341 East Broadway, Vancouver BC V5T 1W5","displayName":"Capoeira Aché Brasil Academy, 341, East Broadway, Mount Pleasant, Vancouver, Metro Vancouver Regional District, British Columbia, V5T, Canada","country_code":"CA","boundingBox":[49.2629159,49.2630159,-123.097891,-123.097791]}}'::jsonb);

-- Group: AXÉ Capoeira Vancouver
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('575c95e6-5384-46bd-a06a-d6415de5ed4f', NOW(), NOW(), 'AXÉ Capoeira Vancouver', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Marcos Barrao
Main Contact: Mestre Marcos Barrao - 604-537-8943, 604-761-4635
Notes: Vancouver, British Columbia, Canada. Mestre Marcos Barrao. SOURCE: website 4/27/17', 'info@axecapoeira.com', '[{"type":"website","url":"http://www.axecapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b959da98-b4b4-4b5b-afd2-478b930f7c5c', '575c95e6-5384-46bd-a06a-d6415de5ed4f', 'Axé Capoeira Academy', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.0699601,49.2768956]},"properties":{"address":"1739 Venables st, Vancouver, BC, v5L 2H3","displayName":"1739, Venables Street, Grandview-Woodland, Vancouver, Metro Vancouver Regional District, British Columbia, V5L, Canada","country_code":"CA","boundingBox":[49.2767563,49.277034,-123.0701996,-123.069698]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6cc5dfb5-75d7-4758-84af-6a6a91cc3356', '575c95e6-5384-46bd-a06a-d6415de5ed4f', 'Seymour Dance', 'Phone: 604 929 6060', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.0004897,49.3144914]},"properties":{"address":"808 Lytton St, North Vancouver, BC V7H 2T1","displayName":"Lytton Street, Seymour Heights, Seymour, District of North Vancouver, Metro Vancouver Regional District, British Columbia, V7H 2M5, Canada","country_code":"CA","boundingBox":[49.3135999,49.315233,-123.001259,-123.0000177]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7101fb7d-011d-499a-9f6d-489a07b6a5bf', '575c95e6-5384-46bd-a06a-d6415de5ed4f', 'Hastings Community Center', 'Schedule: (Call for schedule and registration)
Phone: 604-718-6222', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.0394269,49.2806228]},"properties":{"address":"3096 East Hastings St, Vancouver, BC V2C 6N6","displayName":"Hastings Community Centre, 3096, East Hastings Street, Hastings-Sunrise, Vancouver, Metro Vancouver Regional District, British Columbia, V5K 2A3, Canada","country_code":"CA","boundingBox":[49.2804151,49.2809541,-123.039868,-123.03926]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0b4a0e42-5de1-4793-857a-e7029e005794', '575c95e6-5384-46bd-a06a-d6415de5ed4f', 'North Shore Neighbourhood House', 'Schedule: Kids Class [5-12yrs]: Mon 5:30-6:30pm
Phone: 604-987-8138', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.073971,49.3106439]},"properties":{"address":"225 east 2nd street, North Vancouver, BC V7L 1C4","displayName":"North Shore Neighbourhood House, 225, East 2nd Street, The Shipyards Common, Lower Lonsdale, North Vancouver, Metro Vancouver Regional District, British Columbia, V7L, Canada","country_code":"CA","boundingBox":[49.3104443,49.3108417,-123.0743106,-123.0736315]}}'::jsonb);

-- Group: Grupo Axé Capoeira Victoria Academy
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('55998b1c-0f5f-4bae-8f80-c0793357a0cc', NOW(), NOW(), 'Grupo Axé Capoeira Victoria Academy', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Testa (Kevin Bret)
Main Contact: Contramestre Testa - 250.589-8293
Notes: Victoria, British Columbia, Canada. Contramestre Testa (Kevin Bret). Instrutora Andrea [Kids Program]. SOURCE: website 5/6/17', 'testa@axecapoeira.tv', '[{"type":"website","url":"http://www.axecapoeira.tv/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1b62cc7d-3c5a-4bd3-956a-d73be7bc6eec', '55998b1c-0f5f-4bae-8f80-c0793357a0cc', 'Grupo Axé Capoeira Victoria Academy', 'Schedule: (Full schedule of classes)
Phone: [250] 884-7998
Email: andrea@axecapoeira.tv', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.3641227,48.4260458]},"properties":{"address":"715 Yates Street Victoria, BC V8W 1L6","displayName":"715, Yates Street, Chinatown, Downtown, Victoria, Capital Regional District, British Columbia, V8W 0C8, Canada","country_code":"CA","boundingBox":[48.4259958,48.4260958,-123.3641727,-123.3640727]}}'::jsonb);

-- Group: Capoeira Ache Brasil - Whistler
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f293d73d-f84d-410f-b63a-905039478ce6', NOW(), NOW(), 'Capoeira Ache Brasil - Whistler', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMATO Dragao (Cole Manson)
Main Contact: Formato Dragao - 604-966-8118
Notes: Whistler, British Columbia, Canada. Formato Dragao (Cole Manson) under Mestre Eclison de Jesus[Vancouver]. http://www.whistlercapoeira.ca offline 3/19/17. SOURCE: website 3/19/17', 'cole@whistlercapoeira.ca, Dragonteachercole@live.ca', '[{"type":"website","url":"http://achebrasil.ca"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c5396668-87da-4bc9-afdc-e33ac3fd0038', 'f293d73d-f84d-410f-b63a-905039478ce6', 'Awesome Arts Academy', 'Schedule: Kids[8 up]: Tues 5:45-6:45pm; Adults: Wed 6:45-8:00pm
Phone: 604-907-2340
Email: magda@whistlercapoeira.ca', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.0406118,50.0876303]},"properties":{"address":"1085 Millar Creek Rd, Whistler, BC V0N 1B1","displayName":"Millar Creek Road, Function Junction, Whistler Resort Municipality, Squamish-Lillooet Regional District, British Columbia, V8E 0W5, Canada","country_code":"CA","boundingBox":[50.0872792,50.0880923,-123.0425136,-123.0387185]}}'::jsonb);

-- Group: Capoeira Canavial - Boulder
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('46d08f7e-8ef9-421c-a3b5-39414c96993d', NOW(), NOW(), 'Capoeira Canavial - Boulder', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Lucas Corvo (Luiz Carlos Assunção Silva)
Main Contact: Mestre Lucas Corvo
Notes: Boulder, Colorado. Mestre Lucas Corvo (Luiz Carlos Assunção Silva). SOURCE: website 6/26/19', 'info@capoeiracanavial.com', '[{"type":"website","url":"http://www.capoeiracanavial.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ee63fb12-a4ab-42dd-b489-840cb25c7415', '46d08f7e-8ef9-421c-a3b5-39414c96993d', 'Boulder Ballet Studio', 'Schedule: Mon 7:45-9:00pm; Fri 7:00-8:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-105.2610947,40.01939]},"properties":{"address":"2590 Walnut St, Boulder, CO 80302","displayName":"The Dairy Arts Center, 2590, Walnut Street, Goss-Grove, Boulder, Boulder County, Colorado, 80302, United States of America","country_code":"US","boundingBox":[40.0191141,40.0196856,-105.2614154,-105.26066]}}'::jsonb);

-- Group: Brazilian Capoeira - Colorado Springs
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ca880754-7e6e-4e10-8cc5-f9949da30c8f', NOW(), NOW(), 'Brazilian Capoeira - Colorado Springs', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - [719] 635-1004
Notes: Colorado Springs, Colorado. Brazilian Capoeira. SOURCE: website 8/24/17', 'office@springsdance.com', '[{"type":"website","url":"http://www.capsprings.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('be14b929-15af-4b7f-8808-e87884eb0c1a', 'ca880754-7e6e-4e10-8cc5-f9949da30c8f', 'Springs Dance', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.8525404,38.9005187]},"properties":{"address":"4705 Centennial Blvd, Colorado Springs, CO 80919","displayName":"4705, Centennial Boulevard, Colorado Springs, El Paso County, Colorado, 80919, United States of America","country_code":"US","boundingBox":[38.9004687,38.9005687,-104.8525904,-104.8524904]}}'::jsonb);

-- Group: Grupo Capoeira Mandinga Tucson
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9cf0c58c-746d-4607-919c-7b224201a07d', NOW(), NOW(), 'Grupo Capoeira Mandinga Tucson', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRA Luar do Sertao (Anne Pollack)
Main Contact: Mestra Luar do Sertao - 520.975.6539
Notes: Tucson, Arizona. Mestra Luar do Sertao (Anne Pollack) directed and guided by Mestre Marcelo [Oakland CA]. SOURCE: website 6/5/18', 'info@CapoeiraTucson.com', '[{"type":"website","url":"http://www.CapoeiraTucson.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8b1c0dde-df6d-46ad-9954-456cd27bdbe8', '9cf0c58c-746d-4607-919c-7b224201a07d', 'Capoeira Mandinga Tucson Academy', 'Schedule: Tykes[Ages 3-6] 9:30-10:10am; Kids [Ages 6-13]: Mon 5:00-6:15pm; Sat 10:00-11:15am; Adult & Teen: Mon 7:30-8:30pm; Tues 7:30-9:00pm; Thurs 7:00-8:30pm; Sat 11:30am-1:00pm; Women and kids ages 4+: Tues 6:00-7:15pm; Kids & Family [Ages 6+]: Thurs 5:15-6:30pm; OPEN RODA! 1st Sat 11:00am-12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-110.9790004,32.254989]},"properties":{"address":"85705, Tucson, AZ","displayName":"85705, Miracle Manor, Tucson, Pima County, Arizona, United States of America","country_code":"US","boundingBox":[32.204989,32.304989,-111.0290004,-110.9290004]}}'::jsonb);

-- Group: Axé Capoeira Tucson
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8da9f69d-949b-48c8-a329-9b3c8c25a7a7', NOW(), NOW(), 'Axé Capoeira Tucson', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instrutor Sombra (Aquil Joel Hameed) - 520-990-1820
Notes: Tucson, Arizona. Instrutor Sombra (Aquil Joel Hameed). SOURCE: website 6/5/18', 'axesombra@gmail.com', '[{"type":"website","url":"https://www.tucsoncapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bdae2ef0-27e4-45f7-9ac1-9299384f01ec', '8da9f69d-949b-48c8-a329-9b3c8c25a7a7', 'Studio Axe', 'Schedule: Beginning Kids Tues & Thurs 4:30pm; Advanced Kids Tues & Thurs 5:30pm; All Level Kids Sat 11:00am; Beginning Adults/Teens: Mon 7:00pm; All Levels Adults/Teens: Tues & Thurs 7:00pm; Wed 11:00am; Sat 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-110.9287777,32.2214417]},"properties":{"address":"2928 East Broadway Blvd, Tucson, AZ, 85716","displayName":"2928, East Broadway Boulevard, Broadmoor-Broadway, Tucson, Pima County, Arizona, 85716, United States of America","country_code":"US","boundingBox":[32.2213917,32.2214917,-110.9288277,-110.9287277]}}'::jsonb);

-- Group: Mão no Chão Capoeira Angola Dundee
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8ca76b53-7c09-4c88-a4e0-76e6227c0542', NOW(), NOW(), 'Mão no Chão Capoeira Angola Dundee', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Marrom
Main Contact: Katie - 07830 102039
Notes: Airdrie, Scotland. No longer appears to have classes in Airdrie 12/26/19. Associated with Mestre Marrom e Alunos [Rio de Janiero]. Contact Katie. SOURCE: website 6/20/13', NULL, '[{"type":"website","url":"https://maonochaoscotlandblog.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f5346766-75b9-4080-abc4-2ee605b5e2f2', '8ca76b53-7c09-4c88-a4e0-76e6227c0542', 'Airdrie Leisure Centre', 'Schedule: Beginner class: Thursday, 8.15-9.30pm
Phone: 01236 762871', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.963661,55.8740199]},"properties":{"address":"Motherwell Street Airdrie ML6 7HU","displayName":"Motherwell Street, Rawyards, Airdrie, North Lanarkshire, Alba / Scotland, ML6 7HP, United Kingdom","country_code":"GB","boundingBox":[55.8716683,55.8764014,-3.9657183,-3.9615687]}}'::jsonb);

-- Group: Mundo Capoeira Ireland - Athlone
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('30ad1eb7-f317-4732-a0ed-dd1d73f76bad', NOW(), NOW(), 'Mundo Capoeira Ireland - Athlone', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Sansao
Main Contact: Graduado Duda - 087-2969-133
Notes: Athlone, Ireland. Graduado Duda under Mestre Sansao [Dublin]. SOURCE: website 12/31/19', 'info@capoeiraireland.com, Kirk83@wp{D0Tpl', '[{"type":"website","url":"http://www.capoeiraireland.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b6974cd2-2759-4715-b01d-15af424025da', '30ad1eb7-f317-4732-a0ed-dd1d73f76bad', 'ALSAA Sports Centre', 'Schedule: Mon 6:00pm-7:00pm (Kids); Mon 7:00pm-8:00pm (Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.249166222181791,53.417997435136904]},"properties":{"address":"Old Airport Road, Dublin, Ireland","displayName":"Collinstown Lane, Airport ED, Fingal, County Dublin, Leinster, K67 A0K7, Éire / Ireland","country_code":"ie","boundingBox":[53.4178438,53.4182048,-6.2508855,-6.2474421]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2b8baa82-f591-4c1f-b74b-e65701416107', '30ad1eb7-f317-4732-a0ed-dd1d73f76bad', 'IMAAL HALL', 'Schedule: Tue 4:00pm-5:00pm (Kids & Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.6831,53.0011]},"properties":{"address":"1, Upper Stephen St., Dunlavin Upper, Dunlavin, West Wicklow, Co. Wicklow W91N8H7","displayName":"1 Upper Stephen Street, Dunlavin, Co. Wicklow W91 N8H7, Ireland","country_code":"us"}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c4e01367-be93-448f-8101-eda08e6c242f', '30ad1eb7-f317-4732-a0ed-dd1d73f76bad', 'SPOTLIGHT STUDIOS "The Anchorage"', 'Schedule: Wed 6:30pm-7:30pm (Kids); Wed 7:30pm-8:30pm (Adults)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.1463819770052694,52.79592638294406]},"properties":{"address":"North Quay, Wicklow, A67 XR58","displayName":"North Quay, Arklow No 2 Urban ED, The Municipal District of Arklow, County Wicklow, Leinster, Y14 WE22, Éire / Ireland","country_code":"ie","boundingBox":[52.7950934,52.7979841,-6.149136,-6.1442661]}}'::jsonb);

-- Group: North Star Capoeira Angola - Bloomington
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7898526f-cc87-42bc-837e-2476b1f8cbc5', NOW(), NOW(), 'North Star Capoeira Angola - Bloomington', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Iuri Santos
Notes: Bloomington, Indiana. Mestre Iuri Santos (northstarcapoeira@gmail.com). LINEAGE: Mestre Pastina >> Mestre Joao Pequeno >> Mestre Marrom >> Mestre Iuri Hart Santos. SOURCE: website 3/5/18', NULL, '[{"type":"website","url":"http://northstarcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dbf8ff7a-6fbd-4cba-bc1d-ee9f322224df', '7898526f-cc87-42bc-837e-2476b1f8cbc5', 'Casa do Mestre Iuri', 'Schedule: Children: Mon 5:00-6:00 (contact for details); Adults: Mon & Fri 6:30-8:30pm
Phone: [812] 340-8844
Email: iurigagari@hotmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-86.5274187,39.1585405]},"properties":{"address":"812 South Henderson, Bloomington, IN 47401","displayName":"812, South Henderson Street, Elm Heights, Bloomington, Monroe County, Indiana, 47401, United States of America","country_code":"US","boundingBox":[39.158493,39.158585,-86.527562,-86.527275]}}'::jsonb);

-- Group: ABADA Visalia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('750a1524-5e5d-4bcb-8053-bafce8d9c80c', NOW(), NOW(), 'ABADA Visalia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRA Cigarra
Main Contact: Graduada Toninho (Erica Hemenway)
Notes: Tulare County (Visalia), California. Graduada Toninho (Erica Hemenway) under Mestra Cigarra [San Francisco]. SOURCE: website 8/23/17', 'abada.toninho@gmail.com', '[{"type":"website","url":"http://abadatoninho.wixsite.com/abadavisalia"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1dbc6d67-356c-43ed-a812-2434aa46e712', '750a1524-5e5d-4bcb-8053-bafce8d9c80c', 'Anthony Community Center', 'Schedule: Tues & Thurs 7:30pm-8:45pm (Check facebook for schedule updates)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.3020883,36.3323537]},"properties":{"address":"345 N Jacob Street, Visalia, CA 93291","displayName":"345, North Jacob Street, Visalia, Tulare County, California, 93291, United States of America","country_code":"US","boundingBox":[36.3323037,36.3324037,-119.3021383,-119.3020383]}}'::jsonb);

-- Group: Capoeira Sul da Bahia - Ventura
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0e40177c-fe26-4a96-8a7a-92928c7c7414', NOW(), NOW(), 'Capoeira Sul da Bahia - Ventura', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instructor Caicara (Mike) - [805] 637-5355
Notes: Ventura County (Ventura), California. Instructor Caicara (Mike). Mail: 1230 State Street, Santa Barbara, CA 93101. SOURCE: website 8/23/17', 'capoeirasb@gmail.com', '[{"type":"website","url":"http://www.capoeirasantabarbara.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d886b8bb-af4f-4b0b-a7ca-fba0ddd0318f', '0e40177c-fe26-4a96-8a7a-92928c7c7414', 'Yoga Jones', 'Schedule: Tues & Thurs 7:30-8:45', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.2947568,34.279356]},"properties":{"address":"105 S. Oak Street Ventura CA","displayName":"105, South Oak Street, San Buenaventura (Ventura), Ventura County, California, 93001, United States of America","country_code":"US","boundingBox":[34.279306,34.279406,-119.2948068,-119.2947068]}}'::jsonb);

-- Group: Lincoln Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('aa79bc4f-5058-43d6-9e85-49267805861e', NOW(), NOW(), 'Lincoln Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 19)
Notes: SOURCE:', NULL, '[{"type":"website","url":"http://capoeiraabudhabi.blogspot.com/p/mestre-caxias.html"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('19007516-7306-49d0-a39a-189e08102b9f', 'aa79bc4f-5058-43d6-9e85-49267805861e', '1/8/19)', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1918155,51.3674354]},"properties":{"address":"1/8/19), 7/16/11   1/8/19","displayName":"Woodville House, 1, Brunswick Road, Benhilton, London Borough of Sutton, London, Greater London, England, SM1 4DE, United Kingdom","country_code":"GB","boundingBox":[51.3673854,51.3674854,-0.1918655,-0.1917655]}}'::jsonb);

-- Batch: batch-06.json (37 groups)

-- Group: Cultural Association of Brazilian Arts [CAOBA]
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('afdfbfee-68fb-4248-b3f9-cdab4927a05b', NOW(), NOW(), 'Cultural Association of Brazilian Arts [CAOBA]', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Bayano (Irani Andreati)
Main Contact: - 817
Notes: SOURCE: website 3/19/19', 'caobanj@gmail.com', '[{"type":"website","url":"http://www.caobarts.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3df21b56-e1cb-401c-8f28-c6cef06062a1', 'afdfbfee-68fb-4248-b3f9-cdab4927a05b', 'Main Street', 'Schedule: Youth: Mon & Wed 6:00- 7:00pm;  Sat 12:00-1:00pm; Beginners:Tues & Thurs 7:15pm- 8:15pm; Intermediate and Advanced:Mon & Wed 7:15 - 8:15pm; Music: Fri 7:00 - 8:00pm; Physical Conditioning low impact Adults Only:Thurs 6:00 - 7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0424221,40.9047372]},"properties":{"address":"817 Main Street, Hackensack, NJ 07601","displayName":"817, Main Street, Hackensack, Bergen County, New Jersey, 07601, United States of America","country_code":"US","boundingBox":[40.9046872,40.9047872,-74.0424721,-74.0423721]}}'::jsonb);

-- Group: Ginga Mundo
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ceb9e97c-34c7-4e24-815d-a60301c20fa7', NOW(), NOW(), 'Ginga Mundo', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 917] 488-0041
Notes: SOURCE: website 3/27/19', 'bocadomundo@yahoo.com', '[{"type":"website","url":"http://www.gingamundo.us"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ca568b5d-7995-44b7-8381-1975f1859ab1', 'ceb9e97c-34c7-4e24-815d-a60301c20fa7', 'River Road', 'Schedule: Adults: Tues & Thurs -; Kids Age 4-6: Sun - 10:00-11:00am:; Kids Age 7-13: Sun 11:00am-12:00pm :', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9744485,40.825483]},"properties":{"address":"890 River Road, Edgewater, NJ 07020","displayName":"890, River Road, Edgewater, Bergen County, New Jersey, 07020, United States of America","country_code":"US","boundingBox":[40.825433,40.825533,-73.9744985,-73.9743985]}}'::jsonb);

-- Group: Afro Brazilian Cultural Center of New Jersey
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('887daf99-b36c-416c-ae40-1ab44955cb09', NOW(), NOW(), 'Afro Brazilian Cultural Center of New Jersey', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Gaivota (David Morgan)
Main Contact: - 554
Notes: SOURCE: website 3/23/19', 'emaildavid@abccnj.com', '[{"type":"website","url":"http://www.abccnj.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5d62bc97-a914-4c46-8d10-2a1cd2160e35', '887daf99-b36c-416c-ae40-1ab44955cb09', 'Bloomfield Avenue', 'Schedule: Children:   Mon,Wed & Fri 6:00-7:00pm; Beginners & Teens: Mon,Wed & Fri; Adult: Mon,Wed & Fri 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.1942323,40.7872463]},"properties":{"address":"554 Bloomfield Avenue, Bloomfield, NJ 07003","displayName":"Bloomfield Avenue, Bloomfield, Essex County, New Jersey, 07003, United States of America","country_code":"US","boundingBox":[40.78514,40.7893499,-74.1953298,-74.19314]}}'::jsonb);

-- Group: Grupo Ginga
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('11804cee-266d-42c8-be7e-e448e8feb96a', NOW(), NOW(), 'Grupo Ginga', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - +1 917 725 0381
Notes: SOURCE: website 5/7/19', NULL, '[{"type":"website","url":"http://www.grupoginga.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3759e8bd-4eda-4e4c-99d1-f89f02b6867b', '11804cee-266d-42c8-be7e-e448e8feb96a', 'Morgan Street', 'Schedule: Mon & Thurs  7:00 - 8:30pm( call or contact though', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0415631,40.7201993]},"properties":{"address":"196 Morgan Street, Jersey City, NJ 07302","displayName":"196, Morgan Street, Hamilton Park, Jersey City, Hudson County, New Jersey, 07302, United States of America","country_code":"US","boundingBox":[40.7201493,40.7202493,-74.0416131,-74.0415131]}}'::jsonb);

-- Group: Arts United Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4fc20332-90d9-4130-ab97-ebe3e1672028', NOW(), NOW(), 'Arts United Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 19)
Notes: )SOURCE:  website 4/5/19', 'aucapoeira@gmail.com', '[{"type":"website","url":"https://aucapoeira.wixsite.com/aucapoeira"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ae2b95af-c88c-4efb-835b-7fae77802bd5', '4fc20332-90d9-4130-ab97-ebe3e1672028', 'Coles St', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.047331,40.723628]},"properties":{"address":"54 Coles St, Jersey City, NJ 07302","displayName":"54, Coles Street, Hamilton Park, Journal Square, Jersey City, Hudson County, New Jersey, 07302, United States of America","country_code":"US","boundingBox":[40.723578,40.723678,-74.047381,-74.047281]}}'::jsonb);

-- Group: Grupo Liberdade de Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e8043842-f56b-4bfb-843d-d4a939c7ca24', NOW(), NOW(), 'Grupo Liberdade de Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 347] 228-5593
Notes: SOURCE: website 4/3/19', 'amazonas.jb@gmail.com', '[{"type":"website","url":"http://www.grupoliberdadedecapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5178eb10-f62c-4e95-817d-1f455b166765', 'e8043842-f56b-4bfb-843d-d4a939c7ca24', 'Vauxhall', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.2827557,40.7171382]},"properties":{"address":"Vauxhall, NJ 07088","displayName":"Vauxhall Road, Union, Union County, New Jersey, 07088, United States of America","country_code":"US","boundingBox":[40.7158195,40.7181288,-74.2839144,-74.2820391]}}'::jsonb);

-- Group: Santa Fe Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7837713d-342d-4b5c-b764-5549abfa5a3a', NOW(), NOW(), 'Santa Fe Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 507
Notes: SOURCE:  website  4/10/19', NULL, '[{"type":"website","url":"http://www.capoeirasantafe.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9342b27c-9797-4817-941f-510f57d12a91', '7837713d-342d-4b5c-b764-5549abfa5a3a', 'Kathryn Street', 'Schedule: Tues 6:00-7:30 pm; Thurs 6:00 -7:00 pm.; Conditioning:  Mon- Fri 8:00- 8:45 am.; All ages: Sat 9:00 - 9:45am,', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-105.9575698,35.6784507]},"properties":{"address":"507 Kathryn Street, Santa Fe, NM 87501","displayName":"Kathryn Street Foot Bridge, Santa Fe, Santa Fe County, New Mexico, 87505, United States of America","country_code":"US","boundingBox":[35.678406,35.6784954,-105.9575702,-105.9575694]}}'::jsonb);

-- Group: LV Capoeira Academy - Grupo Liberdade
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9b4fc93b-64d7-4d03-a574-1f58033b2844', NOW(), NOW(), 'LV Capoeira Academy - Grupo Liberdade', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Adam Kaswiner (under Mestre CiganoRio de)
Main Contact: - 845-464-2332
Notes: SOURCE: website 1/12/19', 'akaswiner@gmail.com', '[{"type":"website","url":"https://www.lvcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('36b9ce9e-647f-46f2-9b53-be8108192731', '9b4fc93b-64d7-4d03-a574-1f58033b2844', 'W Sahara Ave', 'Schedule: Mon, Tues & Thur 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-115.1817792,36.1438589]},"properties":{"address":"2929 W Sahara Ave, Las Vegas, NV 89102","displayName":"Las Vegas Shotokan Karate, 2929, West Sahara Avenue, Rancho Charleston, Las Vegas, Clark County, Nevada, 89102, United States of America","country_code":"US","boundingBox":[36.1438013,36.1439321,-115.1818719,-115.1816866]}}'::jsonb);

-- Group: Capoeira Vida Brooklyn
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('58153ea7-b326-41f6-ad66-8097cb52a779', NOW(), NOW(), 'Capoeira Vida Brooklyn', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Ana Costa( ()()
Main Contact: - 917-722-6703
Notes: SOURCE:   website 4/19/19', 'info@capoeirabrooklyn.com', '[{"type":"website","url":"https://www.capoeiravida.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6220458a-2754-44be-9198-5d00f9ba3bd6', '58153ea7-b326-41f6-ad66-8097cb52a779', '7th Street', 'Schedule: Beginner:  Wed: 6:30-8pm; All Levels:  Tues: 6:30-8pm; Thurs : 7:30-9pm; Sat:', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9857219,40.670428]},"properties":{"address":"316 7th Street, Brooklyn, NY 11215","displayName":"Way of Action, 316, 7th Street, Park Slope, Brooklyn, Kings County, City of New York, New York, 11215, United States of America","country_code":"US","boundingBox":[40.670378,40.670478,-73.9857719,-73.9856719]}}'::jsonb);

-- Group: Centro de Capoeira Angola Filhos de Dunga
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3d5fe1b6-84f3-4eaf-8667-3abc1015dcb8', NOW(), NOW(), 'Centro de Capoeira Angola Filhos de Dunga', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Luiz Rocha
Main Contact: - 335
Notes: SOURCE: 5/12/19', 'nygrande@gmail.com', '[{"type":"website","url":"http://www.capoeiraangolabrooklyn.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('72136d3e-4b4d-4697-a079-5ed1c7993b82', '3d5fe1b6-84f3-4eaf-8667-3abc1015dcb8', 'Throop Ave Brooklyn', 'Schedule: Basic Postures, Movements, Sequences, Music: Mon, Tues, Wed, & Thurs 7:00-9:00pm; Music & Movement Ages: 3-5 Years: Sat 10:00á 10:45am; Music & Movement Ages: 6-12Years: Sat 11:00:00amá 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9424241,40.6918747]},"properties":{"address":"335 Throop Ave Brooklyn, NY 11221","displayName":"335, Throop Avenue, Bedford-Stuyvesant, Brooklyn, Kings County, City of New York, New York, 11221, United States of America","country_code":"US","boundingBox":[40.6917356,40.6920139,-73.942605,-73.9422432]}}'::jsonb);

-- Group: Raizes do Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('74f3bfe1-a001-4479-b1fe-45414711700e', NOW(), NOW(), 'Raizes do Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 347] 921-2446
Notes: )SOURCE: website  4/23/19(', 'info@rbcapoeira.com', '[{"type":"website","url":"http://www.rbcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bf7c695b-d55f-457d-a85b-808754a0d0aa', '74f3bfe1-a001-4479-b1fe-45414711700e', '3rd Ave', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9858694,40.6773633]},"properties":{"address":"279 3rd Ave, Brooklyn, NY 11215","displayName":"279, 3rd Avenue, Gowanus, Brooklyn, Kings County, City of New York, New York, 11215, United States of America","country_code":"US","boundingBox":[40.6773133,40.6774133,-73.9859522,-73.9857867]}}'::jsonb);

-- Group: Vai Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('06f1ac20-616a-4792-b6c5-9d8926a9ca99', NOW(), NOW(), 'Vai Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 646.379.4468
Notes: SOURCE: website 4/19/19', NULL, '[{"type":"website","url":"https://www.vaicapoeira.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('76fe9707-2dd0-4def-bbaa-ab42cdd40b89', '06f1ac20-616a-4792-b6c5-9d8926a9ca99', '646.379.4468', 'Schedule: Thurs & Sat 6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.92648354162583,40.666995549999996]},"properties":{"address":"Lincoln Terrace Park, Brooklyn, New York, USA","displayName":"Lincoln Terrace Park / Arthur S. Somers Park, Brownsville, Brooklyn, Kings County, City of New York, New York, United States of America","country_code":"us","boundingBox":[40.664806,40.6683733,-73.9285708,-73.9243734]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('323f1d42-9b04-4753-9fbf-1159fd05a357', '06f1ac20-616a-4792-b6c5-9d8926a9ca99', '8th Ave', 'Schedule: Mon & Wed: 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9919513,40.7538643]},"properties":{"address":"520 8th Ave, New York, NY","displayName":"Houndstooth Pub, 520, 8th Avenue, Garment District, Manhattan Community Board 5, Manhattan, New York County, City of New York, New York, 10018, United States of America","country_code":"US","boundingBox":[40.7538143,40.7539143,-73.9920013,-73.9919013]}}'::jsonb);

-- Group: Capoeira Luanda under Mestre Jelon
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d92ed133-4e06-47a7-a94e-7aac321afc5b', NOW(), NOW(), 'Capoeira Luanda under Mestre Jelon', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Angelo Ribeiro
Main Contact: - 917] 224-1209
Notes: SOURCE: website 4/14/19Introdutor Caipira  "Mirlet(")(
SOURCE: website 4/14/19', 'piaocapoeira@gmail.com', '[{"type":"website","url":"http://www.piaocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('254ce433-8137-45d8-a7c2-5ae23150b843', 'd92ed133-4e06-47a7-a94e-7aac321afc5b', '3rd Avenue', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.986335,40.6766107]},"properties":{"address":"303 3rd Avenue, Brooklyn, NY 11215","displayName":"303, 3rd Avenue, Gowanus, Brooklyn, Kings County, City of New York, New York, 11215, United States of America","country_code":"US","boundingBox":[40.67652,40.6767076,-73.9865069,-73.9861747]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('88b4376b-5135-4788-91da-7ec5467d52c9', 'd92ed133-4e06-47a7-a94e-7aac321afc5b', 'Lafayette Avenue', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9788779,40.6868763]},"properties":{"address":"3 Lafayette Avenue, Brooklyn, NY","displayName":"3, Lafayette Avenue, Fort Greene, Brooklyn, Kings County, City of New York, New York, 11217, United States of America","country_code":"US","boundingBox":[40.6868263,40.6869263,-73.9789279,-73.9788279]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('08090cb8-e130-494e-8779-ee17c7340b28', 'd92ed133-4e06-47a7-a94e-7aac321afc5b', 'Calyer St', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9565605,40.7269717]},"properties":{"address":"106 Calyer St, Greenpoint, Brooklyn, NY","displayName":"Triskelion Arts, 106, Calyer Street, Greenpoint, Brooklyn, Kings County, City of New York, New York, 11222, United States of America","country_code":"US","boundingBox":[40.7269217,40.7270217,-73.9566105,-73.9565105]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fa3c8571-6dc1-476c-9f82-257abb5c2610', 'd92ed133-4e06-47a7-a94e-7aac321afc5b', 'Manhattan Ave', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9466784,40.7166711]},"properties":{"address":"361 Manhattan Ave, Brooklyn, NY","displayName":"Center For Performing Research, 361, Manhattan Avenue, Greenpoint, Brooklyn, Kings County, City of New York, New York, 11211, United States of America","country_code":"US","boundingBox":[40.7165999,40.7167423,-73.9468007,-73.946556]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a0c8f816-96a2-4b4a-ba10-f4b126b0b366', 'd92ed133-4e06-47a7-a94e-7aac321afc5b', '3rd Avenue', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9903434,40.6725026]},"properties":{"address":"432 3rd Avenue, Brooklyn, NY 11215","displayName":"432, 3rd Avenue, Park Slope, Brooklyn, Kings County, City of New York, New York, 11215, United States of America","country_code":"US","boundingBox":[40.6724526,40.6725526,-73.9903934,-73.9902934]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e2c2a006-712b-467d-b9fd-9ca0716d71ad', 'd92ed133-4e06-47a7-a94e-7aac321afc5b', 'Waverly Avenue', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9658381,40.6855509]},"properties":{"address":"419 Waverly Avenue, Brooklyn, NY 11238","displayName":"Public School 11, 419, Waverly Avenue, Clinton Hill, Brooklyn, Kings County, City of New York, New York, 11238, United States of America","country_code":"US","boundingBox":[40.6852063,40.6860426,-73.9662811,-73.9654307]}}'::jsonb);

-- Group: Pena Verde Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('50f4a8b2-d415-442e-ad4b-3278860db620', NOW(), NOW(), 'Pena Verde Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 197
Notes: SOURCE: websites 5/6/19 (merged from 2 duplicate entries)', NULL, '[{"type":"website","url":"http://www.penaverdecapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('eecef0c2-749f-4d49-9ec3-c7f003be4919', '50f4a8b2-d415-442e-ad4b-3278860db620', 'Clifton Place', 'Schedule: Adults: Tues & Thurs 7:00-8;30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9559765,40.6888772]},"properties":{"address":"197 Clifton Place, Brooklyn, NY 11216","displayName":"197, Clifton Place, Clinton Hill, Brooklyn, Kings County, City of New York, New York, 11205, United States of America","country_code":"US","boundingBox":[40.6886857,40.688959,-73.9560718,-73.9558518]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a583b78e-6cb1-4c53-8ac2-d22700f1a472', '50f4a8b2-d415-442e-ad4b-3278860db620', 'Greene Ave', 'Schedule: Adults: Tues & Thurs 7:00-8;30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9627409,40.6868743]},"properties":{"address":"216 Greene Ave, Brooklyn, NY 11238","displayName":"216, Greene Avenue, Clinton Hill, Brooklyn, Kings County, City of New York, New York, 11238, United States of America","country_code":"US","boundingBox":[40.6867185,40.6869735,-73.9627948,-73.9626759]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('56f9a025-f198-4a29-a10b-8c323c46d909', '50f4a8b2-d415-442e-ad4b-3278860db620', 'Nostrand Avenue', 'Schedule: Adults: Tues & Thurs 7:00-8;30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9505769,40.6720862]},"properties":{"address":"778 Nostrand Avenue, Brooklyn, NY 11216","displayName":"778, Nostrand Avenue, Crown Heights, Brooklyn, Kings County, City of New York, New York, 11216, United States of America","country_code":"US","boundingBox":[40.6720531,40.6721194,-73.9507359,-73.9504179]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('18969661-5ec6-4bb9-a7e0-0626936807d9', '50f4a8b2-d415-442e-ad4b-3278860db620', 'Fulton Street', 'Schedule: Adults: Tues & Thurs 7:00-8;30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9456091,40.6799639]},"properties":{"address":"1368 Fulton Street, Brooklyn, NY 11216","displayName":"Restoration Plaza, 1368, Fulton Street, Bedford-Stuyvesant, Brooklyn, Kings County, City of New York, New York, 11216, United States of America","country_code":"US","boundingBox":[40.6797461,40.6800899,-73.9460765,-73.9451482]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('becad082-c42b-46f4-9b98-7f2a97b29ef6', '50f4a8b2-d415-442e-ad4b-3278860db620', 'Main Street Dance and Theatre Alliance', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9496057,40.7619559]},"properties":{"address":"548 Main Street, New York, NY 10044","displayName":"548, Main Street, Manhattan Community Board 8, Manhattan, New York County, City of New York, New York, 10044, United States of America","country_code":"US","boundingBox":[40.7619059,40.7620059,-73.9496557,-73.9495557]}}'::jsonb);

-- Group: ABADÁ - -Capoeira Brooklyn
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cf11558f-3364-4403-8415-088d7ad6b612', NOW(), NOW(), 'ABADÁ - -Capoeira Brooklyn', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Ryan Johnson
Main Contact: - 281
Notes: SOURCE: website 5/11/19', NULL, '[{"type":"website","url":"https://www.abadanyc.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e3f4bc45-c2e8-43ea-ae0b-e941a4f3ba18', 'cf11558f-3364-4403-8415-088d7ad6b612', 'N 7th St', 'Schedule: Tues & Fri 7:00-9:00pm; Sun 12:30-4:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9531794,40.715298]},"properties":{"address":"281 N 7th St, Brooklyn, NY 11211","displayName":"281, North 7th Street, Williamsburg, Brooklyn, Kings County, City of New York, New York, 11211, United States of America","country_code":"US","boundingBox":[40.7151203,40.7154761,-73.9534105,-73.9529504]}}'::jsonb);

-- Group: Buffalo Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('fc6a7826-9ee5-4edd-83ab-43048a37c650', NOW(), NOW(), 'Buffalo Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 716] 320-0093
Notes: SOURCE: website 5/26/19', 'capoeiraculturalarts@gmail.com', '[{"type":"website","url":"http://www.capoeirabuffalo.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4e2f37b7-9faf-4da8-a367-3a5d75e3f191', 'fc6a7826-9ee5-4edd-83ab-43048a37c650', 'E. Utica St.', 'Schedule: Adult Beginner: Mon, Wed & Fri 6:30 - 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-78.8574602,42.911371]},"properties":{"address":"226 E. Utica St., Buffalo, NY","displayName":"226, East Utica Street, East Side, Buffalo, Erie County, New York, 14208, United States of America","country_code":"US","boundingBox":[42.911321,42.911421,-78.8575102,-78.8574102]}}'::jsonb);

-- Group: Ithaca Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c1fb6bbd-a958-4fb5-b559-ac8e26916784', NOW(), NOW(), 'Ithaca Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 407
Notes: SOURCE: website, facebook 5/27/19', NULL, '[{"type":"website","url":"http://vadiacao.net/index.html"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('93119520-e325-4f27-8559-71dc19ea1d1d', 'c1fb6bbd-a958-4fb5-b559-ac8e26916784', 'Taughannock Boulevard', 'Schedule: Mon, Wed & Fri 7:30-930pm; Music: Sun 1:00-2:30pm (location may be elsewhere)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.5122569,42.4426302]},"properties":{"address":"407 Taughannock Boulevard, Ithaca, NY 14850","displayName":"407, Old Taughannock Boulevard, Ward 1, City of Ithaca, Tompkins County, New York, 14850, United States of America","country_code":"US","boundingBox":[42.4425802,42.4426802,-76.5123069,-76.5122069]}}'::jsonb);

-- Group: Capoeira Angola Quintal of Ithaca, NY
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a5db0642-9491-441f-b6a8-d60d2a22d4e5', NOW(), NOW(), 'Capoeira Angola Quintal of Ithaca, NY', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 136
Notes: SOURCE:  website 5/27/19', 'ithacacaq@gmail.com', '[{"type":"website","url":"https://www.ithacacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('33e03e00-34f8-4047-a162-02cd2a471bfc', 'a5db0642-9491-441f-b6a8-d60d2a22d4e5', 'Willard Straight Hall', 'Schedule: Sun & Tues: 7:30pm - 9:00pm; Fri 3:30-5:30pm      (Contact for location); Thurs  7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.4856054,42.446466]},"properties":{"address":"Willard Straight Hall, 136 Ho Plaza, Ithaca, NY 14853","displayName":"Willard Straight Hall, 136, Ho Plaza, Ward 4, City of Ithaca, Tompkins County, New York, 14850, United States of America","country_code":"US","boundingBox":[42.4462657,42.4468666,-76.4860045,-76.4853035]}}'::jsonb);

-- Group: Manhatten Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('27fb2c33-adf6-4298-9c4e-cddf9f2403fb', NOW(), NOW(), 'Manhatten Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 2916
Notes: SOURCE: website 4/12/19', 'info@joaogrande.org', '[{"type":"website","url":"http://www.joaogrande.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9979f437-29ad-4d1a-a0f8-97618d00e2b6', '27fb2c33-adf6-4298-9c4e-cddf9f2403fb', 'Frederick Douglass Boulevard', 'Schedule: Adults: Mon-Fri 6:30- 8:30pm, Sun 10am-12; Kids: Sat 11:00am-12:00; RODA!: Sun 2:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9373406,40.8285417]},"properties":{"address":"2916 Frederick Douglass Boulevard, New York, NY 10039","displayName":"2916, Frederick Douglass Boulevard, Harlem, Manhattan Community Board 10, Manhattan, New York County, City of New York, New York, 10039, United States of America","country_code":"US","boundingBox":[40.8284013,40.8286821,-73.9375526,-73.9371287]}}'::jsonb);

-- Group: Capoeira Angola Quintal
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('181cd2cc-d82f-4713-8e38-158d0bac7d72', NOW(), NOW(), 'Capoeira Angola Quintal', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Michael Goldstein
Main Contact: - 107
Notes: SOURCE: websites 4/13/19', NULL, '[{"type":"website","url":"http://newyorkcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ab37ae55-a904-4fe3-a2be-c9f16d721455', '181cd2cc-d82f-4713-8e38-158d0bac7d72', '107 Suffolk St, Studio 307 New York, NY 10002', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9861796,40.719051]},"properties":{"address":"107 Suffolk Street, New York, NY 10002","displayName":"107, Suffolk Street, Lower East Side, Manhattan Community Board 3, Manhattan, New York County, City of New York, New York, 10002, United States of America","country_code":"US","boundingBox":[40.719001,40.719101,-73.9862296,-73.9861296]}}'::jsonb);

-- Group: Capoeira Luanda
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ccf547e7-cebc-451c-b4d3-e96f3fae203d', NOW(), NOW(), 'Capoeira Luanda', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR
Main Contact: - 635
Notes: SOURCE: website 4/14/19
SOURCE: website 4/13/19(
SOURCE: website 4/14/19 Instructor Sabiá  (is now teaching in  Contra Costa County CA', 'info@capoeiracenterny.orgProfessorTiba', '[{"type":"website","url":"http://www.capoeiracenterny.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b0435fd9-b4e9-4270-8c71-84a7eab42fde', 'ccf547e7-cebc-451c-b4d3-e96f3fae203d', 'Riverside Drive', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.8670119,41.1014877]},"properties":{"address":"635 Riverside Drive, New York, NY 10031","displayName":"635, Riverside Drive, Philipse Manor, Village of Sleepy Hollow, Town of Mount Pleasant, Westchester County, New York, 10591, United States of America","country_code":"US","boundingBox":[41.1014377,41.1015377,-73.8670619,-73.8669619]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('70699c55-3290-42b7-80b5-39c508934533', 'ccf547e7-cebc-451c-b4d3-e96f3fae203d', 'Broadway', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9935691,40.7294608]},"properties":{"address":"721 Broadway, New York, NY 10003","displayName":"721, Broadway, East Village, NoHo, Manhattan, New York County, City of New York, New York, 10003, United States of America","country_code":"US","boundingBox":[40.7294108,40.7295108,-73.9936191,-73.9935191]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8cfb2282-2a27-44de-8143-8ec410c0a00a', 'ccf547e7-cebc-451c-b4d3-e96f3fae203d', 'West 55th Street', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9869292,40.7669468]},"properties":{"address":"405 West 55th Street, New York, NY 10019","displayName":"405, West 55th Street, Columbus Circle, Manhattan Community Board 4, Manhattan, New York County, City of New York, New York, 10019, United States of America","country_code":"US","boundingBox":[40.7667871,40.7671155,-73.9872415,-73.98663]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('903071e8-00b1-414c-9a0e-3b396ebf8344', 'ccf547e7-cebc-451c-b4d3-e96f3fae203d', 'Broadway', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9816882,40.7806943]},"properties":{"address":"2121 Broadway, New York, NY 10023","displayName":"2121, Broadway, Upper West Side, Manhattan Community Board 7, Manhattan, New York County, City of New York, New York, 10023, United States of America","country_code":"US","boundingBox":[40.7806443,40.7807443,-73.9817382,-73.9816382]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bc33e952-66da-4132-9b22-a50e458101bf', 'ccf547e7-cebc-451c-b4d3-e96f3fae203d', 'W 14th St', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9965443,40.7374652]},"properties":{"address":"69 W 14th St, New York, NY 10011","displayName":"69, West 14th Street, Union Square, Manhattan Community Board 5, Manhattan, New York County, City of New York, New York, 10011, United States of America","country_code":"US","boundingBox":[40.7374152,40.7375152,-73.9965943,-73.9964943]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0f7d3930-9f1d-441b-abd2-bbeed6dba266', 'ccf547e7-cebc-451c-b4d3-e96f3fae203d', 'West 25th Street', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9905004,40.7433712]},"properties":{"address":"28 West 25th Street, New York, NY 10010","displayName":"28, West 25th Street, Chelsea, Manhattan Community Board 5, Manhattan, New York County, City of New York, New York, 10010, United States of America","country_code":"US","boundingBox":[40.7432298,40.7435126,-73.9906572,-73.9903436]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5c2ccc89-3ddc-449b-a6fb-3dabc0407fd3', 'ccf547e7-cebc-451c-b4d3-e96f3fae203d', 'N Moore St', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0074462,40.7199406]},"properties":{"address":"27 N Moore St, New York, NY 10013","displayName":"27, North Moore Street, Tribeca, Manhattan, New York County, City of New York, New York, 10013, United States of America","country_code":"US","boundingBox":[40.7198906,40.7199906,-74.0074962,-74.0073962]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('47600103-704d-4059-82e7-acc05456d205', 'ccf547e7-cebc-451c-b4d3-e96f3fae203d', 'Pine St', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0101389,40.7075503]},"properties":{"address":"25 Pine St, New York, NY 10005","displayName":"25, Pine Street, Financial District, Manhattan, New York County, City of New York, New York, 10005, United States of America","country_code":"US","boundingBox":[40.7075003,40.7076003,-74.0101889,-74.0100889]}}'::jsonb);

-- Group: FICA New York
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c0c4250e-6d36-4064-b18b-6f1fb996d828', NOW(), NOW(), 'FICA New York', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: TREINEL Michael Kranz (917.971.7980)
Main Contact: - 917.971.7980
Notes: SOURCE: website  5/11/19(', 'ficany@gmail.com', '[{"type":"website","url":"http://www.ficanewyork.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4d55259e-e22c-4284-91f2-ef2891feb2af', 'c0c4250e-6d36-4064-b18b-6f1fb996d828', 'Christopher Street', 'Schedule: Mon &Wed 7:00-9:00p; RODA! :3rd Sat 3:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0079455,40.7328573]},"properties":{"address":"149 Christopher Street, New York, NY","displayName":"149, Christopher Street, West Village, Manhattan, New York County, City of New York, New York, 10014, United States of America","country_code":"US","boundingBox":[40.7328073,40.7329073,-74.0079955,-74.0078955]}}'::jsonb);

-- Group: Dendê Arts - Capoeira Cordão de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7f8d6fb4-2cbe-4b8b-8f9f-fe7bd060aac2', NOW(), NOW(), 'Dendê Arts - Capoeira Cordão de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chris Rodriguez (under Contra-Mestre CebolinhaNewark)
Main Contact: - 862-571- 7629
Notes: SOURCE: email 7/10/18', 'dende.arts@gmail.com', '[{"type":"website","url":"http://dendearts.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('73b5fb19-b6b0-4ff9-9de7-88522e553112', '7f8d6fb4-2cbe-4b8b-8f9f-fe7bd060aac2', '24th St. Astoria', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9219081,40.7737369]},"properties":{"address":"27-24 24th St. Astoria, Queens, NY(","displayName":"24th Street, Astoria, Queens, Queens County, City of New York, New York, 11102, United States of America","country_code":"US","boundingBox":[40.7735424,40.773931,-73.92216,-73.921656]}}'::jsonb);

-- Group: Com Expressão
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('6429cacd-5f53-40fb-b655-e9b0d1dc969d', NOW(), NOW(), 'Com Expressão', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Todd Russell
Main Contact: - 1352
Notes: SOURCE:  website 5/26/19', 'capo@comexpressao.com', '[{"type":"website","url":"http://www.comexpressao.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('761db86f-4945-4e93-80b9-09487503f6fe', '6429cacd-5f53-40fb-b655-e9b0d1dc969d', 'Culver Rd', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.5604334,43.1701372]},"properties":{"address":"1352 Culver Rd, Rochester, NY 14609","displayName":"1352, Culver Road, Homestead Heights, City of Rochester, Monroe County, New York, 14609, United States of America","country_code":"US","boundingBox":[43.1700872,43.1701872,-77.5604834,-77.5603834]}}'::jsonb);

-- Group: Capoeira Angola Quintal Rochester
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bd724f57-385f-4fcc-b844-8d4d74c114e8', NOW(), NOW(), 'Capoeira Angola Quintal Rochester', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE  Greg Hollar (under Mestre OmbrinhoNew York)
Main Contact: - 34
Notes: SOURCE: website  5/26/19', NULL, '[{"type":"website","url":"http://www.rochestercapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e913a556-8d1b-4aae-85a9-35a5b988f0cc', 'bd724f57-385f-4fcc-b844-8d4d74c114e8', 'Elton St', 'Schedule: Movement: Mon & Thurs 6:30-8:00pm; Music: Wed 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.579638,43.1552757]},"properties":{"address":"34 Elton St, Rochester, New York 14607","displayName":"34, Elton Street, Neighborhood Of The Arts, City of Rochester, Monroe County, New York, 14607, United States of America","country_code":"US","boundingBox":[43.1552257,43.1553257,-77.579688,-77.579588]}}'::jsonb);

-- Group: Westchester Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3a841d09-23d4-4200-a5d7-a65b95d5754f', NOW(), NOW(), 'Westchester Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Raefal and Sarah Teixeira (email: cnc.ny.usa@gmail.com)
Main Contact: - 845-826-4511
Notes: SOURCE: website 5/20/19', 'cnc.ny.usa@gmail.com', '[{"type":"website","url":"http://www.cainacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8c544527-790c-4948-96a9-7ad2443c5b14', '3a841d09-23d4-4200-a5d7-a65b95d5754f', 'North Broadway', 'Schedule: kids: Mon  6:00-6:50 pm; adults: Mon 7:00-8:00 pm;  Thurs 7:30-8:30 pm; Children: Wed  6:10-7:00pm; Adults:  Wed 7:30-8:30 pm; Family/All ages  Sat 9:30-10:30 am      &#8203;      Belmars,; Conditioning:  Sun 4:00-4:4 pm; Music & Roda: Sun 5:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.8575602,41.0793326]},"properties":{"address":"42 North Broadway, Tarrytown, NY 10591","displayName":"42, North Broadway, Village of Tarrytown, Town of Greenburgh, Westchester County, New York, 10591, United States of America","country_code":"US","boundingBox":[41.0792826,41.0793826,-73.8576102,-73.8575102]}}'::jsonb);

-- Group: Capoeira Luanda New Rochelle
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cc4bb3aa-602a-4029-a503-fc1c402d0bd4', NOW(), NOW(), 'Capoeira Luanda New Rochelle', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 347.880.2127
Notes: SOURCE: website 5/20/19', 'instructoracoruja@gmail.com', '[{"type":"website","url":"http://www.thecapoeiracenter.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0fd9a96b-04d9-4cfc-8a19-12a9ebc348f6', 'cc4bb3aa-602a-4029-a503-fc1c402d0bd4', 'The Capoeira Center', 'Schedule: Kids & Young Teens  Tues 6:00-7:00pm; Teens & Adults Tues  7:00-8:30pm; Thurs 7:00-8:00pm; Sat 2:00-3:30pm; Kids Sat 1:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.776026,40.9176407]},"properties":{"address":"130 Rhodes St, New Rochelle, NY","displayName":"130, Rhodes Street, Homestead Park, City of New Rochelle, Westchester County, New York, 10801, United States of America","country_code":"US","boundingBox":[40.9175907,40.9176907,-73.776076,-73.775976]}}'::jsonb);

-- Group: Cleveland Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('07a2e98e-2832-4477-a09b-ca44d3cce98f', NOW(), NOW(), 'Cleveland Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 20437
Notes: Beginner  Adults: Tues 7:00pm - 8:30pmSOURCE: website  6/16/19', 'undertheguidanceofFormandoTuzhinoandMestreBonecoohiocapoeira@gmail.com', '[{"type":"website","url":"http://ohiocapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a0036746-d52d-4d87-9196-c9a0c830416d', '07a2e98e-2832-4477-a09b-ca44d3cce98f', 'Hannan Parkway', 'Schedule: Kids ages 6-12  Sun12:00pm - 12:45pm; Music: Sun 1:00pm - 1:30pm; Adult Beginner Sun 1:30pm - 2:30pm; Adults: All Levels:  Mon 8:30 - 9:30pm;  Thurs 7:00 - 8:30pm; Beginner  Adults: Tues 7:00pm - 8:30pmSOURCE: website  6/16/19', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.530533,41.3646554]},"properties":{"address":"20437 Hannan Parkway, Walton Hills, OH 44146","displayName":"20437, Hannan Parkway, Walton Hills, Cuyahoga County, Ohio, 44146, United States of America","country_code":"US","boundingBox":[41.3646054,41.3647054,-81.530583,-81.530483]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('717ce1fc-3e43-4300-9790-9e4c9105b582', '07a2e98e-2832-4477-a09b-ca44d3cce98f', 'Mercantile Rd', 'Schedule: Kids ages 6-12  Sun12:00pm - 12:45pm; Music: Sun 1:00pm - 1:30pm; Adult Beginner Sun 1:30pm - 2:30pm; Adults: All Levels:  Mon 8:30 - 9:30pm;  Thurs 7:00 - 8:30pm; Beginner  Adults: Tues 7:00pm - 8:30pmSOURCE: website  6/16/19', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.5051183,41.4610889]},"properties":{"address":"23945 Mercantile Rd, Beachwood, OH 44122","displayName":"23945, Mercantile Road, Beachwood Commerce Park, Hampshire Park Country Estates, Beachwood, Cuyahoga County, Ohio, 44122, United States of America","country_code":"US","boundingBox":[41.4610389,41.4611389,-81.5051683,-81.5050683]}}'::jsonb);

-- Group: Columbus Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cb31ed19-39d1-487a-bdb9-f3e696463b56', NOW(), NOW(), 'Columbus Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 1069
Notes: SOURCE: website 5/26/19', NULL, '[{"type":"website","url":"https://www.capoeirabrasileiracolumbus.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('da4ca01f-a3e0-4aad-af0a-f0197985eaf7', 'cb31ed19-39d1-487a-bdb9-f3e696463b56', 'Jaeger St', 'Schedule: age 13+: Tues & Thurs 7:35- 8:35pm; ages 5 - 11: Mon & Thurs 6:45-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.9917605,39.9416859]},"properties":{"address":"1069 Jaeger St, Columbus, OH 43206","displayName":"1069, Jaeger Street, German Village, Columbus, Franklin County, Ohio, 43206, United States of America","country_code":"US","boundingBox":[39.9414155,39.9419273,-82.9922681,-82.9911503]}}'::jsonb);

-- Group: Brighton Capoeira Angola Group - Filhos de Angola
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('af7d3dab-c2b9-40fa-8c87-dc94988c062e', NOW(), NOW(), 'Brighton Capoeira Angola Group - Filhos de Angola', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Contact Susie 07748 471 491 for kids class. SOURCE: website 11/3/16', NULL, '[{"type":"website","url":"http://brightoncapoeira.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3e92a3ae-fd06-4f17-9a2e-368a6e527d2a', 'af7d3dab-c2b9-40fa-8c87-dc94988c062e', 'St. Mary''s Church Hall', 'Schedule: Beginners: Fri 6.30-8.30pm; ages 5-8: Tues 4:10-5:10pm
Phone: 07900020491', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0092883,50.880775]},"properties":{"address":"Highdown Rd., Lewes BN7 1QE","displayName":"Highdown Road, Nevill, Lewes, Offham, Lewes, East Sussex, England, BN7 1QE, United Kingdom","country_code":"GB","boundingBox":[50.8788369,50.8813654,-0.0126896,-0.00711]}}'::jsonb);

-- Group: Nucleo de Capoeiragem
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8470b06a-32ab-4924-9a01-77b868464b49', NOW(), NOW(), 'Nucleo de Capoeiragem', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Claudio Campos
Main Contact: Claudio Campos - 07882745860
Notes: Wales. Under the supervision of Mestres Jorge & Danilo. SOURCE: website 1/1/20', 'claudiocamposrosario@hotmail.com', '[{"type":"website","url":"http://www.cardiffcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('afeab1a7-fa36-4cbe-a4a5-08b0080eccfd', '8470b06a-32ab-4924-9a01-77b868464b49', 'Canton Community Hall', 'Schedule: Wed 8:00-9:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.2021661,51.476997]},"properties":{"address":"Leckwith Road, Cardiff, CF11 8HP, UK","displayName":"Leckwith Road, Leckwith, Canton, Cardiff, Cymru / Wales, CF11 8HP, United Kingdom","country_code":"GB","boundingBox":[51.4766635,51.4773681,-3.2026182,-3.2017503]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7e995304-598a-4bee-bc6e-35eb45ac0441', '8470b06a-32ab-4924-9a01-77b868464b49', 'Chapter Arts Center', 'Schedule: Fri', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.2042231,51.4829544]},"properties":{"address":"Market Rd, Canton, Cardiff, CF5 1QE","displayName":"Market Road, Leckwith, Canton, Cardiff, Cymru / Wales, CF5 1RZ, United Kingdom","country_code":"GB","boundingBox":[51.4818436,51.4839897,-3.2049421,-3.2036371]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b16831a2-4032-46c1-9123-b7aa85227160', '8470b06a-32ab-4924-9a01-77b868464b49', 'Talybont Sports Centre', 'Schedule: Kids: Fri', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.1961837,51.4975314]},"properties":{"address":"Bevan Pl, Cardiff CF14 3UX","displayName":"Bevan Place, The Colonies, Gabalfa, Cardiff, Cymru / Wales, CF14 3AS, United Kingdom","country_code":"GB","boundingBox":[51.4973641,51.4977007,-3.1963781,-3.1959893]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4c8e7a4d-fa49-409d-8c4d-4b1419b05096', '8470b06a-32ab-4924-9a01-77b868464b49', 'University of Wales Capoeira Society', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.1795999,51.4887426]},"properties":{"address":"Cardiff University, Cardiff, Wales, UK","displayName":"Cardiff University, Park Place, Civic Centre, Castle, Cardiff, Cymru / Wales, CF10 3AT, United Kingdom","country_code":"GB","boundingBox":[51.4886926,51.4887926,-3.1796499,-3.1795499]}}'::jsonb);

-- Group: Capoeira Mocambo - Associação de Capoeira Senzala Santos
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1bede0c8-ebee-4c37-ae73-27b5b0518161', NOW(), NOW(), 'Capoeira Mocambo - Associação de Capoeira Senzala Santos', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITOR Colin Daimond
Main Contact: Colin Daimond - 07773 798199
Notes: Wales. Monitor Colin Daimond in association with Mestre Sombra [Santos, Brazil]. SOURCE: website 1/1/20', 'info@capoeiramocambo.co.uk', '[{"type":"website","url":"http://www.capoeiramocambo.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('562c02d8-14a9-4d3a-aba9-1f192d394070', '1bede0c8-ebee-4c37-ae73-27b5b0518161', 'Mynydd LLandgai', 'Schedule: Adults: Tues & Thurs 9:30-10:30am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.08824,53.17045]},"properties":{"address":"LL57 4LQ","displayName":"LL57 4LQ, Llandygai, Mynydd Llandygái, Gwynedd, Cymru / Wales, United Kingdom","country_code":"GB","boundingBox":[53.16845,53.17245,-4.09024,-4.08624]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ad895cc4-b9ff-4f97-a93e-4b9ac27b385f', '1bede0c8-ebee-4c37-ae73-27b5b0518161', 'Hen Iard Nwyddau / The Old Goods Yard', 'Schedule: All ages: Tues & Wed 6:30-7:30pm; Adults: Tues & Wed 6:30-9:00pm; 4-6 year olds: Wed 4:00-4:45pm; 7-11 year olds: Wed 4.45-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.1620744,53.2158565]},"properties":{"address":"Treborth, Bangor. LL57 2NX","displayName":"Treborth Road, Pentir, Bangor, Gwynedd, Cymru / Wales, LL57 2RJ, United Kingdom","country_code":"GB","boundingBox":[53.2150133,53.2168943,-4.1630117,-4.1613625]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('aed7c645-7bb7-43df-95f7-bc115310bd41', '1bede0c8-ebee-4c37-ae73-27b5b0518161', 'Bangor University Capoeira Society', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.130082,53.2300234]},"properties":{"address":"Bangor University, Bangor, LL57 2DG, UK","displayName":"Bangor University, College Road Site, Garth Road, Garth, Bangor, Gwynedd, Cymru / Wales, LL57 2RP, United Kingdom","country_code":"GB","boundingBox":[53.2279858,53.2319511,-4.1327012,-4.1260824]}}'::jsonb);

-- Group: Capoeira School Sheffield - Group Senzala Anglia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cfe56428-7270-4ce7-9b60-59cc0f2513ac', NOW(), NOW(), 'Capoeira School Sheffield - Group Senzala Anglia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 07412381534
Notes: Yorkshire. SOURCE: website 11/13/16', 'info@capoeirasheffield.com', '[{"type":"website","url":"http://capoeirasheffield.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7cbaf1e1-a338-4b79-a4f0-efbe7d8ed89e', 'cfe56428-7270-4ce7-9b60-59cc0f2513ac', 'Trinity Church', 'Schedule: Adults All Levels: Mon & Fri 19.00; Kids [3-5]: Sat 9.30; Kids [6-8]: Sat 10.30; Kids [9-13]: Sat 11.30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.506627,53.3664017]},"properties":{"address":"Ecclesall Road, Sheffield, S11 8TE, UK","displayName":"Ecclesall Road, Banner Cross, Endcliffe, Sheffield, South Yorkshire, England, S11 7AA, United Kingdom","country_code":"GB","boundingBox":[53.366302,53.3664853,-1.5068174,-1.5064289]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c58f3a66-3dec-42c9-aff1-a595f0d89d22', 'cfe56428-7270-4ce7-9b60-59cc0f2513ac', 'King Edward Lower School', 'Schedule: Adult Beginners: Wed 18:15', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.5225737,53.3764558]},"properties":{"address":"Darwin Ln, Crosspool, Sheffield S10 5RG","displayName":"Darwin Lane, Crosspool, Sheffield, South Yorkshire, England, S10 5RH, United Kingdom","country_code":"GB","boundingBox":[53.3763606,53.3765697,-1.5229344,-1.5225693]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c10859d2-1ca4-4575-8157-057884e7d502', 'cfe56428-7270-4ce7-9b60-59cc0f2513ac', 'Hallam Capoeira Society', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.4627951,53.3817264]},"properties":{"address":"Sheffield Hallam University, Sheffield, S1 1WB, UK","displayName":"Sheffield Hallam University, Pond Hill, Sheaf Valley, City Centre, Sheffield, South Yorkshire, England, S1 2BG, United Kingdom","country_code":"GB","boundingBox":[53.3810967,53.3823651,-1.4638458,-1.4625352]}}'::jsonb);

-- Group: UCA-Hayward
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3632e26c-d0d7-4391-9fa4-4a1949d6e77c', NOW(), NOW(), 'UCA-Hayward', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Recruta
Main Contact: - 650.218.7601
Notes: Alameda County, California. SOURCE: websites 11/29/16', NULL, '[{"type":"website","url":"http://www.ucahayward.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('76c30c50-e190-4e91-a6df-fa51392ab17e', '3632e26c-d0d7-4391-9fa4-4a1949d6e77c', 'UCA-Hayward', 'Schedule: Adults: Mon 8:00-9:30pm; Tues & Thurs 7:15-8:45pm; Sat 11:15am-1:00pm; Youth: Tues & Thurs 6:00-7:00pm; Sat 10:00-11:00am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.0816421,37.6746519]},"properties":{"address":"22540 Foothill Blvd. Hayward, CA 94541","displayName":"22540, Foothill Boulevard, Hayward, Alameda County, California, 94541, United States of America","country_code":"US","boundingBox":[37.6746019,37.6747019,-122.0816921,-122.0815921]}}'::jsonb);

-- Group: Carioca Capoeira (New York City)
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('83399177-583c-4ad4-b63c-6bfd1db9edc4', NOW(), NOW(), 'Carioca Capoeira (New York City)', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Carioca (Carlos da Silva Borge)
Main Contact: - 718-309-7605', 'cariocanyc@yahoo.com', '[{"type":"website","url":"http://www.cariocacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c3a12da3-95b6-411d-a47a-0c6a04404106', '83399177-583c-4ad4-b63c-6bfd1db9edc4', 'Cornell Medical College', 'Schedule: Tue 7-9pm; Sat 12-2pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9553346,40.7650988]},"properties":{"address":"445 East 69th St, New York, NY","displayName":"445, East 69th Street, Lenox Hill, Manhattan Community Board 8, Manhattan, New York County, City of New York, New York, 10021, United States of America","country_code":"US","boundingBox":[40.7650488,40.7651488,-73.9553846,-73.9552846]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9d8a1979-87bb-40a7-8a53-b08eb7d7dc81', '83399177-583c-4ad4-b63c-6bfd1db9edc4', 'Woodside Ballet Academy', 'Schedule: Fri 7:30-9pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9227922,40.7433489]},"properties":{"address":"41-20 Queens Boulevard, Sunnyside, NY 11104","displayName":"41-20, Queens Boulevard, Sunnyside Gardens, Queens, Queens County, City of New York, New York, 11104, United States of America","country_code":"US","boundingBox":[40.7432989,40.7433989,-73.9228422,-73.9227422]}}'::jsonb);

-- Group: Carioca Capoeira (Charleston)
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('db9cda0f-5b5e-4a11-8aba-a0be9a9cb631', NOW(), NOW(), 'Carioca Capoeira (Charleston)', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.
', NULL, '[{"type":"website","url":"https://capoeiracharleston.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e7451153-e08e-448d-be8f-798265897e82', 'db9cda0f-5b5e-4a11-8aba-a0be9a9cb631', 'Arthur Christopher Community Center', 'Schedule: Tue & Thu 6:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.9659379131642,32.77784705]},"properties":{"address":"Downtown Charleston, SC","displayName":"Residence Inn Charleston Downtown/Riverview, 90, Ripley Point Drive, The Crescent, Charleston, Charleston County, South Carolina, 29407, United States of America","country_code":"us","boundingBox":[32.7775896,32.7781046,-79.9662154,-79.9652675]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7a35a236-8ff7-4221-a822-f86aabb5d98e', 'db9cda0f-5b5e-4a11-8aba-a0be9a9cb631', 'Hampton Park Gazebo', 'Schedule: Sat 10:30am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.95573217211538,32.79997625]},"properties":{"address":"Hampton Park, Charleston, SC","displayName":"Hampton Park, Charleston, Charleston County, South Carolina, United States of America","country_code":"us","boundingBox":[32.796825,32.8031015,-79.9595482,-79.9519746]}}'::jsonb);

-- Group: Carioca Capoeira (Miami)
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5f6544f4-c2b8-40ef-b3ca-8bbbeb6918df', NOW(), NOW(), 'Carioca Capoeira (Miami)', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.
', NULL, '[{"type":"website","url":"https://oceanlifestudios.com/our-classes/capoeira-miami-beach/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7cf0ee55-2ca7-454c-9a46-5da3b7ce7bea', '5f6544f4-c2b8-40ef-b3ca-8bbbeb6918df', 'Ocean Life Studio', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.1963164,25.840595]},"properties":{"address":"7123 N Miami Avenue, Miami, FL 33150","displayName":"7123, North Miami Avenue, Miami, Miami-Dade County, Florida, 33150, United States of America","country_code":"us","boundingBox":[25.8401342,25.841247,-80.1964601,-80.1956687]}}'::jsonb);

-- Batch: batch-07.json (32 groups)

-- Group: Associaco de Capoeira Mestre Bimba - Bay Area
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2238702c-6fbf-492c-b518-7fed4ed6db41', NOW(), NOW(), 'Associaco de Capoeira Mestre Bimba - Bay Area', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Caçador (Jadson Souza)
Main Contact: - [510] 926 - 1498
Notes: Alameda County, California. SOURCE: website 8/4/17', 'CapoeiraCalifornia@gmail.com', '[{"type":"website","url":"https://capoeiraoaktown.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('810ee884-17f5-42a9-a2d4-2044fe6f0201', '2238702c-6fbf-492c-b518-7fed4ed6db41', 'In the Groove Studios', 'Schedule: Wed 7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.255247,37.8091566]},"properties":{"address":"366 Grand Ave, Oakland","displayName":"366, Grand Avenue, Adams Point, Downtown Oakland, Oakland, Alameda County, California, 94606, United States of America","country_code":"US","boundingBox":[37.8090454,37.8092668,-122.2553408,-122.2551533]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('63123963-7181-45b6-a3ab-4e9511063cad', '2238702c-6fbf-492c-b518-7fed4ed6db41', 'Studio Grand', 'Schedule: Mon 7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2474285,37.8119095]},"properties":{"address":"3234 Grand Ave, Oakland","displayName":"Studio Grand, 3234, Grand Avenue, Grand Lake, Oakland, Alameda County, California, 94610, United States of America","country_code":"US","boundingBox":[37.8118595,37.8119595,-122.2474785,-122.2473785]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('314bd779-e7cb-4485-a51f-217d5649bb19', '2238702c-6fbf-492c-b518-7fed4ed6db41', 'San Pablo Community Center', 'Schedule: Tues 7:00-8:00pm; Kids Tues 6:00-7:00pm; Sat 10:00-11:00am; Sat 11:00am-12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3448903,37.9631657]},"properties":{"address":"2500 Rd 20, San Pablo","displayName":"Road 20, San Pablo, Contra Costa County, California, 94806, United States of America","country_code":"US","boundingBox":[37.9627456,37.9633546,-122.3452922,-122.3443137]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('42d19c10-6f04-48f8-99de-254c3dea1e0a', '2238702c-6fbf-492c-b518-7fed4ed6db41', 'Bladium Sports & Fitness Club', 'Schedule: Kids: Fri 5:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.301157,37.7822885]},"properties":{"address":"800 West Tower ave, Alameda","displayName":"Hangar 40, 800, West Tower Avenue, Alameda, Alameda County, California, 94607, United States of America","country_code":"US","boundingBox":[37.7817409,37.7828443,-122.3016538,-122.3006595]}}'::jsonb);

-- Group: Capoeira Brasil East Bay
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('397a2d29-ca84-439c-835b-5d71a1584b76', NOW(), NOW(), 'Capoeira Brasil East Bay', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTORA Foquinh (Tammy Chang)
Main Contact: - 646-265-8800
Notes: Alameda County, California. Also Instrutor Sagui, Graduada Bailarina (Lorin King). Inclusive Capoeira Classes [adapted capoeira for people with disabilities]. SOURCE: website 12/3/16', 'capoeastbay@gmail.com', '[{"type":"website","url":"http://www.capoeirabrasileastbay.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6714b1fb-a3c4-4e0c-a0ee-4c252a2fa75a', '397a2d29-ca84-439c-835b-5d71a1584b76', 'Ellen Webb Yoga Studios', 'Schedule: Tues 8:30-10:00pm; Thurs 8:00-10:00pm; Sun 11:00am-1:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4457082,37.7958727]},"properties":{"address":"2822 Union St, San Francisco, CA 94123","displayName":"2822, Union Street, San Francisco, California, 94123, United States of America","country_code":"US","boundingBox":[37.7958227,37.7959227,-122.4457582,-122.4456582]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3900a3e8-11ad-4f81-96c2-9a9fbd9a2638', '397a2d29-ca84-439c-835b-5d71a1584b76', 'Capoeira Brasil Richmond', 'Schedule: Wed 8:00-9:30pm; Sat 12:30-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3237358,37.9317796]},"properties":{"address":"4820 Bissell Ave, Richmond CA","displayName":"4820, Bissell Avenue, Richmond, Contra Costa County, California, 94805, United States of America","country_code":"US","boundingBox":[37.9317296,37.9318296,-122.3237858,-122.3236858]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('69a11395-4389-4732-98ac-0fcf4f3a3141', '397a2d29-ca84-439c-835b-5d71a1584b76', 'BORP studio', 'Schedule: Thurs 5:30-6:30 (on hold for December 2016)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2692597,37.85252]},"properties":{"address":"3075 Adeline Street, Berkeley CA","displayName":"Ed Roberts Campus, 3075, Adeline Street, Lorin, Berkeley, Alameda County, California, 94705, United States of America","country_code":"US","boundingBox":[37.8520533,37.8529213,-122.2698083,-122.268898]}}'::jsonb);

-- Group: Filhos de Bimba - California Bay Area School of Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0ce6e0fc-dc39-413c-9a71-78f57f9009df', NOW(), NOW(), 'Filhos de Bimba - California Bay Area School of Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Malandro
Notes: Alameda County, California. Professor Malandro under Mestre Nenel. SOURCE: website 3/11/16', NULL, '[{"type":"website","url":"http://capoeirabayarea.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('821d93ec-4351-4eec-ace3-10c422497b9f', '0ce6e0fc-dc39-413c-9a71-78f57f9009df', 'Emeryville Recreation Center', 'Schedule: Adults & Teens: Sat 10:00am-12:30pm; Mon, Tues & Thurs 7:00-9:00; CapoKids [ages 5-7]: Sat 9:00-9:50am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2803088,37.833395]},"properties":{"address":"4300 San Pablo Avenue, Emeryville, CA 94608","displayName":"Emeryville Recreation Department, 4300, San Pablo Avenue, Emeryville, Alameda County, California, 94608, United States of America","country_code":"US","boundingBox":[37.8331804,37.8336094,-122.2804831,-122.2801344]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('861a2da4-e46a-4151-8636-46cbc4d82e0f', '0ce6e0fc-dc39-413c-9a71-78f57f9009df', 'Bridgecourt Room', 'Schedule: Young Warriors [ages 7-12]: Mon & Wed 4:00-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2834863,37.8310041]},"properties":{"address":"3990 Harlan St, Emeryville, CA 94608","displayName":"Harlan Street, Emeryville, Alameda County, California, 94608, United States of America","country_code":"US","boundingBox":[37.8303752,37.8316328,-122.2836879,-122.2832851]}}'::jsonb);

-- Group: Capoeira Omulu
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('eb94050b-6046-416a-9a93-e385429a1121', NOW(), NOW(), 'Capoeira Omulu', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Busca He'' (Anthony Fidel)
Main Contact: - +1.5109212532
Notes: Alameda County, California. Instructor Busca He'' under Mestre Preguica. SOURCE: website 12/10/16', NULL, '[{"type":"website","url":"http://www.oaklandcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bc4fb653-31f0-4e1e-93af-433639e166be', 'eb94050b-6046-416a-9a93-e385429a1121', 'Malonga Casquelourd Center for the Arts', 'Schedule: Adults & Teens: Mon, Wed, & Fri 6:00-7:30pm; Youth: Mon, Wed, & Fri 5:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2657717,37.8028162]},"properties":{"address":"1428 Alice Street, Oakland, CA","displayName":"Malonga Casquelourd Center for the Arts, 1428, Alice Street, Lakeside, Downtown Oakland, Oakland, Alameda County, California, 94612, United States of America","country_code":"US","boundingBox":[37.8025764,37.8030558,-122.266107,-122.2654364]}}'::jsonb);

-- Group: Capoeira Mestre Bimba Oakland - Associação de Capoeira Mestre Bimba
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ad6e148b-6ffc-43fb-93c8-8cc2bdf03fcb', NOW(), NOW(), 'Capoeira Mestre Bimba Oakland - Associação de Capoeira Mestre Bimba', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Cacador (Jadson Souza)
Main Contact: - [510] 926-1498
Notes: Alameda County, California. Website offline 11/30/16. Instuctor Cacador under Mestre Bamba [Salvador, Bahia, Brazil]. LINEAGE: Mestre Bimba > Mestre Vermelho 27 > Mestre Bamba (Mestre Bamba teaches in the school that Mestre Bimba first taught in in the Pelourinho.). SOURCE: email website 2/29/12', 'jadson.cacador@gmail.com', '[{"type":"website","url":"http://www.capoeiraoakland.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7655b1cd-42c9-4093-a78e-ef1fe4b39fd1', 'ad6e148b-6ffc-43fb-93c8-8cc2bdf03fcb', 'Addis Habana', 'Schedule: Wed 6:00-7:30pm, Sat 9:30-10:45am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.255247,37.8091566]},"properties":{"address":"366 Grand Ave. Oakland CA","displayName":"366, Grand Avenue, Adams Point, Downtown Oakland, Oakland, Alameda County, California, 94606, United States of America","country_code":"US","boundingBox":[37.8090454,37.8092668,-122.2553408,-122.2551533]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('294ca4ec-255b-4329-acd5-c9125d52f67f', 'ad6e148b-6ffc-43fb-93c8-8cc2bdf03fcb', 'The Works Exercise and Dance Studio', 'Schedule: Mon 6:00-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2589989,37.8636877]},"properties":{"address":"2566 Telegraph Ave. Berkeley CA","displayName":"2566, Telegraph Avenue, Southside, Berkeley, Alameda County, California, 94705, United States of America","country_code":"US","boundingBox":[37.8635619,37.8638129,-122.2591836,-122.2588132]}}'::jsonb);

-- Group: Utah Valley Capoeira - Capuraginga
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e7289987-f1c8-4a4a-888a-976d53295161', NOW(), NOW(), 'Utah Valley Capoeira - Capuraginga', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADO Espeto (Arles Lara)
Main Contact: - 801.368.8966
Notes: Utah County. Graduado Espeto under Mestre Loka. SOURCE: website 9/22/19', 'utahcapoeira@gmail.com', '[{"type":"website","url":"http://www.utahcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b9589d47-fe59-4c5d-932b-e3e20a4ec90d', 'e7289987-f1c8-4a4a-888a-976d53295161', 'Utah Valley Capoeira', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.6980078,40.3082614]},"properties":{"address":"578 North 100 West, Orem, UT 84057","displayName":"578, North 100 West, Orem Station, Orem, Utah County, Utah, 84057, United States of America","country_code":"US","boundingBox":[40.3082114,40.3083114,-111.6980578,-111.6979578]}}'::jsonb);

-- Group: Abadá Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a83ffcb1-f892-4679-8b20-53ac9bba55a2', NOW(), NOW(), 'Abadá Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Yara (Yara Cordeiro)
Main Contact: - 301-947-5806
Notes: Fairfax County, Virginia. SOURCE: website 11/30/19', 'info@abadadc.org', '[{"type":"website","url":"http://www.abadadc.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('57c59b75-cce3-4f84-bb9f-e41e1550163a', 'a83ffcb1-f892-4679-8b20-53ac9bba55a2', 'Fairfax Jiu Jitsu', 'Schedule: Children: Wed & Fri 5:30-6:30pm; Adolescents & Adults: Wed & Fri 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.4311513,38.8941543]},"properties":{"address":"Chantilly, VA 20151","displayName":"Chantilly, Fairfax County, Virginia, 20153, United States of America","country_code":"US","boundingBox":[38.8541543,38.9341543,-77.4711513,-77.3911513]}}'::jsonb);

-- Group: Grupo Resistência Escola de Capoeira do Mestre Panão
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5bbd8a04-dfc4-4735-994a-d77b1acf0d19', NOW(), NOW(), 'Grupo Resistência Escola de Capoeira do Mestre Panão', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Balancão (Roderick J. Davis)
Main Contact: - [804] 301-5681
Notes: Charlottesville, Virginia. SOURCE: website 11/30/19', 'davis.roderick.82@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/capoeirarva/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a372340a-780c-429c-9593-7ba357ffd24b', '5bbd8a04-dfc4-4735-994a-d77b1acf0d19', 'IX Art Park', 'Schedule: Adults [13+ years]: Mon 5:30-6:30pm; Kids [4-12 years of age] Mon: 4:30-5:30PM', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-78.4809426,38.0301927]},"properties":{"address":"963 2nd St. SE, Charlottesville, VA 22902","displayName":"2nd Street Southeast, North Downtown, Charlottesville, Virginia, 22902, United States of America","country_code":"US","boundingBox":[38.0298203,38.0305652,-78.4811033,-78.4807819]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('faf4198e-811c-4e80-83a6-034b1d0d6f89', '5bbd8a04-dfc4-4735-994a-d77b1acf0d19', 'The Dance Spot', 'Schedule: Adults [13+ years]: Thurs: 5:30-6:30pm; Kids [4-12 years of age]: Thurs: 4:30-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-78.4810929,38.0301895]},"properties":{"address":"109 2nd St. SE, Charlottesville, VA 22902","displayName":"Jack Brown’s Beer & Burger Joint, 109, 2nd Street Southeast, North Downtown, Charlottesville, Virginia, 22902, United States of America","country_code":"US","boundingBox":[38.0301309,38.0302481,-78.4812048,-78.480981]}}'::jsonb);

-- Group: Capoeira Resistência
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('75c92fd9-7aac-4194-8345-bc0cae4801fb', NOW(), NOW(), 'Capoeira Resistência', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Panão (Robson Alexandre Pedro)
Main Contact: - [803] 477-0768
Notes: Richmond, Virginia. SOURCE: website 12/1/19', 'capoeiraRVA@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/capoeirarva/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('61fbd266-f135-4540-84f9-401459cd3595', '75c92fd9-7aac-4194-8345-bc0cae4801fb', 'Randolph Community Center', 'Schedule: Adults [13+ years]: Wed & Fri 7:00-8:00pm; Sat 2:00-3:30pm; Kids [4-12 years of age]: Wed & Fri 6:00-6:50pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.4604533,37.5439101]},"properties":{"address":"1415 Grayland Ave, Richmond, VA 23220","displayName":"1415, Grayland Avenue, Randolph, Richmond, Virginia, 23220, United States of America","country_code":"US","boundingBox":[37.5438601,37.5439601,-77.4605033,-77.4604033]}}'::jsonb);

-- Group: Abba Capoeira Regional
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7bb90003-9caf-4031-af58-0638f429faaa', NOW(), NOW(), 'Abba Capoeira Regional', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Robson De Jesus (Robson De Jesus)
Main Contact: - 678.240.9017
Notes: Atlanta, Georgia. SOURCE website 12/10/17', 'abbacapoeira@gmail.com', '[{"type":"website","url":"http://abbacapoeira.wixsite.com/abbacapoeira"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b15e8862-c325-4f23-8254-67ed7897c9c9', '7bb90003-9caf-4031-af58-0638f429faaa', 'Cirque Freaks Building', 'Schedule: Kids: Mon, Wed, & Fri 6:00-7:00pm; Adults: Mon, Wed, & Fri 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-84.2945964,34.0755962]},"properties":{"address":"Alpharetta, GA 30004","displayName":"Alpharetta, Fulton County, Georgia, United States of America","country_code":"US","boundingBox":[34.0281476,34.1173451,-84.359435,-84.201218]}}'::jsonb);

-- Group: FICA Hilo Hawaiʻi Study Group - International Capoeira Angola Foundation
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9756b76f-55db-457a-b74e-2cf165ad2bd6', NOW(), NOW(), 'FICA Hilo Hawaiʻi Study Group - International Capoeira Angola Foundation', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 808-965-6306
Notes: Hawaii County. Under Mestre Silvinho and Mestre Jurandir [Seattle]. Mailing Address: P.O. Box 1864, Pahoa, Hi 96778. SOURCE: website 12/23/17', 'ficahawaii@gmail.com', '[{"type":"website","url":"http://ficahawaii.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9630c26e-58cf-4c56-9448-227b0db946d4', '9756b76f-55db-457a-b74e-2cf165ad2bd6', 'Pahoa Community Center', 'Schedule: Thurs 4:30-6:00pm
Phone: 808 238 6933', '{"type":"Feature","geometry":{"type":"Point","coordinates":[76.7031901,11.4133126]},"properties":{"address":"(in the old building)","displayName":"old spencers building, Ooty-Coonoor Road, Udhagamandalam, Nilgiris, Tamil Nadu, 643001, India","country_code":"IN","boundingBox":[11.4131689,11.413428,76.7030332,76.7033433]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('eb1f6713-ef8d-4021-b244-39413550ca87', '9756b76f-55db-457a-b74e-2cf165ad2bd6', 'Kalani Honua', 'Schedule: Sat 4:30-6:00pm
Phone: 808 965 6306', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-154.9108645,19.4058122]},"properties":{"address":"12-6860 Kalapana-Kapoho Rd, Pahoa, HI 96778","displayName":"Kalani Retreat Center, 12-6860, Kapoho-Kalapana Road, Sea View Estates, Opihikao, Pahoa, Hawaiʻi County, Hawaii, 96778, United States of America","country_code":"US","boundingBox":[19.4057622,19.4058622,-154.9109145,-154.9108145]}}'::jsonb);

-- Group: Capoeira del Norte
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('45bfd3b3-b81f-4b4f-95d1-4d5c9ceb7ddd', NOW(), NOW(), 'Capoeira del Norte', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Papagaio
Notes: Boise, Idaho. Last website update 11/9/11. Last facebook post 2/11/15. Attempting contact 1/22/18. SOURCE: website facebook 2/1/18', 'papagaio.game@gmail.com', '[{"type":"website","url":"http://capoeiradelnorte.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b2809646-38dd-4348-83ed-5500d9ec6d6a', '45bfd3b3-b81f-4b4f-95d1-4d5c9ceb7ddd', 'Bodies In Motion', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-116.189846,43.5684003]},"properties":{"address":"729 W. Diamond St. Boise, ID 83705","displayName":"Bodies in Motion, 729, West Diamond Street, Broadway Place, Southeast Boise, Boise, Ada County, Idaho, 83705, United States of America","country_code":"US","boundingBox":[43.5683503,43.5684503,-116.189896,-116.189796]}}'::jsonb);

-- Group: Raca em Movimento University of Connecticut
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f412788c-f1bc-4962-a2d0-b71621f38c63', NOW(), NOW(), 'Raca em Movimento University of Connecticut', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Efraim Silva
Main Contact: Greg Dillon (Club President) - 860-427-5778, 203-257-5466
Notes: Tolland County, Connecticut (University of Connecticut). Instructor: Professore Fabiano (Fabiano Lucas) under Mestre Efraim Silva. Club President: Greg Dillon. Club Treasurer: Matthew DeLuzio. SOURCE: google 9/11/17', 'GMD005@aol.com, uconncapoeira@gmail.com, uconncapoeira@yahoo.com', '[{"type":"website","url":"http://uconncapoeira.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c7b26b86-6242-484f-be2e-d9c931e783a0', 'f412788c-f1bc-4962-a2d0-b71621f38c63', 'University of Connecticut', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-72.2483889,41.8111114]},"properties":{"address":"University of Connecticut, Storrs, CT","displayName":"University of Connecticut, North Eagleville Road, Towers, Storrs, Mansfield, Capitol Planning Region, Connecticut, 06269, United States of America","country_code":"US","boundingBox":[41.796721,41.8255142,-72.2788641,-72.2384722]}}'::jsonb);

-- Group: Capoeira Barro Vermelho DC
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ecdaa213-a0e0-43e3-9ed8-d3ef69accdbe', NOW(), NOW(), 'Capoeira Barro Vermelho DC', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Bomba
Main Contact: Mestre Bomba - +1 [202] 838-3907
Notes: District of Columbia (Washington DC). Mestre Bomba. Mail: 4103 18th St., NW Washington, DC 20011. SOURCE: website 5/19/18', 'bombabahia@gmail.com', '[{"type":"website","url":"http://www.capoeirafitnessdc.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0eada8c3-fef1-4f37-bfd8-015dc96c917d', 'ecdaa213-a0e0-43e3-9ed8-d3ef69accdbe', 'Church of the Holy City', 'Schedule: Kids: Tues 5:30-6:15pm; Thurs 6:30-7:10pm; Adult Beginners: Tues 6:30-7:15pm; Adult All Levels: Tues 7:30-8:45pm; Thurs 7:15-8:30pm; Music: Thurs 8:30-9:15pm; Adult Fundamentals: Sat 10:00-11:00am; All Levels and Roda: Sat 11:15am 12:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0360439,38.9116731]},"properties":{"address":"1611 16th Street NW, Washington, DC","displayName":"Church of the Holy City, 1611, 16th Street Northwest, Dupont Circle, Ward 2, Washington, District of Columbia, 20012, United States of America","country_code":"US","boundingBox":[38.9115564,38.9117995,-77.0362503,-77.0358482]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4bde3898-9123-4fd3-8eba-74f4b267ac90', 'ecdaa213-a0e0-43e3-9ed8-d3ef69accdbe', 'Dupont Circle Park', 'Schedule: (Adult Saturday classes are move here during good weather in the summer)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0427259,38.9109436]},"properties":{"address":"Dupont Circle, Washington, DC 20036","displayName":"Dupont Circle, 1526, New Hampshire Avenue Northwest, Dupont Circle, Ward 2, Washington, District of Columbia, 20036, United States of America","country_code":"US","boundingBox":[38.9108936,38.9109936,-77.0427759,-77.0426759]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ff2bc6ad-b55d-485b-953c-57abfddc90c1', 'ecdaa213-a0e0-43e3-9ed8-d3ef69accdbe', 'BloomBars', 'Schedule: Kids: Sat 8:30-9:15am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0280991,38.9302021]},"properties":{"address":"3222 11th St NW, Washington, DC 20001","displayName":"BloomBars, 3222, 11th Street Northwest, Ward 1, Washington, District of Columbia, 20010, United States of America","country_code":"US","boundingBox":[38.9301775,38.9302321,-77.0281829,-77.0280218]}}'::jsonb);

-- Group: Capoeira Malês DC
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2287b59e-3b6b-49eb-980b-ad50d6d83dcc', NOW(), NOW(), 'Capoeira Malês DC', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Curisco
Main Contact: Instructor: Gaviao
Notes: District of Columbia (Washington DC). Instructor: Gaviao under the guidance of Mestre Curisco [Seattle]. SOURCE: email 9/22/10 website 2/25/11', NULL, '[{"type":"website","url":"http://www.capoeiradc.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9ab3e51a-b02a-4097-968d-6ec82612c3d0', '2287b59e-3b6b-49eb-980b-ad50d6d83dcc', 'The Capoeira Spot', 'Schedule: (Full schedule of classes. See website)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.9757441,38.9295666]},"properties":{"address":"2008 Rhode Island Ave NE, Washington, DC 20018","displayName":"2008, Rhode Island Avenue Northeast, Ward 5, Washington, District of Columbia, 20018, United States of America","country_code":"US","boundingBox":[38.9294877,38.9296576,-76.9758377,-76.9756602]}}'::jsonb);

-- Group: International Capoeira Angola Federation DC
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3b493147-201f-4a89-a7d7-a6148c73f7de', NOW(), NOW(), 'International Capoeira Angola Federation DC', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: District of Columbia (Washington DC). SOURCE: website 5/15/18', NULL, '[{"type":"website","url":"https://ficadc.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4e8c279d-5b51-4bdc-9d20-0c3eb5990326', '3b493147-201f-4a89-a7d7-a6148c73f7de', 'Emergence Community Arts Collective', 'Schedule: (Full schedule of classes. See website)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0237431,38.9243714]},"properties":{"address":"733 Euclid St. NW Washington DC.","displayName":"733, Euclid Street Northwest, Columbia Heights, Ward 1, Washington, District of Columbia, 20001, United States of America","country_code":"US","boundingBox":[38.9242103,38.9244569,-77.0238223,-77.0236526]}}'::jsonb);

-- Group: Capoeira Cordão de Ouro Perth
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bd91c58a-f40a-43fc-b521-56bcd4d34621', NOW(), NOW(), 'Capoeira Cordão de Ouro Perth', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Kuata
Main Contact: Ourico (Lee Coumbe) - 0408924490
Notes: Perth, Western Australia, Australia. Ourico (Lee Coumbe) under Contra Mestre Kuata [Sao Paulo]. SOURCE: website 12/16/16', NULL, '[{"type":"website","url":"http://www.capoeiracdoperth.com.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('95cf26d6-34a5-4168-ac33-b3c870e67910', 'bd91c58a-f40a-43fc-b521-56bcd4d34621', 'Total Worx Health and Fitness Club', 'Schedule: Tues & Thurs 7:30-9:00pm; Sat 9:00-10:30am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[115.8170449,-31.90431]},"properties":{"address":"7A 44 Hutton St Osborne Park WA 6017","displayName":"Hutton Street, Osborne Park, City of Stirling, Western Australia, 6017, Australia","country_code":"AU","boundingBox":[-31.904382,-31.9042627,115.816935,115.817165]}}'::jsonb);

-- Group: Bantus Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7b033954-6240-4b59-ba71-83894ef0ea2b', NOW(), NOW(), 'Bantus Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Pintor
Main Contact: Professor Grao (Fabiano Franca), Instructor Risadinha (Beth), Committee President Voodoo (Chris) - 0414 076 655, 0403 539 187, 0409 890 844
Notes: Perth, Western Australia, Australia. Professor Grao (Fabiano Franca), Instructor Risadinha (Beth), Committee President Voodoo (Chris) under Mestre Pintor [Belo Horizonte]. SOURCE: website 12/15/16', NULL, '[{"type":"website","url":"http://bantus.asn.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d27898ce-edeb-444f-9503-ffcbc4b63ab0', '7b033954-6240-4b59-ba71-83894ef0ea2b', 'Loftus Community Centre', 'Schedule: 3-5 year olds: Sat 9:30-10:15am; 6-12 year olds Sat 10:00-10:45am; Adults: Sat 9:30-10:15am Wed 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[115.8464939,-31.9355149]},"properties":{"address":"2/99 Loftus St, Leederville, Western Australia","displayName":"Loftus Street, Leederville, City of Vincent, Western Australia, 6007, Australia","country_code":"AU","boundingBox":[-31.9361879,-31.9348661,115.8463018,115.8465506]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('697acde7-fa61-4741-be9a-593c1bbdad3e', '7b033954-6240-4b59-ba71-83894ef0ea2b', 'Asian Association', 'Schedule: Capoeira Angola: Thurs 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[115.8638154,-31.9499848]},"properties":{"address":"275 Stirling St Perth","displayName":"Stirling Street, Perth, City of Perth, Western Australia, 6000, Australia","country_code":"AU","boundingBox":[-31.9508449,-31.9491276,115.8632652,115.8643703]}}'::jsonb);

-- Group: Centro Capoeira Angola OuroVerde Flagstaff
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d60073c0-95cc-4af4-ae3f-69ee9fb8a5ae', NOW(), NOW(), 'Centro Capoeira Angola OuroVerde Flagstaff', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Professor Avi (Avi Henn) - [928] 525-4503
Notes: Flagstaff, Arizona. Professor Avi (Avi Henn). SOURCE: website facebook 12/14/16', 'capoeiraflag@gmail.com', '[{"type":"website","url":"http://capoeiraflagstaff.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('94a0718e-214c-436c-a1e9-acb297a4d87a', 'd60073c0-95cc-4af4-ae3f-69ee9fb8a5ae', 'Center for Indigenous Music and Culture', 'Schedule: General: Mon & Thurs 6:30-8:30; Beginners: Mon 6:00-7:00pm; Kids: Sat 10:30-11:15am; Youth: 11:30am-1:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.6495084,35.1942993]},"properties":{"address":"213 South San Francisco St. Flagstaff, AZ 86001","displayName":"213, South San Francisco Street, Flagstaff Normal Addition, Flagstaff, Coconino County, Arizona, 86001, United States of America","country_code":"US","boundingBox":[35.1942493,35.1943493,-111.6495584,-111.6494584]}}'::jsonb);

-- Group: Axé Capoeira Arizona
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4221d5d9-2139-43fa-ac58-b87102764aa5', NOW(), NOW(), 'Axé Capoeira Arizona', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Barrão
Main Contact: Contra Mestre Camara (Jay Spain) - [602] 614-7367
Notes: Phoenix/Tempe, Arizona. Contra Mestre Camara (Jay Spain) under Mestre Barrão [Vancouver]. SOURCE: website 6/18/18', 'info@axecapoeira-az.com', '[{"type":"website","url":"http://www.axecapoeira-az.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('06d0a175-8b4c-4a98-b4e1-c89f180ffe2c', '4221d5d9-2139-43fa-ac58-b87102764aa5', 'Axé Capoeira Arizona Academy', 'Schedule: (Full schedule of classes for adults and kids)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.940016,33.4255117]},"properties":{"address":"Tempe, AZ 85281","displayName":"Tempe, Maricopa County, Arizona, United States of America","country_code":"US","boundingBox":[33.31986,33.4639799,-111.9784718,-111.8773587]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('13d042d4-3f1a-4d4a-979b-34c273da2a2a', '4221d5d9-2139-43fa-ac58-b87102764aa5', 'Arizona State University', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.9331631,33.4213174]},"properties":{"address":"Arizona State University","displayName":"Arizona State University, 1151, South Forest Avenue, Tempe Junction, Tempe, Maricopa County, Arizona, 85281, United States of America","country_code":"US","boundingBox":[33.4102062,33.4329786,-111.9411651,-111.9092447]}}'::jsonb);

-- Group: Grupo Topazio Arizona
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('243cf148-9b4b-4f31-82f7-464fd9bf7b02', NOW(), NOW(), 'Grupo Topazio Arizona', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instrutor Kino - 480-241-8365
Notes: Chandler, Arizona. Instrutor Kino. SOURCE: website 8/3/19', 'topazioaz@gmail.com', '[{"type":"website","url":"http://topazioaz.wixsite.com/topazioaz"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f2fe81d5-a7b3-4528-bee8-532203d80569', '243cf148-9b4b-4f31-82f7-464fd9bf7b02', 'Arizona Wado Karate & Martial Arts Center', 'Schedule: Mon, Wed & Fri 8.00-9.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.8591657,33.3348818]},"properties":{"address":"1992 N. Alma School Rd, Chandler, AZ 85224","displayName":"1992, North Alma School Road, Chandler, Maricopa County, Arizona, 85224, United States of America","country_code":"US","boundingBox":[33.3348318,33.3349318,-111.8592157,-111.8591157]}}'::jsonb);

-- Group: Capoeira Brasil Arizona
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('48c1520e-cb6a-43a7-8807-de4f8afd5c41', NOW(), NOW(), 'Capoeira Brasil Arizona', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Professora Borboleta (Angelique Starks) and Instrutor Lagarta de Goiaba Branca (Matthew Underwood) - [480]510-4741
Notes: Phoenix, Arizona. Professora Borboleta (Angelique Starks) and Instrutor Lagarta de Goiaba Branca (Matthew Underwood). SOURCE: website 6/12/18', 'info@capoeiraarizona.com', '[{"type":"website","url":"http://capoeiraarizona.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2f474df6-f0ca-42f8-98f2-11594b3240bc', '48c1520e-cb6a-43a7-8807-de4f8afd5c41', 'Capoeira Brasil Arizona', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-112.0833679,33.4952155]},"properties":{"address":"4113 N 7th Ave, Phoenix, AZ 85013","displayName":"4113, North 7th Avenue, Melrose District, Encanto, Phoenix, Maricopa County, Arizona, 85013, United States of America","country_code":"US","boundingBox":[33.4951655,33.4952655,-112.0834179,-112.0833179]}}'::jsonb);

-- Group: Omulu Capoeira Guanabara - Madison
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ea858590-372f-4693-aed6-c91b58ae4016', NOW(), NOW(), 'Omulu Capoeira Guanabara - Madison', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITORA Guerreira (Kelly Schumann)
Main Contact: Monitora Guerreira - [608] 492-1919, 608-469-5843
Notes: Madison, Wisconsin. Monitora Guerreira (Kelly Schumann) under Mestre Preguiça [Los Angeles]. UW Omulu Capoeira Club. SOURCE: website 1/4/20', 'madcapoeira@gmail.com, Kelly_schumann@hotmail.com', '[{"type":"website","url":"http://www.madisoncapoeira.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b0f07a44-5352-4e9e-bf6e-541dd45d348c', 'ea858590-372f-4693-aed6-c91b58ae4016', 'Kanopy Dance', 'Schedule: Mixed: Mon, Wed, & Fri 7:00pm; Kids: Sat 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-89.3906996,43.0746911]},"properties":{"address":"341 State St . Madison, WI 53703","displayName":"341, State Street, Mifflin West, Downtown, Madison, Dane County, Wisconsin, 53703, United States of America","country_code":"US","boundingBox":[43.0746411,43.0747411,-89.3907496,-89.3906496]}}'::jsonb);

-- Group: Afro-Brazilian Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4eab6fc4-f9ec-4e64-b2d8-f599b7420aad', NOW(), NOW(), 'Afro-Brazilian Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Yoji Senna
Main Contact: Mestre Yoji Senna - 612-298-3402
Notes: Minneapolis-St.Paul, Minnesota. Mestre Yoji Senna. SOURCE: website 10/4/18', 'abcapoeira@gmail.com', '[{"type":"website","url":"http://www.abcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4a0b7853-f6d9-4e9b-bbca-26f837fc39e3', '4eab6fc4-f9ec-4e64-b2d8-f599b7420aad', 'South High School', 'Schedule: Tues & Thurs 7:00-9:00pm; Roda Sat 2:00pm (intermittent schedule, contact for dates)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-93.243599,44.9456577]},"properties":{"address":"3131 S 19th Ave, Minneapolis, MN 55407","displayName":"South High School, 3131, 19th Avenue South, Standish, Corcoran, Powderhorn, Minneapolis, Hennepin County, Minnesota, 55407, United States of America","country_code":"US","boundingBox":[44.9448404,44.9475235,-93.2448078,-93.2424024]}}'::jsonb);

-- Group: Capoeira Floração
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0a59fb9d-ec0d-4b4a-b58c-b1518793d74d', NOW(), NOW(), 'Capoeira Floração', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instrutor Coruja (James Lynch) and Monitora Vespa (Jenny Johnson-Blanchard) - 612-326-0809
Notes: Minneapolis, Minnesota. Instrutor Coruja (James Lynch) and Monitora Vespa (Jenny Johnson-Blanchard). SOURCE: website 2/18/18', 'minnesotacap@gmail.com', '[{"type":"website","url":"http://www.mncapoeira.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('71a1778c-856a-4966-8d1a-86a2b580d5c4', '0a59fb9d-ec0d-4b4a-b58c-b1518793d74d', 'Minnesota Capoeira Academy', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-93.2868223,44.8859142]},"properties":{"address":"6463 Lyndale Avenue South, Richfield, MN 55423","displayName":"6463, Lyndale Avenue South, Richfield, Hennepin County, Minnesota, 55423, United States of America","country_code":"US","boundingBox":[44.8858642,44.8859642,-93.2868723,-93.2867723]}}'::jsonb);

-- Group: Axé Capoeira Kansas City
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2623cdc4-48a2-4c46-805c-2df0485f3ea5', NOW(), NOW(), 'Axé Capoeira Kansas City', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADA Arara (Sonia Duncombe)
Main Contact: Graduada Arara (Sonia Duncombe) - [816] 442-9907
Notes: Kansas City, Missouri. Graduada Arara (Sonia Duncombe). SOURCE: website 3/19/18', 'axecapoeirakc1@gmail.com', '[{"type":"website","url":"http://www.capoeirakc.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6b3f6c83-2a80-4107-b6e6-8742a42f9d6f', '2623cdc4-48a2-4c46-805c-2df0485f3ea5', 'Axé Capoeira Kansas City', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-94.5749955,39.010136]},"properties":{"address":"6430 Troost Ave, Kansas City, MO 64131","displayName":"6430, Troost Avenue, Oak Meyer Gardens, Kansas City, Jackson County, Missouri, 64131, United States of America","country_code":"US","boundingBox":[39.0100595,39.0102125,-94.5751173,-94.5748737]}}'::jsonb);

-- Group: Capoeira Luanda of St. Louis
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('47f65df9-c434-4be3-b3cd-55a82ed1b2e4', NOW(), NOW(), 'Capoeira Luanda of St. Louis', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instructor Beija-flor (Keith Wilson) - [618] 530-3132
Notes: Saint Louis, Missouri. Instructor Beija-flor (Keith Wilson) Founder & Executive Director. SOURCE: website 4/19/17', 'beijaflor@capoeirastl.org', '[{"type":"website","url":"http://www.capoeirastl.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('55689f3b-5b77-4bc9-853f-64ae720d0f53', '47f65df9-c434-4be3-b3cd-55a82ed1b2e4', 'University Tower', 'Schedule: Kids: Mon & Wed 7:30-8:30pm; Adults: Mon & Wed 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.3443545,38.6362618]},"properties":{"address":"1034 S Brentwood Blvd, St. Louis, MO 63117","displayName":"Passport Health Richmond Heights Travel Clinic, 1034, South Brentwood Boulevard, Richmond Heights, Saint Louis County, Missouri, 63117, United States of America","country_code":"US","boundingBox":[38.6362118,38.6363118,-90.3444045,-90.3443045]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('93eb1794-a50b-4c4b-adc7-b7cca67427c3', '47f65df9-c434-4be3-b3cd-55a82ed1b2e4', 'Be Well Now', 'Schedule: Tues & Thurs 8:00-9:30pm
Phone: [618] 225-9246', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.1739251,38.9212312]},"properties":{"address":"221 Center Drive, Alton, IL 62002","displayName":"221, East Center Drive, Alton Square Mall, Alton, Madison County, Illinois, 62002, United States of America","country_code":"US","boundingBox":[38.9211812,38.9212812,-90.1739751,-90.1738751]}}'::jsonb);

-- Group: Centro Esportivo de Capoeira Angola [CECA] St Louis, MO
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('131be507-7071-4654-88d4-e69f423e0f0e', NOW(), NOW(), 'Centro Esportivo de Capoeira Angola [CECA] St Louis, MO', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Saint Louis, Missouri. SOURCE: website 3/2/18', NULL, '[{"type":"website","url":"https://capoeiraangolasaintlouis.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1cfecdc8-594c-402d-9194-15cbebe39840', '131be507-7071-4654-88d4-e69f423e0f0e', 'Yeyo Arts Collective', 'Schedule: Wed 7:00pm-8:30pm; Sat: 4:00-6:00pm (no classes on fourth Wed each month)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.2242087,38.6008258]},"properties":{"address":"2907 South Jefferson Ave, Saint Louis, MO 63118","displayName":"2907-2909, South Jefferson Avenue, Fox Park, Benton Park West, Saint Louis, Missouri, 63118, United States of America","country_code":"US","boundingBox":[38.6007377,38.6009086,-90.2243251,-90.2240998]}}'::jsonb);

-- Group: Centro Esportivo de Capoeira Angola Asheville
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a5efec2e-d868-43a1-ac90-ae525134c26a', NOW(), NOW(), 'Centro Esportivo de Capoeira Angola Asheville', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Stefan and Jashwant - 828-712-4013
Notes: Asheville, North Carolina. Stefan and Jashwant under Mestre Pe de Chumbo [Germany]. SOURCE: website 5/30/19', NULL, '[{"type":"website","url":"http://www.capoeiraasheville.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4555c392-2ceb-4e77-9c41-768f9b93c311', 'a5efec2e-d868-43a1-ac90-ae525134c26a', 'Burton Street Community Center', 'Schedule: Wed 6:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.5844158,35.5830269]},"properties":{"address":"134 Burton St, Asheville, NC 28806","displayName":"Burton Street Community Center, 134, Burton Street, Hazel Green, West Asheville, Asheville, Buncombe County, North Carolina, 28806, United States of America","country_code":"US","boundingBox":[35.5828282,35.583209,-82.5846116,-82.5842062]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ca85fc16-f9c5-4c92-8891-7f99ba581d79', 'a5efec2e-d868-43a1-ac90-ae525134c26a', 'Montford Community Center', 'Schedule: Sat 10:00am-12:00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.5651653,35.6003947]},"properties":{"address":"34 Pearson Drive, Asheville, NC, 28801","displayName":"Tempie Avery Montford Community Center, 34, Pearson Drive, Montford Hills, Asheville, Buncombe County, North Carolina, 28801, United States of America","country_code":"US","boundingBox":[35.6002032,35.6005681,-82.565394,-82.5649226]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('21bc88d9-2e0e-40da-b9b8-ddb503650f6b', 'a5efec2e-d868-43a1-ac90-ae525134c26a', 'Broad River Community Center', 'Schedule: Senior focus: Tues & Thurs 6:30-8:00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.257718,35.5100929]},"properties":{"address":"44 Broad River VFD Road, Black Mountain, NC","displayName":"The Broad River Volunteer Fire & Rescue Department, 44, Broad River VFD Road, Black Mountain, Buncombe County, North Carolina, 28711, United States of America","country_code":"US","boundingBox":[35.5100429,35.5101429,-82.257768,-82.257668]}}'::jsonb);

-- Group: Cordão de Ouro Carolinas
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('df645b50-79bd-4990-a6f3-72b0ee37067b', NOW(), NOW(), 'Cordão de Ouro Carolinas', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Neguinho
Notes: Charlotte, North Carolina. Mestre Neguinho. SOURCE: website 6/6/19', NULL, '[{"type":"website","url":"https://neguinhocdo.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b25aaf49-de75-4caa-8836-0dfd4d9f2cd9', 'df645b50-79bd-4990-a6f3-72b0ee37067b', 'Budokon Academy Charlotte', 'Schedule: Adults: Mon 8:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.8697823,35.200317]},"properties":{"address":"2935 Griffith Street, Charlotte, NC","displayName":"2935, Griffith Street, Silos, Sedgefield, Charlotte, Mecklenburg County, North Carolina, 28203, United States of America","country_code":"US","boundingBox":[35.200267,35.200367,-80.8698323,-80.8697323]}}'::jsonb);

-- Group: Upstate Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('eac31f86-21be-4904-90dd-856d1788a57e', NOW(), NOW(), 'Upstate Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Contra Mestre Neguinho (Elias Martins) and Professora Risadinha (Melinda Erickson-Martins)
Notes: Gastonia, North Carolina. Contra Mestre Neguinho (Elias Martins) and Professora Risadinha (Melinda Erickson-Martins). SOURCE: website 6/13/18', NULL, '[{"type":"website","url":"https://projectbacana.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('57dd01de-047a-4c46-863b-753b223b7ee2', 'eac31f86-21be-4904-90dd-856d1788a57e', 'Equilíbrio - Movement Culture Center', 'Schedule: Kids'' Capoeira: Mon & Wed 7:30-8:15pm; Adults'' Capoeira: Mon & Wed 8:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.1889188,35.2625292]},"properties":{"address":"182 W. Main Avenue, Gastonia, NC 28052","displayName":"182, West Main Avenue, FUSE, Gastonia, Gaston County, North Carolina, 28052, United States of America","country_code":"US","boundingBox":[35.2624792,35.2625792,-81.1889688,-81.1888688]}}'::jsonb);

-- Group: Capoeira Oregon - CapuraGinga - Beaverton
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('eeba0548-4685-4ae2-9782-f63a77af9467', NOW(), NOW(), 'Capoeira Oregon - CapuraGinga - Beaverton', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRANDO Mago
Notes: Beaverton, Oregon. Mestrando Mago under the guidance of Mestre Loka. Classes for Adults Children, and Families Contact for Details. SOURCE: website 6/25/19', NULL, '[{"type":"website","url":"http://bodyofbrazil.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0fd35cca-771b-45dd-aa7d-f36a6a6a1f96', 'eeba0548-4685-4ae2-9782-f63a77af9467', 'Body of Brazil', 'Schedule: Kids Beginning: Wed 5:05pm
Phone: 03.530.8176', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.7802165,45.4868334]},"properties":{"address":"9955 SW Beaverton Hillsdale Hwy, Beaverton, OR 97005","displayName":"Studio 10 Karaoke Box, 9955, Southwest Beaverton Hillsdale Highway, Raleigh West, Denney Whitford/Raleigh West, Beaverton, Washington County, Oregon, 97005, United States of America","country_code":"US","boundingBox":[45.4867834,45.4868834,-122.7802665,-122.7801665]}}'::jsonb);

COMMIT;

-- Summary: 245 groups, 399 locations imported
-- Skipped: 0 groups