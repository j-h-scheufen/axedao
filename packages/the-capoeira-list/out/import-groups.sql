-- Capoeira Groups Import SQL
-- Generated: 2025-11-14T13:08:33.027Z
-- Source: The Capoeira List (http://home.znet.com/capoeira_list/)

BEGIN;

-- Batch: batch-01.json (44 groups)

-- Group: Capoeira Cordao de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ba2808fe-ae17-46f2-a2d3-c96b10f8de8a', NOW(), NOW(), 'Capoeira Cordao de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Manhoso (Van Robbins)
Notes: SOURCE: website facebook. 8/3/18', 'smithmr75@gmail.com', '[{"type":"website","url":"http://a2capoeira.wixsite.com/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('294dfd70-dd61-4281-82ff-73c97680841e', 'ba2808fe-ae17-46f2-a2d3-c96b10f8de8a', 'Trotter Multicultural Center', 'Schedule: Wed & Thurs 6:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-83.7100389,42.2942142]},"properties":{"address":"University of Michigan","displayName":"University of Michigan, 500, South State Street, Old Fourth Ward, Ann Arbor, Washtenaw County, Michigan, 48109, United States of America","countryCode":"US","boundingBox":[42.242226,42.3125148,-83.7502236,-83.6649743]}}'::jsonb);

-- Group: Axe Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('16fbf27a-858a-4621-bb82-972d22f77d9a', NOW(), NOW(), 'Axe Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Catatau (Bayu Wicaksono)
Main Contact: - 240-281-7828
Notes: under the guidance of instrutor Bambu[Chicago]. SOURCE. website / 3/30/18', 'axemaryland@gmail.com', '[{"type":"website","url":"http://www.axemaryland.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c53bd137-1a77-4226-86b8-13b6395502f8', '16fbf27a-858a-4621-bb82-972d22f77d9a', 'Anne Arundel Community College', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.5171673,39.0491168]},"properties":{"address":"101 College Parkway, Arnold, MD 21012-1895","displayName":"Dr. Martin Luther King, Jr. Memorial, 101, College Parkway, College Station, Arnold, Anne Arundel County, Maryland, 21012, United States of America","countryCode":"US","boundingBox":[39.0490668,39.0491668,-76.5172173,-76.5171173]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7cd9334a-7b77-4565-b87b-1ab265b06c2b', '16fbf27a-858a-4621-bb82-972d22f77d9a', 'Wulin Institute', 'Phone: 240-281-7828', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.6127958,39.1814379]},"properties":{"address":"7164 E Furnace Branch Road, Glen Burnie, MD 21061","displayName":"7164, East Furnace Branch Road, Furnace Branch, Rippling Ridge, Glen Burnie, Anne Arundel County, Maryland, 21060, United States of America","countryCode":"US","boundingBox":[39.1813879,39.1814879,-76.6128458,-76.6127458]}}'::jsonb);

-- Group: Capoeria Karkara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('350dbb1e-c4d2-412c-8ed6-d85ab824ef5c', NOW(), NOW(), 'Capoeria Karkara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMADO Band-aid (Matt Strobel)
Main Contact: - [202] 368-5325
Notes: Charles County, Waldorf. SOURCE: websites 5/15/18', 'formadobandaid@gmail.com', '[{"type":"website","url":"http://capoeirakarkara.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('761bddc8-d1a7-460d-9980-f1e5dca8a376', '350dbb1e-c4d2-412c-8ed6-d85ab824ef5c', 'The Studio Cooperative', 'Schedule: (See website for schedule)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.9106581,38.6263882]},"properties":{"address":"Waldorf, MD 20603","displayName":"Waldorf, Charles County, Maryland, 20601, United States of America","countryCode":"US","boundingBox":[38.4663882,38.7863882,-77.0706581,-76.7506581]}}'::jsonb);

-- Group: FICA
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c6b43c59-89c2-4b37-93cb-86979cd7fdcf', NOW(), NOW(), 'FICA', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE BabaJan (Livaldi da Cruz)
Main Contact: - 301.704.4703
Notes: Prince George''s County, Hyattsville, Capital Heights. SOURCE: website 5/16/18', 'sambatrovao@gmail.com', '[{"type":"website","url":"https://www.sambatrovao.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6dad8d68-3563-4264-ba6d-7badc6853d9e', 'c6b43c59-89c2-4b37-93cb-86979cd7fdcf', 'Espaço Cultural Samba Trovão', 'Schedule: Ages 14- up: Mon & Wed 7:00 - 9:00pm; Sat11:00am-1:00pm; Ages 5 - 13: Tues & Thurs 6:00pm - 7:00pm; Sat 10:00- 11:00am; Ages 5-under with parents:(3 families needed for class to started)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.9411874,38.953644]},"properties":{"address":"4318 Hamilton Street, Hyattsville 20781","displayName":"180 Degree Club, 4318, Hamilton Street, Ellaville, Hyattsville, Prince George''s County, Maryland, 20781, United States of America","countryCode":"US","boundingBox":[38.953594,38.953694,-76.9412374,-76.9411374]}}'::jsonb);

-- Group: Capoeira Barro Vermelho
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e93770a6-609f-4143-aa2b-7622fa372af3', NOW(), NOW(), 'Capoeira Barro Vermelho', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Bomba
Main Contact: - +1 [202] 838-3907
Notes: Montgomery County. Mail: 4103 18th St., NW Washington, DC 20011. SOURCE: website 5/19/18', 'bombabahia@gmail.com', '[{"type":"website","url":"http://www.capoeirafitnessdc.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b9b56134-6954-47cf-9a51-03c8296843ac', 'e93770a6-609f-4143-aa2b-7622fa372af3', 'Brookmont Church', 'Schedule: Ages 4-6 : Mon 4:00-4:40 pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0942447,38.9846816]},"properties":{"address":"Bethesda, MD 20816","displayName":"Bethesda, Montgomery County, Maryland, 22814, United States of America","countryCode":"US","boundingBox":[38.8246816,39.1446816,-77.2542447,-76.9342447]}}'::jsonb);

-- Group: Abadá Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('dc18a87e-4058-4bd9-a388-290e6461b786', NOW(), NOW(), 'Abadá Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Yara (Yara Cordeiro)
Main Contact: - 301-947-5806
Notes: SOURCE: website 11/30/19', 'info@abadadc.org', '[{"type":"website","url":"http://abadadc.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7168c903-3f69-4623-942b-774f06579267', 'dc18a87e-4058-4bd9-a388-290e6461b786', 'Rendevouz Social Dance Studio', 'Schedule: Children: Tues & Thurs 5:30 – 6:30 pm; Sat 1:00-2:00pm; Adolescents / Adults:: Tues & Thurs7:30 – 9:00; Sat 2:00 – 3:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.1013265,39.0477777]},"properties":{"address":"11910 Parklawn Drive, Rockville, Maryland","displayName":"Maryland School of Dance, 11711, Parklawn Drive, Nebel District, Rockville, Montgomery County, Maryland, 20852, United States of America","countryCode":"US","boundingBox":[39.0477277,39.0478277,-77.1013765,-77.1012765]}}'::jsonb);

-- Group: Grupo De Capoeira Sao Jose Dos Carpinteiros
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('db9e5494-dfaf-4721-9ecd-bbe0ab2e5e17', NOW(), NOW(), 'Grupo De Capoeira Sao Jose Dos Carpinteiros', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUCTOR Polaco
Main Contact: - 0772 390 9107
Notes: Berkshire. SOURCE: website 11/3/16', NULL, '[{"type":"website","url":"https://sites.google.com/site/capoeirareading/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('df5649cc-7299-4de5-adb1-e289438eef92', 'db9e5494-dfaf-4721-9ecd-bbe0ab2e5e17', 'St Lukes Church Hall', 'Schedule: Tues 6:30-8:00pm; Fri 8:00-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.9573367,51.45098]},"properties":{"address":"4 Erleigh Road Reading, Berkshire RG1 5LH","displayName":"Erleigh Road, Newtown, Reading, England, RG1 5DG, United Kingdom","countryCode":"GB","boundingBox":[51.4509332,51.4510269,-0.9574326,-0.9572408]}}'::jsonb);

-- Group: Capoeira UK - Capoeira Senzala de Santos
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3e698bc6-dc6c-40fe-8854-78257d491cf0', NOW(), NOW(), 'Capoeira UK - Capoeira Senzala de Santos', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUCTOR Michel Neves
Main Contact: - 01628 672256, 07905 463 145
Notes: Berkshire. under Mestre Sombra "Roberto Teles de Oliveira" [Sao Paulo, Brazil]. (The information above is still on the website.. However the class information page has no content, and the information below is not currently on the website. We have kept it listed since it is possible, although very unlikely, that it is still valid. Please contact us 11/3/16). SOURCE: website 5/18/11', 'capoeirauk@hotmail.com', '[{"type":"website","url":"http://www.capoeirauk.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('19c969e0-d8f7-4f93-b3d1-2052a9a70cee', '3e698bc6-dc6c-40fe-8854-78257d491cf0', 'WRVS York Center', 'Schedule: Tues 7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.7173796,51.5210868]},"properties":{"address":"42 York Road Maidenhead SL6 1SH","displayName":"York Road, Fishery, Maidenhead, Windsor and Maidenhead, England, SL6 1LF, United Kingdom","countryCode":"GB","boundingBox":[51.5210031,51.5211595,-0.7178091,-0.7169481]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('35ca9804-6f9a-4145-a34a-a72b9d1a5761', '3e698bc6-dc6c-40fe-8854-78257d491cf0', 'Windor Leisure Center', 'Schedule: Fri 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.6040419,51.4837886]},"properties":{"address":"Windsor, Berkshire, SL4 5JB, UK","displayName":"Windsor Castle, West Steps, Clewer New Town, Clewer Village, Windsor, Windsor and Maidenhead, England, SL4 1PR, United Kingdom","countryCode":"GB","boundingBox":[51.4828451,51.484747,-0.608327,-0.5999439]}}'::jsonb);

-- Group: Cordao de Ouro, Birmingham Brazilian Cultural Centre
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('261a5938-9fb5-43df-bb28-1c4c534473e8', NOW(), NOW(), 'Cordao de Ouro, Birmingham Brazilian Cultural Centre', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Mascote (Samuel Mascote)
Main Contact: - +44 [0] 7812 99 17 69
Notes: West Midlands, Birmingham, Leamington Spa, Coventry, Wolverhampton. SOURCE: website 11/7/16', 'info.cdob@gmail.com', '[{"type":"website","url":"http://www.cdob.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5b7b8ba7-8b1f-43f5-a605-457a575d64e8', '261a5938-9fb5-43df-bb28-1c4c534473e8', 'Arch 32 Water Street', 'Schedule: Beginners: Mon 7:00-9:00pm; All Levels: Tues, Wed, & Fri 7:00-8:30pm; Kids: Tues & Thurs 5:00-6:00pm; Acrobatics: Tues 8:30-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.902412,52.4859021]},"properties":{"address":"Arch 32 Water Street, Birmingham B3 1HL","displayName":"The Barrel Store by Attic, Water Street, Jewellery Quarter, Birmingham, West Midlands, England, B3 1HL, United Kingdom","countryCode":"GB","boundingBox":[52.4858521,52.4859521,-1.902462,-1.902362]}}'::jsonb);

-- Group: Birmingham University Capoeira Society - Grupo Uniao na Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d862e2cd-b5bc-4d23-a02c-38b971356c3a', NOW(), NOW(), 'Birmingham University Capoeira Society - Grupo Uniao na Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: West Midlands. SOURCE: website 11/21/16', NULL, '[{"type":"website","url":"http://capsoc.wixsite.com/capsoc"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bd9dcea3-60a2-4d8e-9074-fc98f8e51af8', 'd862e2cd-b5bc-4d23-a02c-38b971356c3a', 'Lecture Room 5, The Arts Building', 'Schedule: Movements: Tues & Thurs 6:30- 8:30pm; Music & Roda: Fri 6:30- 8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.9286195,52.446975]},"properties":{"address":"Bristol Rd, Birmingham, B15 2TT, UK","displayName":"Bristol Road, Bournbrook, Metchley, Birmingham, West Midlands, England, B29 7BQ, United Kingdom","countryCode":"GB","boundingBox":[52.4469305,52.4469927,-1.9286846,-1.928542]}}'::jsonb);

-- Group: Capoeira Volta ao Mundo
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7953c66c-6e29-4da3-8c67-0d479b4140d3', NOW(), NOW(), 'Capoeira Volta ao Mundo', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: SOURCE: webpage 9/16/17', NULL, '[{"type":"website","url":"https://www.capovam.com/locations/lakewood-ranch/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('754ceb8d-081c-4ff0-b11d-da484ad6c60b', '7953c66c-6e29-4da3-8c67-0d479b4140d3', 'Lakewood Ranch location', 'Schedule: Full schedule of classes', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.4269007,27.430912]},"properties":{"address":"11534 Palmbrush Trail Lakewood Ranch, FL 34202","displayName":"11534, Palmbrush Trail, Summerfield, Lakewood Ranch, Manatee County, Florida, 34202, United States of America","countryCode":"US","boundingBox":[27.430862,27.430962,-82.4269507,-82.4268507]}}'::jsonb);

-- Group: Capo Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d8615899-6379-4c9e-90ea-d6edc46bcb8d', NOW(), NOW(), 'Capo Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Mangueria
Main Contact: - [954] 755-9424
Notes: SOURCE: website 10/11/17', 'info@capo.rocks', '[{"type":"website","url":"http://www.capocapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('657ddc38-101b-40f8-9906-efec74f29fff', 'd8615899-6379-4c9e-90ea-d6edc46bcb8d', 'Coral Springs location', 'Schedule: Full schedule of classes for kids and adults', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.2360823,26.2869178]},"properties":{"address":"8256 Wiles Road, Coral Springs FL 33067","displayName":"8256, Wiles Road, Coral Springs, Broward County, Florida, 33067, United States of America","countryCode":"US","boundingBox":[26.2868678,26.2869678,-80.2361323,-80.2360323]}}'::jsonb);

-- Group: Grupo Capoeira Males
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c9b113db-0288-4a25-ac50-7461e71772bf', NOW(), NOW(), 'Grupo Capoeira Males', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Lua Branca
Main Contact: Camarao - [647] 283-0462
Notes: Contra Mestre Lua Branca is based in Toronto. SOURCE: website 3/18/17', 'camarao_capoeira@hotmail.com', '[{"type":"website","url":"http://capoeiraschool.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('18f01d99-03ec-4fdd-b78e-74295b22fd50', 'c9b113db-0288-4a25-ac50-7461e71772bf', 'Sidekicks School of Martial Arts', 'Schedule: Mon 8:00-9:30pm; Wed. 7:30pm - 9:00pm; Sat. 12:30pm - 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.7860267,43.3379312]},"properties":{"address":"2421 New Street, Burlington, Ontario","displayName":"2421, New Street, Roseland, Burlington, Halton Region, Golden Horseshoe, Ontario, L7R 1J6, Canada","countryCode":"CA","boundingBox":[43.3378812,43.3379812,-79.7860767,-79.7859767]}}'::jsonb);

-- Group: Capoeira Ache Brasil Calgary
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('05432009-a0a0-499b-a90e-c81c0da25c7c', NOW(), NOW(), 'Capoeira Ache Brasil Calgary', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Manteiga (Mike Darling)
Main Contact: Manteiga - 403-808-6924
Notes: Instrutor Manteiga and Monitor Suassuna under Mestre Eclilson De Jesus [Vancouver]. Calgary location. SOURCES: website 3/18/17', 'info@capoeiraabc.com', '[{"type":"website","url":"https://capoeiraabc.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('01655555-fcb9-461a-a1ac-c6b7c5c4a0e8', '05432009-a0a0-499b-a90e-c81c0da25c7c', 'Capoeira Ache Brasil Calgary', 'Schedule: Beginner Class: Mon 6:15pm-7:15pm; Intermediate Class: Wed & Fri 7:00pm-8:30pm; Advanced Class: Mon 7:15pm-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-114.0520169,51.0866044]},"properties":{"address":"3811 Edmonton Trail NE, Calgary, Alberta, T2E 8J9","displayName":"Next 2 New, 3811, Edmonton Trail NE, Greenview Industrial, Calgary, Alberta, T2E 8J9, Canada","countryCode":"CA","boundingBox":[51.0865544,51.0866544,-114.0520669,-114.0519669]}}'::jsonb);

-- Group: ASCAB Capoeira Chico
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4e17f678-658f-4081-9bbb-ec806f6c8fc3', NOW(), NOW(), 'ASCAB Capoeira Chico', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMADO Pato (Mason Rapacz)
Main Contact: Formado Pato - [928] 600-9189
Notes: Chico, California (Butte County). Formado Pato (Mason Rapacz). SOURCE: website 6/11/18', 'ascabpato@gmail.com', '[{"type":"website","url":"https://www.ascabcapoeirachico.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ccf34bdf-a7cb-4999-9f07-065562485648', '4e17f678-658f-4081-9bbb-ec806f6c8fc3', 'ASCAB Capoeira Chico', 'Schedule: Kids: Mon 7:00-8:00pm; Adults Training: Mon 8:00-9:00pm; Adults Beginner: Tues & Fri 10:00am-12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-121.8378071,39.7414152]},"properties":{"address":"1108 Mangrove Ave, Chico, California 95926","displayName":"1108, Mangrove Avenue, Chico, Butte County, California, 95926, United States of America","countryCode":"US","boundingBox":[39.7413652,39.7414652,-121.8378571,-121.8377571]}}'::jsonb);

-- Group: Capoeira Brasil East Bay - Richmond
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4fe1eacf-55ab-440e-8fae-b89ba212be39', NOW(), NOW(), 'Capoeira Brasil East Bay - Richmond', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Sagui
Main Contact: - 646-265-8800
Notes: Richmond, California (Contra Costa County). Instrutor Sagui. SOURCE: website 12/3/16', 'capoeastbay@gmail.com', '[{"type":"website","url":"http://www.capoeirabrasileastbay.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e764b8fe-d0a8-4cc4-8ab0-a674443f0b1f', '4fe1eacf-55ab-440e-8fae-b89ba212be39', 'Capoeira Brasil Richmond', 'Schedule: Wed 8:00-9:30pm; Sat 12:30-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3237358,37.9317796]},"properties":{"address":"4820 Bissell Ave, Richmond CA","displayName":"4820, Bissell Avenue, Richmond, Contra Costa County, California, 94805, United States of America","countryCode":"US","boundingBox":[37.9317296,37.9318296,-122.3237858,-122.3236858]}}'::jsonb);

-- Group: Capoeira Omulu - Walnut Creek
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3fe79e65-2383-4a0a-9bef-ab2d6a5b0cde', NOW(), NOW(), 'Capoeira Omulu - Walnut Creek', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Preguica
Main Contact: Instructor Uri - 415-834-8135
Notes: Walnut Creek, California (Contra Costa County). Instructor Uri under Mestre Preguica. SOURCE: website 12/12/16', 'wccapoeira@gmail.com', '[{"type":"website","url":"http://www.wcomulucapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f277a6c7-9ff3-439f-9f89-f4c791d09ce9', '3fe79e65-2383-4a0a-9bef-ab2d6a5b0cde', 'Epic Martial Arts', 'Schedule: Children ages 4-7: Sat 12:00-12:40pm; Thurs 3:00-3:40pm; Kids ages 8-13: Sun 9:30-10:30am; Tues 3:00-3:50am; Adults: Tues 8:10-9:30pm Fri 7:00-8:30pm; Sun 10:30am - 12:00pm; Teens: ages 15+: Sat 12:00-1:00pm (Schedule subject to change)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.0680205,37.8970181]},"properties":{"address":"2029 Mt. Diablo Blvd. Walnut Creek, CA 94596","displayName":"2029, Mount Diablo Boulevard, Walnut Creek, Contra Costa County, California, 94596, United States of America","countryCode":"US","boundingBox":[37.8969681,37.8970681,-122.0680705,-122.0679705]}}'::jsonb);

-- Group: Omulu Capoeira Concord
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('70012c6c-64bb-409f-a0c1-6763052efcac', NOW(), NOW(), 'Omulu Capoeira Concord', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Espantalho (Eugene King)
Main Contact: Professor Espantalho - [925] 408-6052
Notes: Concord, California (Contra Costa County). Professor Espantalho (Eugene King). SOURCE: website 12/13/16', NULL, '[{"type":"website","url":"https://concordcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d16c0a19-ade4-4908-8695-e8eeaa50da3b', '70012c6c-64bb-409f-a0c1-6763052efcac', 'UFC Gym', 'Schedule: Wed 6:00-7:00pm; Sat 12:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.0566118,37.9690949]},"properties":{"address":"1975 Diamond Blvd, Concord, CA","displayName":"Half Price Books, 1975, Diamond Boulevard, Willows Shopping Center, The Veranda Shopping Center, Concord, Contra Costa County, California, 94520, United States of America","countryCode":"US","boundingBox":[37.9690449,37.9691449,-122.0566618,-122.0565618]}}'::jsonb);

-- Group: Capoeira Besouro - Los Angeles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('698e468e-f62c-4587-875b-942032808a55', NOW(), NOW(), 'Capoeira Besouro - Los Angeles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Batata
Main Contact: Mestre Batata - [310] 709-9409
Notes: Santa Monica, Los Angeles, California (Los Angeles County). Mestre Batata. Instrutor Cabeca de Coco (Steve Williams) 951-662-5434. Please contact us 6/8/17. SOURCE: websites 6/8/17, capoeira.com personal message 8/7/09', 'mestrebatata@capoeirabesouro.com', '[{"type":"website","url":"http://www.capoeirabesouro.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('64467c6f-86a0-4aa8-8a7f-4ca5f2ccae9d', '698e468e-f62c-4587-875b-942032808a55', 'Capoeira Besouro', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.4546257,34.0200815]},"properties":{"address":"2901 Ocean Park Blvd. Santa Monica, CA 90405","displayName":"Subway, 2901, Ocean Park Boulevard, Santa Monica, Los Angeles County, California, 90405, United States of America","countryCode":"US","boundingBox":[34.0200315,34.0201315,-118.4546757,-118.4545757]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9301cda2-5f5b-4919-9642-93f63f64c67b', '698e468e-f62c-4587-875b-942032808a55', 'Ginga Arts - EXPO Center', 'Phone: [310] 709-2797
Email: info@gingaarts.org', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.2893793,33.9138537]},"properties":{"address":"3980 S. Menlo Ave, Los Angeles, CA 90037","displayName":"South Menlo Avenue, Los Angeles, Los Angeles County, California, 90247, United States of America","countryCode":"US","boundingBox":[33.9112767,33.9164307,-118.2893893,-118.2893653]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a1428c94-bb94-4eda-85af-1808f91ece38', '698e468e-f62c-4587-875b-942032808a55', 'Accelerated Charter Elementary School', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.2731179,34.0149806]},"properties":{"address":"119 E. 37th Street, Los Angeles, CA 90011","displayName":"119, East 37th Street, Jefferson, Historic South-Central, Los Angeles, Los Angeles County, California, 90011, United States of America","countryCode":"US","boundingBox":[34.0149306,34.0150306,-118.2731679,-118.2730679]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d2afc272-4a52-4e92-b173-e539647b8712', '698e468e-f62c-4587-875b-942032808a55', 'Mar Vista Family Center', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.397968,33.9890247]},"properties":{"address":"5075 S Slauson Ave, Culver City, CA 90230","displayName":"Slauson Avenue, Fox Hills, Culver City, Los Angeles County, California, 90056, United States of America","countryCode":"US","boundingBox":[33.988905,33.9891359,-118.398532,-118.3974058]}}'::jsonb);

-- Group: Capoeira Batuque - Los Angeles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('719a6e31-e3dc-405c-be10-b6b0f22b6701', NOW(), NOW(), 'Capoeira Batuque - Los Angeles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Amen
Notes: Los Angeles, California (Los Angeles County). Mestre Amen. Multiple instructors. SOURCE: facebook 6/13/17, website 6/13/17, website 3/25/16, website 6/15/17, website 7/22/17', NULL, '[{"type":"website","url":"http://capoeirabatuque.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('94b78ec4-89fc-4b4c-8005-71c3007f3ccf', '719a6e31-e3dc-405c-be10-b6b0f22b6701', 'Brasil Brasil Cultural Center', 'Schedule: (Full schedule of classes)
Phone: 310-397-3667
Email: bbcc@brasilbrasil.org', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.3168307,34.0399971]},"properties":{"address":"2453 Washington Blvd. Los Angeles, Ca 90066","displayName":"2453, West Washington Boulevard, Arlington Heights, Los Angeles, Los Angeles County, California, 90018, United States of America","countryCode":"US","boundingBox":[34.0399471,34.0400471,-118.3168807,-118.3167807]}}'::jsonb);

-- Group: Capoeira Brasil - Los Angeles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('24c74397-330e-48bd-a5b8-d89d5489e6d2', NOW(), NOW(), 'Capoeira Brasil - Los Angeles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Boneco
Main Contact: Mestre Boneco - 323.935.2224
Notes: Los Angeles, California (Los Angeles County). Mestre Boneco. Multiple locations and instructors. SOURCE: websites 6/15/17', 'capoeirabrasil@gmail.com', '[{"type":"website","url":"http://www.capoeirabrasil.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7ba42386-8894-4335-a9c7-d3a1b48af3ab', '24c74397-330e-48bd-a5b8-d89d5489e6d2', 'Capoeira Brasil Los Angeles', 'Schedule: (Full schedule of classes at this location for adults and children)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.3173567,34.0399132]},"properties":{"address":"5557 Washington Blvd, Los Angeles, 90016","displayName":"West Washington Boulevard, Arlington Heights, Los Angeles, Los Angeles County, California, 90016, United States of America","countryCode":"US","boundingBox":[34.039911,34.0399154,-118.3177032,-118.3170101]}}'::jsonb);

-- Group: ArteLuta Capoeira Academy
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9c95b60a-cc10-4e37-bd8e-480cc6f12b10', NOW(), NOW(), 'ArteLuta Capoeira Academy', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Varal (Luiz Otavio Pereira)
Main Contact: Contra-Mestre Varal - 1 [310] 947-4015
Notes: Lomita, California (Los Angeles County). Contra-Mestre Varal (Luiz Otavio Pereira). SOURCE: website 7/10/17', 'artelutacapoeira@gmail.com', '[{"type":"website","url":"http://www.artelutacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6ae5df0a-6990-465f-baf3-6d459eae7eb0', '9c95b60a-cc10-4e37-bd8e-480cc6f12b10', 'ArteLuta Capoeira Academy', 'Schedule: (Full schedule of classes)
Phone: [213] 344-9435', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.3194981,33.8058776]},"properties":{"address":"24100 Narbonne Avenue, Lomita, CA 90717","displayName":"24100, Narbonne Avenue, Lomita, Los Angeles County, California, 90717, United States of America","countryCode":"US","boundingBox":[33.8057466,33.8062214,-118.3198108,-118.3194013]}}'::jsonb);

-- Group: Senavox Academy - Afro Brazilian Capoeira Association-Los Angeles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('712b4eff-046e-47fb-86d1-0ea12e26cdf7', NOW(), NOW(), 'Senavox Academy - Afro Brazilian Capoeira Association-Los Angeles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Holofote (Alex Rand)
Main Contact: Professor Holofote - 310.752.3775
Notes: Los Angeles, California (Los Angeles County). Professor Holofote (Alex Rand) under the vision and guidance of Mestre Yoji Senna [Minneapolis]. SOURCE: facebook website 7/10/17', 'am.rand@hotmail.com', '[{"type":"website","url":"http://www.abcapoeira.com/home/losangeles"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3aa576e9-2b21-43fd-bb99-93001227d3e8', '712b4eff-046e-47fb-86d1-0ea12e26cdf7', 'D.C Dance Center', 'Schedule: Tues 6:00-8:00pm; Thurs; Sat', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.4658692,34.0395204]},"properties":{"address":"12422 Santa Monica Blvd, Los Angeles, California","displayName":"12422, Santa Monica Boulevard, Sawtelle, Los Angeles, Los Angeles County, California, 90025, United States of America","countryCode":"US","boundingBox":[34.0394704,34.0395704,-118.4659192,-118.4658192]}}'::jsonb);

-- Group: Grupo Negaca Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('fe14b732-ad1b-49d8-9534-336f0de0c5ea', NOW(), NOW(), 'Grupo Negaca Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chitaozinho
Notes: SOURCE: website 11/8/16', 'negaca@capoeiracambridge.co.uk', '[{"type":"website","url":"http://www.capoeiracambridge.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8385c033-0863-49cb-9edd-04b0afaf60e1', 'fe14b732-ad1b-49d8-9534-336f0de0c5ea', 'Arbury Community Centre', 'Schedule: General Level Class Adults: Tues 7:00-8:00pm, £5', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.1289179,52.2266913]},"properties":{"address":"Campkin Rd, Cambridge, CB4 2LD","displayName":"Campkin Road, Chesterton, Cambridge, Cambridgeshire, Cambridgeshire and Peterborough, England, CB4 2LD, United Kingdom","countryCode":"GB","boundingBox":[52.2259266,52.2274753,0.1275557,0.1302669]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ca43f0ec-47ed-415e-8910-18c2349378cd', 'fe14b732-ad1b-49d8-9534-336f0de0c5ea', '28th Scout Hut', 'Schedule: General Level Class Adults: Thurs 7:00-8:30pm; Children Class [6 to 10 years]: Fri 6:15-7:00pm; Children Class [11 to 15 years]: Fri 7:05-8:00pm
Email: enganosa.gnc@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.1186637,52.2055314]},"properties":{"address":"Cambridge, CB1 3QU, UK","displayName":"Cambridge, Cambridgeshire, Cambridgeshire and Peterborough, England, United Kingdom","countryCode":"GB","boundingBox":[52.1579417,52.2372296,0.0686389,0.184552]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c59e7f38-7e08-45b0-9626-a81f9703b1b5', 'fe14b732-ad1b-49d8-9534-336f0de0c5ea', 'Stapleford Pavillion', 'Schedule: Children Class [6 to 12 years]: Fri 6:00-7:00pm
Email: manuela.gnc@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.2740443,52.9293948]},"properties":{"address":"Stapleford, CB22 5BQ, UK","displayName":"Stapleford, Broxtowe, Nottinghamshire, East Midlands, England, United Kingdom","countryCode":"GB","boundingBox":[52.9189418,52.9505431,-1.2857957,-1.2508221]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bcaae77b-13a5-41fb-8b7b-003eb882ce8d', 'fe14b732-ad1b-49d8-9534-336f0de0c5ea', 'Golden Acre Community Centre', 'Schedule: Children Class [6 to 12 years]: Wed 6:30-7:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.2450889,52.0100723]},"properties":{"address":"Long Horse Croft, Saffron Walden, CB11 4BL","displayName":"Longhorse Croft, Pleasant Valley, Saffron Walden, Uttlesford, Essex, England, CB11 4BL, United Kingdom","countryCode":"GB","boundingBox":[52.0098192,52.0106175,0.2447218,0.2463543]}}'::jsonb);

-- Group: Capoeira Ache Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b567ba63-e8e2-4711-8567-342ac299f590', NOW(), NOW(), 'Capoeira Ache Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: (Julie Budgen)
Main Contact: Julie Budgen - 403.609.2019
Notes: Under Mestre Eclison de Jesus [Vancouver]. SOURCE: website 3/19/17 information not changed since Feb 20, 2011', 'jbudgen@corvidaeenv.com', '[{"type":"website","url":"http://achebrasil.ca"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3a74785b-a9e5-4417-a66d-050e61461b08', 'b567ba63-e8e2-4711-8567-342ac299f590', 'LifeWorks', 'Schedule: Tues & Thurs 5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-115.3587906,51.094582]},"properties":{"address":"1412 Railway Ave, Canmore AB","displayName":"Railway Avenue, Railway, Palliser, Canmore, Town of Canmore, Alberta, T1W 1P6, Canada","countryCode":"CA","boundingBox":[51.0932763,51.095891,-115.3589476,-115.3586444]}}'::jsonb);

-- Group: Gingarte Capoeira - Capoeira Cordao de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d00a133d-bfd6-406a-9320-d33830a1c3d1', NOW(), NOW(), 'Gingarte Capoeira - Capoeira Cordao de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRA Marisa (Marisa Cordeiro)
Main Contact: Mestra Marisa - 3l2-768-85O7
Notes: Chicago, Illinois. Mestra Marisa (Marisa Cordeiro). SOURCE: website 2/18/18', 'info@gingartecapoeira.org', '[{"type":"website","url":"http://gingartecapoeira.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c8b1dbef-14a8-44c0-93e2-6d3b5a23512c', 'd00a133d-bfd6-406a-9320-d33830a1c3d1', 'Ruth Page Center of the Arts', 'Schedule: Tues & Thurs 7:00-9:00pm; Sun 11:00am-1:00pm; Ages 3-12: (see website)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6303341,41.901191]},"properties":{"address":"1016 North Dearborn Street Chicago IL","displayName":"Ruth Page Foundation School of Dance, 1016, North Dearborn Street, Gold Coast, Near North Side, Chicago, North Chicago Township, Cook County, Illinois, 60610, United States of America","countryCode":"US","boundingBox":[41.9011048,41.9012772,-87.6306064,-87.6300626]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a22173ac-6a6f-4c9b-81b0-5442d099f385', 'd00a133d-bfd6-406a-9320-d33830a1c3d1', 'Old Town School of Folk Music', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6845671,41.9623325]},"properties":{"address":"4454 N. Lincoln Avenue Chicago IL","displayName":"4454, North Lincoln Avenue, Ravenswood, Lincoln Square, Chicago, Lake View Township, Cook County, Illinois, 60625, United States of America","countryCode":"US","boundingBox":[41.9622825,41.9623825,-87.6846171,-87.6845171]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b5fa8005-12f1-4706-8195-92ddbbff891c', 'd00a133d-bfd6-406a-9320-d33830a1c3d1', 'University of Chicago - Gingarte Capoeira Club', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.5956067,41.7882054]},"properties":{"address":"1212 E 59th St, Chicago, IL 60637","displayName":"Ida Noyes Hall, 1212, East 59th Street, Hyde Park, Chicago, Hyde Park Township, Cook County, Illinois, 60637, United States of America","countryCode":"US","boundingBox":[41.7879373,41.7884615,-87.596028,-87.595122]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('feeed449-6304-4a8d-a63b-b5bfd9c96845', 'd00a133d-bfd6-406a-9320-d33830a1c3d1', 'CombatZone', 'Email: info@risetrainingacademy.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6051711,41.7449954]},"properties":{"address":"8242 S Cottage Grove Ave, Chicago","displayName":"8242, South Cottage Grove Avenue, Avalon Highlands, Chatham, Chicago, Hyde Park Township, Cook County, Illinois, 60619, United States of America","countryCode":"US","boundingBox":[41.7449454,41.7450454,-87.6052211,-87.6051211]}}'::jsonb);

-- Group: Capoeira Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('af54696b-de92-4d4d-bad8-c79aa38c36d7', NOW(), NOW(), 'Capoeira Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMADA Colibri (Katia Da Conceicao)
Main Contact: Formada Colibri - [347] 952-6047
Notes: Chicago, Illinois. Formada Colibri (Katia Da Conceicao). SOURCE: website 2/23/18', 'katiacolibri@gmail.com', '[{"type":"website","url":"https://colibricb.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('48eb3efd-6d55-4cb0-9818-797bf17dc4b8', 'af54696b-de92-4d4d-bad8-c79aa38c36d7', 'Chicago Capoeira Center', 'Schedule: Beginners: Sun 3:00-4:00pm; Tues & Thurs 5:45-6:45pm; Kids[7-12] Sat 12:00-12:45pm; All levels: Sat 1:00-2:30; Sun 5:00-6:30pm; Mon & Wed 6:00-7:30pm; Mon & Wed 7:30-9:00pm; Music: Sun 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6752851,41.9579358]},"properties":{"address":"1802 W Berteau, Chicago, IL 60613","displayName":"1802, West Berteau Avenue, North Center, Chicago, Lake View Township, Cook County, Illinois, 60613, United States of America","countryCode":"US","boundingBox":[41.9578858,41.9579858,-87.6753351,-87.6752351]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dac9305e-f502-4f86-8d77-60a3b8c1892a', 'af54696b-de92-4d4d-bad8-c79aa38c36d7', 'Japanese Culture Center', 'Schedule: All levels: Tues & Thurs 7;30-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.654907,41.9401365]},"properties":{"address":"1016 W. Belmont Ave, Chicago IL","displayName":"1016, West Belmont Avenue, Northalsted, Lake View, Chicago, Lake View Township, Cook County, Illinois, 60657, United States of America","countryCode":"US","boundingBox":[41.9399913,41.9402931,-87.654953,-87.6548614]}}'::jsonb);

-- Group: Grupo Axé Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3e1152b7-233f-4e05-96c5-0cea2107861d', NOW(), NOW(), 'Grupo Axé Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Barrão
Main Contact: Professor Bambu (Steven Kolhouse) - [773] 368-4777
Notes: Chicago, Illinois. Professor Bambu (Steven Kolhouse), graduated student of Mestre Barrão [Vancouver]. SOURCE: website 2/18/18', NULL, '[{"type":"website","url":"http://axechicago.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('450d0e5e-e45c-409b-9ed4-0e8482179fb0', '3e1152b7-233f-4e05-96c5-0cea2107861d', 'Axé Capoeira Academy', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-87.6665595,41.8958657]},"properties":{"address":"1543 W Chicago Ave, Chicago, IL 60642","displayName":"1543, West Chicago Avenue, Noble Square, Chicago, West Chicago Township, Cook County, Illinois, 60622, United States of America","countryCode":"US","boundingBox":[41.8957528,41.8959773,-87.6666066,-87.6665134]}}'::jsonb);

-- Group: Capoeira Camara Cork
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('281413e2-fee5-4c22-8a3c-08953965d9c8', NOW(), NOW(), 'Capoeira Camara Cork', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Curioso (Paulo Farinha)
Main Contact: Paulo Farinha - 087 171 2394
Notes: Under Mestre Bola. Mail: St Vincent''s Secondary School, St Mary''s Road, Blackpool, Cork, County Cork, Ireland. SOURCE: website 12/30/19', 'Paulo.Curioso@gmail.com', '[{"type":"website","url":"http://www.capoeiracork.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('91a32535-0c75-4012-8cf7-64a7f777e45a', '281413e2-fee5-4c22-8a3c-08953965d9c8', 'Camara Studios', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-8.4734429,51.9096324]},"properties":{"address":"Watercourse Rd. Cork 00","displayName":"Watercourse Road, Blackpool, Farranferris A, Cork, County Cork, Munster, T23 V38R, Éire / Ireland","countryCode":"IE","boundingBox":[51.9090836,51.9101958,-8.4735922,-8.4734355]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4e423bcd-eae5-467e-a286-cef303f88081', '281413e2-fee5-4c22-8a3c-08953965d9c8', 'St Vincent''s Secondary School', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-9.1145552,51.7240648]},"properties":{"address":"St Mary''s Road, Cork, Ireland","displayName":"St. Mary’s Road, Dunmanway North, West Cork, County Cork, Munster, P47 X259, Éire / Ireland","countryCode":"IE","boundingBox":[51.723805,51.7243251,-9.1145754,-9.1145432]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('efca0a1a-0390-48e5-9fdb-a7d1cd78342f', '281413e2-fee5-4c22-8a3c-08953965d9c8', 'Midleton Educate Together National School', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-8.1828232,51.9262485]},"properties":{"address":"Mill Road, Midleton, County Cork, Ireland","displayName":"Mill Road, Midleton Rural, The Municipal District of East Cork, County Cork, Munster, P25 YY72, Éire / Ireland","countryCode":"IE","boundingBox":[51.9223531,51.9310009,-8.1843203,-8.1796103]}}'::jsonb);

-- Group: Axe Capoeira Comox
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('da8d7748-f5c6-4b53-b32d-281df97abdbc', NOW(), NOW(), 'Axe Capoeira Comox', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADA Alisha (Alicia Fennell)
Main Contact: - 250-898-7918
Notes: Under Mestre Barrao [Vancouver]. SOURCE: website 5/2/17', 'axecomox@hotmail.com', '[{"type":"website","url":"http://www.capoeiracomox.com/index.html"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ea9a25b6-e93e-49be-aef6-1feafc54587b', 'da8d7748-f5c6-4b53-b32d-281df97abdbc', '5th street', 'Schedule: See Website for classes for Adults and Children', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-124.9963177,49.6918724]},"properties":{"address":"129 5th street, Courtenay, British Columbia","displayName":"Comox Valley Boxing Club, 129, 5th Street, Old Orchard, Courtenay, Comox Valley Regional District, British Columbia, V9N 2J5, Canada","countryCode":"CA","boundingBox":[49.6918224,49.6919224,-124.9963677,-124.9962677]}}'::jsonb);

-- Group: Capoiera Luanda
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9da434b7-84da-4106-8888-ff56d6d8a36e', NOW(), NOW(), 'Capoiera Luanda', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADO Vampiro (Slade Weidl)
Main Contact: - 720.275.7507
Notes: Under the Instruction and Supervision of Contramestre Esquilo Preto. SOURCE: website facebook 8/24/17', 'capoeiraluandadenver@gmail.com', '[{"type":"website","url":"http://www.capoeiradenver.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('afef8217-8288-4031-837e-d4da955037ac', '9da434b7-84da-4106-8888-ff56d6d8a36e', 'Qi Flow', 'Schedule: Mon & Wed 7:30-9:00pm; Fri 6:30-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.9499986,39.7697416]},"properties":{"address":"3827 Steele St Denver, CO 80205","displayName":"3827, Steele Street, Clayton, Denver, Colorado, 80205, United States of America","countryCode":"US","boundingBox":[39.7696916,39.7697916,-104.9500486,-104.9499486]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('07973078-a05f-48bb-b021-0f658aa861fb', '9da434b7-84da-4106-8888-ff56d6d8a36e', 'Colorado New Style Dance', 'Schedule: Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.9918393,39.7247468]},"properties":{"address":"520 Cherokee St. Denver, CO 80204","displayName":"520, Cherokee Street, Baker, Denver, Colorado, 80204, United States of America","countryCode":"US","boundingBox":[39.7246738,39.7247867,-104.9920391,-104.9916395]}}'::jsonb);

-- Group: Brazilian Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b9c6c6fd-3d05-40ac-a7b4-b32633f4d07e', NOW(), NOW(), 'Brazilian Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 720-882-7809
Notes: The websites disagree on details. SOURCE: website 8/24/17', 'support@cap-denver.com', '[{"type":"website","url":"http://cap-denver.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('eb191126-78b8-468d-a355-ce27a0e97e1d', 'b9c6c6fd-3d05-40ac-a7b4-b32633f4d07e', 'E Evans Ave. Denver', 'Schedule: Mon-Thurs 5:45-7:30pm; Sat 10:00am-12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.9369999,39.6783683]},"properties":{"address":"4362 E Evans Ave. Denver, CO 80222","displayName":"4362, East Evans Avenue, University Hills, Denver, Colorado, 80222, United States of America","countryCode":"US","boundingBox":[39.6783183,39.6784183,-104.9370499,-104.9369499]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('56389683-9dc4-4877-8f71-068a42c9f625', 'b9c6c6fd-3d05-40ac-a7b4-b32633f4d07e', 'Enshin Karate School', 'Schedule: Kids: Wed 6:00pm; Adult Beginners: Mon & Wed 7:00pm; Tues & Thurs 8:00pm; Intermediate: Wed 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.9135218,39.6785432]},"properties":{"address":"6441 E Evans Ave Denver CO","displayName":"6441, East Evans Avenue, Denver, Colorado, 80222, United States of America","countryCode":"US","boundingBox":[39.6784932,39.6785932,-104.9135718,-104.9134718]}}'::jsonb);

-- Group: Roots Capoeira De Ouro - Cordao de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('86e19a65-88f1-4e64-828c-88940a1f2251', NOW(), NOW(), 'Roots Capoeira De Ouro - Cordao de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 1-515-661-4556
Notes: Overseen by Mestre Chicote [Paris]. Monitora Caju "Rebecca Schleuger-Valadao", Graduada Dim Dim "Shalina Wallace", Graduado Piriquito "EJ Wallace". SOURCE: website 3/17/18', 'iowarootscapoeira@gmail.com', '[{"type":"website","url":"http://www.rootscapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('715bae3a-aaf7-48a7-8d72-dd756453bd26', '86e19a65-88f1-4e64-828c-88940a1f2251', 'Grubb YMCA', 'Schedule: Children ages 4-11 years old: Thurs 5:30-6:30pm; Adults: Thurs 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-93.6317088,41.6079228]},"properties":{"address":"1611 11th St, Des Moines, IA 50314","displayName":"1611, 11th Street, Prospect Park, Des Moines, Polk County, Iowa, 50314, United States of America","countryCode":"US","boundingBox":[41.6078728,41.6079728,-93.6317588,-93.6316588]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fc494208-2c46-4ce2-8317-801462469a55', '86e19a65-88f1-4e64-828c-88940a1f2251', 'Moulton Elementary', 'Schedule: Kids 7-12: Tues & Thurs 3:40-4:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-93.6275774,41.6067828]},"properties":{"address":"Moulton Elementary, Des Moines, IA","displayName":"Moulton Elementary, 7th Street, River Bend, Des Moines, Polk County, Iowa, 50314, United States of America","countryCode":"US","boundingBox":[41.6059086,41.6076537,-93.628141,-93.6264308]}}'::jsonb);

-- Group: Michigan Center for Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1e7aefdb-e656-40dd-9444-1501800da8ed', NOW(), NOW(), 'Michigan Center for Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Baz (Baz Michaeli)
Main Contact: - 248-225-7349
Notes: Rochester, Farmington Hills, St. Clair Shores, Ferndale. SOURCE: website 8/18/18', 'tmcc.info@gmail.com', '[{"type":"website","url":"https://www.tmc4c.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f034f0c1-67ae-4f38-86e3-bb7ba0d80e79', '1e7aefdb-e656-40dd-9444-1501800da8ed', 'Orchard Lake Rd. Farmington Hills', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-83.3590229,42.5048076]},"properties":{"address":"27881 Orchard Lake Rd. Farmington Hills, MI 48334","displayName":"27881, Orchard Lake Road, Farmington Hills, Oakland County, Michigan, 48334, United States of America","countryCode":"US","boundingBox":[42.5047576,42.5048576,-83.3590729,-83.3589729]}}'::jsonb);

-- Group: Association of Capoeira Engenho da Rainha
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('10afd26a-d1fb-474e-85f9-218552689dd2', NOW(), NOW(), 'Association of Capoeira Engenho da Rainha', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Rodrigo
Main Contact: - 44 [0] 7921 66 77 26
Notes: LINEAGE: Mestre Nenem > Mestre Paizinho > Mestre Artu Emidio > Mestre Celso > Contra Mestre Rodrigo. ACER Kids program. SOURCE: website 10/30/16', 'e.rodrigo@acercapoeira.com', '[{"type":"website","url":"http://www.capoeiracornwall.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('48d3a0cc-8f4e-44d4-a3ef-d39631070148', '10afd26a-d1fb-474e-85f9-218552689dd2', 'St Stephen''s Hill', 'Schedule: 5 to 11yrs: Mon 3:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.4096087,50.6281448]},"properties":{"address":"Tregadillett, PL15 7EU, UK","displayName":"Tregadillett Primary School, Prouts Way, Kestle, St. Thomas the Apostle Rural, Tregadillet, Cornwall, England, PL15 7EU, United Kingdom","countryCode":"GB","boundingBox":[50.6275495,50.6289881,-4.4101977,-4.4084773]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3ec22c05-f0de-47d9-9300-a779de33ef5a', '10afd26a-d1fb-474e-85f9-218552689dd2', 'Phoenix Leisure Centre', 'Schedule: 12yrs+: Mon', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.3587854,50.6310351]},"properties":{"address":"Coronation Pk, Launceston PL15 9DQ","displayName":"Coronation Skate Park, Windmill Hill, Launceston, Cornwall, England, PL15 9AF, United Kingdom","countryCode":"GB","boundingBox":[50.630792,50.6311418,-4.3590567,-4.3585361]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e3c3bb74-cef7-4a77-addf-d03857ac830f', '10afd26a-d1fb-474e-85f9-218552689dd2', 'Sands End Community Centre', 'Schedule: Mon 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2109249,51.4708886]},"properties":{"address":"66 High Street, Fulham, London, SW6 3LJ, UK","displayName":"Fulham High Street, Hurlingham, Fulham, London Borough of Hammersmith and Fulham, London, Greater London, England, SW6 3LQ, United Kingdom","countryCode":"GB","boundingBox":[51.4705411,51.4712772,-0.2110829,-0.2106859]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dec123cb-4095-431f-a1e6-ad3ee2da54a9', '10afd26a-d1fb-474e-85f9-218552689dd2', 'Greyhound Community Centre', 'Schedule: Wed 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2305592,51.4654018]},"properties":{"address":"Dryburgh Road, Putney, London, SW15 1BL, UK","displayName":"Dryburgh Road, Putney, London Borough of Wandsworth, London, Greater London, England, SW15 1BL, United Kingdom","countryCode":"GB","boundingBox":[51.4651916,51.4659956,-0.2335588,-0.2293608]}}'::jsonb);

-- Group: Mundo Capoeira Ireland
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7333789b-522a-4db8-8967-10df6139c9ba', NOW(), NOW(), 'Mundo Capoeira Ireland', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Sansao
Main Contact: - [+353] 086 1079313
Notes: Graduada Smorfete "Daniela Quaresima" [+353] 086 8875119 daniela@capoeiraireland.com. Location: 48, the Weavers, South Earl St, Dublin 8. SOURCE: website 12/31/19', 'info@capoeiraireland.com', '[{"type":"website","url":"http://www.capoeiraireland.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7d5dcafc-ab39-4d4b-b07e-0e09044f5239', '7333789b-522a-4db8-8967-10df6139c9ba', 'Byrne Hall', 'Schedule: Adults: Tues & Thurs: 7:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.2668542,53.3319004]},"properties":{"address":"Synge Street, Dublin 8, Ireland","displayName":"Synge Street, Portobello, Saint Kevins Ward 1986, Dublin, County Dublin, Leinster, D08 W599, Éire / Ireland","countryCode":"IE","boundingBox":[53.331269,53.3325285,-6.266928,-6.2668064]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('45313ff0-0e43-43ec-825b-01dfa397cc2f', '7333789b-522a-4db8-8967-10df6139c9ba', 'Charlemont Community Resource Centre', 'Schedule: Adults: Sat 12:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.2616947,53.3314676]},"properties":{"address":"Charlemont Street, Dublin 2, Ireland","displayName":"Charlemont Street, Saint Kevins Ward 1986, Dublin, County Dublin, Leinster, D02 Y993, Éire / Ireland","countryCode":"IE","boundingBox":[53.3305855,53.3324182,-6.2630178,-6.2603245]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b60eee6a-286d-422c-be0f-7654547bb311', '7333789b-522a-4db8-8967-10df6139c9ba', 'Swan Leisure', 'Schedule: Children of 4 years of age up: Sat 11:00am-12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.266509,53.3248426]},"properties":{"address":"Rathmines Square, 161 Rathmines Rd Lower","displayName":"Rathmines Square, Rathmines Road Lower, Rathmines, Rathmines West A Ward 1986, Dublin, County Dublin, Leinster, D06 V3Y8, Éire / Ireland","countryCode":"IE","boundingBox":[53.3247926,53.3248926,-6.266559,-6.266459]}}'::jsonb);

-- Group: Grupo Candeias Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('35bcde17-0667-47d6-843a-2160e09eb9b3', NOW(), NOW(), 'Grupo Candeias Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Pele
Main Contact: - 087 1531355
Notes: SOURCE: website 12/31/19', 'pelecandeias@hotmail.com', '[{"type":"website","url":"https://candeiasdublin.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('238dc36e-f39b-4fab-8914-352c79368190', '35bcde17-0667-47d6-843a-2160e09eb9b3', 'Carmelite Communite centre', 'Schedule: Beginners: Mon 9:00 to 10:00; Mixed With Roda. Wed 8:00 to 9:00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-6.2660262,53.3399826]},"properties":{"address":"56 Aungier street, Dublin 2","displayName":"Carmelite Community Centre, 56, Aungier Street, Royal Exchange A Ward 1986, Dublin, County Dublin, Leinster, D02 RW67, Éire / Ireland","countryCode":"IE","boundingBox":[53.3398635,53.3401797,-6.2661703,-6.2658673]}}'::jsonb);

-- Group: Mao no Chao Capoeira Angola
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b2a93366-a238-44dd-a2ec-056d9e827388', NOW(), NOW(), 'Mao no Chao Capoeira Angola', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Stephen - 07807 693298
Notes: Associated with Mestre Marrom e Alunos [Rio de Janiero]. No longer appears to have classes in Dundee 12/30/19. SOURCE: website 6/20/13', 'maonochao.edinburgh@googlemail.com', '[{"type":"website","url":"https://maonochao.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('93893dbe-4f4a-42cc-9c28-c55e86e8de67', 'b2a93366-a238-44dd-a2ec-056d9e827388', 'Showcase The Street', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-2.9795461,56.4605161]},"properties":{"address":"42 Brown St Dundee, Dundee City DD1 5EF","displayName":"Brown Street, University of Dundee Campus, Dudhope, Dundee, Dundee City, Alba / Scotland, DD1 5EJ, United Kingdom","countryCode":"GB","boundingBox":[56.4599907,56.4610451,-2.9797198,-2.9793613]}}'::jsonb);

-- Group: Grupo Senzela
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('53f03675-0f1a-4723-9126-a0a26d190227', NOW(), NOW(), 'Grupo Senzela', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Tasmania (Jimi McAvoy)
Main Contact: - +44 [0] 191 5860691
Notes: Under the guidance of Mestre Gato [Rio de Janeiro]. Professor Caranguejo "Peter" (peter@groupsenzala.co.uk), Professor Scuzzi "Rob" (rob@groupsenzala.co.uk, 07917440093). SOURCE: website 11/18/16', 'jimi@groupsenzala.co.uk', '[{"type":"website","url":"http://www.groupsenzala.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('db6f3cf6-0d0b-4b73-a0bd-578f7abc7ab7', '53f03675-0f1a-4723-9126-a0a26d190227', 'Vane Tempest Hall', 'Schedule: Wed 7.30pm-9:00pm; Sun 3.00pm-4.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.5559711,54.7784301]},"properties":{"address":"Maynard''s Row Gilesgate Durham DH1 1QF","displayName":"Maynard''s Row, Gilesgate, Durham, County Durham, North East, England, DH1 1QF, United Kingdom","countryCode":"GB","boundingBox":[54.7781804,54.7790741,-1.5562667,-1.5555417]}}'::jsonb);

-- Group: Mao no Chao Capoeira Angola Edinburgh
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5d4dc84b-78b0-4670-8084-af6b325e666e', NOW(), NOW(), 'Mao no Chao Capoeira Angola Edinburgh', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Associated with Mestre Marrom e Alunos [Rio de Janiero]. SOURCE: website 12/30', 'maonochao.edinburgh@googlemail.com', '[{"type":"website","url":"https://maonochao.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8bf111e6-0343-4fdd-bd76-ad4e99f6e1d9', '5d4dc84b-78b0-4670-8084-af6b325e666e', 'Out of the Blue Arts Center', 'Schedule: Tues 8:00-9.30pm (in Rehearsal Studio [Buzz 041])', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.1743617,55.9644431]},"properties":{"address":"36 Dalmeny St, Leith Edinburgh, EH6 8RG","displayName":"The Out of the Blue Drill Hall, 36, Dalmeny Street, Lorne, Leith, City of Edinburgh, Alba / Scotland, EH6 8RG, United Kingdom","countryCode":"GB","boundingBox":[55.9641446,55.9647529,-3.1746998,-3.174016]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('82581585-5c99-4095-ae38-c8a0b2cd4adf', '5d4dc84b-78b0-4670-8084-af6b325e666e', 'Tollcross Community Centre', 'Schedule: Fri 6.30-8.30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.170804,55.8432796]},"properties":{"address":"Tollcross","displayName":"Tollcross, Glasgow, Glasgow City, Alba / Scotland, G32 8HD, United Kingdom","countryCode":"GB","boundingBox":[55.8232796,55.8632796,-4.190804,-4.150804]}}'::jsonb);

-- Group: Grupo Negaca Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('31cfd599-8ad3-4fcc-bb00-0a2102fa38c9', NOW(), NOW(), 'Grupo Negaca Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chitaozinho
Main Contact: Manuela
Notes: Contact: negaca@capoeiracambridge.co.uk. SOURCE: website 3/3/20', 'manuela.gnc@gmail.com', '[{"type":"website","url":"http://www.capoeiracambridge.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8f5402aa-fe3e-4559-b8f2-bf2f61665587', '31cfd599-8ad3-4fcc-bb00-0a2102fa38c9', 'Golden Acre Community Centre', 'Schedule: All Level Adults: Wed 6:30-7:30pm (beginners welcome, please get in touch first); Children class [6 to 9 years]: Wed 6:00-6:45pm; Children & adult improvers class [10+ years]: Wed 6:45-7:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.2450889,52.0100723]},"properties":{"address":"Long Horse Croft, Saffron Walden, CB11 4BL","displayName":"Longhorse Croft, Pleasant Valley, Saffron Walden, Uttlesford, Essex, England, CB11 4BL, United Kingdom","countryCode":"GB","boundingBox":[52.0098192,52.0106175,0.2447218,0.2463543]}}'::jsonb);

-- Group: Capoeira Brazil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d77b8498-4009-487a-b1d3-554387868b70', NOW(), NOW(), 'Capoeira Brazil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Biscuim (Licio Aurelio De Oliveira Bezerra)
Notes: Professora Sininha "Emma Gibbs De Oliveira" - Call | Text: [English & Portuguese] +44 [0] 7894 716 833. SOURCE: website 11/12/16', 'info@brazilarte.org', '[{"type":"website","url":"http://brazilarte.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a2c8bcb9-9d9e-49e2-aef0-088ec9b29fd1', 'd77b8498-4009-487a-b1d3-554387868b70', 'BrazilArte Academy', 'Schedule: Full schedule of classes', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.7323058,51.5369422]},"properties":{"address":"Kensington Road, Southend on Sea, Essex, SS1 2TA","displayName":"Kensington Road, Kursaal Estate, Southchurch, Southend-on-Sea, Essex, England, SS1 2TA, United Kingdom","countryCode":"GB","boundingBox":[51.535529,51.5383554,0.7321059,0.7325058]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bf254294-fdea-4e37-91a3-f4c674780687', 'd77b8498-4009-487a-b1d3-554387868b70', 'Nuffield Health & Fitness', 'Schedule: Beginners: Tues 20.00-21.00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.478929,51.7364725]},"properties":{"address":"Unit 6 Victoria Road, Chelmsford, Essex CM1 1AN","displayName":"Victoria Road, Springfield Park, Chelmsford, Essex, England, CM2 6LJ, United Kingdom","countryCode":"GB","boundingBox":[51.7364181,51.7365186,0.4788398,0.4790132]}}'::jsonb);

-- Group: ABADA Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('dd31b7e2-a2a0-4529-89ab-e03ab5e32384', NOW(), NOW(), 'ABADA Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Coco (Marcelo Fagundes)
Main Contact: - [907]388-0122 & [907]347-5262
Notes: Instructor Coco "Marcelo Fagundes". SOURCES: blog websites 3/4/11', 'abada.alaska@gmail.com', '[{"type":"website","url":"http://abadacapoeiraalaska.blogspot.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d9bc508c-c9ca-4d99-a067-278f6bd023e5', 'dd31b7e2-a2a0-4529-89ab-e03ab5e32384', 'University of Alaska - Great Hall / Student Recreation Center', 'Schedule: Meeting times vary by sources
Email: ssalazar2@alaska.edu', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-83.6312623,41.3782901]},"properties":{"address":"Student Recreation Center - 2nd floor","displayName":"Student Recreation Center Turnaround, Athletics District, Bowling Green, Wood County, Ohio, 43403, United States of America","countryCode":"US","boundingBox":[41.3781407,41.3782912,-83.631557,-83.630975]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9d2a9423-aec9-4aee-81c9-01797e961a07', 'dd31b7e2-a2a0-4529-89ab-e03ab5e32384', 'Infinit8yoga', 'Schedule: Tues & Thurs 8:00-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-118.4071049,33.993185]},"properties":{"address":"Mar Vista Family Center, Los Angeles, CA","displayName":"Mar Vista Family Center, Ballona Creek Bike Path, Los Angeles, Los Angeles County, California, 90096, United States of America","countryCode":"US","boundingBox":[33.992989,33.9933795,-118.4072602,-118.4066923]}}'::jsonb);

-- Group: Capoeira Vadiacao de Oxossi
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e9724b78-9b59-4f65-876a-323747f519f8', NOW(), NOW(), 'Capoeira Vadiacao de Oxossi', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Girafa
Notes: Instructor: Girafa under Perere [Port Townsend WA]. SOURCE: website 3/17/18', 'capoeiragirafa@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/vadiacaodeoxossi/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c2e320fd-f3b4-4fdd-bab9-aa082671c5b5', 'e9724b78-9b59-4f65-876a-323747f519f8', 'Maharishi University of Management Recreation Center', 'Schedule: Age 14 and up: Mon & Wed 7:30-9:00pm; Sat 3:00-4:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-91.963967,41.023532]},"properties":{"address":"Maharishi University of Management, Fairfield, IA 52557","displayName":"Maharishi International University, 1000, North 4th Street, Fairfield, Jefferson County, Iowa, 52557, United States of America","countryCode":"US","boundingBox":[41.014892,41.0320579,-91.971762,-91.9586887]}}'::jsonb);

-- Batch: batch-02.json (44 groups)

-- Group: Cordao de Ouro South Carolina
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('6d2cf0e0-46cc-45e6-921a-db143e835478', NOW(), NOW(), 'Cordao de Ouro South Carolina', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Neguinho
Notes: Greenville/Spartanburg, South Carolina. Mestre Neguinho. SOURCE: website 7/10/19', NULL, '[{"type":"website","url":"https://neguinhocdo.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b4cc1c7a-28cb-49bc-b661-f5cda0ba4895', '6d2cf0e0-46cc-45e6-921a-db143e835478', 'Raja Martial Arts Academy', 'Schedule: Beginners: Tues & Thur 5:30-6:30pm; Kids: Tues & Thurs 4:30-5:20pm; Sat 2:00-3:00pm; Adults: Tues & Thurs 6:30-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.2899651,34.8221418]},"properties":{"address":"1200 Woodruff Road, Greenville, SC","displayName":"Busy Beez Movers LLC, 1200, Woodruff Road, Merovan Business Center, Greenville County, South Carolina, 29607, United States of America","countryCode":"US","boundingBox":[34.8220918,34.8221918,-82.2900151,-82.2899151]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('25491fe7-401c-46a3-968d-57f4feb1da55', '6d2cf0e0-46cc-45e6-921a-db143e835478', 'Ethos Combatives', 'Schedule: Adults: Tues 8:00-9:00pm (kids welcome as well)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.8948813,35.0250235]},"properties":{"address":"2306 Chesnee Highway, Spartanburg, SC","displayName":"2306, Chesnee Highway, Spartanburg County, South Carolina, 29303, United States of America","countryCode":"US","boundingBox":[35.02488,35.025167,-81.895077,-81.894686]}}'::jsonb);

-- Group: Capoeira Fundo da Mata - United Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c9a07e33-f2b7-468d-8def-2cb651c28cd5', NOW(), NOW(), 'Capoeira Fundo da Mata - United Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Avestruz (Joe Williams)
Notes: Knoxville, Tennessee. Mestre Avestruz (Joe Williams) under Mestre Acordeon[Berkeley]. SOURCE: website 7/21/19', NULL, '[{"type":"website","url":"http://www.capoeiraknoxville.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('285b55a5-c727-450e-b3bb-f39e050e217a', 'c9a07e33-f2b7-468d-8def-2cb651c28cd5', 'Emporium Center for Arts and Culture', 'Schedule: Open Levels with Mestre Avestruz: Tues 6:00-8:00 pm; Student-led Conditioning Class: Thurs 6:00-7:00 pm
Email: info@capoeiraknoxville.org', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-83.920052,35.9680804]},"properties":{"address":"100 S Gay St Knoxville, TN 37902","displayName":"South Gay Street, Knoxville Central Business District, Mechanicsville, Knoxville, Knox County, East Tennessee, Tennessee, 37902, United States of America","countryCode":"US","boundingBox":[35.9672189,35.9688228,-83.9207907,-83.9194659]}}'::jsonb);

-- Group: Capoeira Abolicao Knoxville
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a9f4a537-4bb4-48e6-8398-816454dc96aa', NOW(), NOW(), 'Capoeira Abolicao Knoxville', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRANDO Anao (Alejandro Florez)
Main Contact: Mestrando Anao - [865] 321-1106
Notes: Knoxville, Tennessee. Mestrando Anao (Alejandro Florez) under Master Delei[Miami]. SOURCE: website facebook 7/23/19', 'mimadacapo@gmail.com', '[{"type":"website","url":"http://www.capoeiraknoxville.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6bec5e60-523d-4bcc-97f5-c65cd55ca801', 'a9f4a537-4bb4-48e6-8398-816454dc96aa', 'The FitBox Knox', 'Schedule: Adults: Mon, Tues, Wed, & Thurs: 7:30pm; Kids: Tues & Thurs 5:30pm; Music and Roda: Fri 6:30pm
Phone: [865] 312-9782
Email: fitboxknox@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-84.0923611,35.9105592]},"properties":{"address":"9294 Kingston Pike, Knoxville, TN 37922","displayName":"9294, Kingston Pike, Knoxville, Knox County, East Tennessee, Tennessee, 37922, United States of America","countryCode":"US","boundingBox":[35.9105092,35.9106092,-84.0924111,-84.0923111]}}'::jsonb);

-- Group: Capoeira Ginga Brasil - Cordão de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0f523c46-07c3-4fa9-a8d7-ee07d6962392', NOW(), NOW(), 'Capoeira Ginga Brasil - Cordão de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Pinga Fogo (Guilherme Torres)
Notes: Austin, Texas. Mestre Pinga Fogo (Guilherme Torres). SOURCE: facebook website 7/29/19', NULL, '[{"type":"website","url":"http://www.capoeiraustin.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('99e156d0-0bf2-426e-940d-7f631468fc7c', '0f523c46-07c3-4fa9-a8d7-ee07d6962392', 'Rising Sun Aikido', 'Schedule: All Levels: Mon 6:00-7:00pm; Wed 8:00-9:00pm; Kids[2 1/2 - 4]: Mon 4:30-5:00pm; Kids[4 - 7]: Mon 5:00-5:45pm
Phone: 203 444 7142', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.7720492,30.2507394]},"properties":{"address":"2125-C Goodrich Avenue, Austin, TX 78704","displayName":"Goodrich Avenue, Zilker, Austin, Travis County, Texas, 78704, United States of America","countryCode":"US","boundingBox":[30.2483403,30.253143,-97.7736188,-97.770486]}}'::jsonb);

-- Group: Capoeira Evolução
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('6368c9e8-6818-4feb-b282-4f3697a9fbe3', NOW(), NOW(), 'Capoeira Evolução', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Metido (Alex Rodriguez)
Main Contact: Contra Mestre Metido - 512-715-4373
Notes: Austin, Texas. Contra Mestre Metido (Alex Rodriguez) under Mestre Rodrigo Zerlotti. Full schedule of classes. See website. LINEAGE: Betinho>Mestre Bimba > Mestre Suassuna>Mestre Jurema >MestreWilton Pereira >Mestre Rodrigo Zerlotti. SOURCE: website 7/24/19', 'alex@capoeiraevolucao.com', '[{"type":"website","url":"http://www.capoeiraevolucao.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d56ace24-51a3-4b5c-b42e-67aef565b205', '6368c9e8-6818-4feb-b282-4f3697a9fbe3', 'Capoeira Evolução', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.7679494,30.2153029]},"properties":{"address":"4619 South Congress Avenue, Austin, TX 78745","displayName":"4619, South Congress Avenue, St. Elmo, Austin, Travis County, Texas, 78745, United States of America","countryCode":"US","boundingBox":[30.214896,30.2155227,-97.7683269,-97.7675751]}}'::jsonb);

-- Group: Capoeira Luanda- Austin
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ef813d53-8af4-4e08-863c-e6add0d084f4', NOW(), NOW(), 'Capoeira Luanda- Austin', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Austin, Texas. SOURCE: website 7/30/19', NULL, '[{"type":"website","url":"http://austincapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('265ed432-30cb-4448-8144-8f67ce92fe18', 'ef813d53-8af4-4e08-863c-e6add0d084f4', 'Austin Recreation Center', 'Schedule: Mon 6:00-7:30pm; Thursday 7:30-9:00pm; Music: Sat 9:00-10:30am
Phone: 512-827-7618
Email: info@austincapoeira.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.7489593,30.2782451]},"properties":{"address":"1301 Shoal Creek Blvd, Austin, TX 78701","displayName":"Austin Recreation Center, 1301, Shoal Creek Boulevard, Austin, Travis County, Texas, 78701, United States of America","countryCode":"US","boundingBox":[30.2781172,30.2785067,-97.7491567,-97.7488019]}}'::jsonb);

-- Group: Raça em Movimento
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b0af721c-95d1-4e79-ba07-75dc866e7df5', NOW(), NOW(), 'Raça em Movimento', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Graveto (Tyrone Phelipa)
Main Contact: Professor Graveto - +1[956] 371 1666
Notes: Brownsville, McAllen, Texas. Professor Graveto (Tyrone Phelipa) under Mestre Efraim[New Haven CT]. Next to the Kuk Sool Won Academy, across from Lotus Chinese Restaurant. SOURCE: website 8/4/19', 'professor.graveto@southtexascapoeira.com', '[{"type":"website","url":"http://www.southtexascapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('00443557-2c01-4617-b5fa-0e836ec6fc77', 'b0af721c-95d1-4e79-ba07-75dc866e7df5', 'Raça em Movimento', 'Schedule: Kids Group 1: Tues & Thurs 5:00-5:45pm; Kids Group 2: Tues & Thurs 5:45-630pm; Adults Fundamentals: Tues & Thurs 6:30-7:00pm; Adults: 7:00-8:30pm; All ages Review:Sat 5:00-5:45pm; All ages Muisic: Sat 6:30-7:00pm; All ages Acrobatics: Sat 5:45-630pm; All ages Roda: Sat 5;30-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.4963908,25.9800881]},"properties":{"address":"1601 E Alton Gloor Blvd, Brownsville, TX 78526","displayName":"East Alton Gloor Boulevard, Brownsville, Cameron County, Texas, 78526, United States of America","countryCode":"US","boundingBox":[25.9793024,25.9808411,-97.5046322,-97.4881675]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('423532bc-1430-452a-b73a-9df8204e6239', 'b0af721c-95d1-4e79-ba07-75dc866e7df5', 'Eternamente Bella Spa', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-98.2368903,26.2024525]},"properties":{"address":"217 S. 16th St. McAllen, TX","displayName":"217, South 16th Street, College Heights, McAllen, Hidalgo County, Texas, 78501, United States of America","countryCode":"US","boundingBox":[26.2024025,26.2025025,-98.2369403,-98.2368403]}}'::jsonb);

-- Group: Fort Worth Capoeira Regional
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e09e3ad5-17dd-4470-83a9-a4365ade3628', NOW(), NOW(), 'Fort Worth Capoeira Regional', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Borboleta (Lindsay Puente)
Main Contact: Professora Borboleta - 817-586-2146
Notes: Dallas-Ft. Worth, Texas. Professora Borboleta (Lindsay Puente). SOURCE: email 3/19/16', 'ftwcapo@gmail.com', '[{"type":"website","url":"http://www.ftwcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4a8f53e6-f407-461f-9ef7-037b0498551d', 'e09e3ad5-17dd-4470-83a9-a4365ade3628', 'Fort Worth Capoeira Regional', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-97.3327459,32.753177]},"properties":{"address":"Fort Worth, TX 76110","displayName":"Fort Worth, Tarrant County, Texas, United States of America","countryCode":"US","boundingBox":[32.551584,33.049529,-97.592388,-97.0335808]}}'::jsonb);

-- Group: Os Malandros de Mestre Touro -Capoeira Angola de São Bento Grande
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8110c83b-30d3-4f3e-8443-09c946126f55', NOW(), NOW(), 'Os Malandros de Mestre Touro -Capoeira Angola de São Bento Grande', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Preto Velho (Dennis Newsome)
Main Contact: Zumbi Malandro - 972-415-5103
Notes: Dallas, Texas. Under Mestre Preto Velho (Dennis Newsome) [San Diego]. Zumbi Malandro. SOURCE: website 3/20/16', 'info@dallasmalandros.com', '[{"type":"website","url":"http://www.dallasmalandros.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e42e3d44-d88e-430f-8001-2ba527344e4c', '8110c83b-30d3-4f3e-8443-09c946126f55', 'South Dallas Cultural Center', 'Schedule: Tues & Thurs 7:00-8:45pm; Sat 10:00am-12:00pm
Phone: [214] 939 2787', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-96.7574052,32.771362]},"properties":{"address":"3400 S. Fitzhugh, Dallas, Texas 76210","displayName":"South Dallas Cultural Center, 3400, South Fitzhugh Avenue, Wheatley Place Historic District, Dallas, Dallas County, Texas, 75210, United States of America","countryCode":"US","boundingBox":[32.7710161,32.7716707,-96.7576773,-96.7570244]}}'::jsonb);

-- Group: Capoeira Resistência
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('37e9d8b7-04e2-4ec8-b212-a0af537a7657', NOW(), NOW(), 'Capoeira Resistência', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Molejo (Diogo Rodrigues da Costa Oliveira)
Main Contact: Professor Molejo - 469.734.8281
Notes: Dallas, Texas. Professor Molejo (Diogo Rodrigues da Costa Oliveira) under Mestre Panão[Richmond]. SOURCE: website 3/24/16', NULL, '[{"type":"website","url":"http://www.capoeiraallen.blogspot.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9c836dea-1730-4252-9c15-290ff2a03746', '37e9d8b7-04e2-4ec8-b212-a0af537a7657', 'Capoeira Resistência', 'Schedule: Adults: Mon-Thurs 3:00-4:00pm, 7:00-7:50pm, 7:50-8:40pm 8:40-9:40pm; Sat 1:00-2:00pm; Kids: Mon-Thurs 4:00-4:45 pm, 4:45-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-96.6580883,33.1056144]},"properties":{"address":"410 N. Greenville Ave - - Allen, TX 75002","displayName":"410, North Greenville Avenue, Allen, Collin County, Texas, 75002, United States of America","countryCode":"US","boundingBox":[33.1055644,33.1056644,-96.6581383,-96.6580383]}}'::jsonb);

-- Group: United Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f4b0b872-2552-422a-869c-dfa6369e7f92', NOW(), NOW(), 'United Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: El Paso, Texas. United Capoeira Association. SOURCE: website 4/10/19', NULL, '[{"type":"website","url":"https://www.capoeiraelpaso.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('394a50ab-44d2-4ea4-93a3-f6a73727e8ab', 'f4b0b872-2552-422a-869c-dfa6369e7f92', 'SoL Studio', 'Phone: [915] 996-1814
Email: ucaelpaso@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-106.4432986,31.7835557]},"properties":{"address":"4106 Montana Ave El Paso, TX 79903","displayName":"4106, Montana Avenue, El Paso, El Paso County, Texas, 79903, United States of America","countryCode":"US","boundingBox":[31.7835057,31.7836057,-106.4433486,-106.4432486]}}'::jsonb);

-- Group: Centro Cultural Aruandê Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5e0fabba-7aa4-4d1d-b3ec-0ee513a00da1', NOW(), NOW(), 'Centro Cultural Aruandê Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Demetrius (Demétrius Pereira Dos Santos)
Main Contact: Mestre Demetrius - +1-832-303-0319
Notes: Houston, Spring, Texas. Mestre Demetrius (Demétrius Pereira Dos Santos). SOURCE: website 8/11/19', 'capoeira@aruande.com', '[{"type":"website","url":"https://www.zumzumzum.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9365c2b6-f4a3-4cca-aced-3b8b500ae9de', '5e0fabba-7aa4-4d1d-b3ec-0ee513a00da1', 'Danz Fit X', 'Schedule: Ages 12 and under: 5:00pm Thurs & Sat; Ages 12 & up: 8:15pm Tues, Thurs & Sat', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-95.6450369,29.8056946]},"properties":{"address":"6110 N. Hwy 6, Houston, TX 77084","displayName":"North Highway 6, Addicks, Houston, Harris County, Texas, 77084, United States of America","countryCode":"US","boundingBox":[29.7980892,29.8132865,-95.6453897,-95.644945]}}'::jsonb);

-- Group: Capoeira Luanda
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ce448a50-428b-49e1-b902-b46322e1b8bf', NOW(), NOW(), 'Capoeira Luanda', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Gringo (Mauricio Campos)
Notes: Houston, Texas. Gringo (Mauricio Campos) under Mestre Jelon Viera. See website for schedule. SOURCE: website 3/23/13', NULL, '[{"type":"website","url":"http://brazilianarts.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('55c0beb7-b1aa-42ee-8508-20c467b6f18a', 'ce448a50-428b-49e1-b902-b46322e1b8bf', 'Brazilian Arts Foundation', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-95.3745185,29.7905406]},"properties":{"address":"316 Pecore St, Houston TX, 77009","displayName":"316, Pecore Street, Woodland Heights, Houston Heights, Houston, Harris County, Texas, 77009, United States of America","countryCode":"US","boundingBox":[29.7904906,29.7905906,-95.3745685,-95.3744685]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('24f56649-30e1-4815-878f-2379d646c5f9', 'ce448a50-428b-49e1-b902-b46322e1b8bf', 'Midtown Park', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-95.3759601,29.7445057]},"properties":{"address":"2811 Travis Street, Houston, Texas 77006","displayName":"2811, Travis Street, Midtown, Houston, Harris County, Texas, 77006, United States of America","countryCode":"US","boundingBox":[29.7444557,29.7445557,-95.3760101,-95.3759101]}}'::jsonb);

-- Group: Kalunga N'Golo
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a984ab11-0dbc-4e9e-9446-3ff2a45c7dff', NOW(), NOW(), 'Kalunga N''Golo', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Ezell, Marrio, Osakwe - [832] 814-8928, [512] 909-0892, [832] 971-2395
Notes: Houston, Texas. Ezell: [832] 814-8928, Marrio: [512] 909-0892, Osakwe [832] 971-2395. SOURCE: website 3/2/13', NULL, '[{"type":"website","url":"http://www.ngolohouston.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8a0acfe6-bf1b-42f6-b975-f5517b4d0651', 'a984ab11-0dbc-4e9e-9446-3ff2a45c7dff', 'Shape Community Center - Family Center', 'Schedule: Wed 7:30-9:00pm Sat 1:00-3:00pm, Sun 2:00-4:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-95.3663875,29.7290807]},"properties":{"address":"3815 Live Oak Street Houston, TX 77004","displayName":"Shape Community Center, 3815, Live Oak Street, Washington Terrace, Third Ward, Houston, Harris County, Texas, 77004, United States of America","countryCode":"US","boundingBox":[29.728918,29.7292411,-95.3665873,-95.3661878]}}'::jsonb);

-- Group: Central Cultural Aruandê Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('723804e0-a0e9-42dd-ab63-967bce59c805', NOW(), NOW(), 'Central Cultural Aruandê Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADO Violão (Carlos A. Morales, Jr.)
Main Contact: Graduado Violão - [956] 220 - 7449 / [956] 319 - 4133
Notes: Laredo, Texas. Graduado Violão (Carlos A. Morales, Jr.). SOURCE: websites 8/118/19', 'info@moralesfpa.com', '[{"type":"website","url":"https://www.zumzumzum.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a03487b7-81ed-4bec-a1c9-820530409892', '723804e0-a0e9-42dd-ab63-967bce59c805', 'Morales Fine & Performaning Arts', 'Schedule: Beg./Adv. [All Ages]: Mon & Wed 6:00-7:30 p.m.', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-99.4998491,27.5580792]},"properties":{"address":"800 E Mann Rd, Laredo, TX 78041","displayName":"East Mann Road, Nye, Laredo, Webb County, Texas, 78041, United States of America","countryCode":"US","boundingBox":[27.5567322,27.5594231,-99.5032525,-99.4964444]}}'::jsonb);

-- Group: Capoeira Luanda San Antonio
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('339cac28-e469-4256-97e1-b0546614f548', NOW(), NOW(), 'Capoeira Luanda San Antonio', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: San Antonio, Texas. SOURCE website 8/19/19', NULL, '[{"type":"website","url":"http://www.capoeiratexas.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('09ad143b-2199-47bc-a158-050f7c06e591', '339cac28-e469-4256-97e1-b0546614f548', 'Capoeira Luanda San Antonio', 'Schedule: Music: Mon 7:00-8:00pm; Adults Tues & Thurs 7:00-8:00pm: Sat 2:00-4:00pm; Children: Wed 6:30pm-7:30pm; Sat 1:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-98.5048533,29.4511045]},"properties":{"address":"925 West Russell Pl, San Antonio TX 78212","displayName":"925, West Russell Place, Alta Vista, San Antonio, Bexar County, Texas, 78212, United States of America","countryCode":"US","boundingBox":[29.4510545,29.4511545,-98.5049033,-98.5048033]}}'::jsonb);

-- Group: CapuraGinga Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cc3426f9-84e6-4071-b792-9aa671c05432', NOW(), NOW(), 'CapuraGinga Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITOR Advogado (Nathan Sparrow)
Main Contact: Monitor Advogado - 210-535-4577
Notes: San Antonio, Texas. Monitor Advogado (Nathan Sparrow) under Mestre Loka. SOURCE: website 8/19/19', 'info@go-cap.com', '[{"type":"website","url":"http://www.go-cap.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b1a6e589-4aea-4911-8441-5ac022f76781', 'cc3426f9-84e6-4071-b792-9aa671c05432', 'CapuraGinga Capoeira', 'Schedule: Beg Kids Tues & Thurs 5:00pm; Adv Kids: Mon & Wed 6:00pm; Beg Adults: Tues & Thurs 6:00pm; Adults: Mon, Wed, & Fri 6:00am; Sat 10:am; Ad/Inter Adults: Mon, Tues & Wed7:00pm; RODA Thurs: 7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-98.5259367,29.5144559]},"properties":{"address":"8005 West Avenue, San Antonio TX 78213","displayName":"West Avenue, San Antonio, Bexar County, Texas, 78213, United States of America","countryCode":"US","boundingBox":[29.5141143,29.5147974,-98.5259399,-98.5259334]}}'::jsonb);

-- Group: Mao no Chao Capoeira Angola Glasgow
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('22748128-6e5e-4c02-9a1b-7dad4be01a1d', NOW(), NOW(), 'Mao no Chao Capoeira Angola Glasgow', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Associated with Mestre Marrom e Alunos [Rio de Janiero]. SOURCE: website 12/29/19', NULL, '[{"type":"website","url":"https://maonochao.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f0a4a0b0-1d82-4f1e-b9fb-9b32a2a33568', '22748128-6e5e-4c02-9a1b-7dad4be01a1d', 'Overnewton Recreation Centre', 'Schedule: Thurs 7:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.2909928,55.8658667]},"properties":{"address":"2 Overnewton Square, Glasgow, G3 8RW","displayName":"Overnewton Square, Stobcross, Kelvinhaugh, Glasgow, Glasgow City, Alba / Scotland, G3 8TW, United Kingdom","countryCode":"GB","boundingBox":[55.8658586,55.8658747,-4.2912315,-4.290754]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1b6ee357-0e3f-42f5-bcc5-591fc2358e2f', '22748128-6e5e-4c02-9a1b-7dad4be01a1d', 'Garnethill Multicultural Centre', 'Schedule: Kids and adults, Mon 7.30-9.30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.2616269,55.866268]},"properties":{"address":"21 Rose Street, Glasgow","displayName":"Garnethill Multicultural Comunity Centre, 21, Rose Street, Garnethill, Glasgow, Glasgow City, Alba / Scotland, G3 6RE, United Kingdom","countryCode":"GB","boundingBox":[55.8661786,55.8663572,-4.2617428,-4.2615101]}}'::jsonb);

-- Group: Grand Rapids Capoeira - West Michigan Cordao de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9656828f-9864-4473-93a9-8eb72c65bdee', NOW(), NOW(), 'Grand Rapids Capoeira - West Michigan Cordao de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITOR Talento
Notes: Under the supervision of Instrutor Show Grande. Allendale. SOURCE: website 7/29/18', 'talentocdo@gmail.com', '[{"type":"website","url":"https://www.grcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('75b3cf04-3275-4583-ac89-376a689c4bbc', '9656828f-9864-4473-93a9-8eb72c65bdee', 'Armentality Movement Arts Center', 'Schedule: All Levels: Tues 7:15-8:30pm; Family Classes: 3rd Sat 3:00-4:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-85.6804535,42.9633171]},"properties":{"address":"233 E Fulton, Grand Rapids, MI","displayName":"Fulton Street West, Grand Rapids, Kent County, Michigan, 49503, United States of America","countryCode":"US","boundingBox":[42.9633023,42.96339,-85.681517,-85.679385]}}'::jsonb);

-- Group: Capoeira MarAzul
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4dc95d8a-14c8-4b0d-afda-3b600478f89a', NOW(), NOW(), 'Capoeira MarAzul', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Joãozinho (Joãozinho da Figueira)
Main Contact: Suzannah - [+44] 07731 833 819
Notes: Mestre''s phone (Portuguese only): [+44] 0787 119 3871. SOURCE: website 10/25/16', 'info@marazul.co.uk', '[{"type":"website","url":"http://www.marazul.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ed19ff44-a24d-454d-94e6-a61c522932bc', '4dc95d8a-14c8-4b0d-afda-3b600478f89a', 'Highfield Residents Gardens Pavilion', 'Schedule: Children: Tues 4.00-4.45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.3951985,50.9275054]},"properties":{"address":"13 Abbotts Way, Southampton, SO17 1QU","displayName":"13, Abbotts Way, Portswood Park, Portswood, Southampton, England, SO17 1NU, United Kingdom","countryCode":"GB","boundingBox":[50.9274368,50.9275911,-1.3953024,-1.3950761]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('46a71d61-97e0-4b5a-9cb8-792251afd810', '4dc95d8a-14c8-4b0d-afda-3b600478f89a', 'The Café', 'Schedule: Adults Movement & Music: Mon 5:00-7:00; Wed 6:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.3974844,50.9341804]},"properties":{"address":"University of Southampton Students Union, Southampton, SO17 1BJ, UK","displayName":"University of Southampton Students'' Union (SUSU), Courtyard, Highfield, Southampton, England, SO17 1BJ, United Kingdom","countryCode":"GB","boundingBox":[50.9337731,50.9345962,-1.3981197,-1.3968993]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7115379e-7871-4348-b579-de14a9db51e0', '4dc95d8a-14c8-4b0d-afda-3b600478f89a', 'Activities Studio', 'Schedule: Adults Movement & Music Sun 12:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.3974844,50.9341804]},"properties":{"address":"University of Southampton Students Union, Southampton, SO17 1BJ, UK","displayName":"University of Southampton Students'' Union (SUSU), Courtyard, Highfield, Southampton, England, SO17 1BJ, United Kingdom","countryCode":"GB","boundingBox":[50.9337731,50.9345962,-1.3981197,-1.3968993]}}'::jsonb);

-- Group: Origens do Brasil Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('396086ef-0b3a-4e7d-85ea-327fd5b97c56', NOW(), NOW(), 'Origens do Brasil Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Bia (Beatriz Viana Rosa)
Main Contact: - [0044]07729133051
Notes: Under Mestre Adelmo [Sao Paulo]. New website 10/30/18. KIDS CLASS ARE IN BLOCKS AND MUST BE BOOKED IN ADVANCE. Additional contacts: Aluno Graduado Rob (+44 7989 542595, robertjkeit@outlook.com), Aluna Graduada Voltagem (+44 7876 736390, docvoltagem@gmail.com). SOURCE: website 11/12/16', 'bia_origens@hotmail.com', '[{"type":"website","url":"http://www.ajitucapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bb411842-92e9-4f4d-9102-287441ce9a83', '396086ef-0b3a-4e7d-85ea-327fd5b97c56', 'Pavilion Dance South West', 'Schedule: Mon 7.15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.8759707,50.7187029]},"properties":{"address":"Bournemouth, Westover Road, BH1 2BU","displayName":"Bournemouth Aviary, 26-29, Westover Road, Lansdowne, West Cliff, Bournemouth, Bournemouth, Christchurch and Poole, England, BH1 2BU, United Kingdom","countryCode":"GB","boundingBox":[50.7186529,50.7187529,-1.8760207,-1.8759207]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9088cebe-4d7d-470d-89b4-70edcbb7d59b', '396086ef-0b3a-4e7d-85ea-327fd5b97c56', 'BH Live', 'Schedule: Adults: Thurs 20.00; Sat 11.00 Kids Class', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.8456749,50.7371626]},"properties":{"address":"Queens Park South Drive BH8 9BJ","displayName":"Queen''s Park South Drive, Springbourne, Bournemouth, Bournemouth, Christchurch and Poole, England, BH8 9BJ, United Kingdom","countryCode":"GB","boundingBox":[50.7366953,50.7371651,-1.8468618,-1.844606]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e21c5654-171c-4c5b-ae8e-751a6760fd57', '396086ef-0b3a-4e7d-85ea-327fd5b97c56', 'The City of Portsmouth Girls'' School', 'Schedule: Adults: Mon 7.15pm; Kids: Mon 6.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.071864,50.8032249]},"properties":{"address":"St Marys Road, Portsmouth, PO1 5PF, UK","displayName":"St Marys Road, Kingston, Fratton, Portsmouth, England, PO1 5PJ, United Kingdom","countryCode":"GB","boundingBox":[50.8029077,50.8040957,-1.0763874,-1.0672615]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f6d825c4-b43c-4688-9dd7-340c5afe2687', '396086ef-0b3a-4e7d-85ea-327fd5b97c56', 'Cantell School', 'Schedule: Kids: Tues 5.45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.3975873,50.9409368]},"properties":{"address":"Violet road, Southampton, SO16 3GJ","displayName":"Violet Road, Glen Eyre, Southampton, England, SO16 3GS, United Kingdom","countryCode":"GB","boundingBox":[50.9405508,50.9410683,-1.3982153,-1.3970812]}}'::jsonb);

-- Group: Group Senzala
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('65500a65-3a96-4350-a5af-1411180dbe9a', NOW(), NOW(), 'Group Senzala', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Sanhaco (Julio Cesar Alves de Oliveira)
Main Contact: - 07834 553975
Notes: A student of Mestre Peixinho. Time not on current website as of 10/26/16. SOURCE: website 11/6/09, 10/26/16', NULL, '[{"type":"website","url":"http://senzala-london.co.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('063d3f38-2a52-462e-96ad-d19d951d7f27', '65500a65-3a96-4350-a5af-1411180dbe9a', 'Fitness First, Unit 17', 'Schedule: Wed 8.00-9.15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3406679,51.7510497]},"properties":{"address":"St Albans, AL3 5DQ, UK","displayName":"Cancer Research UK, 15A, High Street, St Stephens, St Albans, Hertfordshire, England, AL3 4ED, United Kingdom","countryCode":"GB","boundingBox":[51.7509997,51.7510997,-0.3407179,-0.3406179]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('91564787-fdd4-40a5-bb0a-57e704089391', '65500a65-3a96-4350-a5af-1411180dbe9a', 'Hatfield University - Sports Hall 2', 'Schedule: Mon 9.00-10.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.249154,51.7613981]},"properties":{"address":"de Havilland Campus, Hatfield, AL10 9EU","displayName":"University of Hertfordshire, de Havilland Campus, Cunningham Avenue, Hatfield Business Park, Hatfield, Welwyn Hatfield, Hertfordshire, England, AL10 9LR, United Kingdom","countryCode":"GB","boundingBox":[51.7592396,51.7635586,-0.2568514,-0.2438553]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c90888c8-adce-4c04-b861-71f481d70037', '65500a65-3a96-4350-a5af-1411180dbe9a', 'Hutton Hall', 'Schedule: Wed 6.00-7.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2390498,51.7517443]},"properties":{"address":"College Lane, Hatfield, AL10 9AB","displayName":"University of Hertfordshire, College Lane Campus, Roehyde Way, Nast Hyde, Hatfield, Welwyn Hatfield, Hertfordshire, England, AL4 0PJ, United Kingdom","countryCode":"GB","boundingBox":[51.7480625,51.7549097,-0.2444839,-0.234031]}}'::jsonb);

-- Group: Grupo Capoeira Brasil Hong Kong
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2509bc0d-b480-4d73-b32f-3d8fe287bd6f', NOW(), NOW(), 'Grupo Capoeira Brasil Hong Kong', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - +852 9197 4429
Notes: Classes also in Mong Kok, Wan Chai, and Tsuen Wan. SOURCE: website facebook 3/8/17', 'info@capoeira.hk', '[{"type":"website","url":"http://capoeira.hk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('adf027fe-5d8b-44e3-aac4-f91136e50ca9', '2509bc0d-b480-4d73-b32f-3d8fe287bd6f', 'Capri Building', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[114.173653,22.3031362]},"properties":{"address":"130 Austin Road, Tsim Sha Tsui, Kowloon, Hong Kong","displayName":"嘉碧大廈 Capri Building, 130, 柯士甸道 Austin Road, 官涌 Kwun Chung, 尖沙咀 Tsim Sha Tsui, 油尖旺區 Yau Tsim Mong District, 九龍 Kowloon, 香港 Hong Kong, 中国","countryCode":"CN","boundingBox":[22.3030731,22.3032872,114.1736021,114.1736993]}}'::jsonb);

-- Group: Capoeira Mandinga Aotearoa
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5c5e6029-ae62-4ed9-888d-61dc2850c6c1', NOW(), NOW(), 'Capoeira Mandinga Aotearoa', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Brabo (Grant Cole)
Main Contact: Colette Hanley - 0273242688
Notes: New Zealand. PO Box 68403 Newton, Auckland. Additional Facebook: http://www.facebook.com/groups/capoeiraotautahi/. SOURCE: website 2/9/17', 'capoeira@capoeira.org.nz', '[{"type":"website","url":"http://www.capoeira.org.nz/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('805ebd30-8303-4519-adba-0c1f50b93ace', '5c5e6029-ae62-4ed9-888d-61dc2850c6c1', 'National Academy', 'Schedule: Full schedule of classes
Phone: 027 327 9716 or 06 752 4065
Email: taranaki@capoeira.org.nz', '{"type":"Feature","geometry":{"type":"Point","coordinates":[174.7566876,-36.8622298]},"properties":{"address":"29 Randolph St, Newton, Auckland","displayName":"29, Randolph Street, Newton, Eden Terrace, Waitematā, Auckland, 1002, New Zealand / Aotearoa","countryCode":"NZ","boundingBox":[-36.8622798,-36.8621798,174.7566376,174.7567376]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1601a28c-da03-445b-8253-a56ec61f0c24', '5c5e6029-ae62-4ed9-888d-61dc2850c6c1', 'Central Primary School Hall', 'Phone: 0226800801
Email: capoeira@capoeira.org.nz', '{"type":"Feature","geometry":{"type":"Point","coordinates":[174.082271,-39.0592113]},"properties":{"address":"Pendarves Street, New Plymouth, New Zealand","displayName":"Pendarves Street, Strandon, New Plymouth, New Plymouth District, Taranaki, 4310, New Zealand / Aotearoa","countryCode":"NZ","boundingBox":[-39.0605825,-39.0578233,174.077738,174.0867983]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1214c7d6-3b7e-4462-a994-81d468723db3', '5c5e6029-ae62-4ed9-888d-61dc2850c6c1', 'Aro Valley community center', 'Schedule: Mon 6:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[174.7688892,-41.2953096]},"properties":{"address":"48 Aro St; Wellington","displayName":"Aro Valley Preschool, 48, Aro Street, Aro Valley, Wellington, Wellington City, Wellington, 6040, New Zealand / Aotearoa","countryCode":"NZ","boundingBox":[-41.2953757,-41.2952366,174.7686367,174.7689955]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('842738a3-d4a1-4208-9cca-0d25b69cb572', '5c5e6029-ae62-4ed9-888d-61dc2850c6c1', 'Thistle Hall', 'Schedule: Thurs 6:00-8:00pm
Email: Stephen@vital.org.nz', '{"type":"Feature","geometry":{"type":"Point","coordinates":[174.7736646,-41.2973613]},"properties":{"address":"293 Cuba St, Wellington","displayName":"Thistle Hall, 293, Cuba Street, Mount Cook, Wellington, Wellington City, Wellington, 6040, New Zealand / Aotearoa","countryCode":"NZ","boundingBox":[-41.2974325,-41.2972782,174.7735252,174.7738041]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1266949c-ed4f-4089-ad54-30401435e86f', '5c5e6029-ae62-4ed9-888d-61dc2850c6c1', 'White Elephant HQ', 'Schedule: Tues & Thurs 6:00-8:00pm
Phone: 021774426', '{"type":"Feature","geometry":{"type":"Point","coordinates":[172.6550987,-43.5356106]},"properties":{"address":"442 Tuam Street. Christchurch","displayName":"442, Tuam Street, Phillipstown, Christchurch, Christchurch City, Canterbury, 8011, New Zealand / Aotearoa","countryCode":"NZ","boundingBox":[-43.5356606,-43.5355606,172.6550487,172.6551487]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3a27532f-086e-4e1a-95f1-e84d14dab45b', '5c5e6029-ae62-4ed9-888d-61dc2850c6c1', 'Taipa area school hall', 'Schedule: Tue & Wed, 4:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[173.9470106,-35.3755091]},"properties":{"address":"Northland","displayName":"Northland, New Zealand / Aotearoa","countryCode":"NZ","boundingBox":[-36.5586286,-34.1935434,172.3928404,174.9935714]}}'::jsonb);

-- Group: Miami Capoeira Sol e Lua-United Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3d828ae2-d32a-490f-b10a-fe6878616eeb', NOW(), NOW(), 'Miami Capoeira Sol e Lua-United Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRA Índia
Main Contact: - 305-332-1636
Notes: Miami Dade County, Florida. SOURCE: website 10/4/17', 'indiauca@gmail.com', '[{"type":"website","url":"http://www.miamicapoeirasolelua.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d576b873-b8b8-447f-a9c6-6f0b4071cdf2', '3d828ae2-d32a-490f-b10a-fe6878616eeb', 'Miami location', 'Schedule: Full schedule of classes', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.2308184,25.7578202]},"properties":{"address":"2200 SW 16th St Miami Fl 33145","displayName":"2200, Southwest 16th Street, Miami, Miami-Dade County, Florida, 33145, United States of America","countryCode":"US","boundingBox":[25.7577702,25.7578702,-80.2308684,-80.2307684]}}'::jsonb);

-- Group: Cordão de Ouro Miami
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('975841eb-511f-43b5-b85a-f19f717a7b3c', NOW(), NOW(), 'Cordão de Ouro Miami', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTORA Rebelde
Main Contact: - 305 606 9191
Notes: Miami Dade County, Florida. Under Contra Mestre Espirrinho. Professora Casca Dura "Tania de Jesus" is living in Pembroke Pines, but does not appear to be teaching (facebook 11/5/17). SOURCE: webpage 11/3/17', 'rebeldecdo@gmail.com', '[{"type":"website","url":"https://cdomiami.wordpress.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('08cee10e-a461-46f2-b9e9-d6535fc88230', '975841eb-511f-43b5-b85a-f19f717a7b3c', 'Little Haiti Cultural Center', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.1914299,25.8301861]},"properties":{"address":"212 NE 59th Terrace, Miami, FL","displayName":"Little Haiti Cultural Center, 212, Northeast 59th Terrace, Little Haiti, Bayshore, Miami, Miami-Dade County, Florida, 33137, United States of America","countryCode":"US","boundingBox":[25.8298759,25.8304927,-80.1915825,-80.1911011]}}'::jsonb);

-- Group: Morro Verde Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('22355904-ff26-44de-8f25-d5d46f631825', NOW(), NOW(), 'Morro Verde Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRA Gata Brava (Leigh Robinson)
Main Contact: - [858] 688-0316
Notes: New Hope, PA. Under Mestre Doutor. Estagiário Rolha "Corky Brown" (galaxyblur@gmail.com, [856] 237-930m). SOURCE: website 4/3/19', 'gatabravacapoeira@gmail.com', '[{"type":"website","url":"http://www.newhopecapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('581889c2-0505-4478-8269-f4bd4ac4cdd8', '22355904-ff26-44de-8f25-d5d46f631825', 'New Hope location', 'Schedule: Adults: Mon 7:30-9:00pm; Tues 6:30-8:00pm; Thurs 7:00-8:30pm; Music: Wed 5:30-6:30pm; Kids 6 and up: Tues 5:30-6:30pm; Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.9512785,40.3642728]},"properties":{"address":"New Hope, PA 18938","displayName":"New Hope, Bucks County, Pennsylvania, United States of America","countryCode":"US","boundingBox":[40.3497411,40.3735144,-74.9685192,-74.9454628]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dbd2899a-1d60-4fd6-ad78-7de51114f56b', '22355904-ff26-44de-8f25-d5d46f631825', 'New Hope Fitness', 'Schedule: Wed 12:00-1:00pm (Please contact if you''re interested in this class)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.9757146,40.3559836]},"properties":{"address":"6542-K Lower York Road, New Hope, PA 18938","displayName":"New Hope Fitness, 6542, Lower York Road, Reeder, New Hope, Bucks County, Pennsylvania, 18938, United States of America","countryCode":"US","boundingBox":[40.3557761,40.356188,-74.9759667,-74.9754678]}}'::jsonb);

-- Group: ASCAB [Associacao Santista de Capoeira Areia Branca]
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('39286a9d-64b3-45ee-8ab4-0fcf0252f8fd', NOW(), NOW(), 'ASCAB [Associacao Santista de Capoeira Areia Branca]', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Doutor (Adenilson dos Santos)
Main Contact: - 215-601-9117
Notes: Philadelphia, PA. Formado Canguru "Antonio Marcos Correa" - Website offline 6/28/19, 2l5-9OO-977O, email has been disabled 7/3/19 (SOURCE: website 6/27/06). SOURCE: website 6/29/19', NULL, '[{"type":"website","url":"http://www.projectcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('14b108a8-9087-4d32-88bb-b48b3dd2a8a8', '39286a9d-64b3-45ee-8ab4-0fcf0252f8fd', 'Philadelphia Capoeira Arts Center', 'Schedule: Full Schedule of classes, kids teens beginners all levels. See website for details', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-75.1595353,39.9559105]},"properties":{"address":"1213 Race Street, Philadelphia, PA 19107","displayName":"1213, Race Street, Chinatown, Fashion District Philadelphia, Center City, Philadelphia, Philadelphia County, Pennsylvania, 19107, United States of America","countryCode":"US","boundingBox":[39.9558605,39.9559605,-75.1595853,-75.1594853]}}'::jsonb);

-- Group: ICAF-Philadelphia Chapter
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d9be2192-7d85-47c9-887f-2f3e8a53d116', NOW(), NOW(), 'ICAF-Philadelphia Chapter', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 215.500.5987
Notes: Philadelphia, PA. SOURCE: website 6/29/19', 'Info@ficaphiladelphia.org', '[{"type":"website","url":"http://www.ficaphiladelphia.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7cadab31-83b4-460b-91d5-cbbebb291525', 'd9be2192-7d85-47c9-887f-2f3e8a53d116', 'Martin Luther King Recreation Center', 'Schedule: Classes Tues & Thurs 6:30-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-75.1651867,39.9796396]},"properties":{"address":"22nd Street & Cecil B. Moore Avenue Philadelphia","displayName":"Cecil B Moore Avenue, Sharswood, North Philadelphia, Philadelphia, Philadelphia County, Pennsylvania, 19121, United States of America","countryCode":"US","boundingBox":[39.9786738,39.9806198,-75.1724979,-75.1578703]}}'::jsonb);

-- Group: Capoeira Angola of Mestre João Grande
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8212b8cb-6b93-45f9-bfe4-56d2e5e87d70', NOW(), NOW(), 'Capoeira Angola of Mestre João Grande', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Chris Young
Notes: Pittsburgh, PA. Kung Fu. "Chris Young." under Mestre João Grande [New York]. SOURCE: email website 7/3/19', NULL, '[{"type":"website","url":"http://www.steel-dragon.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('05fe7faf-8232-4d68-b872-df1c5e22abe4', '8212b8cb-6b93-45f9-bfe4-56d2e5e87d70', 'Steel Dragon Kung Fu', 'Schedule: Adults Fri 7:00-9:00pm; Sun 3:00-5:00pm; Kids: Mon & Wed 5:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.964289,40.473366]},"properties":{"address":"100 43rd St, Pittsburgh, PA 15201","displayName":"100, 43rd Street, Lawrenceville, Central Lawrenceville, Pittsburgh, Allegheny County, Pennsylvania, 15201, United States of America","countryCode":"US","boundingBox":[40.473316,40.473416,-79.964339,-79.964239]}}'::jsonb);

-- Group: Ecole d'Arts Martiaux Bresiliens de Laval
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c260610e-e4ff-424b-b3f5-250dbd53674b', NOW(), NOW(), 'Ecole d''Arts Martiaux Bresiliens de Laval', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Perninha (Vitor Silva Dos Santos)
Main Contact: - +1 514-814-4530
Notes: Laval, Quebec, Canada. SOURCE: website 3/22/17, email 7/30/12', 'info@ecolecapoeiralaval.com', '[{"type":"website","url":"https://www.ecolecapoeiralaval.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('98fa6575-6061-4a33-841f-f584323dd53c', 'c260610e-e4ff-424b-b3f5-250dbd53674b', 'Laval location', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.6985976,45.5670147]},"properties":{"address":"103 Boulevard de la Concorde Ouest, Laval, QC, H7N 1H8, Canada","displayName":"103, Boulevard de la Concorde Ouest, Laval-des-Rapides, Laval (région administrative), Québec, H7N 2C8, Canada","countryCode":"CA","boundingBox":[45.5669647,45.5670647,-73.6986476,-73.6985476]}}'::jsonb);

-- Group: Grupo Forca Rara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('411dab03-8ee5-4342-b4a0-02f64b4c0a3b', NOW(), NOW(), 'Grupo Forca Rara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Ninja (Luis Felipe Pinto)
Notes: Lenexa, Kansas. Under Mestre Saracura, Indaiatuba-SP Brazil. SOURCE: website 3/27/16', NULL, '[{"type":"website","url":"http://www.brazilacademyusa.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('883a0234-d712-495f-a603-543dae4b2761', '411dab03-8ee5-4342-b4a0-02f64b4c0a3b', 'Brazil Academy', 'Schedule: Full schedule of classes
Phone: [913]220-2153', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-94.7599216,38.9211916]},"properties":{"address":"11441 Strang Line Rd. Lenexa, KS 66215","displayName":"11441, Strang Line Road, Lackmans, Lenexa, Johnson County, Kansas, 66215, United States of America","countryCode":"US","boundingBox":[38.9211416,38.9212416,-94.7599716,-94.7598716]}}'::jsonb);

-- Group: Filhos de Bimba
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('342f8ab7-4ec4-4f80-acc9-8bef3a945b76', NOW(), NOW(), 'Filhos de Bimba', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 07873 847703.
Notes: SOURCE: website 11/7/16  1/16/20', 'mestre.pelicano@gmail.com', '[{"type":"website","url":"https://mestrepelicano.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('495f6908-6ea2-4174-9c12-eae264c6b523', '342f8ab7-4ec4-4f80-acc9-8bef3a945b76', 'Mulberry Sports and Leisure Centre', 'Schedule: Thurs  7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0602945,51.514594]},"properties":{"address":"Richard Street, Shadwell, London, E1 2JP, UK","displayName":"Richard Street, St. George in the East, Whitechapel, London Borough of Tower Hamlets, London, Greater London, England, E1 2FE, United Kingdom","countryCode":"GB","boundingBox":[51.5144756,51.5147125,-0.0603144,-0.0602757]}}'::jsonb);

-- Group: Mojuba Capoeria
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('849d3815-f431-4c17-9d04-f18e19e625e9', NOW(), NOW(), 'Mojuba Capoeria', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Ponciano Almeida
Main Contact: - 368
Notes: SOURCE: website 1/19/20', NULL, '[{"type":"website","url":"http://www.mojuba.co.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c068ff84-a427-4ae6-9687-a96c1de20439', '849d3815-f431-4c17-9d04-f18e19e625e9', 'North End Road', 'Schedule: All Levels: Mon 20.30-22.00; Wed 18.00-19.20,; All Levels:  Thurs 18:00-19:00; Fri 18.30-20:30; Sun 10:30-12:00; Music: Wed 19:30-20:30; Sun 12:30-13:30; All Levels: Tues & Thurs 20:00-21.30; All Levels: Sat 17:00-18:30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1996097,51.4811645]},"properties":{"address":"368 North End Road, London, SW6 1LY, UK","displayName":"Dance Attic Studios, 368, North End Road, Walham Green, Fulham, London Borough of Hammersmith and Fulham, London, Greater London, England, SW6 1LY, United Kingdom","countryCode":"GB","boundingBox":[51.4810326,51.481279,-0.199971,-0.1992752]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a4ab8a0b-b0a1-4354-93a0-2d7a0b208680', '849d3815-f431-4c17-9d04-f18e19e625e9', 'Duke''s Road', 'Schedule: All Levels: Mon 20.30-22.00; Wed 18.00-19.20,; All Levels:  Thurs 18:00-19:00; Fri 18.30-20:30; Sun 10:30-12:00; Music: Wed 19:30-20:30; Sun 12:30-13:30; All Levels: Tues & Thurs 20:00-21.30; All Levels: Sat 17:00-18:30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1286962,51.5273868]},"properties":{"address":"17 Duke''s Road, London, WC1H 9PY, UK","displayName":"The Place, 17, Duke''s Road, St Pancras, London Borough of Camden, London, Greater London, England, WC1H 9PY, United Kingdom","countryCode":"GB","boundingBox":[51.527042,51.5278322,-0.1292357,-0.1282312]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('618314d6-fb26-47df-94b1-5550afad9aa5', '849d3815-f431-4c17-9d04-f18e19e625e9', 'Langley Street', 'Schedule: All Levels: Mon 20.30-22.00; Wed 18.00-19.20,; All Levels:  Thurs 18:00-19:00; Fri 18.30-20:30; Sun 10:30-12:00; Music: Wed 19:30-20:30; Sun 12:30-13:30; All Levels: Tues & Thurs 20:00-21.30; All Levels: Sat 17:00-18:30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1252772,51.5132082]},"properties":{"address":"7 Langley Street, Covent Garden, London, WC2H 9JA, UK","displayName":"Langley Street, Seven Dials, Bloomsbury, City of Westminster, Greater London, England, WC2H 9JA, United Kingdom","countryCode":"GB","boundingBox":[51.5128625,51.5135599,-0.1257552,-0.1247948]}}'::jsonb);

-- Group: Danca Da Liberdade
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b34324cc-1387-43b6-b291-ceae34952490', NOW(), NOW(), 'Danca Da Liberdade', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 07 739 973 890
Notes: SOURCE: website  1/19/20', 'info@ddluk.org', '[{"type":"website","url":"http://www.dancadaliberdade.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e0c613bb-0c24-4578-8a85-9cd77a4feb8c', 'b34324cc-1387-43b6-b291-ceae34952490', 'Kennington Park Centre', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.12828,51.4341658]},"properties":{"address":"136 Streatham High Road, London, SW16 1BW, UK","displayName":"Streatham High Road, Streatham, London Borough of Lambeth, London, Greater London, England, SW16 1BW, United Kingdom","countryCode":"GB","boundingBox":[51.4340125,51.4343195,-0.1282962,-0.1282602]}}'::jsonb);

-- Group: Olorum Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f608081c-d3b8-4888-a8a7-ea452fd6b97d', NOW(), NOW(), 'Olorum Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Danny Kearns
Main Contact: - +44 [0]79 7712 3581
Notes: SOURCE: website 1/22/20', NULL, '[{"type":"website","url":"http://www.olorumcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('23a44fa2-e0d9-4169-bc1d-a246790b18bd', 'f608081c-d3b8-4888-a8a7-ea452fd6b97d', 'Northcote Road', 'Schedule: Adults [All levels]: Thurs 20:10-21:40; Sat 10:30-12:30; Adults [Advanced Class]Wed 19:00-21:00; Kids [from 5 years old all levels]: Sat 9:30-10:30Professora Boca Rica "Raquel Pereira"; Wed 16:30-17:30 - Kids  [all levels - from 5 years old]; Harmony Hall; Mon 16:30-17:30 - Kids [all levels - from 5 years old] with Professor Seguidor "Danny Kearns"; Harmony Hall; Thurs 16:30-17:30 - Kids  [from 5 years old -  * all levels] with', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0302913,51.5852869]},"properties":{"address":"Northcote Road, Walthamstow, London, E17 6PQ, UK","displayName":"Northcote Road, London Borough of Waltham Forest, London, Greater London, England, E17 7DU, United Kingdom","countryCode":"GB","boundingBox":[51.5851224,51.5854515,-0.0308938,-0.0296889]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('416e6431-07bd-42bd-8d0d-4725a8d89bef', 'f608081c-d3b8-4888-a8a7-ea452fd6b97d', 'Leswin Road', 'Schedule: Adults [All levels]: Thurs 20:10-21:40; Sat 10:30-12:30; Adults [Advanced Class]Wed 19:00-21:00; Kids [from 5 years old all levels]: Sat 9:30-10:30Professora Boca Rica "Raquel Pereira"; Wed 16:30-17:30 - Kids  [all levels - from 5 years old]; Harmony Hall; Mon 16:30-17:30 - Kids [all levels - from 5 years old] with Professor Seguidor "Danny Kearns"; Harmony Hall; Thurs 16:30-17:30 - Kids  [from 5 years old -  * all levels] with', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0730045,51.5599625]},"properties":{"address":"61 Leswin Road, London, N16 7NX, UK","displayName":"Leswin Road, West Hackney, London Borough of Hackney, London, Greater London, England, N16 7NX, United Kingdom","countryCode":"GB","boundingBox":[51.5592987,51.56062,-0.0730148,-0.0729873]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('08fbf4f1-7d89-4380-b499-5707cb574ad4', 'f608081c-d3b8-4888-a8a7-ea452fd6b97d', 'Truro Road', 'Schedule: Adults [All levels]: Thurs 20:10-21:40; Sat 10:30-12:30; Adults [Advanced Class]Wed 19:00-21:00; Kids [from 5 years old all levels]: Sat 9:30-10:30Professora Boca Rica "Raquel Pereira"; Wed 16:30-17:30 - Kids  [all levels - from 5 years old]; Harmony Hall; Mon 16:30-17:30 - Kids [all levels - from 5 years old] with Professor Seguidor "Danny Kearns"; Harmony Hall; Thurs 16:30-17:30 - Kids  [from 5 years old -  * all levels] with', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0261758,51.5838888]},"properties":{"address":"10 Truro Road, Walthamstow, E17 7BY, UK","displayName":"Truro Road, London Borough of Waltham Forest, London, Greater London, England, E17 7BY, United Kingdom","countryCode":"GB","boundingBox":[51.5836583,51.5841194,-0.0263584,-0.0259931]}}'::jsonb);

-- Group: UR Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('08fbba86-3926-4560-b410-a67244d1eb5f', NOW(), NOW(), 'UR Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Simon Atkinson
Main Contact: - 07779031273
Notes: SOURCE: website 1020/20', NULL, '[{"type":"website","url":"http://www.capoeira.co.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4b14f9c3-a5a4-40a7-aca2-40e93196d796', '08fbba86-3926-4560-b410-a67244d1eb5f', 'Stonebridge Gardens', 'Schedule: Mon 7:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0744177,51.5395585]},"properties":{"address":"Haggerston Road, Hackney, London, E8 4EP, UK","displayName":"Haggerston Road, De Beauvoir Town, Haggerston, London Borough of Hackney, London, Greater London, England, E8 4EX, United Kingdom","countryCode":"GB","boundingBox":[51.539546,51.5395709,-0.0744309,-0.0744045]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('67ddef24-c73d-4eb7-9905-9c2ef89c48cd', '08fbba86-3926-4560-b410-a67244d1eb5f', 'SPACe Gym', 'Schedule: Tues 8:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0789463,51.5307898]},"properties":{"address":"31 Falkirk Street, Hoxton, London, N1 6HF, UK","displayName":"Falkirk Street, Shoreditch, London Borough of Hackney, London, Greater London, England, N1 6SA, United Kingdom","countryCode":"GB","boundingBox":[51.5307237,51.5308505,-0.0801919,-0.0777011]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('287036a0-ddb5-4b36-af7a-0247463c15c9', '08fbba86-3926-4560-b410-a67244d1eb5f', 'Rhodes Community Hall', 'Schedule: Thurs 7:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.072611,51.5455927]},"properties":{"address":"Kirkland Walk, Hackney, London, UK","displayName":"Kirkland Walk, Rhodes Estate, Dalston, London Borough of Hackney, London, Greater London, England, E8 3SY, United Kingdom","countryCode":"GB","boundingBox":[51.54551,51.5456754,-0.0726115,-0.0726106]}}'::jsonb);

-- Group: Capoeira Angola Palmares
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2ff0af50-13f8-4719-a30e-1a1991afa8a5', NOW(), NOW(), 'Capoeira Angola Palmares', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 07813 554785
Notes: SOURCE:   website 1/28/20', 'info@capoeirapalmares.co.uk', '[{"type":"website","url":"http://capoeirapalmares.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('06d551e5-2eab-4e33-bd87-44c76412c641', '2ff0af50-13f8-4719-a30e-1a1991afa8a5', 'St. Mildred''s Church Hall', 'Schedule: Mon 7:15-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0612255,51.3914253]},"properties":{"address":"5 Albert Road, Addiscombe, Croydon, CR0 5PE, UK","displayName":"Albert Road, Woodside, London Borough of Croydon, London, Greater London, England, SE25 4RN, United Kingdom","countryCode":"GB","boundingBox":[51.3907112,51.3921543,-0.0619136,-0.0605227]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c7cb6dac-8d19-4a71-873d-a46cdeaba987', '2ff0af50-13f8-4719-a30e-1a1991afa8a5', 'University of Law Bloomsbury', 'Schedule: Tues 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1193869,51.5178134]},"properties":{"address":"100 High Holborn, London, WC1V 6LJ, UK","displayName":"Caffè Nero, 100-110, High Holborn, Gray''s Inn, Holborn, London Borough of Camden, London, Greater London, England, WC1V 6QL, United Kingdom","countryCode":"GB","boundingBox":[51.5177634,51.5178634,-0.1194369,-0.1193369]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('39e8b76e-1383-43b2-ba47-3e4e5e05246c', '2ff0af50-13f8-4719-a30e-1a1991afa8a5', 'Queens Park Community School', 'Schedule: Wed 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2039971,51.5335275]},"properties":{"address":"Salusbury Road, London, UK","displayName":"Salusbury Road, Queen''s Park, London Borough of Brent, London, Greater London, England, NW6 6BF, United Kingdom","countryCode":"GB","boundingBox":[51.5334063,51.5336461,-0.2041281,-0.2038686]}}'::jsonb);

-- Group: Group Senzala
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('778ce301-95e4-430e-9d9a-0eaeaf0d4922', NOW(), NOW(), 'Group Senzala', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 07984 969 040
Notes: SOURCE: website 2/4/20', 'gingasanha@gmail.com', '[{"type":"website","url":"http://senzala-london.co.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b8a60a64-90b2-437b-ab60-20b6b631b310', '778ce301-95e4-430e-9d9a-0eaeaf0d4922', 'Artizan Community Centre', 'Schedule: Adults [All levels]: Tues & Thurs 7:00 - 8.30pm; Adults [All levels]: Wed 7.15 - 8.15pm; Children [4-12 years]: Sat 12.30 - 1.15pm; Adults [All levels]: Sat   1.15 - 2.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1320641,51.5297882]},"properties":{"address":"1 Drummond Crescent, London, NW1 1LY, UK","displayName":"Drummond Crescent, Somers Town, London Borough of Camden, London, Greater London, England, NW1 1LD, United Kingdom","countryCode":"GB","boundingBox":[51.5296366,51.5297882,-0.1331994,-0.1309409]}}'::jsonb);

-- Group: Association of Capoeira Engenho da Rainha
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('6b7fbc00-a775-42a5-a0b4-390e55f1b30c', NOW(), NOW(), 'Association of Capoeira Engenho da Rainha', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 44 [0] 7921 66 77 26
Notes: SOURCE: website 10/30/16
SOURCE: website 2/5/20', 'e.rodrigo@acercapoeira.com', '[{"type":"website","url":"http://www.capoeiraworld.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('65009537-ebe4-40b9-b1b1-e0a29f1507b0', '6b7fbc00-a775-42a5-a0b4-390e55f1b30c', 'Sands End Community Centre', 'Schedule: Mon 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2109249,51.4708886]},"properties":{"address":"66 High Street, Fulham, London, SW6 3LJ, UK","displayName":"Fulham High Street, Hurlingham, Fulham, London Borough of Hammersmith and Fulham, London, Greater London, England, SW6 3LQ, United Kingdom","countryCode":"GB","boundingBox":[51.4705411,51.4712772,-0.2110829,-0.2106859]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3c37706c-41fe-41c3-9006-14ec1930475b', '6b7fbc00-a775-42a5-a0b4-390e55f1b30c', 'Greyhound Community Centre', 'Schedule: Wed 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2305592,51.4654018]},"properties":{"address":"Dryburgh Road, Putney, London, SW15 1BL, UK","displayName":"Dryburgh Road, Putney, London Borough of Wandsworth, London, Greater London, England, SW15 1BL, United Kingdom","countryCode":"GB","boundingBox":[51.4651916,51.4659956,-0.2335588,-0.2293608]}}'::jsonb);

-- Group: Capoeira Muzenza
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c643579f-24c1-4aa7-a19e-8494eafc0b2f', NOW(), NOW(), 'Capoeira Muzenza', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR
Main Contact: - 078 4134 2874
Notes: SOURCE: websites 2/26/20
SOURCE:  website  2/26/20', 'capoeiracademyuk@gmail.com', '[{"type":"website","url":"http://capoeiracademyuk.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('db77a2f0-0129-44a2-99a8-5af25eb15522', 'c643579f-24c1-4aa7-a19e-8494eafc0b2f', 'The Broadway', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3339538,51.6004812]},"properties":{"address":"25 The Broadway, HA7 4DA, UK","displayName":"27,25,23,21, The Broadway, Wealdstone, London Borough of Harrow, London, Greater London, England, HA3 7EH, United Kingdom","countryCode":"GB","boundingBox":[51.6003188,51.6006435,-0.3341103,-0.3337972]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('23b76f0c-0ea0-47a8-9dce-a22ea4f848f8', 'c643579f-24c1-4aa7-a19e-8494eafc0b2f', 'Mycenae Road', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.0162807,51.4796406]},"properties":{"address":"90 Mycenae Road, Blackheath, SE3 7SE, UK","displayName":"Woodlands House, 90, Mycenae Road, Blackheath Royal Standard, Blackheath, Royal Borough of Greenwich, London, Greater London, England, SE3 7SE, United Kingdom","countryCode":"GB","boundingBox":[51.4795204,51.4797507,0.0160341,0.0165082]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('34c63c7c-3963-49ff-b9ee-d8e1570f6aed', 'c643579f-24c1-4aa7-a19e-8494eafc0b2f', 'Kings Cross', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1175506,51.5312377]},"properties":{"address":"Kings Cross, London, N1 9GA, UK","displayName":"Kings cross, Pentonville Road, Pentonville, Barnsbury, London Borough of Islington, London, Greater London, England, N1 9UZ, United Kingdom","countryCode":"GB","boundingBox":[51.5311877,51.5312877,-0.1176006,-0.1175006]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2d888805-6433-4754-9ebd-8376046c2bed', 'c643579f-24c1-4aa7-a19e-8494eafc0b2f', 'City Road', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1027165,51.5310801]},"properties":{"address":"361-373 City Road, London, EC1, UK","displayName":"City Road, Angel, Islington, London Borough of Islington, London, Greater London, England, EC1V 1LR, United Kingdom","countryCode":"GB","boundingBox":[51.5309015,51.5312587,-0.1034045,-0.1020284]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6050fa0c-e125-491c-bf1f-953f6a44f571', 'c643579f-24c1-4aa7-a19e-8494eafc0b2f', 'Ainsworth Road', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0507183,51.5396756]},"properties":{"address":"Ainsworth Road, London, UK","displayName":"Ainsworth Road, Victoria Park Village, Hackney, London Borough of Hackney, London, Greater London, England, E9 7LP, United Kingdom","countryCode":"GB","boundingBox":[51.5388225,51.5405177,-0.0512788,-0.0501748]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e650e760-f461-4365-bbc2-87ec55e47027', 'c643579f-24c1-4aa7-a19e-8494eafc0b2f', 'James Lane', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[0.0042018,51.5755155]},"properties":{"address":"James Lane, Leytonstone, London, E11 1NS, UK","displayName":"James Lane, Whipps Cross, Leytonstone, London Borough of Waltham Forest, London, Greater London, England, E11 1NS, United Kingdom","countryCode":"GB","boundingBox":[51.5750804,51.575915,0.0035823,0.0048447]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ddac118c-3e8c-4678-b4eb-32aaf84846c5', 'c643579f-24c1-4aa7-a19e-8494eafc0b2f', 'Woodville Road', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0816084,51.5508423]},"properties":{"address":"Woodville Road, London, N16 8NA, UK","displayName":"Woodville Road, Mayville Estate, Islington, London Borough of Islington, London, Greater London, England, N16 8NE, United Kingdom","countryCode":"GB","boundingBox":[51.5502039,51.5514732,-0.0820579,-0.0811602]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fb47a89f-2075-4140-88cc-21b92873ee7d', 'c643579f-24c1-4aa7-a19e-8494eafc0b2f', 'Kayani Avenue', 'Schedule: Beginners & Intermediates: Mon 8.30-9.30; Thurs & Fri 6.30-7.30pm; All Levels: Sat 12.15-2.00pm; Intermediates & Advance: Mon & Wed 7.30-8.30pm; Skills development Members only: Wed 8.30-9.30pm       Bernays Memorial Hall; Kids: Mon 4:45-5:30pm; Adults Parents: Tues 5:00-6:00pm; kids ages 3-4: Tues 3:30-4:00pm kids ages 5+: Tues 4:00-5:00pm; kids: Wed 4:00-5:00pm; Sun 12:30-1:30pm; Adults: Mon 8:15pm;  Fri  7:15pm; Adults:  Wed 7:30pm; Children Only:Wed     17.00hr; Children Only: Sat 10.30hr; Redmond Comm. Centre; Children Only: Fri 17.00hr; Children Only:  Mon16.30hr', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0918882,51.5707101]},"properties":{"address":"Kayani Avenue, London, N4 2HF, UK","displayName":"Kayani Avenue, Brownswood Park, Stoke Newington, London Borough of Hackney, London, Greater London, England, N4 2GU, United Kingdom","countryCode":"GB","boundingBox":[51.5701859,51.5712464,-0.0920284,-0.0917419]}}'::jsonb);

-- Group: Capoeira Science
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('619dc0bd-b6a8-4981-911c-9cefe2fc408a', NOW(), NOW(), 'Capoeira Science', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 283-291
Notes: SOURCE: website 2/28/2020', 'info@capoeirascience.co.uk', '[{"type":"website","url":"http://www.capoeirascience.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('42ac6a7b-d0b9-4f35-bb3a-7f07f9b25653', '619dc0bd-b6a8-4981-911c-9cefe2fc408a', 'Wandsworth Road', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1437744,51.4683931]},"properties":{"address":"283-291 Wandsworth Road, London,","displayName":"Wandsworth Road, Clapham, London Borough of Lambeth, London, Greater London, England, SW8 3JE, United Kingdom","countryCode":"GB","boundingBox":[51.4681047,51.4686523,-0.1443861,-0.1431497]}}'::jsonb);

-- Group: Capoeira Ceara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b99ae5d9-5584-4b63-b40e-45895398088e', NOW(), NOW(), 'Capoeira Ceara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITORA
Main Contact: - 44 78233 33962
Notes: SOURCE: website 1/21/20', 'frangolino@capoeira-ceara.co.uk', '[{"type":"website","url":"http://capoeira-ceara.co.uk."}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('89787b34-a873-4ca1-a16a-4a0c4132ebfe', 'b99ae5d9-5584-4b63-b40e-45895398088e', 'Parish Church of St. Jude on the Hill', 'Schedule: Mon 7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0999825,51.5024846]},"properties":{"address":"1 Pocock Street, London, NW11, UK","displayName":"1-15, Pocock Street, Bankside, Southwark, London Borough of Southwark, London, Greater London, England, SE1 0BJ, United Kingdom","countryCode":"GB","boundingBox":[51.5023043,51.5027477,-0.1008825,-0.099083]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('252867c0-e758-4768-9c64-5f2bb6ae4ce9', 'b99ae5d9-5584-4b63-b40e-45895398088e', 'Orchard Hall', 'Schedule: Wed 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2660186,51.6088906]},"properties":{"address":"145 Orange Hill Road, Burnt Oak, Edgware, HA8 0TW, UK","displayName":"Watling Community Centre, 145, Orange Hill Road, Burnt Oak, Edgware, London, Greater London, England, HA8 0TR, United Kingdom","countryCode":"GB","boundingBox":[51.6087187,51.6090606,-0.2663074,-0.2657497]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('84065f52-e79f-4952-bd35-b12da2a8a9bb', 'b99ae5d9-5584-4b63-b40e-45895398088e', 'Clissold Park', 'Schedule: Sat 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0857374,51.5603672]},"properties":{"address":"Clissold Road, Stoke Newington, London, N16 9HJ, UK","displayName":"Clissold Road, Stoke Newington, London Borough of Hackney, London, Greater London, England, N16 9HD, United Kingdom","countryCode":"GB","boundingBox":[51.5603466,51.5603852,-0.0857639,-0.0857132]}}'::jsonb);

-- Group: Capoeira Angola - South London
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('497062e6-463e-4aa9-b3d9-982966bcdef8', NOW(), NOW(), 'Capoeira Angola - South London', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 50
Notes: SOURCE: website 2/21/20', NULL, '[{"type":"website","url":"http://www.capoeiradeangola.net"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b344f5d5-4d98-48e3-8c1d-fc4f989263a1', '497062e6-463e-4aa9-b3d9-982966bcdef8', '50A Corry Dr', 'Schedule: Wed 7.30-9.00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1066799,51.4605046]},"properties":{"address":"50A Corry Dr, Brixton, London SW9 8QT","displayName":"Corry Drive, Brixton, London Borough of Lambeth, London, Greater London, England, SW9 8QT, United Kingdom","countryCode":"GB","boundingBox":[51.4599525,51.4612441,-0.1074557,-0.1063773]}}'::jsonb);

-- Batch: batch-03.json (41 groups)

-- Group: Beira-Mar Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b3954c35-9c2c-46af-b958-8d17a928e903', NOW(), NOW(), 'Beira-Mar Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Gafanhoto (Stan Marshall)
Main Contact: - [502] 229-9182
Notes: Louisville, Kentucky. Under Contra Mestre Bundo [Jacksonville FL] and Mestre Tarzan [Brazil]. SOURCE: website 4/16/18', NULL, '[{"type":"website","url":"http://www.gbantu.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b91858f3-19ac-4755-bf15-6432d2fa6746', 'b3954c35-9c2c-46af-b958-8d17a928e903', 'Freestyle Fitness', 'Schedule: Kids and Adults: Tues & Thurs 8:00-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-85.7132066,38.2627901]},"properties":{"address":"1860 Mellwood Ave, Louisville, KY 40206","displayName":"Mellwood Art Center, 1860, Mellwood Avenue, Clifton, Louisville, Jefferson County, Kentucky, 40206, United States of America","countryCode":"US","boundingBox":[38.2620065,38.2635747,-85.7137558,-85.7120802]}}'::jsonb);

-- Group: Capoeira Volta Ao Mundo Louisville
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ded52b69-f3ac-4520-a4a3-6c00f3ee92ec', NOW(), NOW(), 'Capoeira Volta Ao Mundo Louisville', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 502-641-7218
Notes: Louisville, Kentucky. The information on Derby City Martial Arts page (http://www.derbycitymartialarts.com/app_pages/capoeira.php) appears to be out of date as of 4/22/18. SOURCE: website 4/22/18', NULL, '[{"type":"website","url":"https://www.capovam.com/locations/louisville/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('550af9a0-21cb-4a4d-b195-f856f83f2f06', 'ded52b69-f3ac-4520-a4a3-6c00f3ee92ec', 'Freestyle Fitness', 'Schedule: Adults: Mon 8:00-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-85.6866547,38.2547294]},"properties":{"address":"2920 Frankfort Ave, Louisville, KY, 40206","displayName":"2920, Frankfort Avenue, Louisville, Jefferson County, Kentucky, 40206, United States of America","countryCode":"US","boundingBox":[38.2546794,38.2547794,-85.6867047,-85.6866047]}}'::jsonb);

-- Group: Capoeira North West - Capoeira Cordao De Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('80b0496b-a4db-4938-bcb4-7dc921cda6ef', NOW(), NOW(), 'Capoeira North West - Capoeira Cordao De Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Parente
Main Contact: - +44 7949 711 745
Notes: Manchester, England. SOURCE: website 11/17/16', 'cdonorthwest@gmail.com', '[{"type":"website","url":"http://cdonw.co.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('759d4933-219a-46f9-90e5-5a46072b4e2a', '80b0496b-a4db-4938-bcb4-7dc921cda6ef', 'The Trinity Centre', 'Schedule: All Levels: Thurs 7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-2.2382108,53.4663415]},"properties":{"address":"Higher Cambridge St, Hulme. M15 6HP","displayName":"Higher Cambridge Street, First Street, Hulme, Manchester, Greater Manchester, England, M15 6AR, United Kingdom","countryCode":"GB","boundingBox":[53.4662796,53.4664035,-2.2382653,-2.2381564]}}'::jsonb);

-- Group: Mundo Capoeira Ireland
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('03c02cc4-1691-4bce-b7a8-ad179db84a7e', NOW(), NOW(), 'Mundo Capoeira Ireland', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITOR Vizinho
Main Contact: - 087-777-7931
Notes: Mullingar, Ireland. Monitor Vizinho under Mestre Sansao [Dublin]. SOURCE: website 12/31/19', 'info@capoeiraireland.com', '[{"type":"website","url":"http://www.capoeiraireland.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a014acd1-d377-4bd1-a3a5-8214b55b62df', '03c02cc4-1691-4bce-b7a8-ad179db84a7e', 'Forest Park', 'Schedule: Tues 6:00 – 7:20pm
Email: Krzysztof.rittau@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-7.3552713,53.5151245]},"properties":{"address":"Mullingar Business Park","displayName":"Mullingar Business Park, Mullingar Rural ED, The Municipal District of Mullingar — Kinnegad, County Westmeath, Leinster, N91 NH33, Éire / Ireland","countryCode":"IE","boundingBox":[53.51232,53.5180083,-7.3585803,-7.3532406]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('82b11079-52b7-4b17-aca4-35818585f852', '03c02cc4-1691-4bce-b7a8-ad179db84a7e', 'Harbour St, Commons', 'Schedule: Thurs: 6:30 – 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-78.9436986,33.7198921]},"properties":{"address":"Harbour St, Commons","displayName":"Claypond Commons, Fantasy Harbour, Horry County, South Carolina, 29577, United States of America","countryCode":"US","boundingBox":[33.7098921,33.7298921,-78.9536986,-78.9336986]}}'::jsonb);

-- Group: Grupo Senzela
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('68be75b5-7732-4ffc-94c5-2c1a559489df', NOW(), NOW(), 'Grupo Senzela', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Tasmania (Jimi McAvoy)
Main Contact: Mestre Tasmania - +44 [0] 191 5860691
Notes: Newcastle, England. Under the guidance of Mestre Gato [Rio de Janeiro]. Professor Caranguejo (peter@groupsenzala.co.uk). Professor Scuzzi ''Rob'' (rob@groupsenzala.co.uk, 07917440093). SOURCE: website 11/18/16', 'jimi@groupsenzala.co.uk', '[{"type":"website","url":"http://www.groupsenzala.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8949e162-4fa4-4482-bd1b-049d2843467d', '68be75b5-7732-4ffc-94c5-2c1a559489df', 'Heaton Community Centre', 'Schedule: Tues 7:00-9.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.5706731,54.987702]},"properties":{"address":"Trewhitt Road, Heaton, Newcastle Upon Tyne NE6 5DY","displayName":"Trewhitt Road, Heaton, Newcastle upon Tyne, Tyne and Wear, North East, England, NE6 5DT, United Kingdom","countryCode":"GB","boundingBox":[54.9876845,54.9877215,-1.5711115,-1.5702347]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c2046c0c-1f59-4cde-b230-7153a7451128', '68be75b5-7732-4ffc-94c5-2c1a559489df', 'Dance City', 'Schedule: Thurs 7.30pm-8.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.6221799,54.9703292]},"properties":{"address":"Temple Street, Newcastle Upon Tyne, NE1 4BR","displayName":"Temple Street, Grainger Town, Newcastle upon Tyne, Tyne and Wear, North East, England, NE1 4BR, United Kingdom","countryCode":"GB","boundingBox":[54.9702967,54.9703617,-1.6225272,-1.6218326]}}'::jsonb);

-- Group: Cordo de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('eed32e1f-660c-4d6e-8366-4ad170d32cd2', NOW(), NOW(), 'Cordo de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Cascao
Notes: Norfolk, England. Professor Cascao under Mestre Papa-Leguas [Patos de Minas, Minas Gerais]. SOURCE: website 11/18/16', NULL, '[{"type":"website","url":"http://capocoms.org.uk"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3d484f14-2023-4240-8c72-45225405498e', 'eed32e1f-660c-4d6e-8366-4ad170d32cd2', 'Trinity church hall', 'Schedule: Adults, All levels: 19:00-20:30pm; Age 4-7 years: Tues 15:30-16:15 pm; Age 8 upwards: Tues 16:15-17:15 pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[1.2710178,52.6203078]},"properties":{"address":"1,Unthank road, Norwich, NR2 2PA","displayName":"1-6 Pym House, 260, Unthank Road, Mount Pleasant, Eaton, Norwich, Norfolk, England, NR2 2AJ, United Kingdom","countryCode":"GB","boundingBox":[52.6202229,52.6203795,1.2709014,1.2711955]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1a126f40-98d0-443c-8731-a3d73680cb38', 'eed32e1f-660c-4d6e-8366-4ad170d32cd2', 'Sportspark Dance Studio', 'Schedule: Wed & Fri 3.15-5.15 pm; Sun 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[1.2409256,52.6245439]},"properties":{"address":"Sportspark, University of East Anglia, Norwich, UK","displayName":"Sportspark, University of East Anglia, Norwich, Norfolk, England, NR4 7TJ, United Kingdom","countryCode":"GB","boundingBox":[52.6236661,52.6249165,1.2405376,1.2421443]}}'::jsonb);

-- Group: ABADA-Capoeira Marin
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d2ce0396-0057-4bc7-a4da-68b10795cd24', NOW(), NOW(), 'ABADA-Capoeira Marin', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Prego (Diego Freitas)
Main Contact: - 415 420 9350
Notes: Marin County, California. Instrutor Prego and Graduada Ciranda ''Lisa Willoughby'' under Mestra Cigarra [San Francisco]. SOURCE: website 7/13/17', 'abadamarin@gmail.com', '[{"type":"website","url":"https://abadamarin.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('00837caa-5302-4e42-a10f-8117aac154a9', 'd2ce0396-0057-4bc7-a4da-68b10795cd24', 'San Rafael Community Services', 'Schedule: Toddler 2-4 y/o: Tues 4:15-4:45pm: Sat 9:00-9:30am; Youth 5-12 y/o Tues 5:00-6:00pm; Sat 9:45-10:45am; Teen/Adult13 and up: Tues 6:30-8:00pm; Sat 9:45-11:15am
Phone: 415 485 3333', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.5292452,37.9694571]},"properties":{"address":"618 B Street, San Rafael, CA 94901","displayName":"San Rafael Community Center, 618, B Street, San Rafael, Marin County, California, 94902, United States of America","countryCode":"US","boundingBox":[37.9692018,37.9697162,-122.5294175,-122.5288381]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5d3ead7e-0da6-4289-9e90-73ef2d7178d1', 'd2ce0396-0057-4bc7-a4da-68b10795cd24', 'Strawberry Community Center', 'Schedule: 5-12 y/o: Mon 3:45-4:45pm
Phone: 415 420 9350', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.5449763,37.9060368]},"properties":{"address":"Mill Valley, CA 94941","displayName":"Mill Valley, Marin County, California, United States of America","countryCode":"US","boundingBox":[37.886477,37.9296329,-122.5769802,-122.5143818]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a44e0611-b9b9-48b5-9062-745616d533ae', 'd2ce0396-0057-4bc7-a4da-68b10795cd24', 'Marinwood Community Services', 'Schedule: 2-4 y/o: Wed 2:15pm-2:45pm; 5-7 y/o: Wed 3:00pm-3:50pm; 8-12 y/o: Wed 3:50-4:50pm
Phone: 415 479 7751', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.5523632,38.0279059]},"properties":{"address":"775 Miller Creek Road San Rafael, CA 94903","displayName":"Marinwood Community Center, 775, Miller Creek Road, Lucas Valley, Lucas Valley-Marinwood, San Rafael, Marin County, California, 94903, United States of America","countryCode":"US","boundingBox":[38.0278559,38.0279559,-122.5524132,-122.5523132]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('67333531-4aad-41be-806e-0bc5798b1f04', 'd2ce0396-0057-4bc7-a4da-68b10795cd24', 'Corte Madera Recreation. Center', 'Schedule: 3-5 y/o: Thurs3 3:15-3:45pm; 6-12 y/o: Thurs 3 4:00-5:00pm
Phone: 415 927 5071', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.5241174,37.9257182]},"properties":{"address":"498 Tamalpais Dr. Corte Madera, CA 94924","displayName":"Corte Madera Community Center, 498;500, Tamalpais Drive, Corte Madera, Marin County, California, 94925, United States of America","countryCode":"US","boundingBox":[37.9255644,37.9259161,-122.5242747,-122.5239601]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b19119c6-65c8-4db9-89b2-eb6c07079838', 'd2ce0396-0057-4bc7-a4da-68b10795cd24', 'Manor Elementary School', 'Schedule: 5-12 y/o Thurs 1:50-2:50pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.594082,37.99794]},"properties":{"address":"150 Oak Manor Drive, Fairfax, CA 94930","displayName":"150, Oak Manor Drive, Manor, Fairfax, Marin County, California, 94930, United States of America","countryCode":"US","boundingBox":[37.99789,37.99799,-122.594132,-122.594032]}}'::jsonb);

-- Group: Capoeira Yokayo-United Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bc5e07c3-c936-40a7-baaf-df67bcd30403', NOW(), NOW(), 'Capoeira Yokayo-United Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRAMESTRE Maluco (Mario Ackerberg)
Main Contact: Contramestre Maluco - 707-472-0332
Notes: Mendicino County, California. Mestre Amunka passed away 1/24/2013. Contramestre Maluco land: 707-621-2911, cell: 707-472-0332. Professor Carranca ''Calvin Turnwall'' (mail: 430 West Stephenson St, Ukaih California 95482, cell: 707-621-0183, calvinturnwall@hotmail.com). SOURCE: website 7/14/17', 'mariomaluco2000@icloud.com', '[{"type":"website","url":"http://www.capoeirayokayo.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('47b41550-84b0-42a6-9ced-ded54c29d11d', 'bc5e07c3-c936-40a7-baaf-df67bcd30403', 'S.P.A.C.E.', 'Schedule: All Levels: Mon 7:00-8:30pm;Wed 6:30-8:00pm; Fri10:00am-12:00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.211659,39.149432]},"properties":{"address":"500 West Perkins Street Ukiah, CA 95482","displayName":"500, West Perkins Street, Downtown, Downtown Ukiah, Ukiah, Mendocino County, California, 95482, United States of America","countryCode":"US","boundingBox":[39.149382,39.149482,-123.211709,-123.211609]}}'::jsonb);

-- Group: Raizes do Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('36243214-0dfa-4b10-ad7b-11e4398c7db2', NOW(), NOW(), 'Raizes do Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Quati
Main Contact: - [831] 818-4811
Notes: Monterey County, California. Professor Quati under Mestre Papiba [Santa Cruz]. SOURCE: website 7/17/17', 'capoeira.quati@gmail.com', '[{"type":"website","url":"http://capoeiramonterey.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('56c3afb1-2f3e-4198-8463-7e321d5028e7', '36243214-0dfa-4b10-ad7b-11e4398c7db2', 'Monterey Yoga Shala', 'Schedule: Kids [4+ yrs]: Mon 4:30-5:30 pm; Adults: Mon 6:45-7:45 pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-121.8925012,36.5947654]},"properties":{"address":"724 Abrego Street, Monterey, CA 93940","displayName":"El Palomar Monterey, 724, Abrego Street, Monterey, Monterey County, California, 93940, United States of America","countryCode":"US","boundingBox":[36.5947154,36.5948154,-121.8925512,-121.8924512]}}'::jsonb);

-- Group: Capoeira Eastside
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c25c6185-22ae-4d13-b9d2-b199bbd4fd38', NOW(), NOW(), 'Capoeira Eastside', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Fabricio
Main Contact: - [954] 652-8433
Notes: Bellevue, Kirkland, Redmond, Washington. SOURCE: website 12/24/19', 'capoeiraeastside@gmail.com', '[{"type":"website","url":"http://www.capoeiraeastside.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e4d4cc21-7eb4-4efe-b016-7cf7e286266e', 'c25c6185-22ae-4d13-b9d2-b199bbd4fd38', 'Gracie Barra', 'Schedule: Adults: Tues & Thurs 8:00-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.1382377,47.6330499]},"properties":{"address":"2505 152nd Ave NE, Redmond, WA 98052","displayName":"2505, 152nd Avenue Northeast, Overlake, Redmond, King County, Washington, 98052, United States of America","countryCode":"US","boundingBox":[47.6329999,47.6330999,-122.1382877,-122.1381877]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('72733387-63ce-4b18-b232-27ab899ae30b', 'c25c6185-22ae-4d13-b9d2-b199bbd4fd38', 'Northwest Aerials', 'Schedule: Kids: Mon & Wed 6:45-7:45pm; Adults Mon 8:00-9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.1694434,47.7116355]},"properties":{"address":"12440 128th Lane NE Kirkland, WA 98034","displayName":"12440, 128th Lane Northeast, Kirkland, King County, Washington, 98034, United States of America","countryCode":"US","boundingBox":[47.7114673,47.7118049,-122.169807,-122.169078]}}'::jsonb);

-- Group: WWU Capoeira Club-FICA Bellingham Study Group
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('14d5090e-4e7e-4365-907b-ce05f873e808', NOW(), NOW(), 'WWU Capoeira Club-FICA Bellingham Study Group', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Bellingham, Washington. SOURCE: blog 12/24/19', 'capoeirawwu@yahoo.com', '[{"type":"website","url":"http://bellinghamcapoeira.blogspot.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('001263dd-e042-4feb-bf5a-5249a5779f36', '14d5090e-4e7e-4365-907b-ce05f873e808', 'Western Washington University - Viking Union multipurpose room', 'Schedule: Mon 6:00-8:00pm (when school is in session; free and open to all)
Email: ficabellingham@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4874638,48.734141]},"properties":{"address":"Western Washington University, Bellingham, WA","displayName":"Western Washington University, 516, High Street, Bellingham, Whatcom County, Washington, 98225, United States of America","countryCode":"US","boundingBox":[48.7264107,48.7413577,-122.4917467,-122.4804349]}}'::jsonb);

-- Group: FICA - Olympia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ceb93a50-8d8f-4f19-af28-5c17d251a245', NOW(), NOW(), 'FICA - Olympia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Silvinho
Main Contact: Mestre Silvinho - 206-669-0273
Notes: Olympia, Washington. International Capoeira Angola Foundation. Mestre Silvinho [Seattle]. Treinel Caxambu: treneucaxambu@yahoo.}com, 206-937-5849. SOURCE: website 12/24/19', 'silvioaleixo@hotmail[D0T}com', '[{"type":"website","url":"http://www.ficanorthwest.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8fea6b18-dc13-44ea-9414-2335384d6764', 'ceb93a50-8d8f-4f19-af28-5c17d251a245', 'Evergreen Capoeira Angola Club', 'Schedule: Wed 1:00-3:00pm; Sat 12:00-2:00pm
Phone: 206-937-5849
Email: treneucaxambu@yahoo.}com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-101.8632454,35.2110044]},"properties":{"address":"CRC Room 117","displayName":"Circus Room, 2309, Southwest 6th Avenue, Original Town of Amarillo, Amarillo, Potter County, Texas, 79106, United States of America","countryCode":"US","boundingBox":[35.2109544,35.2110544,-101.8632954,-101.8631954]}}'::jsonb);

-- Group: Grupo de Capoeira Moringa de Barro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('970d7734-3b49-43db-bb7c-d131d7a5bb75', NOW(), NOW(), 'Grupo de Capoeira Moringa de Barro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Pitta (Daniel Nery Dos Santos Filho)
Main Contact: - 206-819-3334
Notes: Seattle, Washington. SOURCE: website 12/24/19', 'studio@bahiainmotion.com', '[{"type":"website","url":"http://bahiainmotion.com/capoeira/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f3563830-785e-4cc8-9a9e-0ee0b749ba7d', '970d7734-3b49-43db-bb7c-d131d7a5bb75', 'Balance Studio', 'Schedule: Adult Beginner [Age 13+]: Mon 6:30-7:30pm; Adult -Intermed/Adv [Age 13+]: Mon & Wed 7:30-9:00pm; Sat 11:30am-1:00pm; Little Tots [Age 3-4]: Wed 4:45-5:20pm; Youth Capoeira Level 1: [Age 5-12]: Wed 5:30-6:20pm; Youth Level 2: [Age 6-12]: Mon5:30-6:20pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3535964,47.6514877]},"properties":{"address":"418 N 35th St, Fremont - Seattle, 98103","displayName":"418, North 35th Street, Fremont, Seattle, King County, Washington, 98103, United States of America","countryCode":"US","boundingBox":[47.6513601,47.6516152,-122.3537165,-122.3534763]}}'::jsonb);

-- Group: FICA - International Capoeira Angola Foundation - Seattle
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1455ac48-6075-4d18-af3b-7ec81e6eb70b', NOW(), NOW(), 'FICA - International Capoeira Angola Foundation - Seattle', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Silvinho
Main Contact: Mestre Silvinho - 206-669-0273
Notes: Seattle, Washington. Founded by and under the guidance of Mestre Jurandir. Treneu Caxambu: treneucaxambu@yahoo.com, 206-937-5849. SOURCE: website 4/16/16', 'silvioaleixo@hotmail.com', '[{"type":"website","url":"http://www.ficanorthwest.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9d103e9b-92b7-49d6-a490-df2d6d1c1083', '1455ac48-6075-4d18-af3b-7ec81e6eb70b', 'Union Cultural Center', 'Schedule: Tues & 7:00-9:00pm; Thurs 6:00-9:00; Sun 4:00-6:00pm; Open Roda: 1st Sun
Phone: 206-937-5849
Email: treneucaxambu@yahoo.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3222172,47.5982279]},"properties":{"address":"803 S King St. Seattle, Wa 98104","displayName":"803, South King Street, Chinatown, Chinatown International District, Seattle, King County, Washington, 98104, United States of America","countryCode":"US","boundingBox":[47.5981779,47.5982779,-122.3222672,-122.3221672]}}'::jsonb);

-- Group: Capoeira Malês - Seattle
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7df7f80e-d600-4278-8e77-aeedf5952328', NOW(), NOW(), 'Capoeira Malês - Seattle', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Curisco
Main Contact: - +1 [206] 643-0075
Notes: Seattle, Washington. Instructor Ninja ''Ali Mojallal''. SOURCE: website 4/16/16', 'capoeira.seattle@gmail.com', '[{"type":"website","url":"http://www.curisco.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8e54474e-781f-40c1-b766-1d4ccb7276d5', '7df7f80e-d600-4278-8e77-aeedf5952328', 'SoDo STUDIO - Old Rainier Brewery / Tully''s Building', 'Schedule: All Levels: Mon & Wed 7:30-9:00pm; Sat 1:30-3:30pm; Parents: Fri 7:30-9:00pm; Kids: Mon 6:00-7:30pm; Sat 12:00-1:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3204572,47.5761333]},"properties":{"address":"3150 Airport Way S Seattle 98134","displayName":"3150, Airport Way South, Beacon Hill, Seattle, King County, Washington, 98134, United States of America","countryCode":"US","boundingBox":[47.5760833,47.5761833,-122.3205072,-122.3204072]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6fa3b051-a4f7-4098-96cb-0b3b1b57ee41', '7df7f80e-d600-4278-8e77-aeedf5952328', 'Compfit', 'Schedule: Fri 7:30-8:30pm
Phone: [ 206 ] 696-0680', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3408719,47.6618619]},"properties":{"address":"4501 Interlake Ave. North #6 | Seattle, WA 98103","displayName":"Compfit Dance & Fitness Studio, 4501, Interlake Avenue North, Wallingford, Seattle, King County, Washington, 98103, United States of America","countryCode":"US","boundingBox":[47.6618119,47.6619119,-122.3409219,-122.3408219]}}'::jsonb);

-- Group: Seattle Capoeira Center - Capoeira Angola Palmares
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a7c4c4ca-8170-4a98-9bc3-aed6d3b30b91', NOW(), NOW(), 'Seattle Capoeira Center - Capoeira Angola Palmares', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Mangangá (Syed Taqi)
Main Contact: - + 1 206 372 2691
Notes: Seattle, Washington. Professor Mangangá under Mestre No. SOURCE: website 4/16/16', 'seattlecapoeira@gmail.com', '[{"type":"website","url":"http://seattlecapoeiracenter.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7c54357e-2aef-48ef-bff3-186c9f031939', 'a7c4c4ca-8170-4a98-9bc3-aed6d3b30b91', 'Seattle Capoeira Center', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2976967,47.5773334]},"properties":{"address":"2909 Rainier Avenue South Seattle, WA 98144","displayName":"2909, Rainier Avenue South, Mount Baker, Seattle, King County, Washington, 98144, United States of America","countryCode":"US","boundingBox":[47.5772834,47.5773834,-122.2977467,-122.2976467]}}'::jsonb);

-- Group: Grupo Semente do jogo de Angola
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('17f6d087-73d3-42b2-831f-c11e47b88456', NOW(), NOW(), 'Grupo Semente do jogo de Angola', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Colette (Colette Desilets)
Main Contact: - [514] 270-5853
Notes: Montreal, Quebec, Canada. See also Laval. SOURCE: website 3/28/17', 'colette@capoeiraangola.ca', '[{"type":"website","url":"http://www.capoeiraangola.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0ef8f781-c316-48bf-9ad8-f066a72f1d6f', '17f6d087-73d3-42b2-831f-c11e47b88456', 'Montreal location', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.567163,45.5055686]},"properties":{"address":"372 Sainte-Catherine Ouest, Montreal, QC, Canada","displayName":"Belgo, 372, Rue Sainte-Catherine Ouest, Quartier des Spectacles, Ville-Marie, Montréal, Agglomération de Montréal, Montréal (région administrative), Québec, H3B 1A2, Canada","countryCode":"CA","boundingBox":[45.5051668,45.5061857,-73.5676107,-73.5665504]}}'::jsonb);

-- Group: Capoeira Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f2397aeb-a93e-4cbb-890f-30e2908c7b8d', NOW(), NOW(), 'Capoeira Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Mortal
Main Contact: - [438] 394 8401
Notes: Montreal, Quebec, Canada. Professor Mortal under the supervision of Mestre Paulinho Sabia. SOURCE: website 3/24/17', 'info@capoeirabrasil.ca', '[{"type":"website","url":"http://www.capoeirabrasil.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('20f05b82-f005-4cd3-9a1b-676db35a77b3', 'f2397aeb-a93e-4cbb-890f-30e2908c7b8d', 'Karate Taikido Longueuil', 'Schedule: Mon, 7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.4604091,45.5206565]},"properties":{"address":"2755 Chemin de Chambly, Longueuil, J4L 1M7, QC","displayName":"2755, Chemin de Chambly, Le Vieux-Longueuil, Longueuil, Agglomération de Longueuil, Montérégie, Québec, J3L 1N3, Canada","countryCode":"CA","boundingBox":[45.5206065,45.5207065,-73.4604591,-73.4603591]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0d41f23c-3bad-4944-a2bb-c6bfdc8ed854', 'f2397aeb-a93e-4cbb-890f-30e2908c7b8d', 'Club de Boxe One X One', 'Schedule: Thurs; 7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.4445046,45.4758002]},"properties":{"address":"5556 Grande Allee, Saint-Hubert, QC, J3Y 1A8, Canada","displayName":"5556, Grande Allée, Saint-Hubert, Longueuil, Agglomération de Longueuil, Montérégie, Québec, J3Y 1A5, Canada","countryCode":"CA","boundingBox":[45.4757502,45.4758502,-73.4445546,-73.4444546]}}'::jsonb);

-- Group: FICA Study Group Montreal
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4e46462f-30e2-45d8-9a18-6181553cf4d8', NOW(), NOW(), 'FICA Study Group Montreal', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Montreal, Quebec, Canada. SOURCE: website 3/31/17', 'capoeiragcam@gmail.com', '[{"type":"website","url":"http://jogodeangola-mtl.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('06a7822e-461d-4f20-912b-dc963ee3ca85', '4e46462f-30e2-45d8-9a18-6181553cf4d8', 'MAI - Montreal arts interculturels - studio 460', 'Schedule: Mon & Thurs 6:30-9:00pm
Phone: 514-982-1812', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.5763331,45.5115985]},"properties":{"address":"3680, rue Jeanne-Mance Montreal QC H2X 2K5","displayName":"Ex aequo, 3680, Rue Jeanne-Mance, Le Plateau-Mont-Royal, Montréal, Agglomération de Montréal, Montréal (région administrative), Québec, H2X 2K5, Canada","countryCode":"CA","boundingBox":[45.5115485,45.5116485,-73.5763831,-73.5762831]}}'::jsonb);

-- Group: New Orleans Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9208c26f-c0eb-479e-be96-4ee151ecfbb4', NOW(), NOW(), 'New Orleans Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRANDO Cocada (Rogerio Valencio da Silva)
Notes: New Orleans, Louisiana. Mestrando Cocada (Rogerio Valencio da Silva), Instrutor Molejo. SOURCE: website 4/29/18', 'capoeirawestbank@gmail.com', '[{"type":"website","url":"http://nolacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f888234a-ed9d-403c-b990-b18010752ec9', '9208c26f-c0eb-479e-be96-4ee151ecfbb4', 'NOLA BJJ studio', 'Schedule: Adult Beginner: Mon & Wed 8:00-9:00pm; Kids: Mon & Wed 5;00-6:00pm
Email: capoeirawestbank@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.02919,29.927937]},"properties":{"address":"2901 General de Gaulle Dr, New Orleans, LA 70114","displayName":"2901, General de Gaulle Drive, New Orleans, Orleans Parish, Louisiana, 70114, United States of America","countryCode":"US","boundingBox":[29.927887,29.927987,-90.02924,-90.02914]}}'::jsonb);

-- Group: Grupo Besouro Capoeira Angola New Orleans
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ccd2993a-dc86-4a6a-96c3-037a6ad92b67', NOW(), NOW(), 'Grupo Besouro Capoeira Angola New Orleans', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Curtis Pierre - [1] 504-236-7479
Notes: New Orleans, Louisiana. Instructor: Curtis Pierre. SOURCE: websites 4/29/18', 'casasambaneworleans@gmail.com', '[{"type":"website","url":"http://capoeiraangolaneworleans.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ab823526-db31-4210-83b8-d3e67a042415', 'ccd2993a-dc86-4a6a-96c3-037a6ad92b67', 'Annunciation Cente', 'Schedule: Capoeira Angola Kids: Wed & Fri 6:00-7:00pm; Capoeira Angola Adults: Wed & Fri 7:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.068854,29.933527]},"properties":{"address":"800 Race Street, New Orleans, LA, 70130","displayName":"800, Race Street, The Saulet Apartment Homes, Garden District, New Orleans, Orleans Parish, Louisiana, 70130, United States of America","countryCode":"US","boundingBox":[29.933477,29.933577,-90.068904,-90.068804]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b23f2afa-a543-4aec-bf2e-dc126590c6b3', 'ccd2993a-dc86-4a6a-96c3-037a6ad92b67', 'Tulane University Capoeira Angola Club - Uptown Gym of the Reily Center', 'Schedule: Tues 8:00-10:00pm; Fri 5:00-7:00pm
Email: capoeira@tulane.edu', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.1201009,29.9412196]},"properties":{"address":"Tulane University, New Orleans, LA 70118","displayName":"Tulane University, 6823, Saint Charles Avenue, Black Pearl, Greenville, New Orleans, Orleans Parish, Louisiana, 70118, United States of America","countryCode":"US","boundingBox":[29.9342635,29.948289,-90.1238755,-90.1143296]}}'::jsonb);

-- Group: Northampton Capoeira - Capoeira Rosa Rubra
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('54676845-ac4c-4ffa-b3fc-1321d9d313c2', NOW(), NOW(), 'Northampton Capoeira - Capoeira Rosa Rubra', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: ESTAGIARIO Bicicleta
Main Contact: Estagiario Bicicleta - +1 413 362 0642
Notes: Northampton, Massachusetts. Estagiario Bicicleta under Mestre Calango[Boston]. SOURCE: website 2/6/19', 'nohocapoeira@gmail.com', '[{"type":"website","url":"https://www.gunga.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3fad52de-d65f-41fe-9b9d-b51a4f114cc0', '54676845-ac4c-4ffa-b3fc-1321d9d313c2', 'East Street Studios', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-72.5825266,42.3465082]},"properties":{"address":"47 East Street, Hadley, MA 01035","displayName":"47, East Street, Hadley Center Historic District, Hadley, Hampshire County, Massachusetts, 01035, United States of America","countryCode":"US","boundingBox":[42.3461529,42.3467387,-72.5830886,-72.582327]}}'::jsonb);

-- Group: Associação de Capoeira Mandingueiros dos Palmares [Capoeira MdP] - Boston
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c165450c-95ae-4343-a339-525ac87b8ba7', NOW(), NOW(), 'Associação de Capoeira Mandingueiros dos Palmares [Capoeira MdP] - Boston', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisco
Main Contact: Mestre Chuvisco - [857] 230-9139
Notes: Boston, Massachusetts (Suffolk County). Mestre Chuvisco. SOURCE: email 1/31/20', 'contact@capoeiramdp.com', '[{"type":"website","url":"http://capoeiramdp.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5d4ec3ad-690a-41ba-a191-2212bf8bebfd', 'c165450c-95ae-4343-a339-525ac87b8ba7', 'South Boston Yoga Center', 'Schedule: All Levels: Sun 2:00-3:30pm
Phone: [617] 315-7448', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0535296,42.3406776]},"properties":{"address":"36 W Broadway, Boston, MA 02127","displayName":"36, West Broadway, Seaport, South Boston, Boston, Suffolk County, Massachusetts, 02127, United States of America","countryCode":"US","boundingBox":[42.3406276,42.3407276,-71.0535796,-71.0534796]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('566f0e96-85f9-48f0-b17a-e049d998816b', 'c165450c-95ae-4343-a339-525ac87b8ba7', 'Boston University', 'Schedule: Mon & Wed 7:00 - 8:30pm (Boston University Students and Faculty Only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1006995,42.3478016]},"properties":{"address":"700 Beacon St Boston, MA 02215","displayName":"Beacon Street, Audubon Circle, Fenway, Boston, Suffolk County, Massachusetts, 02215, United States of America","countryCode":"US","boundingBox":[42.347536,42.3481714,-71.1018535,-71.0995747]}}'::jsonb);

-- Group: SINHA' Capoeira - Boston
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('6c414eed-ba50-40ae-9628-6e273c8a7ef7', NOW(), NOW(), 'SINHA'' Capoeira - Boston', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisquinho (Lindemberg Souza)
Main Contact: Mestre Chuvisquinho - 857-417-9394
Notes: Boston, Massachusetts. Mestre Chuvisquinho (Lindemberg Souza). SOURCE: website 5/26/18', NULL, '[{"type":"website","url":"http://sinhacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('31d77aa0-9129-4c05-b8f5-63dd63efb9a3', '6c414eed-ba50-40ae-9628-6e273c8a7ef7', 'Boston Martial Arts Center', 'Schedule: Adults: Sat 3:30 - 5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1319051,42.3514477]},"properties":{"address":"161 Harvard Ave Allston, MA","displayName":"Salsa y Control, 161, Harvard Avenue, Allston Village, Allston, Boston, Suffolk County, Massachusetts, 02134, United States of America","countryCode":"US","boundingBox":[42.3513977,42.3514977,-71.1319551,-71.1318551]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1fe4c384-e8ad-47bc-962e-9dfe06ec8869', '6c414eed-ba50-40ae-9628-6e273c8a7ef7', 'SINHA'' Capoeira Dorchester', 'Schedule: Kids & Teens: Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0594437,42.315411]},"properties":{"address":"48 Pleasant St, Dorchester, MA","displayName":"48, Pleasant Street, Uphams Corner, Dorchester, Boston, Suffolk County, Massachusetts, 02125, United States of America","countryCode":"US","boundingBox":[42.3152763,42.3155415,-71.0595963,-71.0593602]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7aeb8473-5ea9-46be-812e-685cea0d0137', '6c414eed-ba50-40ae-9628-6e273c8a7ef7', 'Northeastern University', 'Schedule: Mon & Tues 2:00 - 3:30pm (NEU students only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0892579,42.3351053]},"properties":{"address":"Northeastern University, Boston, MA","displayName":"Northeastern University, 360, Huntington Avenue, Fenway, Boston, Suffolk County, Massachusetts, 02115, United States of America","countryCode":"US","boundingBox":[42.334667,42.3458049,-71.0936211,-71.0830404]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fb64b71d-9326-40a4-bd68-e1c20373498f', '6c414eed-ba50-40ae-9628-6e273c8a7ef7', 'University of Mass- Boston', 'Schedule: Mon & Wed 4:00 - 5:00pm ( UMB students & faculty only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0387132,42.314068]},"properties":{"address":"University of Massachusetts Boston, Boston, MA","displayName":"University of Massachusetts Boston, 150, Mount Vernon Street, Dorchester, Boston, Suffolk County, Massachusetts, 02125, United States of America","countryCode":"US","boundingBox":[42.3103068,42.3178731,-71.046738,-71.0326914]}}'::jsonb);

-- Group: Associação de Capoeira Mandingueiros dos Palmares [Capoeira MdP] - Gloucester
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9c8f3354-20d1-43e0-a139-4c0a4ae3b443', NOW(), NOW(), 'Associação de Capoeira Mandingueiros dos Palmares [Capoeira MdP] - Gloucester', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisco
Main Contact: Mestre Chuvisco - [857] 230-9139
Notes: Gloucester, Massachusetts (Essex County). Mestre Chuvisco. SOURCE: email 1/31/20', 'contact@capoeiramdp.com', '[{"type":"website","url":"http://capoeiramdp.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('555a84b5-0c33-413d-b394-cbf926f0248f', '9c8f3354-20d1-43e0-a139-4c0a4ae3b443', 'Movement Arts Gloucester Massachusetts [MAGMA]', 'Schedule: Tues 8:00- 9:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-70.6617982,42.6139065]},"properties":{"address":"11 Pleasant St,Gloucester, MA 01930","displayName":"11, Pleasant Street, Central Gloucester Historic District, Five Pound Island, Gloucester, Essex County, Massachusetts, 01930, United States of America","countryCode":"US","boundingBox":[42.6138565,42.6139565,-70.6618482,-70.6617482]}}'::jsonb);

-- Group: Group Capoeira Camara Angola - Cambridge
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d70cc184-d816-427d-af7f-84f8f3b75b46', NOW(), NOW(), 'Group Capoeira Camara Angola - Cambridge', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Deraldo Ferreira
Main Contact: Mestre Deraldo Ferreira - 857.246.4090
Notes: Cambridge, Massachusetts (Middlesex County). Mestre Deraldo Ferreira. SOURCE: website 7/18/18', 'deraldoferr@gmail.com', '[{"type":"website","url":"http://www.capoeira-angola.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0dc36cf4-1678-422f-86e1-034a0207157a', 'd70cc184-d816-427d-af7f-84f8f3b75b46', 'Dance Complex', 'Schedule: Wed 7:00-8:30pm; Sat 3:00-5:00 pm; Sun 11:30am-1:00pm
Phone: [617]547-9363', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1023016,42.3642314]},"properties":{"address":"536 Massachusetts Avenue, Cambridge, MA 02139-4029","displayName":"Odd Fellows Hall, 534;536;538, Massachusetts Avenue, Central Square, Cambridge, Middlesex County, Massachusetts, 02139, United States of America","countryCode":"US","boundingBox":[42.3640931,42.3643696,-71.1024769,-71.1021262]}}'::jsonb);

-- Group: Associação de Capoeira Mandingueiros dos Palmares - Cambridge
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('317c3869-b834-4e40-9549-7f17907fd313', NOW(), NOW(), 'Associação de Capoeira Mandingueiros dos Palmares - Cambridge', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisco
Main Contact: Mestre Chuvisco - [857] 230-9139
Notes: Cambridge, Massachusetts (Middlesex County). Mestre Chuvisco. SOURCE: email 1/31/20', 'contact@capoeiramdp.com', '[{"type":"website","url":"http://capoeiramdp.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('aa457759-7101-4a38-ade5-6b32c21834a1', '317c3869-b834-4e40-9549-7f17907fd313', 'Dance Complex', 'Schedule: Mon 6:30 - 8:30pm (studio 2); Sat 10:30am-12:00pm (studio 6)
Phone: [617] 547-9363', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1023016,42.3642314]},"properties":{"address":"536 Massachusetts Avenue, Cambridge, MA","displayName":"Odd Fellows Hall, 534;536;538, Massachusetts Avenue, Central Square, Cambridge, Middlesex County, Massachusetts, 02139, United States of America","countryCode":"US","boundingBox":[42.3640931,42.3643696,-71.1024769,-71.1021262]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('82610015-9770-4294-8d07-74fc6276aeb7', '317c3869-b834-4e40-9549-7f17907fd313', 'Windsor Community Art Center', 'Schedule: Children[8+] Wed & Thurs 6:30-7:30pm; Adults: Wed & Thurs 7:30-8:30pm
Phone: [617] 868-7100', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.0966449,42.3646976]},"properties":{"address":"119 Windsor St, Cambridge, MA 02139","displayName":"Windsor St. Health & Community Center, 119, Windsor Street, The Port, Cambridge, Middlesex County, Massachusetts, 02139, United States of America","countryCode":"US","boundingBox":[42.3646476,42.3647476,-71.0966949,-71.0965949]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2c0a6ce1-87e6-49fb-b47a-b75e4e303fac', '317c3869-b834-4e40-9549-7f17907fd313', 'Harvard Capoeira Regional Club', 'Schedule: Mon 8:30-9:55pm[ (Fitness Room 2)]; Wed 8:30-9:55pm[(Mezzanine)] (Harvard Faculty and Students only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1190632,42.3713205]},"properties":{"address":"39 Holyoke St, Cambridge, MA 02139","displayName":"39, Holyoke Street, Cambridge, Middlesex County, Massachusetts, 02138, United States of America","countryCode":"US","boundingBox":[42.3712705,42.3713705,-71.1191132,-71.1190132]}}'::jsonb);

-- Group: SINHA' Capoeira - Cambridge
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9e140729-715b-4ad5-84e5-4e17d2366964', NOW(), NOW(), 'SINHA'' Capoeira - Cambridge', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisquinho (Lindemberg Souza)
Main Contact: Mestre Chuvisquinho - 857-417-9394
Notes: Cambridge, Massachusetts (Middlesex County). Mestre Chuvisquinho (Lindemberg Souza). SOURCE: website 5/26/18', NULL, '[{"type":"website","url":"http://sinhacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f8f2cff2-9e15-4c18-a415-c49be7f49d3c', '9e140729-715b-4ad5-84e5-4e17d2366964', 'New England Aikikai', 'Schedule: Ages 5-12: Tues & Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1214997,42.3902286]},"properties":{"address":"2000 Massachusetts Ave, Cambridge MA","displayName":"2000, Massachusetts Avenue, Cambridge, Middlesex County, Massachusetts, 02140, United States of America","countryCode":"US","boundingBox":[42.3900666,42.3904157,-71.1217366,-71.1212628]}}'::jsonb);

-- Group: SINHA' Capoeira - Brookline
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c70b9d01-ee22-448a-8f71-f4a99323b0d3', NOW(), NOW(), 'SINHA'' Capoeira - Brookline', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisquinho (Lindemberg Souza)
Main Contact: Mestre Chuvisquinho - 857-417-9394
Notes: Brookline, Massachusetts (Norfolk County). Mestre Chuvisquinho (Lindemberg Souza). SOURCE: website 5/26/18', NULL, '[{"type":"website","url":"http://sinhacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('985bf1b4-059b-46f1-b376-649bac18ff59', 'c70b9d01-ee22-448a-8f71-f4a99323b0d3', 'Jean Paige Dance Studio', 'Schedule: Adults: Mon & Wed 8:30 to 10:300pm; Teens: Sat 12:30-1:30pm; ages 3.5-12: Sat 1:30-2:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-71.1261463,42.3406599]},"properties":{"address":"1431 Beacon Street, Brookline MA","displayName":"1431, Beacon Street, Coolidge Corner, North Brookline, Brookline, Norfolk County, Massachusetts, 02446, United States of America","countryCode":"US","boundingBox":[42.3406099,42.3407099,-71.1261963,-71.1260963]}}'::jsonb);

-- Group: Associação de Capoeira Mandingueiros dos Palmares - Abington
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9859b8ac-32bb-4ebf-a2d2-c4b562bab3e7', NOW(), NOW(), 'Associação de Capoeira Mandingueiros dos Palmares - Abington', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chuvisco
Main Contact: Mestre Chuvisco - [857] 230-9139
Notes: Abington, Massachusetts (Plymouth County). Mestre Chuvisco. SOURCE: email 1/21/20', 'contact@capoeiramdp.com', '[{"type":"website","url":"http://capoeiramdp.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ebf94ddf-cef3-48e1-980c-c3f9ee1de002', '9859b8ac-32bb-4ebf-a2d2-c4b562bab3e7', 'Boston Taekwondo Academy', 'Schedule: Sat 3:00 - 4:30pm; Sun | 10:30am - 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-70.9538067,42.1457805]},"properties":{"address":"1501 Bedford St Abington, MA 02351","displayName":"1501, Bedford Street, North Abington, Abington, Plymouth County, Massachusetts, 02351, United States of America","countryCode":"US","boundingBox":[42.1457305,42.1458305,-70.9538567,-70.9537567]}}'::jsonb);

-- Group: Xango Capoeira Darwin Academy
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9093c2a2-70a5-4ae1-ac03-332dda6cfa5d', NOW(), NOW(), 'Xango Capoeira Darwin Academy', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: (Enrique Saldana)
Main Contact: - 0416 565 136
Notes: Darwin, Northern Territory, Australia. SOURCE: website 1/27/17', 'jenrique@xangocapoeira.com.au', '[{"type":"website","url":"http://xangocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d8e0ef1c-17bb-4bab-be73-4bdbfd0012f2', '9093c2a2-70a5-4ae1-ac03-332dda6cfa5d', 'The Gym At CDU', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[130.8823639,-12.3737641]},"properties":{"address":"Casuarina, Northern Territory, Australia","displayName":"Casuarina, Darwin, City of Darwin, Northern Territory, 0810, Australia","countryCode":"AU","boundingBox":[-12.377589,-12.369968,130.876531,130.886235]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f7f3186f-f3b1-4e43-b4f4-fb160da3067a', '9093c2a2-70a5-4ae1-ac03-332dda6cfa5d', 'Chambers Crescent Theatre', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[130.9064409,-12.3976602]},"properties":{"address":"Chambers Crescent, Malak, NT, Australia","displayName":"Chambers Crescent, Malak, Darwin, City of Darwin, Northern Territory, 0812, Australia","countryCode":"AU","boundingBox":[-12.3978089,-12.3942011,130.9025959,130.9080322]}}'::jsonb);

-- Group: Grupo Capoeira Aruanda
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d4354b0a-4761-4c80-ac92-727ec3f67766', NOW(), NOW(), 'Grupo Capoeira Aruanda', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Borracha (Jose de Amorim)
Main Contact: - 0414 745 161
Notes: New South Wales, Australia. SOURCE: website 1/14/17', 'info@CapoeiraAruanda.com', '[{"type":"website","url":"http://aruanda.com.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dbb5740c-0088-476d-8734-a61423a1db68', 'd4354b0a-4761-4c80-ac92-727ec3f67766', 'Ultimo Public School', 'Schedule: All Levels: Mon & Wed 7:30-8:30pm; Beginners: Mon & Wed 6:30-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[151.1953938,-33.8773438]},"properties":{"address":"Quarry St, Ultimo NSW 2007","displayName":"Quarry Street, Ultimo, Sydney CBD, Sydney, Council of the City of Sydney, New South Wales, 2007, Australia","countryCode":"AU","boundingBox":[-33.8775558,-33.8771291,151.1948569,151.1959296]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4cb51854-7d29-49f4-a47f-81400c76ef13', 'd4354b0a-4761-4c80-ac92-727ec3f67766', 'Coogee Senior Citizens Hall', 'Schedule: Kids Class [7-12 years]: Thurs6:00 – 6:45pm; Adult Class: Thurs 7:00 – 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[151.2542053,-33.921437]},"properties":{"address":"97 Brook St, Coogee NSW","displayName":"Brook Street, Coogee, Eastern Suburbs, Sydney, Randwick City Council, New South Wales, 2034, Australia","countryCode":"AU","boundingBox":[-33.9223863,-33.920485,151.2539973,151.2544005]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7778d23a-652a-464f-b3fe-9e7620a5cd1c', 'd4354b0a-4761-4c80-ac92-727ec3f67766', '218 Church', 'Schedule: Mon 6:15-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[151.003444,-33.8168759]},"properties":{"address":"218 Church St, Parramatta NSW","displayName":"Church Street, Parramatta, Sydney, City of Parramatta Council, New South Wales, 2150, Australia","countryCode":"AU","boundingBox":[-33.8169249,-33.8168266,151.0034338,151.0034555]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('97567cd9-f55e-4bc1-815f-b303a0d8ec9c', 'd4354b0a-4761-4c80-ac92-727ec3f67766', 'Nova Flow Academy', 'Schedule: Women Class Only / All Levels Mon 6:00 – 7:00 pm; children: Tues & Thurs 6:00 – 6:30pm; Open class: Tues & Thurs 6:30 – 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[151.7764374,-32.9268854]},"properties":{"address":"180 King Street, Newcastle, NSW 2300, Australia","displayName":"devFU, 180, King Street, Newcastle, Newcastle-Maitland, City of Newcastle, New South Wales, 2300, Australia","countryCode":"AU","boundingBox":[-32.9269354,-32.9268354,151.7763874,151.7764874]}}'::jsonb);

-- Group: Xango Capoeira - Queensland
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('593fd300-cb2d-4138-9b7a-8d76dd5e53d8', NOW(), NOW(), 'Xango Capoeira - Queensland', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Luizinho Barravento
Main Contact: - [07] 5578 6353
Notes: Queensland, Australia. Formerly Zambiacongo. Phone: 0417 613 787. Professor Caracol: 0421 179 359. SOURCE: website 11/27/10', 'barraventoau@yahoo.com.au', '[{"type":"website","url":"http://xangocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9d5918f3-8e87-450b-859b-1d8fd6444c9e', '593fd300-cb2d-4138-9b7a-8d76dd5e53d8', 'Queensland location', 'Schedule: (Full schedule of classes)
Phone: 0421 179 359', '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.4353906,-28.0664251]},"properties":{"address":"10/23 Hillcrest Parade Miami, Gold Coast","displayName":"Hillcrest Parade, Miami, Gold Coast City, Queensland, 4220, Australia","countryCode":"AU","boundingBox":[-28.0675205,-28.0651885,153.4350582,153.4360251]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('46ee981a-b468-4368-9089-4f33df1f3e6f', '593fd300-cb2d-4138-9b7a-8d76dd5e53d8', 'Xango Capoeira Brisbane Academy', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.003176,-27.4828544]},"properties":{"address":"349 Montague Road West End, QLD","displayName":"349, Montague Road, Hill End, West End, Greater Brisbane, Queensland, 4101, Australia","countryCode":"AU","boundingBox":[-27.4829804,-27.4827154,153.003003,153.0033489]}}'::jsonb);

-- Group: Capoeira Brasil- Townsvilles
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ea3660dc-4159-4b04-b5c0-93e143519160', NOW(), NOW(), 'Capoeira Brasil- Townsvilles', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMANDO Uakari (Matthew Eales)
Main Contact: - [07] 4773 6877
Notes: Queensland, Australia. Formando Uakari under Mestre Peixe. Postal Address: PO Box 4355, Kirwan Qld 4817. Mob: 0416 100 377. SOURCE: website 1/27/17', 'info@capoeiraschool.com.au', '[{"type":"website","url":"http://www.capoeiraschool.com.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('85e7fa03-4907-4612-9891-9ce2a69a1795', 'ea3660dc-4159-4b04-b5c0-93e143519160', 'Townsville location', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[146.7688958,-19.2932835]},"properties":{"address":"17 Fleming St, Aitkenvale QLD 4812","displayName":"Fleming Street, Aitkenvale, Townsville, Townsville City, Queensland, 4814, Australia","countryCode":"AU","boundingBox":[-19.2937236,-19.2928683,146.7670419,146.7707552]}}'::jsonb);

-- Group: Kadara Capoeira Gold Coast
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2ea7fed0-7d1e-4907-98da-dced218aebe4', NOW(), NOW(), 'Kadara Capoeira Gold Coast', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Tamandua (Phellipe Mello)
Main Contact: - 0423 293 771
Notes: Queensland, Australia. Instrutor Tamandua, student of Mestre Cicatriz. SOURCE: website 1/20/17', NULL, '[{"type":"website","url":"http://www.learncapoeira.com.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a6b50f07-7452-4689-bee3-5bdf1878eca6', '2ea7fed0-7d1e-4907-98da-dced218aebe4', 'Surfer''s Paradise Primary School', 'Schedule: Tues: 6.00-7.00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.4228479,-28.0115443]},"properties":{"address":"St Andrews Ave, Isle of Capri","displayName":"Church of Jesus Christ of Latter-Day Saints - Isle Of Capri Chapel, St Andrews Avenue, Surfers Paradise, Gold Coast City, Queensland, 4217, Australia","countryCode":"AU","boundingBox":[-28.0117169,-28.0113638,153.4225966,153.4230992]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('496a8666-5a6f-4d67-a165-d11a64a5eb50', '2ea7fed0-7d1e-4907-98da-dced218aebe4', 'Bellevue Park Primary School', 'Schedule: Thurs : 5.45-7.00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.4066696,-27.9687807]},"properties":{"address":"Southport, QLD 4215, Australia","displayName":"Southport, Gold Coast City, Queensland, 4215, Australia","countryCode":"AU","boundingBox":[-27.998492,-27.951279,153.376002,153.422794]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3c531441-2833-47dc-a780-ffd203532418', '2ea7fed0-7d1e-4907-98da-dced218aebe4', 'Ashmore PCYC', 'Schedule: KIDS: Sat 10.00-11.00am; ADULTS: Sat11.00-12.00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[153.383882,-27.9802444]},"properties":{"address":"Dominions Rd, Ashmore","displayName":"Dominions Road, Ashmore, Gold Coast City, Queensland, 4214, Australia","countryCode":"AU","boundingBox":[-27.9822643,-27.9782359,153.3836254,153.3842479]}}'::jsonb);

-- Group: Academia Grupo Capoeira Cordão de Ouro Malaysia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9ce3c11a-f0ef-4682-8bc7-df5cfe43b801', NOW(), NOW(), 'Academia Grupo Capoeira Cordão de Ouro Malaysia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Braulio
Notes: Singapore and Malaysia. SOURCE: website 3/17/17', NULL, '[{"type":"website","url":"http://www.capoeira.my"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('7f3cdd6f-7daa-4190-8c38-cbbbfe7110ff', '9ce3c11a-f0ef-4682-8bc7-df5cfe43b801', 'Malaysia location', 'Schedule: Mon, Wed, & Fri 8:30-10:00pm; Kids Sat 4:30-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[101.6340073,3.1112064]},"properties":{"address":"Jalan 14/22, Section 14, Petaling Jaya, Selangor, Malaysia","displayName":"Jalan 14/22, Seksyen 14, Petaling Jaya, Petaling, Selangor, 46200, Malaysia","countryCode":"MY","boundingBox":[3.1106254,3.1118253,101.6338987,101.6343121]}}'::jsonb);

-- Group: Capoeira Angoleiros do Mar
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4b8210ef-8369-4564-8a40-3bfc85205c65', NOW(), NOW(), 'Capoeira Angoleiros do Mar', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Marcelo Angola
Main Contact: Grandao - 07521298488
Notes: Oxfordshire, England. Under Mestre Marcelo Angola [Itaparica, Bahia, Brazil.]. Lobinho: 07411776771, maurizio_1984@msn.com. SOURCE: websites 11/19/16', 'chrisgraham10@gmail.com', '[{"type":"website","url":"http://www.oxfordcapoeira.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b826c94a-7222-416a-9ad6-a99eafaffd81', '4b8210ef-8369-4564-8a40-3bfc85205c65', 'Warneford Chapel', 'Schedule: Tues & Thurs 7:00-9:00pm; Sat 9:30-10:30am; Music: Thurs 6;00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.2228935,51.7516089]},"properties":{"address":"Warneford Lane, Headington OX3 7JX","displayName":"Warneford Lane, Headington, Oxford, Oxfordshire, England, OX3 7QJ, United Kingdom","countryCode":"GB","boundingBox":[51.7506824,51.7524776,-1.2243886,-1.2213668]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5d5ed772-4b25-49c0-b80b-5be16df69fcd', '4b8210ef-8369-4564-8a40-3bfc85205c65', 'Brookes University Sports Centre', 'Schedule: Beginners: Mon 6:45-8:00pm; Wed 5:00-6:00pm (during Brookes University Term time)
Phone: 07411776771
Email: maurizio_1984@msn.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.2303058,51.7529353]},"properties":{"address":"Cheney Lane, Headington, Oxford, OX3 0BD, UK","displayName":"Cheney Lane, Headington Hill, Headington, Oxford, Oxfordshire, England, OX3 0BF, United Kingdom","countryCode":"GB","boundingBox":[51.7526041,51.753358,-1.2322215,-1.2283714]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cc026337-218e-4115-b1e8-668300403565', '4b8210ef-8369-4564-8a40-3bfc85205c65', 'The University Club', 'Schedule: Mixed ability: Sun 4:00-7:00pm; Beginners: Wed6.30-7.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.2513538,51.7571363]},"properties":{"address":"11 Mansfield Road, Oxford OX1 3SZ","displayName":"University Club, 11, Mansfield Road, Holywell, City Centre, Oxford, Oxfordshire, England, OX1 3SZ, United Kingdom","countryCode":"GB","boundingBox":[51.756948,51.7573321,-1.2515715,-1.2511067]}}'::jsonb);

-- Group: QMC Escuela de Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('405bd20e-d77f-421e-a7ff-dd8249edad92', NOW(), NOW(), 'QMC Escuela de Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRAMESTRE Marcus Cabeça
Main Contact: - 0208 617 9570
Notes: Surrey, England. Formerly Grupo Axé Capoeira. Mobile: 07931 770 153. SOURCE: website 2/1/20', 'info{/\T}pmc-capoeirauk.com', '[{"type":"website","url":"http://www.qmc-capoeirauk.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b8056671-b109-498e-a2ee-ca52664b9753', '405bd20e-d77f-421e-a7ff-dd8249edad92', 'Kingston University - Fitness Centre', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3043901,51.4034409]},"properties":{"address":"Penrhyn Road, Kingston upon Thames, KT1 2EE, UK","displayName":"Penrhyn Road, Surbiton, Royal Borough of Kingston upon Thames, London, Greater London, England, KT1 2ED, United Kingdom","countryCode":"GB","boundingBox":[51.402976,51.4039044,-0.3044653,-0.3043023]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c4f4aeab-d940-40d9-9da5-cd049dd1fe59', '405bd20e-d77f-421e-a7ff-dd8249edad92', 'Tiffin Girls'' School', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3048099,51.4255308]},"properties":{"address":"Richmond Road, Kingston upon Thames KT2 5PL","displayName":"Richmond Road, Royal Borough of Kingston upon Thames, London, Greater London, England, KT2 5PW, United Kingdom","countryCode":"GB","boundingBox":[51.4250351,51.4259985,-0.3051848,-0.3044731]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('425221e1-4d6d-4c57-a19b-39a0d2dd0ff0', '405bd20e-d77f-421e-a7ff-dd8249edad92', 'Piper Hall Community Centre', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.2896103,51.4066506]},"properties":{"address":"Piper Road, Kingston upon Thames, KT1 3EX","displayName":"Piper Road, Norbiton, Royal Borough of Kingston upon Thames, London, Greater London, England, KT1 3EX, United Kingdom","countryCode":"GB","boundingBox":[51.4062535,51.4070477,-0.2896307,-0.2895898]}}'::jsonb);

-- Group: Capoeira Science
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4fc354f1-4133-416c-b6db-a321aabd45ee', NOW(), NOW(), 'Capoeira Science', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 078 5361 1496
Notes: Surrey, England. SOURCE: website 10/25/16', 'info@capoeirascience.co.uk', '[{"type":"website","url":"http://www.capoeirascience.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bd9fcf9a-0315-4c9a-8960-a65d04d23f33', '4fc354f1-4133-416c-b6db-a321aabd45ee', 'Surrey location', 'Schedule: West Croydon[private classes only]', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1437744,51.4683931]},"properties":{"address":"283-291 Wandsworth Road, London","displayName":"Wandsworth Road, Clapham, London Borough of Lambeth, London, Greater London, England, SW8 3JE, United Kingdom","countryCode":"GB","boundingBox":[51.4681047,51.4686523,-0.1443861,-0.1431497]}}'::jsonb);

-- Group: London School of Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bbd97613-b88b-4bc7-b12a-71e6a53fd410', NOW(), NOW(), 'London School of Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 44 [0] 20 7281 2020
Notes: Surrey, England. No class information on website. Please contact us 11/20/16. SOURCE: website 6/9/12', 'info@londonschoolofcapoeira.co', '[{"type":"website","url":"http://www.londonschoolofcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('905943b5-dd22-4101-927a-41f14e54aa42', 'bbd97613-b88b-4bc7-b12a-71e6a53fd410', 'Cannons Health Club', 'Schedule: 8:00-9.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.3013365,51.4662488]},"properties":{"address":"Kew Foot Road, Richmond, TW9 2SS, UK","displayName":"Kew Foot Road, Kew, London Borough of Richmond upon Thames, London, Greater London, England, TW9 2TA, United Kingdom","countryCode":"GB","boundingBox":[51.4652253,51.4671822,-0.3021765,-0.3003272]}}'::jsonb);

-- Group: ABADA Capoeira Orange County
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('de20a55c-2f9e-411b-a3f8-561b224dda4a', NOW(), NOW(), 'ABADA Capoeira Orange County', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRA
Main Contact: - 16582
Notes: SOURCE: website 7/7/17', NULL, '[{"type":"website","url":"http://www.capoeiraoc.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ef5ae3c5-10a5-42c6-a679-5cae4614a67a', 'de20a55c-2f9e-411b-a3f8-561b224dda4a', 'Gothard St', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-117.9996851,33.7213998]},"properties":{"address":"16582 Gothard St, Huntington Beach, CA 92647","displayName":"16582, Gothard Street, Wintersburg, Huntington Beach, Orange County, California, 92647, United States of America","countryCode":"US","boundingBox":[33.7207516,33.7218645,-117.9998298,-117.9995542]}}'::jsonb);

-- Batch: batch-04.json (44 groups)

-- Group: Placer and El Dorado Counties
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5a7e9f2e-d988-4f68-8ee1-578c0176a0ac', NOW(), NOW(), 'Placer and El Dorado Counties', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 2000
Notes: SOURCE: websites 7/17/17', 'luanda2000@gmail.com', '[{"type":"website","url":"http://www.capoeiraijexa.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c19556d8-0c3a-40a3-9f34-614263fd6411', '5a7e9f2e-d988-4f68-8ee1-578c0176a0ac', 'Gold Country Martial Arts Center', 'Schedule: Tues & Thurs 5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-120.798546,38.7296252]},"properties":{"address":"Placerville, CA 95667","displayName":"Placerville, El Dorado County, California, 95667, United States of America","countryCode":"US","boundingBox":[38.712864,38.7486766,-120.851472,-120.750502]}}'::jsonb);

-- Group: Capoeira Agua de Beber-United Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9441bfac-a01f-4fbd-9d7a-362e3a6ad701', NOW(), NOW(), 'Capoeira Agua de Beber-United Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Patrick Hilligan (under Mestre Acordeon Berkeley)
Main Contact: - 600
Notes: SOURCE: website  7/24/17', 'saccap@hotmail.com', '[{"type":"website","url":"http://www.adbcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a962d3df-016d-49d2-ba95-028c6dbd4cda', '9441bfac-a01f-4fbd-9d7a-362e3a6ad701', 'Broadway', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-121.505794,38.565114]},"properties":{"address":"600 Broadway, Sacramento, CA 95818","displayName":"600, Broadway, Upper Land Park, Sacramento, Sacramento County, California, 95818, United States of America","countryCode":"US","boundingBox":[38.565064,38.565164,-121.505844,-121.505744]}}'::jsonb);

-- Group: Allied Capoeira League
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7da445ab-0553-45ad-8f90-2c24e7d372f2', NOW(), NOW(), 'Allied Capoeira League', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 4128
Notes: SOURCE: website 7/23/17', NULL, '[{"type":"website","url":"http://www.sacramentocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2041eeb2-9bc7-480e-b662-31a0a282d3e6', '7da445ab-0553-45ad-8f90-2c24e7d372f2', 'El Camino Ave', 'Schedule: Kids  [age 7-12]: Fri 5:30-6:20pm; Adult/Teen: Mon, Tues & Wed 6:30-7:45pm; Adult/Teen Roda: Fri  6:30-7:45pm (For ACL members only)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-121.367733,38.610197]},"properties":{"address":"4128 El Camino Ave, Sacramento, CA 95821","displayName":"4128, El Camino Avenue, Arden-Arcade, Sacramento County, California, 95821, United States of America","countryCode":"US","boundingBox":[38.610147,38.610247,-121.367783,-121.367683]}}'::jsonb);

-- Group: Capoeira IJEXÁ
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('444c3312-d7aa-48a9-ba3c-4716f53d36cc', NOW(), NOW(), 'Capoeira IJEXÁ', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 650.279.4107
Notes: SOURCE: website 7/17/17', 'dajujuman@gmail.com', '[{"type":"website","url":"http://www.capoeiraijexa.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('070a958a-4101-4d7b-9a47-02696f3f6a8b', '444c3312-d7aa-48a9-ba3c-4716f53d36cc', 'Brazilian Center', 'Schedule: Tues 6:00pm;  Sat 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-121.475962,38.5703478]},"properties":{"address":"2420 N St, Sacramento, CA","displayName":"Seasons Coffee Roasters, 2420, N Street, Lavender Heights, Midtown, Sacramento, Sacramento County, California, 95816, United States of America","countryCode":"US","boundingBox":[38.5702978,38.5703978,-121.476012,-121.475912]}}'::jsonb);

-- Group: Capoeira Mandinga
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('04e4bd1f-f8ba-4e2e-8c36-6b611891d77d', NOW(), NOW(), 'Capoeira Mandinga', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Paulo Lima (with the consent of Mestre CaveirinhaOakland)
Main Contact: - 3780
Notes: SOURCE: website 7/26/17', NULL, '[{"type":"website","url":"http://capoeirasd.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ee8b9401-c7aa-4545-bb27-2f8d8548c461', '04e4bd1f-f8ba-4e2e-8c36-6b611891d77d', 'Hancock Street', 'Schedule: Adult All Levels:  Tues 7:00-8:30pm; 7:00-8:15pm:  11:30-1:00am; Children:  Mon & Fri 4:45-5:45pm; Adult Beginners: Mon  8:30-10:00pm;  Wed  7:00-8:30pm; Adult  All Levels: Wed 8:30-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-117.2121269,32.7584019]},"properties":{"address":"3780 Hancock Street, San Diego, CA 92110","displayName":"3780, Hancock Street, Midway District, San Diego, San Diego County, California, 92110, United States of America","countryCode":"US","boundingBox":[32.7583519,32.7584519,-117.2121769,-117.2120769]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('887edd76-a646-4447-9265-4a0586ac0203', '04e4bd1f-f8ba-4e2e-8c36-6b611891d77d', 'Garnet Ave', 'Schedule: Adult All Levels:  Tues 7:00-8:30pm; 7:00-8:15pm:  11:30-1:00am; Children:  Mon & Fri 4:45-5:45pm; Adult Beginners: Mon  8:30-10:00pm;  Wed  7:00-8:30pm; Adult  All Levels: Wed 8:30-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-117.2541174,32.7969475]},"properties":{"address":"880 Garnet Ave, San Diego, CA 92109","displayName":"880, Garnet Avenue, Pacific Beach, San Diego, San Diego County, California, 92109, United States of America","countryCode":"US","boundingBox":[32.7968975,32.7969975,-117.2541674,-117.2540674]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('55ff3d78-f414-4094-9e38-5051f9cc90c5', '04e4bd1f-f8ba-4e2e-8c36-6b611891d77d', 'La Jolla', 'Schedule: Adult All Levels:  Tues 7:00-8:30pm; 7:00-8:15pm:  11:30-1:00am; Children:  Mon & Fri 4:45-5:45pm; Adult Beginners: Mon  8:30-10:00pm;  Wed  7:00-8:30pm; Adult  All Levels: Wed 8:30-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-117.2740777,32.8401623]},"properties":{"address":"La Jolla, CA 92093","displayName":"La Jolla, San Diego, San Diego County, California, 92037, United States of America","countryCode":"US","boundingBox":[32.8201623,32.8601623,-117.2940777,-117.2540777]}}'::jsonb);

-- Group: San Francisco Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('117424dd-1a85-4e5d-9563-21d4809f7a7d', NOW(), NOW(), 'San Francisco Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 640
Notes: SOURCE: website 1/9/18', 'Gingadocapoeira247@gmail.com', '[{"type":"website","url":"http://www.gingadocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('70089f16-e19a-41cc-80ed-bb35c638a96a', '117424dd-1a85-4e5d-9563-21d4809f7a7d', 'Stanyan St. San Francisco', 'Schedule: Adults: Mon, Wed, & Fri 7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4535211,37.7703868]},"properties":{"address":"640 Stanyan St. San Francisco, CA 94417","displayName":"636;638;640;644, Stanyan Street, Cole Valley, San Francisco, California, 94117, United States of America","countryCode":"US","boundingBox":[37.7702808,37.7704674,-122.4536662,-122.4532828]}}'::jsonb);

-- Group: ABADÁ-Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('216a99be-5d74-47f3-b7cb-305265aeaf1c', NOW(), NOW(), 'ABADÁ-Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTORA Jennifer Walsh (Excutive Director)
Main Contact: - 3221 22
Notes: SOURCE: website 7/31/17', 'info@abada.org', '[{"type":"website","url":"http://www.abada.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('99accb40-e8aa-4e17-925f-019842427f44', '216a99be-5d74-47f3-b7cb-305265aeaf1c', '22nd St. San Francisco', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4193161,37.7553182]},"properties":{"address":"3221 22nd St. San Francisco, 94110[","displayName":"3221, 22nd Street, Mission District, San Francisco, California, 94110, United States of America","countryCode":"US","boundingBox":[37.7552682,37.7553682,-122.4193661,-122.4192661]}}'::jsonb);

-- Group: Capoeira IJEXÁ
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c856f7e7-9051-47e0-be88-a374fd96d6fd', NOW(), NOW(), 'Capoeira IJEXÁ', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA
Main Contact: - 2095
Notes: SOURCE:  website 7/31/17', 'info@capoeiraijexa.com', '[{"type":"website","url":"http://ijexa.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dd0a56b5-2f00-4541-a730-afde069ed526', 'c856f7e7-9051-47e0-be88-a374fd96d6fd', 'Harrison Street', 'Schedule: Adults: Mon & Wed 7:00-9:00pm; Fri 6:30-9:00pm; Thurs 8:00am; Sat 12:00pm; Music class: Wed 6:00pm; Sun 10:30 & 12.; private classes:  Sun  2:30-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4128527,37.7643788]},"properties":{"address":"2095 Harrison Street, San Francisco, CA 94110","displayName":"Project Commotion, 2095, Harrison Street, Mission District, San Francisco, California, 90110, United States of America","countryCode":"US","boundingBox":[37.7643288,37.7644288,-122.4129027,-122.4128027]}}'::jsonb);

-- Group: Grupo Omulu Capoeira Guanabara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('31951669-f17e-4d5d-8af2-63ee4dd538f4', NOW(), NOW(), 'Grupo Omulu Capoeira Guanabara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 415] 710-7416
Notes: SOURCE: website 6/6/17', 'omulusf@gmail.com', '[{"type":"website","url":"http://sfcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('074bc489-1d01-4817-a971-eb212571ecdc', '31951669-f17e-4d5d-8af2-63ee4dd538f4', 'Mission Street', 'Schedule: Kids 6-11: Tues 4:00-5:00pm; Thurs 4:30-5:45pm; Kids 6-11: Fri 5:00pm- 6:30pm; Adults: Wed 6:00-7:30pm; Adults: Tues & Thur 6:30- 8:00pm; Adults: Sun 12:45- 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4186067,37.7509758]},"properties":{"address":"2868 Mission Street, San Francisco, CA 94110","displayName":"Mission Cultural Center for Latino Arts, 2868, Mission Street, Mission District, San Francisco, California, 94110, United States of America","countryCode":"US","boundingBox":[37.7508835,37.7510668,-122.4187347,-122.4184786]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4a3bcd0c-256c-4a91-9e58-e8d648d25a4d', '31951669-f17e-4d5d-8af2-63ee4dd538f4', 'Cesar Chavez Street', 'Schedule: Kids 6-11: Tues 4:00-5:00pm; Thurs 4:30-5:45pm; Kids 6-11: Fri 5:00pm- 6:30pm; Adults: Wed 6:00-7:30pm; Adults: Tues & Thur 6:30- 8:00pm; Adults: Sun 12:45- 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4190005,37.7480111]},"properties":{"address":"3435 Cesar Chavez Street, San Francisco, CA 94110","displayName":"3435, Cesar Chavez Street, Mission District, San Francisco, California, 94110, United States of America","countryCode":"US","boundingBox":[37.7479611,37.7480611,-122.4190505,-122.4189505]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a60a2a5d-85ed-4cce-905a-6a8c4fd81bd3', '31951669-f17e-4d5d-8af2-63ee4dd538f4', 'South Van Ness', 'Schedule: Kids 6-11: Tues 4:00-5:00pm; Thurs 4:30-5:45pm; Kids 6-11: Fri 5:00pm- 6:30pm; Adults: Wed 6:00-7:30pm; Adults: Tues & Thur 6:30- 8:00pm; Adults: Sun 12:45- 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4172124,37.7621456]},"properties":{"address":"672 South Van Ness, San Francisco, CA 94110","displayName":"South Van Ness Avenue, Mission District, San Francisco, California, 90110, United States of America","countryCode":"US","boundingBox":[37.7619709,37.7623203,-122.4172286,-122.4171965]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6e887a7d-8778-42fb-876d-daeb1d560a8c', '31951669-f17e-4d5d-8af2-63ee4dd538f4', '24th Street', 'Schedule: Kids 6-11: Tues 4:00-5:00pm; Thurs 4:30-5:45pm; Kids 6-11: Fri 5:00pm- 6:30pm; Adults: Wed 6:00-7:30pm; Adults: Tues & Thur 6:30- 8:00pm; Adults: Sun 12:45- 2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4277022,37.7515215]},"properties":{"address":"3813 24th Street, San Francisco, CA 94110","displayName":"3801;3805;3807;3809;3811;3813, 24th Street, Noe Valley, Mission District, San Francisco, California, 94114, United States of America","countryCode":"US","boundingBox":[37.7513439,37.7516161,-122.4278452,-122.4275607]}}'::jsonb);

-- Group: Capoeira Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ccc75640-81ed-444d-844f-7a77226043d4', NOW(), NOW(), 'Capoeira Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR
Main Contact: - 3906
Notes: SOURCE: website 8/7/17', 'capoeirabrasilsf@gmail.com', '[{"type":"website","url":"http://www.aranhacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ba483476-ad31-49aa-b536-c25e8170fe5c', 'ccc75640-81ed-444d-844f-7a77226043d4', 'Irving St.', 'Schedule: Adult Basics: Mon 7:30 á 9:00pm; Kids[6 -12]: Tues & Thurs 5:45 á 6:45pm; Adult: Tues 7:00 á 8:30pm; Sat 11:00am á 12:30pm; Adult Instruments and Music: Thurs 7:00á 8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4998494,37.7627162]},"properties":{"address":"3906 Irving St., San Francisco, CA","displayName":"3900;3906, Irving Street, Sunset District, San Francisco, California, 94121, United States of America","countryCode":"US","boundingBox":[37.7626715,37.7628164,-122.4999342,-122.4997685]}}'::jsonb);

-- Group: Capoeira Brasil,
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('68d03328-51ab-4042-afb0-840e86cbfb40', NOW(), NOW(), 'Capoeira Brasil,', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 415-793-2988
Notes: SOURCE: website 8/7/17', 'itabora@yahoo.com', '[{"type":"website","url":"http://www.institutebrazilianfitness.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b81f70b6-6d8c-4db1-ac61-2fcded34a478', '68d03328-51ab-4042-afb0-840e86cbfb40', 'Old County Road', 'Schedule: Adults: Mon 7:30-9:00pm; Wed 6:30-7:30pm; Sat 12:15-1:30pm 1; Kids:  Tues & Thurs  5:00-6:00pm; Music:  Thurs 8:15-9:00pm; Conditioning: Thurs  7:30-8:10pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2817744,37.5263093]},"properties":{"address":"409 Old County Road, Belmont, CA 94002","displayName":"409, Old County Road, Belmont, San Mateo County, California, 94002, United States of America","countryCode":"US","boundingBox":[37.5262593,37.5263593,-122.2818244,-122.2817244]}}'::jsonb);

-- Group: Capoeira Batuque
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cb27b6dd-0a3e-4174-833b-2ccd12da3fec', NOW(), NOW(), 'Capoeira Batuque', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR
Main Contact: - 69
Notes: SOURCE: website 8/4/19', NULL, '[{"type":"website","url":"https://www.capoeiradalycity.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('195f4af1-89f1-4686-928b-9aaefdd573f1', 'cb27b6dd-0a3e-4174-833b-2ccd12da3fec', 'Washington Street', 'Schedule: All Levels All Styles:Tues & Thurs  6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4685092,37.6877957]},"properties":{"address":"69 Washington Street, Daly City, CA 94014","displayName":"69, Washington Street, Daly City, San Mateo County, California, 94014, United States of America","countryCode":"US","boundingBox":[37.6877457,37.6878457,-122.4685592,-122.4684592]}}'::jsonb);

-- Group: Capoeira IJEXÁ
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('52539b6e-951d-40ba-9ea5-b01164bef3cb', NOW(), NOW(), 'Capoeira IJEXÁ', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 650.483.7743
Notes: SOURCE: website 7/17/17', 'rgmolyneaux@gmail.com', '[{"type":"website","url":"http://www.capoeiraijexa.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d0047182-86f2-4432-87c6-2bd16292cfb1', '52539b6e-951d-40ba-9ea5-b01164bef3cb', 'Pacifica Athletic Center [P.A.C.]', 'Schedule: Thurs 6:30pm; Sat 10:30am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4972189,37.5965079]},"properties":{"address":"640 Crespi Drive, Pacifica, CA 94044","displayName":"640, Crespi Drive, Pedro Valley, Pacifica, San Mateo County, California, 94044, United States of America","countryCode":"US","boundingBox":[37.5964579,37.5965579,-122.4972689,-122.4971689]}}'::jsonb);

-- Group: The Brazilian Cultural Arts Center of Santa Barbara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bc63f577-2b51-402d-87b6-6ac76f559d90', NOW(), NOW(), 'The Brazilian Cultural Arts Center of Santa Barbara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 805.
Notes: SOURCE: website 3/14/16, 8/1/17', 'marianosbdance@yahoo.com', '[{"type":"website","url":"http://www.capoeira805.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fd9c6c8c-5204-434f-88b1-2abccee32483', 'bc63f577-2b51-402d-87b6-6ac76f559d90', 'Hollister Ave', 'Schedule: All Levels: Mon 8:00; Wed 7:15; Kids & Parents: Fri 5:15; Beginners  Fri 6:15pm; Kids: Tues 6:15pm; All Levels Tues 6:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.8579716,34.4305224]},"properties":{"address":"370 Hollister Ave, Santa Barbara, CA 93117","displayName":"Hollister Avenue, Santa Barbara, Santa Barbara County, California, 93117, United States of America","countryCode":"US","boundingBox":[34.430339,34.430643,-119.859598,-119.8563399]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2d45d4d2-3741-4878-8257-4ba289f442d6', 'bc63f577-2b51-402d-87b6-6ac76f559d90', 'De La Vina St', 'Schedule: All Levels: Mon 8:00; Wed 7:15; Kids & Parents: Fri 5:15; Beginners  Fri 6:15pm; Kids: Tues 6:15pm; All Levels Tues 6:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.717435,34.428742]},"properties":{"address":"2009 De La Vina St, Santa Barbara, CA 93101","displayName":"2009, De La Vina Street, Santa Barbara, Santa Barbara County, California, 93105, United States of America","countryCode":"US","boundingBox":[34.428692,34.428792,-119.717485,-119.717385]}}'::jsonb);

-- Group: Capoeira Sul da Bahia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7887fb14-cf92-412a-8e93-aa58cf2fea11', NOW(), NOW(), 'Capoeira Sul da Bahia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 805] 637-5355
Notes: SOURCE: website 8/1/17', 'capoeirasb@gmail.com', '[{"type":"website","url":"http://www.capoeirasantabarbara.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a78dfa36-cd95-4978-a36d-395771c56ab5', '7887fb14-cf92-412a-8e93-aa58cf2fea11', 'State Street', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.705397,34.424239]},"properties":{"address":"1230 State Street, Santa Barbara, CA  93101","displayName":"Yona Redz, 1230, State Street, Santa Barbara, Santa Barbara County, California, 93101, United States of America","countryCode":"US","boundingBox":[34.424189,34.424289,-119.705447,-119.705347]}}'::jsonb);

-- Group: Raizes do Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0c2b8607-a63f-4717-8090-95318df8f0c1', NOW(), NOW(), 'Raizes do Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Papiba
Main Contact: - 207
Notes: SOURCE: website 8/16/17
SOURCE: google 8/18/17', 'info@santacruzcapoeira.com', '[{"type":"website","url":"http://www.santacruzcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('694dcfe1-7504-43c8-9e1b-d46236c243e6', '0c2b8607-a63f-4717-8090-95318df8f0c1', 'McPherson Street', 'Schedule: children ages 4-10:  Thurs  4:15pm; adults:  Thurs 5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.0478312,36.9601829]},"properties":{"address":"207 McPherson Street, Santa Cruz, CA 95060","displayName":"207, McPherson Street, Westside Industrial District, Westside, Santa Cruz, Santa Cruz County, California, 95060, United States of America","countryCode":"US","boundingBox":[36.9601329,36.9602329,-122.0478812,-122.0477812]}}'::jsonb);

-- Group: Capoeira Mandinga Santa Rosa
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ad3f9050-d1a1-4f04-8450-986ec76e6660', NOW(), NOW(), 'Capoeira Mandinga Santa Rosa', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA
Main Contact: - 1.
Notes: SOURCE:  website 8/21/17', 'Indiomandinga@gmail.com', '[{"type":"website","url":"http://doncarlos1.googlepages.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c948f58b-6b23-46d3-b358-1e09a4b432f3', 'ad3f9050-d1a1-4f04-8450-986ec76e6660', 'N Main Street', 'Schedule: Tues & Thurs 7:00-8:30pm; Adult beg  Mon 2-3pm; Kids 5-12: Mon 3:30-4:30p; Sun  11:30am-1:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.8245184,38.402828]},"properties":{"address":"172 N Main Street, Sebastopol, CA 95472","displayName":"172, North Main Street, Sebastopol, Sonoma County, California, 95472, United States of America","countryCode":"US","boundingBox":[38.402778,38.402878,-122.8245684,-122.8244684]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b00c2c75-bb67-43c3-ac6a-81699fef2109', 'ad3f9050-d1a1-4f04-8450-986ec76e6660', 'W 6th Street', 'Schedule: Tues & Thurs 7:00-8:30pm; Adult beg  Mon 2-3pm; Kids 5-12: Mon 3:30-4:30p; Sun  11:30am-1:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.7232759,38.4373798]},"properties":{"address":"56 W 6th Street, Santa Rosa, CA 95401","displayName":"56, West 6th Street, Santa Rosa, Sonoma County, California, 95401, United States of America","countryCode":"US","boundingBox":[38.4373298,38.4374298,-122.7233259,-122.7232259]}}'::jsonb);

-- Group: Capoeira Palmares Orlando
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cc3257cb-a286-4f46-bb01-d2405e5a671e', NOW(), NOW(), 'Capoeira Palmares Orlando', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE George Palmares
Main Contact: - [407]-960-3104
Notes: Orlando, Florida. SOURCE: website 11/23/17', 'capoeirapalmaresorlando@gmail.com', '[{"type":"website","url":"http://capoeirapalmaresorlando.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('57865e46-e585-4311-a12f-a1691f5abe57', 'cc3257cb-a286-4f46-bb01-d2405e5a671e', 'Orlando location', 'Schedule: Kids: Mon, Wed, & Fri 6:30pm-7:30pm; All Levels: Mon, Wed, & Fri7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.379045,28.5421218]},"properties":{"address":"32807, Orlando, FL","displayName":"Orlando, Orange County, Florida, United States of America","countryCode":"US","boundingBox":[28.3480634,28.614283,-81.5075377,-81.1241435]}}'::jsonb);

-- Group: Capoeira Brazilian Pelourinho
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('56e4d673-310a-4d62-9183-49ccf8e7605d', NOW(), NOW(), 'Capoeira Brazilian Pelourinho', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Lazaro da Bahia
Main Contact: - 407.226.3195
Notes: Orlando, Florida. SOURCE: website 11/23/17', 'CapoeiraBrazilPelo@gmail.com', '[{"type":"website","url":"http://www.capoeirabrazilpelo.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('74b7a616-782f-45aa-b98c-28cb690b0fbf', '56e4d673-310a-4d62-9183-49ccf8e7605d', 'Orlando location', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.4367924,28.4616696]},"properties":{"address":"7075 Kingspointe Parkway, Orlando, FL 32819","displayName":"7075, Kingspointe Parkway, Florida Center, Orlando, Orange County, Florida, 32819, United States of America","countryCode":"US","boundingBox":[28.4616196,28.4617196,-81.4368424,-81.4367424]}}'::jsonb);

-- Group: Capoeira Guerreiros
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cfca0301-0044-490e-81c8-7ce30c0e1197', NOW(), NOW(), 'Capoeira Guerreiros', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Folclore (Roberto Armien)
Main Contact: - 855-434-8675 ext 1
Notes: Orlando, Florida. Professor Folclore under Contramestre Gaivota [Bloomfield NJ]. SOURCE: website 11/14/17', NULL, '[{"type":"website","url":"http://www.capoeiraorlando.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9f0442d6-91c8-4eae-8598-ccd3d9ecc8a7', 'cfca0301-0044-490e-81c8-7ce30c0e1197', 'Orlando location', 'Schedule: Adults[13+]: Mon, Tues, & Thurs 7;00-8:00pm; Kids: Tues & Thurs 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.1940077,28.5475701]},"properties":{"address":"829 Woodbury Rd Orlando, FL 32828","displayName":"Mid Florida Dermatology Associates, 829, Woodbury Road, Waterford Lakes, Orlando, Orange County, Florida, 32828, United States of America","countryCode":"US","boundingBox":[28.5475201,28.5476201,-81.1940577,-81.1939577]}}'::jsonb);

-- Group: Capoeira Karkara
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0c7d0e3b-c23f-49b7-8dc3-0398bb7ec9dc', NOW(), NOW(), 'Capoeira Karkara', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Betinho
Main Contact: - [561] 737-3425
Notes: Palm Beach County, Florida (Boynton Beach, Boca Raton, Melbourne, Palm Bay). Formado Ray: [321]-223-0062. SOURCE: website 9/16/17', 'info@capokusa.com', '[{"type":"website","url":"http://capoeirakarkara.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e3ae4cf1-4bb2-4e15-83d2-20da3a4d52a9', '0c7d0e3b-c23f-49b7-8dc3-0398bb7ec9dc', 'Boynton Beach location', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.0714913,26.5588834]},"properties":{"address":"106 Commerce Rd., Boynton Beach FL 33426","displayName":"106, Commerce Road, Boynton Beach, Palm Beach County, Florida, 33426, United States of America","countryCode":"US","boundingBox":[26.5588334,26.5589334,-80.0715413,-80.0714413]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e676e092-fa01-467f-b8c7-f18a33c9554e', '0c7d0e3b-c23f-49b7-8dc3-0398bb7ec9dc', 'Melbourne Capoeira and World Class MMA', 'Phone: [321]-223-0062
Email: info@capofitclub.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.6531745,28.0789688]},"properties":{"address":"4185 W. New Haven Ave Melbourne, FL 32904","displayName":"New Haven Avenue, Melbourne, Brevard County, Florida, 32904, United States of America","countryCode":"US","boundingBox":[28.0789676,28.07897,-80.6535477,-80.6528014]}}'::jsonb);

-- Group: Capoeira Volta Ao Mundo - Sarasota
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b7d84eef-175c-4255-a013-1a7c39a9f301', NOW(), NOW(), 'Capoeira Volta Ao Mundo - Sarasota', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Rony Costa
Main Contact: - [941] 922-4520
Notes: Sarasota, Florida. SOURCE: website 11/29/17', NULL, '[{"type":"website","url":"http://www.capovam.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cbd20491-723a-4774-aa42-bcafb2124c3c', 'b7d84eef-175c-4255-a013-1a7c39a9f301', 'Sarasota location', 'Schedule: Martial Arts Preschool CapoKids Mon-Fri 7:30am-6:00pm; After School Program: Mon-Fri: 3:30-6:00pm; CapoKids Ages 3-6: Tues & Thurs; CapoKids Ages 7-11: Mon & Wed 5:00-6:00pm; Adult Class: Mon-Thurs 6:00-7:00pm; RODA!: Fri 6:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.4751798,27.299446]},"properties":{"address":"4672 McIntosh Lane Sarasota, FL 34232","displayName":"4672, McIntosh Lane, Sarasota County, Florida, 34232, United States of America","countryCode":"US","boundingBox":[27.299396,27.299496,-82.4752298,-82.4751298]}}'::jsonb);

-- Group: Capoeria Tampa Bay - Grupo Maculele
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('78af7ca8-44d7-4d52-8fe4-dfc7d4eb83f4', NOW(), NOW(), 'Capoeria Tampa Bay - Grupo Maculele', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRANDO Girino (Eduardo Torres)
Notes: St. Petersburg, Florida. Mestrando Girino under Mestre Fran. SOURCE: website 11/22/17', 'tampacapoeira@gmail.com', '[{"type":"website","url":"https://tampacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dd869b11-75c3-446f-a352-c301d6860119', '78af7ca8-44d7-4d52-8fe4-dfc7d4eb83f4', 'Hip Expressions Studio', 'Schedule: Kids: Mon & Wed 6:00-7:00pm; Teens & adults: Mon & Wed 7:00-8:15pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.6397632,27.8212447]},"properties":{"address":"2033 54th Ave N, St. Petersburg, FL","displayName":"54th Avenue North, Bay Breeze Cove, Saint Petersburg, Pinellas County, Florida, 33703, United States of America","countryCode":"US","boundingBox":[27.821169,27.821338,-82.6401515,-82.6393724]}}'::jsonb);

-- Group: Tallahassee Capoeira - Allied Capoeira League
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9d945e0c-69cf-47df-814c-017aec61fd1b', NOW(), NOW(), 'Tallahassee Capoeira - Allied Capoeira League', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - [850] 264-6792
Notes: Talahassee, Florida. SOURCE: website 11/29/17', NULL, '[{"type":"website","url":"https://www.tallahasseecapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a0503e8b-5737-4dba-8477-3d83d862ce7e', '9d945e0c-69cf-47df-814c-017aec61fd1b', 'Tallahassee Martial Arts and Self Defense Academy', 'Schedule: Teens and Adults: Mon, Wed, & Fri 7:00-8:00pm; Little Kids 4-6: Mon & Wed 4:00-4:45pm; Big Kids 7-11 Mon & Wed 5:00-5:45pm; Adult Music Class: Mon 6:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-84.3005658,30.4787195]},"properties":{"address":"2706 N Monroe St, Tallahassee, FL 32303","displayName":"2706, North Monroe Street, Tallahassee, Leon County, Florida, 32303, United States of America","countryCode":"US","boundingBox":[30.4786695,30.4787695,-84.3006158,-84.3005158]}}'::jsonb);

-- Group: West Island Capoeira - Equipe Capoeira Brasileira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3b89c5b6-bf62-4b36-8fff-df11d759248a', NOW(), NOW(), 'West Island Capoeira - Equipe Capoeira Brasileira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Pirata
Notes: Pierrefonds, Quebec, Canada. Professor Pirata under Mestre Peninha [Montreal]. SOURCE: website 4/22/17', NULL, '[{"type":"website","url":"http://www.westislandcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3f8140f6-ba99-4245-8941-e0e268ff2a3b', '3b89c5b6-bf62-4b36-8fff-df11d759248a', 'San Tropez', 'Schedule: Sat 1:30-3:00pm; Mon 6:30-8:00pm; Wed 7:00-8:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.7979954,45.4821821]},"properties":{"address":"54 Brunswick, Pointe-Claire, QC H9B 2L3, Canada","displayName":"Boulevard Brunswick, Pointe-Claire, Agglomération de Montréal, Montréal (région administrative), Québec, H9B 2L3, Canada","countryCode":"CA","boundingBox":[45.4821405,45.4822265,-73.7980832,-73.7979089]}}'::jsonb);

-- Group: Capoeira Alma do Mar
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('40089a64-8801-4472-bb2e-73ba54e40059', NOW(), NOW(), 'Capoeira Alma do Mar', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITORA Sonho (Pamela McGrath)
Main Contact: - [207] 409-6124
Notes: Biddeford/Portland, Maine. Monitora Sonho, a dedicated student of Mestre Beck. SOURCE: website 7/24/18', 'almadomarcapoeira@gmail.com', '[{"type":"website","url":"http://www.almacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c254696c-af02-4317-9d3f-fbbaddcc096c', '40089a64-8801-4472-bb2e-73ba54e40059', 'Hustle & Flow Studio', 'Schedule: Ages 5-8: Tues & Thurs 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-70.2663038,43.6508117]},"properties":{"address":"155 Brackett St Portland, Maine, ME 04102","displayName":"Fresh Approach Market, 155, Brackett Street, West End, Portland, Cumberland County, Maine, 04102, United States of America","countryCode":"US","boundingBox":[43.6506697,43.6509543,-70.2664755,-70.266133]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('057567cd-5d76-41c3-83c7-f9a5dcd1a1a2', '40089a64-8801-4472-bb2e-73ba54e40059', 'Metta Studios', 'Schedule: Adults: Tues, 6:00-7:00pm; Kids ages 5+: Mon 4:30-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-70.4530585,43.4928834]},"properties":{"address":"40 Main Street, Pepperell Mill, Biddeford, Maine 04005","displayName":"40, Main Street, Pepperell Mill Campus, Biddeford, York County, Maine, 04005, United States of America","countryCode":"US","boundingBox":[43.4928334,43.4929334,-70.4531085,-70.4530085]}}'::jsonb);

-- Group: Grupo de Capoeira Esporão
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('804a57ea-9c25-48eb-a029-4ed26739c5da', NOW(), NOW(), 'Grupo de Capoeira Esporão', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Marinaldo
Main Contact: Contra Mestre Ubaldo (Ubaldo Teixeira Baleeiro) - 203.231.6931
Notes: Bridgeport, Fairfield County, Connecticut. Contra Mestre Ubaldo (Ubaldo Teixeira Baleeiro) under Mestre Marinaldo [Brazil]. Instrutora Capitã. SOURCE: website 8/27/17', 'capoeirainct@gmail.com', '[{"type":"website","url":"http://esporaomulticulturalcenter.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dbb89548-1816-4ff9-ae90-a2d78e0e970a', '804a57ea-9c25-48eb-a029-4ed26739c5da', 'Esporão Multi-Cultural Center', 'Schedule: Adult: Mon, Wed & Fri 7:30-9:30pm; Youth: Mon & Wed 6:00-7:00pm
Phone: 203.615.4275', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.2104732,41.2125203]},"properties":{"address":"3768 Main Street, Bridgeport, Connecticut 06606","displayName":"Hancock Pharmacy III, 3768, Main Street, Bridgeport, Greater Bridgeport Planning Region, Connecticut, 06606, United States of America","countryCode":"US","boundingBox":[41.2124703,41.2125703,-73.2105232,-73.2104232]}}'::jsonb);

-- Group: Capoeira Connecticut Ginga Brasil - Cordão de Ouro - West Hartford
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cfa468b6-cd61-4b68-90a8-782fa2f23414', NOW(), NOW(), 'Capoeira Connecticut Ginga Brasil - Cordão de Ouro - West Hartford', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Pinga Fogo
Main Contact: Instrutor Suave (Joel Melendez) - 860.922.5343
Notes: West Hartford, Hartford County, Connecticut. Instrutor Suave (Joel Melendez). See also Harwinton location. SOURCE: website 9/3/17', 'Darin@teamplusone.com', '[{"type":"website","url":"http://www.teamplusone.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4410ca21-5339-46c9-8d60-5d3a4fa5d940', 'cfa468b6-cd61-4b68-90a8-782fa2f23414', 'Plus One Defense Systems', 'Schedule: Adults: Mon 8:00-9:30pm; Thurs 8:30-10:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-72.7184787,41.7361598]},"properties":{"address":"9 Tolles St West Hartford, CT 06110","displayName":"9, Tolles Street, Elmwood, West Hartford, Capitol Planning Region, Connecticut, 06110, United States of America","countryCode":"US","boundingBox":[41.7361098,41.7362098,-72.7185287,-72.7184287]}}'::jsonb);

-- Group: Motumbaxé Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d51e7ed4-196e-452d-be0e-6ecb196a28c1', NOW(), NOW(), 'Motumbaxé Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Professora Formiguinha (Leticia Monteiro) - 347-489-6058
Notes: West Hartford and Hartford, Hartford County, Connecticut. Professora Formiguinha (Leticia Monteiro). SOURCE: facebook 5/15/16 website 9/2/17', 'iheartcapoeiraformi@gmail.com', '[{"type":"website","url":"http://www.motumbaxecapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('95c3db74-5fc6-48a9-9cf2-b3b6bddb5bbd', 'd51e7ed4-196e-452d-be0e-6ecb196a28c1', 'Sudor Taino', 'Phone: [860] 952-9015
Email: Info@sudortaino.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-72.7240961,41.7329118]},"properties":{"address":"635 New Park Avenue, West Hartford, CT. 06110","displayName":"635, New Park Avenue, Elmwood, West Hartford, Capitol Planning Region, Connecticut, 06110, United States of America","countryCode":"US","boundingBox":[41.7328618,41.7329618,-72.7241461,-72.7240461]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('30ea9d2d-7723-46ba-b474-cd5f907ec6bb', 'd51e7ed4-196e-452d-be0e-6ecb196a28c1', 'Studio8sixty', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-72.6953115,41.767823]},"properties":{"address":"224 Farmington Avenue, Hartford CT, 06105","displayName":"224, Farmington Avenue, Imlay and Laurel Streets District, Parkville, Clay Arsenal, Hartford, Capitol Planning Region, Connecticut, 06105, United States of America","countryCode":"US","boundingBox":[41.767773,41.767873,-72.6953615,-72.6952615]}}'::jsonb);

-- Group: Ginga Associação de Capoeira USA
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0de32a18-e68a-438e-8607-9a80a7f19d2d', NOW(), NOW(), 'Ginga Associação de Capoeira USA', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Kiki Da Bahia
Main Contact: Mestre Kiki Da Bahia - +1 917 725 0381
Notes: Kent, Litchfield County, Connecticut. Mestre Kiki Da Bahia. SOURCE: website 5/7/19', NULL, '[{"type":"website","url":"http://gingacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5803dbe0-6685-427a-8568-ebf6866a6a51', '0de32a18-e68a-438e-8607-9a80a7f19d2d', 'W Rhythm Fitness & Wellness Studio', 'Schedule: Sun 12:30pm
Phone: [203] 788-7818', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.4782244,41.7227369]},"properties":{"address":"25 Main St. Kent, Ct 06757","displayName":"25, South Main Street, Kent, Northwest Hills Planning Region, Connecticut, 06757, United States of America","countryCode":"US","boundingBox":[41.7226869,41.7227869,-73.4782744,-73.4781744]}}'::jsonb);

-- Group: Cordao de Ouro - Cedar Falls
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2a0ddbae-5037-4547-97de-c269cc4b00ec', NOW(), NOW(), 'Cordao de Ouro - Cedar Falls', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Alan Huynh - 319-215-1140
Notes: Cedar Falls, Iowa. Contact: Busca Pe (Alan Huynh). Website has not been updated since 2015; facebook page is offline 3/14/18. Classes are on the schedule but do not agree with the above website 3/14/18. SOURCE: websites 3/14/18', 'cedarvalley@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/cedarvalleycapoeira"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0faaf746-cb20-440c-96e3-5829c12177aa', '2a0ddbae-5037-4547-97de-c269cc4b00ec', 'Heinz Academy', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-92.434082,42.5149668]},"properties":{"address":"6322 University Ave, Cedar Falls, IA 50613","displayName":"West Music, 6322, University Avenue, Cedar Falls, Black Hawk County, Iowa, 50613, United States of America","countryCode":"US","boundingBox":[42.5148377,42.5152255,-92.4342076,-92.4339595]}}'::jsonb);

-- Group: Axe Richmond
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f1dd7ace-5865-43a3-97ba-e05c422cbfe3', NOW(), NOW(), 'Axe Richmond', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Polvo (Kenneth Clark)
Notes: Richmond BC, Canada. Instrutor Polvo (Kenneth Clark) under Mestre Barrao [Vancouver]. SOURCE: website 4/25/17', NULL, '[{"type":"website","url":"https://richmondcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fbdd050c-05ba-4991-8a4a-d0ceb4500917', 'f1dd7ace-5865-43a3-97ba-e05c422cbfe3', 'Richmond Olympic Oval', 'Schedule: Tues & Thurs 8:15 – 9:45pm; Sat 1:00 – 2:30pm
Phone: 778.296.1400
Email: axeprograms@gmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.1516226,49.1746162]},"properties":{"address":"6111 River Road, Richmond, BC V7C 0A2","displayName":"Richmond Olympic Oval, 6111, River Road, Oval Village, City Centre, Richmond, Metro Vancouver Regional District, British Columbia, V7C, Canada","countryCode":"CA","boundingBox":[49.1740674,49.175336,-123.15314,-123.1501928]}}'::jsonb);

-- Group: Capoeira Brasil - Schaumburg
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('40f091d5-cb83-4828-9ab0-f4fc1819435d', NOW(), NOW(), 'Capoeira Brasil - Schaumburg', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMADA Colibri
Main Contact: Raphaela Augusto - [773] 554-8384
Notes: Schaumburg, Illinois. Formada Colibri. Contact: Raphaela Augusto. SOURCE: website 2/23/18', 'pretolcct@hotmail.com', '[{"type":"website","url":"https://colibricb.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('08eb128f-99bd-4e25-acdf-f481972cb7d2', '40f091d5-cb83-4828-9ab0-f4fc1819435d', 'Brazilian Jiu Jitsu', 'Schedule: All Levels: Thurs 7:30-8:30pm; Sat 10:30-11:30am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-88.0801773,42.0064286]},"properties":{"address":"1154 S Roselle Rd, Schaumburg, IL 60193","displayName":"1154, South Roselle Road, Schaumburg, Schaumburg Township, Cook County, Illinois, 60193, United States of America","countryCode":"US","boundingBox":[42.0063786,42.0064786,-88.0802273,-88.0801273]}}'::jsonb);

-- Group: Beira-Mar Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f2dc43e2-a7cf-4966-8cc7-9ee82c21a6e2', NOW(), NOW(), 'Beira-Mar Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Jaco (Jacob Woosley)
Notes: Richmond, Kentucky. Jaco (Jacob Woosley) under Contra Mestre Bundo [Jacksonville FL] and Mestre Tarzan [Brazil]. Please inquire about training outside of campus semesters. SOURCE: website 3/14/17', NULL, '[{"type":"website","url":"http://www.gbantu.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a2da8f96-5e5e-4c01-8b0c-db2b76a01eda', 'f2dc43e2-a7cf-4966-8cc7-9ee82c21a6e2', 'Eastern Kentucky University', 'Schedule: Students and Adults: Mon 6:00-8:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-84.2946539,37.7478572]},"properties":{"address":"Richmond, KY","displayName":"Richmond, Madison County, Kentucky, 40475, United States of America","countryCode":"US","boundingBox":[37.623519,37.794517,-84.34202,-84.24014]}}'::jsonb);

-- Group: Capoeira Angola Beaufort
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ca8b696e-0cd5-47f8-adb8-392e7bb3b342', NOW(), NOW(), 'Capoeira Angola Beaufort', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Emily Fader - 843-263-9335
Notes: Beaufort, South Carolina. Instructor Emily (Emily Fader). Bring white pants and t-shirt and athletic shoes. SOURCE: website 1/30/13', 'Emily.fader@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/capoeiraangolabeaufort/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3e100042-cd1e-418e-85d7-18f3db3ea72c', 'ca8b696e-0cd5-47f8-adb8-392e7bb3b342', 'Burton Wells Recreation Center', 'Schedule: Tues & Thurs 5:30-6:45
Phone: 843-470-6200', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.6923169,32.3850708]},"properties":{"address":"Beaufort, SC 29906","displayName":"Beaufort County, South Carolina, United States of America","countryCode":"US","boundingBox":[32.07689,32.704321,-81.016234,-80.3448069]}}'::jsonb);

-- Group: Axe Capoeira Toronto
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('480e0d0c-8960-43e6-97ec-79833d1891b2', NOW(), NOW(), 'Axe Capoeira Toronto', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Paraiba (Marcos Martins)
Main Contact: Professor Paraiba - 647.340.2293
Notes: Toronto, Ontario, Canada. Professor Paraiba (Marcos Martins). SOURCE: website 4/26/17', 'axetoronto@gmail.com', '[{"type":"website","url":"http://www.axecapoeira-to.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e672ca0a-d580-496a-b898-c7adec3215fa', '480e0d0c-8960-43e6-97ec-79833d1891b2', 'Axe Capoeira Toronto Academy', 'Schedule: (Full schedule of classes. See website)
Phone: 647.340.2293', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.4392291,43.6786681]},"properties":{"address":"1069 St Clair Ave West, Toronto, Ontario, M6E 1A6, Canada","displayName":"1069, St. Clair Avenue West, Corso Italia-Davenport, Davenport, Toronto, Golden Horseshoe, Ontario, M6E 1A3, Canada","countryCode":"CA","boundingBox":[43.6786181,43.6787181,-79.4392791,-79.4391791]}}'::jsonb);

-- Group: Associacao Kadara Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f75756f0-569a-4ee3-b739-9fdcf4029893', NOW(), NOW(), 'Associacao Kadara Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUCTOR Soquete
Main Contact: Instructor Soquete - 647 522 4540
Notes: Toronto, Ontario, Canada (Scarborough, Vaughan). Instructor Soquete under Mestre Cicatriz[Sydney]. SOURCE: website 2/3/17', 'info@learncapoeira.ca', '[{"type":"website","url":"http://kadaracapoeira.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1884c7d2-080a-4ce4-b730-6cc7e7b2bdf9', 'f75756f0-569a-4ee3-b739-9fdcf4029893', 'Southside Muay Thai', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.2706866,43.770218]},"properties":{"address":"2065 Midland Ave., Scarborough, ON M1P 4P8","displayName":"2065, Midland Avenue, Dorset Park, Scarborough Centre, Scarborough, Toronto, Golden Horseshoe, Ontario, M1P 2X3, Canada","countryCode":"CA","boundingBox":[43.769919,43.770517,-79.271559,-79.270133]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e79cd15f-9302-41a9-b203-5d1ececfba2e', 'f75756f0-569a-4ee3-b739-9fdcf4029893', 'Pantera Fitness', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.5360962,43.8205821]},"properties":{"address":"399 Four Valley Drive, Vaughan, ON.","displayName":"399, Four Valley Drive, Vaughan, York Region, Golden Horseshoe, Ontario, L4K 4Z7, Canada","countryCode":"CA","boundingBox":[43.8199873,43.8209353,-79.5363164,-79.5351416]}}'::jsonb);

-- Group: Grupo Capoeira Males - Toronto
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('75473e95-a491-4262-907b-fc3e3ad00dd4', NOW(), NOW(), 'Grupo Capoeira Males - Toronto', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Lua Branca (Waldecir de Souza)
Main Contact: Contra Mestre Lua Branca - 416-537-RODA [7632]
Notes: Toronto, Ontario, Canada. Contra Mestre Lua Branca (Waldecir de Souza). See also Burlington. SOURCE: website 3/18/17', 'info@capoeiraschool.ca', '[{"type":"website","url":"http://capoeiraschool.ca/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('94049678-5a94-4b3f-af93-1bc5d4214b54', '75473e95-a491-4262-907b-fc3e3ad00dd4', 'Wu Xing Martial Arts', 'Schedule: Mon 8:00-9:30pm; Wed 8:45-10:15pm; Fri 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.4105211,43.6744418]},"properties":{"address":"374 Dupont St.","displayName":"374, Dupont Street, Annex, University—Rosedale, Toronto, Golden Horseshoe, Ontario, M5R 1V9, Canada","countryCode":"CA","boundingBox":[43.674259,43.6746194,-79.4107294,-79.4103342]}}'::jsonb);

-- Group: The Canadian Centre for Capoeira - Cordao de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5f503bbd-6c3a-428b-abff-833ebcd41a5f', NOW(), NOW(), 'The Canadian Centre for Capoeira - Cordao de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 647.892.5931
Notes: Toronto, Ontario, Canada. The Canadian Centre for Capoeira - Cordao de Ouro. SOURCE: website 12/13/16', 'cdo.toronto@gmail.com', '[{"type":"website","url":"http://www.tcc4c.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('042dbee4-359a-409e-87b2-c18cbe619c12', '5f503bbd-6c3a-428b-abff-833ebcd41a5f', 'hook up Muay Thai Boxing gym', 'Schedule: Adult: Mon & Wed 8:00-9:00pm;', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-79.4588478,43.7269869]},"properties":{"address":"288 Bridgeland Avenue, M6A 1Z4, Toronto, ON","displayName":"Bridgeland Avenue, Yorkdale-Glen Park, Eglinton—Lawrence, North York, Toronto, Golden Horseshoe, Ontario, M3K 1E4, Canada","countryCode":"CA","boundingBox":[43.7269067,43.7270672,-79.4592586,-79.458437]}}'::jsonb);

-- Group: Capoeira Ache Brasil - Vancouver
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('68520902-57d1-41c7-82e8-ba9dda013cee', NOW(), NOW(), 'Capoeira Ache Brasil - Vancouver', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Eclison de Jesus
Main Contact: Mestre Eclison de Jesus - 778 838 9801 or 604 322 0553
Notes: Vancouver, British Columbia, Canada. Mestre Eclison de Jesus. SOURCE: website 4/27/17', 'info.achebrasil@gmail.com', '[{"type":"website","url":"http://achebrasil.ca"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('01788f3b-2bae-42a4-85bf-50c9971636fd', '68520902-57d1-41c7-82e8-ba9dda013cee', 'Capoeira Ache Brasil Academy', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.097841,49.2629659]},"properties":{"address":"341 East Broadway, Vancouver BC V5T 1W5","displayName":"Capoeira Aché Brasil Academy, 341, East Broadway, Mount Pleasant, Vancouver, Metro Vancouver Regional District, British Columbia, V5T, Canada","countryCode":"CA","boundingBox":[49.2629159,49.2630159,-123.097891,-123.097791]}}'::jsonb);

-- Group: AXE Capoeira Vancouver
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('97402487-5496-41bf-9989-a3fbcdaa484f', NOW(), NOW(), 'AXE Capoeira Vancouver', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Marcos Barrao
Main Contact: Mestre Marcos Barrao - 604-537-8943, 604-761-4635
Notes: Vancouver, British Columbia, Canada. Mestre Marcos Barrao. SOURCE: website 4/27/17', 'info@axecapoeira.com', '[{"type":"website","url":"http://www.axecapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('15959bfa-79c2-4e4d-8d4d-186be664a90c', '97402487-5496-41bf-9989-a3fbcdaa484f', 'Axe Capoeira Academy', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.0699601,49.2768956]},"properties":{"address":"1739 Venables st, Vancouver, BC, v5L 2H3","displayName":"1739, Venables Street, Grandview-Woodland, Vancouver, Metro Vancouver Regional District, British Columbia, V5L, Canada","countryCode":"CA","boundingBox":[49.2767563,49.277034,-123.0701996,-123.069698]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fc0f2c52-e060-445f-bfd0-f01b4e2eff66', '97402487-5496-41bf-9989-a3fbcdaa484f', 'Seymour Dance', 'Phone: 604 929 6060', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.0004897,49.3144914]},"properties":{"address":"808 Lytton St, North Vancouver, BC V7H 2T1","displayName":"Lytton Street, Seymour Heights, Seymour, District of North Vancouver, Metro Vancouver Regional District, British Columbia, V7H 2M5, Canada","countryCode":"CA","boundingBox":[49.3135999,49.315233,-123.001259,-123.0000177]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('85208375-9720-4321-8154-06245ac695c2', '97402487-5496-41bf-9989-a3fbcdaa484f', 'Hastings Community Center', 'Schedule: (Call for schedule and registration)
Phone: 604-718-6222', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.0394269,49.2806228]},"properties":{"address":"3096 East Hastings St, Vancouver, BC V2C 6N6","displayName":"Hastings Community Centre, 3096, East Hastings Street, Hastings-Sunrise, Vancouver, Metro Vancouver Regional District, British Columbia, V5K 2A3, Canada","countryCode":"CA","boundingBox":[49.2804151,49.2809541,-123.039868,-123.03926]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a2b109cc-aabb-4c37-aa8e-f87e7677d844', '97402487-5496-41bf-9989-a3fbcdaa484f', 'North Shore Neighbourhood House', 'Schedule: Kids Class [5-12yrs]: Mon 5:30-6:30pm
Phone: 604-987-8138', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.073971,49.3106439]},"properties":{"address":"225 east 2nd street, North Vancouver, BC V7L 1C4","displayName":"North Shore Neighbourhood House, 225, East 2nd Street, The Shipyards Common, Lower Lonsdale, North Vancouver, Metro Vancouver Regional District, British Columbia, V7L, Canada","countryCode":"CA","boundingBox":[49.3104443,49.3108417,-123.0743106,-123.0736315]}}'::jsonb);

-- Group: Grupo Axe Capoeira Victoria Academy
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('58f8ee33-646b-4b0e-8feb-f25b7138a4dd', NOW(), NOW(), 'Grupo Axe Capoeira Victoria Academy', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Testa (Kevin Bret)
Main Contact: Contramestre Testa - 250.589-8293
Notes: Victoria, British Columbia, Canada. Contramestre Testa (Kevin Bret). Instrutora Andrea [Kids Program]. SOURCE: website 5/6/17', 'testa@axecapoeira.tv', '[{"type":"website","url":"http://www.axecapoeira.tv/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('acc678b2-2872-4986-b397-73e06def7cca', '58f8ee33-646b-4b0e-8feb-f25b7138a4dd', 'Grupo Axe Capoeira Victoria Academy', 'Schedule: (Full schedule of classes)
Phone: [250] 884-7998
Email: andrea@axecapoeira.tv', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.3641227,48.4260458]},"properties":{"address":"715 Yates Street Victoria, BC V8W 1L6","displayName":"715, Yates Street, Chinatown, Downtown, Victoria, Capital Regional District, British Columbia, V8W 0C8, Canada","countryCode":"CA","boundingBox":[48.4259958,48.4260958,-123.3641727,-123.3640727]}}'::jsonb);

-- Group: Capoeira Ache Brasil - Whistler
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e12a8897-c2ee-4081-b015-b8f03e402815', NOW(), NOW(), 'Capoeira Ache Brasil - Whistler', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: FORMATO Dragao (Cole Manson)
Main Contact: Formato Dragao - 604-966-8118
Notes: Whistler, British Columbia, Canada. Formato Dragao (Cole Manson) under Mestre Eclison de Jesus[Vancouver]. http://www.whistlercapoeira.ca offline 3/19/17. SOURCE: website 3/19/17', 'cole@whistlercapoeira.ca, Dragonteachercole@live.ca', '[{"type":"website","url":"http://achebrasil.ca"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('06861958-b012-4729-806a-43310cecbab8', 'e12a8897-c2ee-4081-b015-b8f03e402815', 'Awesome Arts Academy', 'Schedule: Kids[8 up]: Tues 5:45-6:45pm; Adults: Wed 6:45-8:00pm
Phone: 604-907-2340
Email: magda@whistlercapoeira.ca', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-123.0406118,50.0876303]},"properties":{"address":"1085 Millar Creek Rd, Whistler, BC V0N 1B1","displayName":"Millar Creek Road, Function Junction, Whistler Resort Municipality, Squamish-Lillooet Regional District, British Columbia, V8E 0W5, Canada","countryCode":"CA","boundingBox":[50.0872792,50.0880923,-123.0425136,-123.0387185]}}'::jsonb);

-- Group: Capoeira Canavial - Boulder
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f93a7143-2f13-4b24-b112-76a7e3f36442', NOW(), NOW(), 'Capoeira Canavial - Boulder', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Lucas Corvo (Luiz Carlos Assunção Silva)
Main Contact: Mestre Lucas Corvo
Notes: Boulder, Colorado. Mestre Lucas Corvo (Luiz Carlos Assunção Silva). SOURCE: website 6/26/19', 'info@capoeiracanavial.com', '[{"type":"website","url":"http://www.capoeiracanavial.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4bab495b-40b3-4921-a606-39933564d615', 'f93a7143-2f13-4b24-b112-76a7e3f36442', 'Boulder Ballet Studio', 'Schedule: Mon 7:45-9:00pm; Fri 7:00-8:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-105.2610947,40.01939]},"properties":{"address":"2590 Walnut St, Boulder, CO 80302","displayName":"The Dairy Arts Center, 2590, Walnut Street, Goss-Grove, Boulder, Boulder County, Colorado, 80302, United States of America","countryCode":"US","boundingBox":[40.0191141,40.0196856,-105.2614154,-105.26066]}}'::jsonb);

-- Batch: batch-05.json (36 groups)

-- Group: Brazilian Capoeira - Colorado Springs
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('dc3b962f-5559-4951-9249-9d10b8f75d4c', NOW(), NOW(), 'Brazilian Capoeira - Colorado Springs', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - [719] 635-1004
Notes: Colorado Springs, Colorado. Brazilian Capoeira. SOURCE: website 8/24/17', 'office@springsdance.com', '[{"type":"website","url":"http://www.capsprings.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6ac3951f-9ee4-49fe-bc2c-f0560c4509d5', 'dc3b962f-5559-4951-9249-9d10b8f75d4c', 'Springs Dance', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-104.8525404,38.9005187]},"properties":{"address":"4705 Centennial Blvd, Colorado Springs, CO 80919","displayName":"4705, Centennial Boulevard, Colorado Springs, El Paso County, Colorado, 80919, United States of America","countryCode":"US","boundingBox":[38.9004687,38.9005687,-104.8525904,-104.8524904]}}'::jsonb);

-- Group: Grupo Capoeira Mandinga Tucson
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('351b8b65-2807-4c4c-bf44-8ee576c9ecb1', NOW(), NOW(), 'Grupo Capoeira Mandinga Tucson', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRA Luar do Sertao (Anne Pollack)
Main Contact: Mestra Luar do Sertao - 520.975.6539
Notes: Tucson, Arizona. Mestra Luar do Sertao (Anne Pollack) directed and guided by Mestre Marcelo [Oakland CA]. SOURCE: website 6/5/18', 'info@CapoeiraTucson.com', '[{"type":"website","url":"http://www.CapoeiraTucson.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cbd82d2b-fbf8-487d-a72b-97a514edc161', '351b8b65-2807-4c4c-bf44-8ee576c9ecb1', 'Capoeira Mandinga Tucson Academy', 'Schedule: Tykes[Ages 3-6] 9:30-10:10am; Kids [Ages 6-13]: Mon 5:00-6:15pm; Sat 10:00-11:15am; Adult & Teen: Mon 7:30-8:30pm; Tues 7:30-9:00pm; Thurs 7:00-8:30pm; Sat 11:30am-1:00pm; Women and kids ages 4+: Tues 6:00-7:15pm; Kids & Family [Ages 6+]: Thurs 5:15-6:30pm; OPEN RODA! 1st Sat 11:00am-12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-110.9790004,32.254989]},"properties":{"address":"85705, Tucson, AZ","displayName":"85705, Miracle Manor, Tucson, Pima County, Arizona, United States of America","countryCode":"US","boundingBox":[32.204989,32.304989,-111.0290004,-110.9290004]}}'::jsonb);

-- Group: Axe Capoeira Tucson
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0379b78b-a5bf-4638-819e-189bb15d7ae3', NOW(), NOW(), 'Axe Capoeira Tucson', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instrutor Sombra (Aquil Joel Hameed) - 520-990-1820
Notes: Tucson, Arizona. Instrutor Sombra (Aquil Joel Hameed). SOURCE: website 6/5/18', 'axesombra@gmail.com', '[{"type":"website","url":"https://www.tucsoncapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a2c89d9c-63eb-4946-9c82-fddaaa7c2fdb', '0379b78b-a5bf-4638-819e-189bb15d7ae3', 'Studio Axe', 'Schedule: Beginning Kids Tues & Thurs 4:30pm; Advanced Kids Tues & Thurs 5:30pm; All Level Kids Sat 11:00am; Beginning Adults/Teens: Mon 7:00pm; All Levels Adults/Teens: Tues & Thurs 7:00pm; Wed 11:00am; Sat 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-110.9287777,32.2214417]},"properties":{"address":"2928 East Broadway Blvd, Tucson, AZ, 85716","displayName":"2928, East Broadway Boulevard, Broadmoor-Broadway, Tucson, Pima County, Arizona, 85716, United States of America","countryCode":"US","boundingBox":[32.2213917,32.2214917,-110.9288277,-110.9287277]}}'::jsonb);

-- Group: Mao no Chao Capoeira Angola Dundee
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('52600793-c995-4337-9861-64769c4b89e9', NOW(), NOW(), 'Mao no Chao Capoeira Angola Dundee', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Marrom
Main Contact: Katie - 07830 102039
Notes: Airdrie, Scotland. No longer appears to have classes in Airdrie 12/26/19. Associated with Mestre Marrom e Alunos [Rio de Janiero]. Contact Katie. SOURCE: website 6/20/13', NULL, '[{"type":"website","url":"https://maonochaoscotlandblog.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3090144c-c3c8-4946-8c67-712cfb7c40c3', '52600793-c995-4337-9861-64769c4b89e9', 'Airdrie Leisure Centre', 'Schedule: Beginner class: Thursday, 8.15-9.30pm
Phone: 01236 762871', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.963661,55.8740199]},"properties":{"address":"Motherwell Street Airdrie ML6 7HU","displayName":"Motherwell Street, Rawyards, Airdrie, North Lanarkshire, Alba / Scotland, ML6 7HP, United Kingdom","countryCode":"GB","boundingBox":[55.8716683,55.8764014,-3.9657183,-3.9615687]}}'::jsonb);

-- Group: Mundo Capoeira Ireland - Athlone
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e62c8a0f-17b0-4ede-b56b-0891c8e48913', NOW(), NOW(), 'Mundo Capoeira Ireland - Athlone', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Sansao
Main Contact: Graduado Duda - 087-2969-133
Notes: Athlone, Ireland. Graduado Duda under Mestre Sansao [Dublin]. SOURCE: website 12/31/19', 'info@capoeiraireland.com, Kirk83@wp{D0Tpl', '[{"type":"website","url":"http://www.capoeiraireland.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('629f40f4-fdbf-4429-836f-77d06c4dcc4f', 'e62c8a0f-17b0-4ede-b56b-0891c8e48913', 'Monksland Community Centre', 'Schedule: Wed: 7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-7.9904263,53.4237653]},"properties":{"address":"Monksland, Athlone, Ireland","displayName":"Monksland, Athlone West Rural ED, Athlone, County Roscommon, Connacht, Éire / Ireland","countryCode":"IE","boundingBox":[53.411254,53.4363311,-8.0121234,-7.9637214]}}'::jsonb);

-- Group: North Star Capoeira Angola - Bloomington
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0af3cb0a-61bb-4fe4-a452-88a2dc1b7894', NOW(), NOW(), 'North Star Capoeira Angola - Bloomington', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Iuri Santos
Notes: Bloomington, Indiana. Mestre Iuri Santos (northstarcapoeira@gmail.com). LINEAGE: Mestre Pastina >> Mestre Joao Pequeno >> Mestre Marrom >> Mestre Iuri Hart Santos. SOURCE: website 3/5/18', NULL, '[{"type":"website","url":"http://northstarcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3b21859a-f563-4f5b-92a9-27751fb25d39', '0af3cb0a-61bb-4fe4-a452-88a2dc1b7894', 'Casa do Mestre Iuri', 'Schedule: Children: Mon 5:00-6:00 (contact for details); Adults: Mon & Fri 6:30-8:30pm
Phone: [812] 340-8844
Email: iurigagari@hotmail.com', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-86.5274187,39.1585405]},"properties":{"address":"812 South Henderson, Bloomington, IN 47401","displayName":"812, South Henderson Street, Elm Heights, Bloomington, Monroe County, Indiana, 47401, United States of America","countryCode":"US","boundingBox":[39.158493,39.158585,-86.527562,-86.527275]}}'::jsonb);

-- Group: ABADA Visalia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b47a5fb9-6ef1-4155-ad80-567e082018e9', NOW(), NOW(), 'ABADA Visalia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRA Cigarra
Main Contact: Graduada Toninho (Erica Hemenway)
Notes: Tulare County (Visalia), California. Graduada Toninho (Erica Hemenway) under Mestra Cigarra [San Francisco]. SOURCE: website 8/23/17', 'abada.toninho@gmail.com', '[{"type":"website","url":"http://abadatoninho.wixsite.com/abadavisalia"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4558cff0-02ca-4c97-a6ae-199e8304a0a7', 'b47a5fb9-6ef1-4155-ad80-567e082018e9', 'Anthony Community Center', 'Schedule: Tues & Thurs 7:30pm-8:45pm (Check facebook for schedule updates)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.3020883,36.3323537]},"properties":{"address":"345 N Jacob Street, Visalia, CA 93291","displayName":"345, North Jacob Street, Visalia, Tulare County, California, 93291, United States of America","countryCode":"US","boundingBox":[36.3323037,36.3324037,-119.3021383,-119.3020383]}}'::jsonb);

-- Group: Capoeira Sul da Bahia - Ventura
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5d93b87c-0588-47a3-80a3-385bdb25d653', NOW(), NOW(), 'Capoeira Sul da Bahia - Ventura', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instructor Caicara (Mike) - [805] 637-5355
Notes: Ventura County (Ventura), California. Instructor Caicara (Mike). Mail: 1230 State Street, Santa Barbara, CA 93101. SOURCE: website 8/23/17', 'capoeirasb@gmail.com', '[{"type":"website","url":"http://www.capoeirasantabarbara.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('add67776-3125-4cd0-981c-c1aa59eeae4a', '5d93b87c-0588-47a3-80a3-385bdb25d653', 'Yoga Jones', 'Schedule: Tues & Thurs 7:30-8:45', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-119.2947568,34.279356]},"properties":{"address":"105 S. Oak Street Ventura CA","displayName":"105, South Oak Street, San Buenaventura (Ventura), Ventura County, California, 93001, United States of America","countryCode":"US","boundingBox":[34.279306,34.279406,-119.2948068,-119.2947068]}}'::jsonb);

-- Group: Lincoln Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ce752dad-5e02-41e0-b08a-800d200356ac', NOW(), NOW(), 'Lincoln Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 19)
Notes: SOURCE:', NULL, '[{"type":"website","url":"http://capoeiraabudhabi.blogspot.com/p/mestre-caxias.html"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a9293fa9-eef3-46cb-9e27-d173a7774eb3', 'ce752dad-5e02-41e0-b08a-800d200356ac', '1/8/19)', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.1918155,51.3674354]},"properties":{"address":"1/8/19), 7/16/11   1/8/19","displayName":"Woodville House, 1, Brunswick Road, Benhilton, London Borough of Sutton, London, Greater London, England, SM1 4DE, United Kingdom","countryCode":"GB","boundingBox":[51.3673854,51.3674854,-0.1918655,-0.1917655]}}'::jsonb);

-- Group: Cultural Association of Brazilian Arts [CAOBA]
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('07ad2a94-7c69-4d11-a247-96e251e4c7a7', NOW(), NOW(), 'Cultural Association of Brazilian Arts [CAOBA]', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Bayano (Irani Andreati)
Main Contact: - 817
Notes: SOURCE: website 3/19/19', 'caobanj@gmail.com', '[{"type":"website","url":"http://www.caobarts.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dc82303f-28fa-4143-8246-1159d2ec1ee3', '07ad2a94-7c69-4d11-a247-96e251e4c7a7', 'Main Street', 'Schedule: Youth: Mon & Wed 6:00- 7:00pm;  Sat 12:00-1:00pm; Beginners:Tues & Thurs 7:15pm- 8:15pm; Intermediate and Advanced:Mon & Wed 7:15 - 8:15pm; Music: Fri 7:00 - 8:00pm; Physical Conditioning low impact Adults Only:Thurs 6:00 - 7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0424221,40.9047372]},"properties":{"address":"817 Main Street, Hackensack, NJ 07601","displayName":"817, Main Street, Hackensack, Bergen County, New Jersey, 07601, United States of America","countryCode":"US","boundingBox":[40.9046872,40.9047872,-74.0424721,-74.0423721]}}'::jsonb);

-- Group: Ginga Mundo
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ada2e5d8-0172-4638-ba7c-0cba16d1e0a3', NOW(), NOW(), 'Ginga Mundo', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 917] 488-0041
Notes: SOURCE: website 3/27/19', 'bocadomundo@yahoo.com', '[{"type":"website","url":"http://www.gingamundo.us"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('df06dc57-689b-4fbb-b60d-5e992edcb53c', 'ada2e5d8-0172-4638-ba7c-0cba16d1e0a3', 'River Road', 'Schedule: Adults: Tues & Thurs -; Kids Age 4-6: Sun - 10:00-11:00am:; Kids Age 7-13: Sun 11:00am-12:00pm :', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9744485,40.825483]},"properties":{"address":"890 River Road, Edgewater, NJ 07020","displayName":"890, River Road, Edgewater, Bergen County, New Jersey, 07020, United States of America","countryCode":"US","boundingBox":[40.825433,40.825533,-73.9744985,-73.9743985]}}'::jsonb);

-- Group: Afro Brazilian Cultural Center of New Jersey
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b9e1e1c6-9343-4ed0-99f8-f21ad346118d', NOW(), NOW(), 'Afro Brazilian Cultural Center of New Jersey', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Gaivota (David Morgan)
Main Contact: - 554
Notes: SOURCE: website 3/23/19', 'emaildavid@abccnj.com', '[{"type":"website","url":"http://www.abccnj.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8626e2fa-0093-415c-a036-d03f6b17ffd1', 'b9e1e1c6-9343-4ed0-99f8-f21ad346118d', 'Bloomfield Avenue', 'Schedule: Children:   Mon,Wed & Fri 6:00-7:00pm; Beginners & Teens: Mon,Wed & Fri; Adult: Mon,Wed & Fri 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.1942323,40.7872463]},"properties":{"address":"554 Bloomfield Avenue, Bloomfield, NJ 07003","displayName":"Bloomfield Avenue, Bloomfield, Essex County, New Jersey, 07003, United States of America","countryCode":"US","boundingBox":[40.78514,40.7893499,-74.1953298,-74.19314]}}'::jsonb);

-- Group: Grupo Ginga
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ca65ced8-6fdc-4b53-a782-80a4993490e5', NOW(), NOW(), 'Grupo Ginga', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - +1 917 725 0381
Notes: SOURCE: website 5/7/19', NULL, '[{"type":"website","url":"http://www.grupoginga.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('949ffc87-b8c0-4805-8c6c-797fa06f337f', 'ca65ced8-6fdc-4b53-a782-80a4993490e5', 'Morgan Street', 'Schedule: Mon & Thurs  7:00 - 8:30pm( call or contact though', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0415631,40.7201993]},"properties":{"address":"196 Morgan Street, Jersey City, NJ 07302","displayName":"196, Morgan Street, Hamilton Park, Jersey City, Hudson County, New Jersey, 07302, United States of America","countryCode":"US","boundingBox":[40.7201493,40.7202493,-74.0416131,-74.0415131]}}'::jsonb);

-- Group: Arts United Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8c3abc25-0074-41a8-a13e-8d66a7bb1c24', NOW(), NOW(), 'Arts United Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 19)
Notes: )SOURCE:  website 4/5/19', 'aucapoeira@gmail.com', '[{"type":"website","url":"https://aucapoeira.wixsite.com/aucapoeira"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1fef8cd4-e4dd-4a60-b335-95844b0e8a80', '8c3abc25-0074-41a8-a13e-8d66a7bb1c24', 'Coles St', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.047331,40.723628]},"properties":{"address":"54 Coles St, Jersey City, NJ 07302","displayName":"54, Coles Street, Hamilton Park, Journal Square, Jersey City, Hudson County, New Jersey, 07302, United States of America","countryCode":"US","boundingBox":[40.723578,40.723678,-74.047381,-74.047281]}}'::jsonb);

-- Group: Grupo Liberdade de Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c52bffe0-ba88-4902-995f-17519e676b56', NOW(), NOW(), 'Grupo Liberdade de Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 347] 228-5593
Notes: SOURCE: website 4/3/19', 'amazonas.jb@gmail.com', '[{"type":"website","url":"http://www.grupoliberdadedecapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('12742b05-bd64-49c4-812a-edf40ef86bfd', 'c52bffe0-ba88-4902-995f-17519e676b56', 'Vauxhall', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.2827557,40.7171382]},"properties":{"address":"Vauxhall, NJ 07088","displayName":"Vauxhall Road, Union, Union County, New Jersey, 07088, United States of America","countryCode":"US","boundingBox":[40.7158195,40.7181288,-74.2839144,-74.2820391]}}'::jsonb);

-- Group: Santa Fe Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('518c3a17-dc37-45d0-8efb-a990c9a30413', NOW(), NOW(), 'Santa Fe Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 507
Notes: SOURCE:  website  4/10/19', NULL, '[{"type":"website","url":"http://www.capoeirasantafe.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a4398d92-6f71-4c50-a51f-4e9388d4b74d', '518c3a17-dc37-45d0-8efb-a990c9a30413', 'Kathryn Street', 'Schedule: Tues 6:00-7:30 pm; Thurs 6:00 -7:00 pm.; Conditioning:  Mon- Fri 8:00- 8:45 am.; All ages: Sat 9:00 - 9:45am,', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-105.9575698,35.6784507]},"properties":{"address":"507 Kathryn Street, Santa Fe, NM 87501","displayName":"Kathryn Street Foot Bridge, Santa Fe, Santa Fe County, New Mexico, 87505, United States of America","countryCode":"US","boundingBox":[35.678406,35.6784954,-105.9575702,-105.9575694]}}'::jsonb);

-- Group: LV Capoeira Academy - Grupo Liberdade
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4e206fc8-01b8-40a0-92b6-dd19963f5475', NOW(), NOW(), 'LV Capoeira Academy - Grupo Liberdade', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Adam Kaswiner (under Mestre CiganoRio de)
Main Contact: - 845-464-2332
Notes: SOURCE: website 1/12/19', 'akaswiner@gmail.com', '[{"type":"website","url":"https://www.lvcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3bb6801e-dc6f-4094-8ec1-0ee9d21f6f02', '4e206fc8-01b8-40a0-92b6-dd19963f5475', 'W Sahara Ave', 'Schedule: Mon, Tues & Thur 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-115.1817792,36.1438589]},"properties":{"address":"2929 W Sahara Ave, Las Vegas, NV 89102","displayName":"Las Vegas Shotokan Karate, 2929, West Sahara Avenue, Rancho Charleston, Las Vegas, Clark County, Nevada, 89102, United States of America","countryCode":"US","boundingBox":[36.1438013,36.1439321,-115.1818719,-115.1816866]}}'::jsonb);

-- Group: Motumbaxé Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('47a4dae4-7059-414c-be5e-9dfb224863f7', NOW(), NOW(), 'Motumbaxé Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Joao Bispo de Souza Neto, (Lampreia)
Main Contact: - 76
Notes: SOURCE: website 5/6/19', 'lampreia@motumbaxecapoeira.com', '[{"type":"website","url":"http://www.motumbaxecapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('dfd2f731-8da0-43bd-8770-2d3c3f75f9f4', '47a4dae4-7059-414c-be5e-9dfb224863f7', 'Nevins Street', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9826228,40.6865053]},"properties":{"address":"76 Nevins Street, Brooklyn, NY 11217","displayName":"76, Nevins Street, Boerum Hill, Brooklyn, Kings County, City of New York, New York, 11217, United States of America","countryCode":"US","boundingBox":[40.6864297,40.6865828,-73.982767,-73.9824835]}}'::jsonb);

-- Group: Capoeira Vida Brooklyn
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3df8e50b-5512-4725-9611-283259a5dae0', NOW(), NOW(), 'Capoeira Vida Brooklyn', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Ana Costa( ()()
Main Contact: - 917-722-6703
Notes: SOURCE:   website 4/19/19', 'info@capoeirabrooklyn.com', '[{"type":"website","url":"https://www.capoeiravida.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4e61630a-073d-4fba-bf59-a771b5f5a170', '3df8e50b-5512-4725-9611-283259a5dae0', '7th Street', 'Schedule: Beginner:  Wed: 6:30-8pm; All Levels:  Tues: 6:30-8pm; Thurs : 7:30-9pm; Sat:', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9857219,40.670428]},"properties":{"address":"316 7th Street, Brooklyn, NY 11215","displayName":"Way of Action, 316, 7th Street, Park Slope, Brooklyn, Kings County, City of New York, New York, 11215, United States of America","countryCode":"US","boundingBox":[40.670378,40.670478,-73.9857719,-73.9856719]}}'::jsonb);

-- Group: Centro de Capoeira Angola Filhos de Dunga
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bf8eb5b3-37f5-4cca-a3d7-af2054028110', NOW(), NOW(), 'Centro de Capoeira Angola Filhos de Dunga', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Luiz Rocha
Main Contact: - 335
Notes: SOURCE: 5/12/19', 'nygrande@gmail.com', '[{"type":"website","url":"http://www.capoeiraangolabrooklyn.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1ce12277-58d8-4213-bdd9-b8b0f0fee25e', 'bf8eb5b3-37f5-4cca-a3d7-af2054028110', 'Throop Ave Brooklyn', 'Schedule: Basic Postures, Movements, Sequences, Music: Mon, Tues, Wed, & Thurs 7:00-9:00pm; Music & Movement Ages: 3-5 Years: Sat 10:00á 10:45am; Music & Movement Ages: 6-12Years: Sat 11:00:00amá 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9424241,40.6918747]},"properties":{"address":"335 Throop Ave Brooklyn, NY 11221","displayName":"335, Throop Avenue, Bedford-Stuyvesant, Brooklyn, Kings County, City of New York, New York, 11221, United States of America","countryCode":"US","boundingBox":[40.6917356,40.6920139,-73.942605,-73.9422432]}}'::jsonb);

-- Group: Raizes do Brasil
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('506bec7b-915a-42ac-846a-1beab77bab95', NOW(), NOW(), 'Raizes do Brasil', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 347] 921-2446
Notes: )SOURCE: website  4/23/19(', 'info@rbcapoeira.com', '[{"type":"website","url":"http://www.rbcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5fb33f4b-3a42-436c-8d97-dd95e2b909f6', '506bec7b-915a-42ac-846a-1beab77bab95', '3rd Ave', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9858694,40.6773633]},"properties":{"address":"279 3rd Ave, Brooklyn, NY 11215","displayName":"279, 3rd Avenue, Gowanus, Brooklyn, Kings County, City of New York, New York, 11215, United States of America","countryCode":"US","boundingBox":[40.6773133,40.6774133,-73.9859522,-73.9857867]}}'::jsonb);

-- Group: Vai Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('9d95f994-45ce-47bb-a24c-629d6a564b4c', NOW(), NOW(), 'Vai Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 646.379.4468
Notes: SOURCE: website 4/19/19', NULL, '[{"type":"website","url":"https://www.vaicapoeira.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3296a5cc-da02-4641-84d8-1c3c4d5d5a52', '9d95f994-45ce-47bb-a24c-629d6a564b4c', '646.379.4468', 'Schedule: Thurs & Sat 6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[16.9869676,49.276294]},"properties":{"address":"646.379.4468","displayName":"Purkyňova, Nosálovice, Vyškov, okres Vyškov, Jihomoravský kraj, Jihovýchod, 682 01, Česko","countryCode":"CZ","boundingBox":[49.2762806,49.2763074,16.986868,16.9870671]}}'::jsonb);

-- Group: Capoeira Luanda under Mestre Jelon
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cb758b6f-4794-4e55-848a-72db98734867', NOW(), NOW(), 'Capoeira Luanda under Mestre Jelon', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Angelo Ribeiro
Main Contact: - 917] 224-1209
Notes: SOURCE: website 4/14/19Introdutor Caipira  "Mirlet(")(
SOURCE: website 4/14/19', 'piaocapoeira@gmail.com', '[{"type":"website","url":"http://www.piaocapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('82dc1a0d-9e40-4767-bc5f-4553b9afedc1', 'cb758b6f-4794-4e55-848a-72db98734867', '3rd Avenue', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.986335,40.6766107]},"properties":{"address":"303 3rd Avenue, Brooklyn, NY 11215","displayName":"303, 3rd Avenue, Gowanus, Brooklyn, Kings County, City of New York, New York, 11215, United States of America","countryCode":"US","boundingBox":[40.67652,40.6767076,-73.9865069,-73.9861747]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a3ef79b4-ab03-4f13-baf8-38750f9a12fa', 'cb758b6f-4794-4e55-848a-72db98734867', 'Lafayette Avenue', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9788779,40.6868763]},"properties":{"address":"3 Lafayette Avenue, Brooklyn, NY","displayName":"3, Lafayette Avenue, Fort Greene, Brooklyn, Kings County, City of New York, New York, 11217, United States of America","countryCode":"US","boundingBox":[40.6868263,40.6869263,-73.9789279,-73.9788279]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b42cb940-b135-4781-9648-f3d706bc8cb9', 'cb758b6f-4794-4e55-848a-72db98734867', 'Calyer St', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9565605,40.7269717]},"properties":{"address":"106 Calyer St, Greenpoint, Brooklyn, NY","displayName":"Triskelion Arts, 106, Calyer Street, Greenpoint, Brooklyn, Kings County, City of New York, New York, 11222, United States of America","countryCode":"US","boundingBox":[40.7269217,40.7270217,-73.9566105,-73.9565105]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('54ab568e-aaa9-4137-b820-c591e1c56233', 'cb758b6f-4794-4e55-848a-72db98734867', 'Manhattan Ave', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9466784,40.7166711]},"properties":{"address":"361 Manhattan Ave, Brooklyn, NY","displayName":"Center For Performing Research, 361, Manhattan Avenue, Greenpoint, Brooklyn, Kings County, City of New York, New York, 11211, United States of America","countryCode":"US","boundingBox":[40.7165999,40.7167423,-73.9468007,-73.946556]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e3231060-903e-408c-87b6-a7b3e30e1d64', 'cb758b6f-4794-4e55-848a-72db98734867', '3rd Avenue', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9903434,40.6725026]},"properties":{"address":"432 3rd Avenue, Brooklyn, NY 11215","displayName":"432, 3rd Avenue, Park Slope, Brooklyn, Kings County, City of New York, New York, 11215, United States of America","countryCode":"US","boundingBox":[40.6724526,40.6725526,-73.9903934,-73.9902934]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1747711f-b23f-4d4d-ae6f-64bc31ac9c98', 'cb758b6f-4794-4e55-848a-72db98734867', 'Waverly Avenue', 'Schedule: Adult: Mon, Wed & Fri: 7:00-8:30pm; Sat: 4:00-5:30pm; Kids:Sat: 3:00-4:00pmProfessor Alegria "Leandro Santos da Silva"; Mon 7:30-8:45pm; Kids: &#8203;Mon 5:00-6:00pm; Kids Wed 4:00-5:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9658381,40.6855509]},"properties":{"address":"419 Waverly Avenue, Brooklyn, NY 11238","displayName":"Public School 11, 419, Waverly Avenue, Clinton Hill, Brooklyn, Kings County, City of New York, New York, 11238, United States of America","countryCode":"US","boundingBox":[40.6852063,40.6860426,-73.9662811,-73.9654307]}}'::jsonb);

-- Group: Pena Verde Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('e8a464e8-73a5-44d1-ab0a-53e83337a954', NOW(), NOW(), 'Pena Verde Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 197
Notes: SOURCE: websites 5/6/19 (merged from 2 duplicate entries)', NULL, '[{"type":"website","url":"http://www.penaverdecapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('509b5abe-b8da-4f76-a88f-48cd6e4c1228', 'e8a464e8-73a5-44d1-ab0a-53e83337a954', 'Clifton Place', 'Schedule: Adults: Tues & Thurs 7:00-8;30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9559765,40.6888772]},"properties":{"address":"197 Clifton Place, Brooklyn, NY 11216","displayName":"197, Clifton Place, Clinton Hill, Brooklyn, Kings County, City of New York, New York, 11205, United States of America","countryCode":"US","boundingBox":[40.6886857,40.688959,-73.9560718,-73.9558518]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c8d24d88-7e9f-4c91-b15e-ee506bbe2823', 'e8a464e8-73a5-44d1-ab0a-53e83337a954', 'Greene Ave', 'Schedule: Adults: Tues & Thurs 7:00-8;30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9627409,40.6868743]},"properties":{"address":"216 Greene Ave, Brooklyn, NY 11238","displayName":"216, Greene Avenue, Clinton Hill, Brooklyn, Kings County, City of New York, New York, 11238, United States of America","countryCode":"US","boundingBox":[40.6867185,40.6869735,-73.9627948,-73.9626759]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bdc42dcd-56af-4d63-8b55-761cb2463cc1', 'e8a464e8-73a5-44d1-ab0a-53e83337a954', 'Nostrand Avenue', 'Schedule: Adults: Tues & Thurs 7:00-8;30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9505769,40.6720862]},"properties":{"address":"778 Nostrand Avenue, Brooklyn, NY 11216","displayName":"778, Nostrand Avenue, Crown Heights, Brooklyn, Kings County, City of New York, New York, 11216, United States of America","countryCode":"US","boundingBox":[40.6720531,40.6721194,-73.9507359,-73.9504179]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0efd3d09-0073-43bf-8a5f-a580bbaa8f10', 'e8a464e8-73a5-44d1-ab0a-53e83337a954', 'Fulton Street', 'Schedule: Adults: Tues & Thurs 7:00-8;30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9456091,40.6799639]},"properties":{"address":"1368 Fulton Street, Brooklyn, NY 11216","displayName":"Restoration Plaza, 1368, Fulton Street, Bedford-Stuyvesant, Brooklyn, Kings County, City of New York, New York, 11216, United States of America","countryCode":"US","boundingBox":[40.6797461,40.6800899,-73.9460765,-73.9451482]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4341295b-9093-4b21-9444-d255c37f2f05', 'e8a464e8-73a5-44d1-ab0a-53e83337a954', 'Main Street Dance and Theatre Alliance', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9496057,40.7619559]},"properties":{"address":"548 Main Street, New York, NY 10044","displayName":"548, Main Street, Manhattan Community Board 8, Manhattan, New York County, City of New York, New York, 10044, United States of America","countryCode":"US","boundingBox":[40.7619059,40.7620059,-73.9496557,-73.9495557]}}'::jsonb);

-- Group: ABADÁ - -Capoeira Brooklyn
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('64b0e670-e637-4839-9a43-1462823e60e0', NOW(), NOW(), 'ABADÁ - -Capoeira Brooklyn', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Ryan Johnson
Main Contact: - 281
Notes: SOURCE: website 5/11/19', NULL, '[{"type":"website","url":"https://www.abadanyc.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0ec51d92-0ca5-4c80-88d0-0960192974dc', '64b0e670-e637-4839-9a43-1462823e60e0', 'N 7th St', 'Schedule: Tues & Fri 7:00-9:00pm; Sun 12:30-4:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9531794,40.715298]},"properties":{"address":"281 N 7th St, Brooklyn, NY 11211","displayName":"281, North 7th Street, Williamsburg, Brooklyn, Kings County, City of New York, New York, 11211, United States of America","countryCode":"US","boundingBox":[40.7151203,40.7154761,-73.9534105,-73.9529504]}}'::jsonb);

-- Group: Buffalo Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('3e093968-b07c-4c0b-bc72-effdbf8ea9c3', NOW(), NOW(), 'Buffalo Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 716] 320-0093
Notes: SOURCE: website 5/26/19', 'capoeiraculturalarts@gmail.com', '[{"type":"website","url":"http://www.capoeirabuffalo.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6462daed-8612-4640-bc44-1bbab82d208f', '3e093968-b07c-4c0b-bc72-effdbf8ea9c3', 'E. Utica St.', 'Schedule: Adult Beginner: Mon, Wed & Fri 6:30 - 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-78.8574602,42.911371]},"properties":{"address":"226 E. Utica St., Buffalo, NY","displayName":"226, East Utica Street, East Side, Buffalo, Erie County, New York, 14208, United States of America","countryCode":"US","boundingBox":[42.911321,42.911421,-78.8575102,-78.8574102]}}'::jsonb);

-- Group: Ithaca Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0d34cd11-458a-4817-8bb6-fda4f6577e79', NOW(), NOW(), 'Ithaca Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 407
Notes: SOURCE: website, facebook 5/27/19', NULL, '[{"type":"website","url":"http://vadiacao.net/index.html"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3198b6ad-66c0-42e7-bae6-87c42062b199', '0d34cd11-458a-4817-8bb6-fda4f6577e79', 'Taughannock Boulevard', 'Schedule: Mon, Wed & Fri 7:30-930pm; Music: Sun 1:00-2:30pm (location may be elsewhere)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.5122569,42.4426302]},"properties":{"address":"407 Taughannock Boulevard, Ithaca, NY 14850","displayName":"407, Old Taughannock Boulevard, Ward 1, City of Ithaca, Tompkins County, New York, 14850, United States of America","countryCode":"US","boundingBox":[42.4425802,42.4426802,-76.5123069,-76.5122069]}}'::jsonb);

-- Group: Capoeira Angola Quintal of Ithaca, NY
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('7742e0e5-1a58-4dad-9712-e7f6bc66bd29', NOW(), NOW(), 'Capoeira Angola Quintal of Ithaca, NY', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 136
Notes: SOURCE:  website 5/27/19', 'ithacacaq@gmail.com', '[{"type":"website","url":"https://www.ithacacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('60231118-34a4-4eca-a862-66fd441d059a', '7742e0e5-1a58-4dad-9712-e7f6bc66bd29', 'Willard Straight Hall', 'Schedule: Sun & Tues: 7:30pm - 9:00pm; Fri 3:30-5:30pm      (Contact for location); Thurs  7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.4856054,42.446466]},"properties":{"address":"Willard Straight Hall, 136 Ho Plaza, Ithaca, NY 14853","displayName":"Willard Straight Hall, 136, Ho Plaza, Ward 4, City of Ithaca, Tompkins County, New York, 14850, United States of America","countryCode":"US","boundingBox":[42.4462657,42.4468666,-76.4860045,-76.4853035]}}'::jsonb);

-- Group: Manhatten Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bcf24dbe-de9e-45a8-83b2-f55b7a216eab', NOW(), NOW(), 'Manhatten Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 2916
Notes: SOURCE: website 4/12/19', 'info@joaogrande.org', '[{"type":"website","url":"http://www.joaogrande.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('97bf6876-0b76-4ab7-ad37-ae5ab70b8c8c', 'bcf24dbe-de9e-45a8-83b2-f55b7a216eab', 'Frederick Douglass Boulevard', 'Schedule: Adults: Mon-Fri 6:30- 8:30pm, Sun 10am-12; Kids: Sat 11:00am-12:00; RODA!: Sun 2:00-7:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9373406,40.8285417]},"properties":{"address":"2916 Frederick Douglass Boulevard, New York, NY 10039","displayName":"2916, Frederick Douglass Boulevard, Harlem, Manhattan Community Board 10, Manhattan, New York County, City of New York, New York, 10039, United States of America","countryCode":"US","boundingBox":[40.8284013,40.8286821,-73.9375526,-73.9371287]}}'::jsonb);

-- Group: Capoeira Angola Quintal
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4bf73345-234a-4e87-ba3f-a71525891eec', NOW(), NOW(), 'Capoeira Angola Quintal', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Michael Goldstein
Main Contact: - 107
Notes: SOURCE: websites 4/13/19', NULL, '[{"type":"website","url":"http://newyorkcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('90aa6fe9-98f8-4973-829b-a46f3390d651', '4bf73345-234a-4e87-ba3f-a71525891eec', '107 Suffolk St, Studio 307 New York, NY 10002', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9861796,40.719051]},"properties":{"address":"107 Suffolk Street, New York, NY 10002","displayName":"107, Suffolk Street, Lower East Side, Manhattan Community Board 3, Manhattan, New York County, City of New York, New York, 10002, United States of America","countryCode":"US","boundingBox":[40.719001,40.719101,-73.9862296,-73.9861296]}}'::jsonb);

-- Group: Carioca Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('cb54fb76-8c31-4121-852e-4e27ad1100ad', NOW(), NOW(), 'Carioca Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Carlos da Silva Borge
Main Contact: - 718-309-7605
Notes: SOURCE: website 4/13/19', 'cariocanyc@yahoo.com', '[{"type":"website","url":"http://www.cariocacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b67ec1df-18ee-4b43-9ffc-72e80a1acc16', 'cb54fb76-8c31-4121-852e-4e27ad1100ad', 'Cornell Medical College', 'Schedule: Tues 7:00-9:00pm; Sat 12:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9553346,40.7650988]},"properties":{"address":"445 East 69th St, New York, NY","displayName":"445, East 69th Street, Lenox Hill, Manhattan Community Board 8, Manhattan, New York County, City of New York, New York, 10021, United States of America","countryCode":"US","boundingBox":[40.7650488,40.7651488,-73.9553846,-73.9552846]}}'::jsonb);

-- Group: Capoeira Luanda
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4a6a060d-a743-486a-8795-728742be8b0a', NOW(), NOW(), 'Capoeira Luanda', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR
Main Contact: - 635
Notes: SOURCE: website 4/14/19
SOURCE: website 4/13/19(
SOURCE: website 4/14/19 Instructor Sabiá  (is now teaching in  Contra Costa County CA', 'info@capoeiracenterny.orgProfessorTiba', '[{"type":"website","url":"http://www.capoeiracenterny.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('763704eb-e009-4057-a873-fecf61e826e0', '4a6a060d-a743-486a-8795-728742be8b0a', 'Riverside Drive', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.8670119,41.1014877]},"properties":{"address":"635 Riverside Drive, New York, NY 10031","displayName":"635, Riverside Drive, Philipse Manor, Village of Sleepy Hollow, Town of Mount Pleasant, Westchester County, New York, 10591, United States of America","countryCode":"US","boundingBox":[41.1014377,41.1015377,-73.8670619,-73.8669619]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3c7f7c3c-72a8-4a10-9ded-d7ae63dd979d', '4a6a060d-a743-486a-8795-728742be8b0a', 'Broadway', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9935691,40.7294608]},"properties":{"address":"721 Broadway, New York, NY 10003","displayName":"721, Broadway, East Village, NoHo, Manhattan, New York County, City of New York, New York, 10003, United States of America","countryCode":"US","boundingBox":[40.7294108,40.7295108,-73.9936191,-73.9935191]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d03d55ca-76bf-49af-85fa-551cbc4ec3f5', '4a6a060d-a743-486a-8795-728742be8b0a', 'West 55th Street', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9869292,40.7669468]},"properties":{"address":"405 West 55th Street, New York, NY 10019","displayName":"405, West 55th Street, Columbus Circle, Manhattan Community Board 4, Manhattan, New York County, City of New York, New York, 10019, United States of America","countryCode":"US","boundingBox":[40.7667871,40.7671155,-73.9872415,-73.98663]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4c5a585b-c9dd-4afa-acba-653575b8d75f', '4a6a060d-a743-486a-8795-728742be8b0a', 'Broadway', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9816882,40.7806943]},"properties":{"address":"2121 Broadway, New York, NY 10023","displayName":"2121, Broadway, Upper West Side, Manhattan Community Board 7, Manhattan, New York County, City of New York, New York, 10023, United States of America","countryCode":"US","boundingBox":[40.7806443,40.7807443,-73.9817382,-73.9816382]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('932ed791-66f6-428a-aba3-a30eb5db9537', '4a6a060d-a743-486a-8795-728742be8b0a', 'W 14th St', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9965443,40.7374652]},"properties":{"address":"69 W 14th St, New York, NY 10011","displayName":"69, West 14th Street, Union Square, Manhattan Community Board 5, Manhattan, New York County, City of New York, New York, 10011, United States of America","countryCode":"US","boundingBox":[40.7374152,40.7375152,-73.9965943,-73.9964943]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('59181153-33f8-4b36-93d6-55fed01d07e5', '4a6a060d-a743-486a-8795-728742be8b0a', 'West 25th Street', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9905004,40.7433712]},"properties":{"address":"28 West 25th Street, New York, NY 10010","displayName":"28, West 25th Street, Chelsea, Manhattan Community Board 5, Manhattan, New York County, City of New York, New York, 10010, United States of America","countryCode":"US","boundingBox":[40.7432298,40.7435126,-73.9906572,-73.9903436]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fec69754-df64-402f-897f-a45d8dc712dc', '4a6a060d-a743-486a-8795-728742be8b0a', 'N Moore St', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0074462,40.7199406]},"properties":{"address":"27 N Moore St, New York, NY 10013","displayName":"27, North Moore Street, Tribeca, Manhattan, New York County, City of New York, New York, 10013, United States of America","countryCode":"US","boundingBox":[40.7198906,40.7199906,-74.0074962,-74.0073962]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8b271954-e23c-46b1-90b7-6541f9c80002', '4a6a060d-a743-486a-8795-728742be8b0a', 'Pine St', 'Schedule: Tues 7:30-9:00pm; Wed 7:30-8:00pm; Sat 4:00-5:30pm; All levels: Sat- 4:00-5:30pm Introdutor Caipira  "Mirlet(")(', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0101389,40.7075503]},"properties":{"address":"25 Pine St, New York, NY 10005","displayName":"25, Pine Street, Financial District, Manhattan, New York County, City of New York, New York, 10005, United States of America","countryCode":"US","boundingBox":[40.7075003,40.7076003,-74.0101889,-74.0100889]}}'::jsonb);

-- Group: FICA New York
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d39c0577-0a15-4e91-8c4b-43ef2e5a0972', NOW(), NOW(), 'FICA New York', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: TREINEL Michael Kranz (917.971.7980)
Main Contact: - 917.971.7980
Notes: SOURCE: website  5/11/19(', 'ficany@gmail.com', '[{"type":"website","url":"http://www.ficanewyork.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('92dc3cfd-a53a-41d0-b3a4-4ea86f5f35d1', 'd39c0577-0a15-4e91-8c4b-43ef2e5a0972', 'Christopher Street', 'Schedule: Mon &Wed 7:00-9:00p; RODA! :3rd Sat 3:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-74.0079455,40.7328573]},"properties":{"address":"149 Christopher Street, New York, NY","displayName":"149, Christopher Street, West Village, Manhattan, New York County, City of New York, New York, 10014, United States of America","countryCode":"US","boundingBox":[40.7328073,40.7329073,-74.0079955,-74.0078955]}}'::jsonb);

-- Group: Vai Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('eb5dd263-54f3-4c67-8535-118eb68bbe29', NOW(), NOW(), 'Vai Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 646.379.4468
Notes: SOURCE: website 4/19/19', NULL, '[{"type":"website","url":"https://www.vaicapoeira.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('070d14a1-4fdc-4952-9adf-e302bd1337a4', 'eb5dd263-54f3-4c67-8535-118eb68bbe29', '8th Ave', 'Schedule: Mon & Wed: 8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9919513,40.7538643]},"properties":{"address":"520 8th Ave, New York, NY","displayName":"Houndstooth Pub, 520, 8th Avenue, Garment District, Manhattan Community Board 5, Manhattan, New York County, City of New York, New York, 10018, United States of America","countryCode":"US","boundingBox":[40.7538143,40.7539143,-73.9920013,-73.9919013]}}'::jsonb);

-- Group: Carioca Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f571f5f2-0ba3-4172-8a3d-e0189268606b', NOW(), NOW(), 'Carioca Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Carlos da Silva Borge
Main Contact: - 718-309-7605
Notes: SOURCE: website 4/13/19', 'cariocanyc@yahoo.com', '[{"type":"website","url":"http://www.cariocacapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6a372bcf-a8c0-4ce5-84e4-0a7883937321', 'f571f5f2-0ba3-4172-8a3d-e0189268606b', 'Woodside Ballet Academy', 'Schedule: kids : Thurs 6:00-7:00pm; Fri 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9055343,40.7429852]},"properties":{"address":"49-10 43rd Ave, Woodside, NY 11377","displayName":"43rd Avenue, Woodside, Queens, Queens County, City of New York, New York, 11377, United States of America","countryCode":"US","boundingBox":[40.7423239,40.74347,-73.908956,-73.902145]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('0e644247-efca-4406-b981-8f0910992039', 'f571f5f2-0ba3-4172-8a3d-e0189268606b', 'Woodside Ballet Academy', 'Schedule: kids : Thurs 6:00-7:00pm; Fri 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9227922,40.7433489]},"properties":{"address":"41-20 Queens Boulevard, Sunnyside, NY 11104","displayName":"41-20, Queens Boulevard, Sunnyside Gardens, Queens, Queens County, City of New York, New York, 11104, United States of America","countryCode":"US","boundingBox":[40.7432989,40.7433989,-73.9228422,-73.9227422]}}'::jsonb);

-- Group: Dendê Arts - Capoeira Cordao de Ouro
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('585d3d1b-9ff6-4240-94a5-6f28ce45b9af', NOW(), NOW(), 'Dendê Arts - Capoeira Cordao de Ouro', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Chris Rodriguez (under Contra-Mestre CebolinhaNewark)
Main Contact: - 862-571- 7629
Notes: SOURCE: email 7/10/18', 'dende.arts@gmail.com', '[{"type":"website","url":"http://dendearts.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('fcfbfa7f-4d85-4581-ac4d-5549e2f62e35', '585d3d1b-9ff6-4240-94a5-6f28ce45b9af', '24th St. Astoria', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.9219081,40.7737369]},"properties":{"address":"27-24 24th St. Astoria, Queens, NY(","displayName":"24th Street, Astoria, Queens, Queens County, City of New York, New York, 11102, United States of America","countryCode":"US","boundingBox":[40.7735424,40.773931,-73.92216,-73.921656]}}'::jsonb);

-- Batch: batch-06.json (33 groups)

-- Group: Com Expressao
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8dc96932-2f8c-4cc6-8cf3-34f91d3e17fb', NOW(), NOW(), 'Com Expressao', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Todd Russell
Main Contact: - 1352
Notes: SOURCE:  website 5/26/19', 'capo@comexpressao.com', '[{"type":"website","url":"http://www.comexpressao.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d5c1f58d-8647-400a-bd16-7dbf66b36ec0', '8dc96932-2f8c-4cc6-8cf3-34f91d3e17fb', 'Culver Rd', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.5604334,43.1701372]},"properties":{"address":"1352 Culver Rd, Rochester, NY 14609","displayName":"1352, Culver Road, Homestead Heights, City of Rochester, Monroe County, New York, 14609, United States of America","countryCode":"US","boundingBox":[43.1700872,43.1701872,-77.5604834,-77.5603834]}}'::jsonb);

-- Group: Capoeira Angola Quintal Rochester
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('57c12504-23ca-41ab-bcc3-f87aae8ffd01', NOW(), NOW(), 'Capoeira Angola Quintal Rochester', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE  Greg Hollar (under Mestre OmbrinhoNew York)
Main Contact: - 34
Notes: SOURCE: website  5/26/19', NULL, '[{"type":"website","url":"http://www.rochestercapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('797df569-b152-46c9-bdc7-136ab1dd35bc', '57c12504-23ca-41ab-bcc3-f87aae8ffd01', 'Elton St', 'Schedule: Movement: Mon & Thurs 6:30-8:00pm; Music: Wed 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.579638,43.1552757]},"properties":{"address":"34 Elton St, Rochester, New York 14607","displayName":"34, Elton Street, Neighborhood Of The Arts, City of Rochester, Monroe County, New York, 14607, United States of America","countryCode":"US","boundingBox":[43.1552257,43.1553257,-77.579688,-77.579588]}}'::jsonb);

-- Group: Westchester Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('646e9bbc-4760-4594-9036-a955d7c5fad3', NOW(), NOW(), 'Westchester Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Raefal and Sarah Teixeira (email: cnc.ny.usa@gmail.com)
Main Contact: - 845-826-4511
Notes: SOURCE: website 5/20/19', 'cnc.ny.usa@gmail.com', '[{"type":"website","url":"http://www.cainacapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6a1d0fd7-ccc9-4c20-8abc-e856b2ffecbf', '646e9bbc-4760-4594-9036-a955d7c5fad3', 'North Broadway', 'Schedule: kids: Mon  6:00-6:50 pm; adults: Mon 7:00-8:00 pm;  Thurs 7:30-8:30 pm; Children: Wed  6:10-7:00pm; Adults:  Wed 7:30-8:30 pm; Family/All ages  Sat 9:30-10:30 am      &#8203;      Belmars,; Conditioning:  Sun 4:00-4:4 pm; Music & Roda: Sun 5:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.8575602,41.0793326]},"properties":{"address":"42 North Broadway, Tarrytown, NY 10591","displayName":"42, North Broadway, Village of Tarrytown, Town of Greenburgh, Westchester County, New York, 10591, United States of America","countryCode":"US","boundingBox":[41.0792826,41.0793826,-73.8576102,-73.8575102]}}'::jsonb);

-- Group: Capoeira Luanda New Rochelle
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('862e8229-c80e-4aaf-a4fc-da28cca379f4', NOW(), NOW(), 'Capoeira Luanda New Rochelle', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 347.880.2127
Notes: SOURCE: website 5/20/19', 'instructoracoruja@gmail.com', '[{"type":"website","url":"http://www.thecapoeiracenter.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ab8fb08b-72cf-4cdd-b292-40e22544d63f', '862e8229-c80e-4aaf-a4fc-da28cca379f4', 'The Capoeira Center', 'Schedule: Kids & Young Teens  Tues 6:00-7:00pm; Teens & Adults Tues  7:00-8:30pm; Thurs 7:00-8:00pm; Sat 2:00-3:30pm; Kids Sat 1:00-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-73.776026,40.9176407]},"properties":{"address":"130 Rhodes St, New Rochelle, NY","displayName":"130, Rhodes Street, Homestead Park, City of New Rochelle, Westchester County, New York, 10801, United States of America","countryCode":"US","boundingBox":[40.9175907,40.9176907,-73.776076,-73.775976]}}'::jsonb);

-- Group: Cleveland Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5b6d6169-3b72-4ef4-b1db-aa2d9e4849b7', NOW(), NOW(), 'Cleveland Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE
Main Contact: - 20437
Notes: Beginner  Adults: Tues 7:00pm - 8:30pmSOURCE: website  6/16/19', 'undertheguidanceofFormandoTuzhinoandMestreBonecoohiocapoeira@gmail.com', '[{"type":"website","url":"http://ohiocapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('20e44eeb-cd3d-4afa-8038-1cc5f76f8973', '5b6d6169-3b72-4ef4-b1db-aa2d9e4849b7', 'Hannan Parkway', 'Schedule: Kids ages 6-12  Sun12:00pm - 12:45pm; Music: Sun 1:00pm - 1:30pm; Adult Beginner Sun 1:30pm - 2:30pm; Adults: All Levels:  Mon 8:30 - 9:30pm;  Thurs 7:00 - 8:30pm; Beginner  Adults: Tues 7:00pm - 8:30pmSOURCE: website  6/16/19', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.530533,41.3646554]},"properties":{"address":"20437 Hannan Parkway, Walton Hills, OH 44146","displayName":"20437, Hannan Parkway, Walton Hills, Cuyahoga County, Ohio, 44146, United States of America","countryCode":"US","boundingBox":[41.3646054,41.3647054,-81.530583,-81.530483]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cd892006-af1f-4d55-a5e1-1fb1d105959a', '5b6d6169-3b72-4ef4-b1db-aa2d9e4849b7', 'Mercantile Rd', 'Schedule: Kids ages 6-12  Sun12:00pm - 12:45pm; Music: Sun 1:00pm - 1:30pm; Adult Beginner Sun 1:30pm - 2:30pm; Adults: All Levels:  Mon 8:30 - 9:30pm;  Thurs 7:00 - 8:30pm; Beginner  Adults: Tues 7:00pm - 8:30pmSOURCE: website  6/16/19', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.5051183,41.4610889]},"properties":{"address":"23945 Mercantile Rd, Beachwood, OH 44122","displayName":"23945, Mercantile Road, Beachwood Commerce Park, Hampshire Park Country Estates, Beachwood, Cuyahoga County, Ohio, 44122, United States of America","countryCode":"US","boundingBox":[41.4610389,41.4611389,-81.5051683,-81.5050683]}}'::jsonb);

-- Group: Columbus Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d11f1be0-e538-443a-a33c-5f13c81eb7f0', NOW(), NOW(), 'Columbus Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 1069
Notes: SOURCE: website 5/26/19', NULL, '[{"type":"website","url":"https://www.capoeirabrasileiracolumbus.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('33a85404-37fb-471c-8b7c-9df55db58973', 'd11f1be0-e538-443a-a33c-5f13c81eb7f0', 'Jaeger St', 'Schedule: age 13+: Tues & Thurs 7:35- 8:35pm; ages 5 - 11: Mon & Thurs 6:45-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.9917605,39.9416859]},"properties":{"address":"1069 Jaeger St, Columbus, OH 43206","displayName":"1069, Jaeger Street, German Village, Columbus, Franklin County, Ohio, 43206, United States of America","countryCode":"US","boundingBox":[39.9414155,39.9419273,-82.9922681,-82.9911503]}}'::jsonb);

-- Group: Brighton Capoeira Angola Group - Filhos de Angola
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('fefb365b-0cc1-49b4-9635-36591647ead4', NOW(), NOW(), 'Brighton Capoeira Angola Group - Filhos de Angola', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Contact Susie 07748 471 491 for kids class. SOURCE: website 11/3/16', NULL, '[{"type":"website","url":"http://brightoncapoeira.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5df3df0b-5c36-40dd-8944-e433165cb7c6', 'fefb365b-0cc1-49b4-9635-36591647ead4', 'St. Mary''s Church Hall', 'Schedule: Beginners: Fri 6.30-8.30pm; ages 5-8: Tues 4:10-5:10pm
Phone: 07900020491', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-0.0092883,50.880775]},"properties":{"address":"Highdown Rd., Lewes BN7 1QE","displayName":"Highdown Road, Nevill, Lewes, Offham, Lewes, East Sussex, England, BN7 1QE, United Kingdom","countryCode":"GB","boundingBox":[50.8788369,50.8813654,-0.0126896,-0.00711]}}'::jsonb);

-- Group: Nucleo de Capoeiragem
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4b17a241-4546-44fe-936a-290a642cdc73', NOW(), NOW(), 'Nucleo de Capoeiragem', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Claudio Campos
Main Contact: Claudio Campos - 07882745860
Notes: Wales. Under the supervision of Mestres Jorge & Danilo. SOURCE: website 1/1/20', 'claudiocamposrosario@hotmail.com', '[{"type":"website","url":"http://www.cardiffcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('eee1b2ba-c001-44d9-8268-45be40d9f43f', '4b17a241-4546-44fe-936a-290a642cdc73', 'Canton Community Hall', 'Schedule: Wed 8:00-9:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.2021661,51.476997]},"properties":{"address":"Leckwith Road, Cardiff, CF11 8HP, UK","displayName":"Leckwith Road, Leckwith, Canton, Cardiff, Cymru / Wales, CF11 8HP, United Kingdom","countryCode":"GB","boundingBox":[51.4766635,51.4773681,-3.2026182,-3.2017503]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('71a84420-3e77-4d3d-8eb4-2bab77ad0857', '4b17a241-4546-44fe-936a-290a642cdc73', 'Chapter Arts Center', 'Schedule: Fri', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.2042231,51.4829544]},"properties":{"address":"Market Rd, Canton, Cardiff, CF5 1QE","displayName":"Market Road, Leckwith, Canton, Cardiff, Cymru / Wales, CF5 1RZ, United Kingdom","countryCode":"GB","boundingBox":[51.4818436,51.4839897,-3.2049421,-3.2036371]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f8666a0c-2f7c-4552-a6d6-51b2530e5282', '4b17a241-4546-44fe-936a-290a642cdc73', 'Talybont Sports Centre', 'Schedule: Kids: Fri', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.1961837,51.4975314]},"properties":{"address":"Bevan Pl, Cardiff CF14 3UX","displayName":"Bevan Place, The Colonies, Gabalfa, Cardiff, Cymru / Wales, CF14 3AS, United Kingdom","countryCode":"GB","boundingBox":[51.4973641,51.4977007,-3.1963781,-3.1959893]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c8b640e6-b498-4db3-96d1-a81fee584937', '4b17a241-4546-44fe-936a-290a642cdc73', 'University of Wales Capoeira Society', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-3.1795999,51.4887426]},"properties":{"address":"Cardiff University, Cardiff, Wales, UK","displayName":"Cardiff University, Park Place, Civic Centre, Castle, Cardiff, Cymru / Wales, CF10 3AT, United Kingdom","countryCode":"GB","boundingBox":[51.4886926,51.4887926,-3.1796499,-3.1795499]}}'::jsonb);

-- Group: Capoeira Mocambo - Associação de Capoeira Senzala Santos
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('417fbf60-2f02-45ec-a674-7fb911ac29b4', NOW(), NOW(), 'Capoeira Mocambo - Associação de Capoeira Senzala Santos', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITOR Colin Daimond
Main Contact: Colin Daimond - 07773 798199
Notes: Wales. Monitor Colin Daimond in association with Mestre Sombra [Santos, Brazil]. SOURCE: website 1/1/20', 'info@capoeiramocambo.co.uk', '[{"type":"website","url":"http://www.capoeiramocambo.co.uk/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2c170cee-3acd-4a84-a48e-0c5048f4f141', '417fbf60-2f02-45ec-a674-7fb911ac29b4', 'Mynydd LLandgai', 'Schedule: Adults: Tues & Thurs 9:30-10:30am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.08824,53.17045]},"properties":{"address":"LL57 4LQ","displayName":"LL57 4LQ, Llandygai, Mynydd Llandygái, Gwynedd, Cymru / Wales, United Kingdom","countryCode":"GB","boundingBox":[53.16845,53.17245,-4.09024,-4.08624]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('db5a9bb9-0a1b-4b33-9419-f997123c3bcf', '417fbf60-2f02-45ec-a674-7fb911ac29b4', 'Hen Iard Nwyddau / The Old Goods Yard', 'Schedule: All ages: Tues & Wed 6:30-7:30pm; Adults: Tues & Wed 6:30-9:00pm; 4-6 year olds: Wed 4:00-4:45pm; 7-11 year olds: Wed 4.45-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.1620744,53.2158565]},"properties":{"address":"Treborth, Bangor. LL57 2NX","displayName":"Treborth Road, Pentir, Bangor, Gwynedd, Cymru / Wales, LL57 2RJ, United Kingdom","countryCode":"GB","boundingBox":[53.2150133,53.2168943,-4.1630117,-4.1613625]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('aeff524d-2db4-4b05-ac48-a51b7057cfd9', '417fbf60-2f02-45ec-a674-7fb911ac29b4', 'Bangor University Capoeira Society', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-4.130082,53.2300234]},"properties":{"address":"Bangor University, Bangor, LL57 2DG, UK","displayName":"Bangor University, College Road Site, Garth Road, Garth, Bangor, Gwynedd, Cymru / Wales, LL57 2RP, United Kingdom","countryCode":"GB","boundingBox":[53.2279858,53.2319511,-4.1327012,-4.1260824]}}'::jsonb);

-- Group: Capoeira School Sheffield - Group Senzala Anglia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('22d450d3-e83c-49c8-9392-ed37adc6fb2e', NOW(), NOW(), 'Capoeira School Sheffield - Group Senzala Anglia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 07412381534
Notes: Yorkshire. SOURCE: website 11/13/16', 'info@capoeirasheffield.com', '[{"type":"website","url":"http://capoeirasheffield.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('d27ee4ba-8bd5-4be2-9088-5901be81885a', '22d450d3-e83c-49c8-9392-ed37adc6fb2e', 'Trinity Church', 'Schedule: Adults All Levels: Mon & Fri 19.00; Kids [3-5]: Sat 9.30; Kids [6-8]: Sat 10.30; Kids [9-13]: Sat 11.30', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.506627,53.3664017]},"properties":{"address":"Ecclesall Road, Sheffield, S11 8TE, UK","displayName":"Ecclesall Road, Banner Cross, Endcliffe, Sheffield, South Yorkshire, England, S11 7AA, United Kingdom","countryCode":"GB","boundingBox":[53.366302,53.3664853,-1.5068174,-1.5064289]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('449c7eb2-909c-4872-94d4-a438962cece4', '22d450d3-e83c-49c8-9392-ed37adc6fb2e', 'King Edward Lower School', 'Schedule: Adult Beginners: Wed 18:15', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.5225737,53.3764558]},"properties":{"address":"Darwin Ln, Crosspool, Sheffield S10 5RG","displayName":"Darwin Lane, Crosspool, Sheffield, South Yorkshire, England, S10 5RH, United Kingdom","countryCode":"GB","boundingBox":[53.3763606,53.3765697,-1.5229344,-1.5225693]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4a0ef4f6-43ed-4b06-b945-e8d0338118d3', '22d450d3-e83c-49c8-9392-ed37adc6fb2e', 'Hallam Capoeira Society', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-1.4627951,53.3817264]},"properties":{"address":"Sheffield Hallam University, Sheffield, S1 1WB, UK","displayName":"Sheffield Hallam University, Pond Hill, Sheaf Valley, City Centre, Sheffield, South Yorkshire, England, S1 2BG, United Kingdom","countryCode":"GB","boundingBox":[53.3810967,53.3823651,-1.4638458,-1.4625352]}}'::jsonb);

-- Group: UCA-Hayward
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('501df62d-b990-42a3-8066-38a3b4a5e420', NOW(), NOW(), 'UCA-Hayward', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Recruta
Main Contact: - 650.218.7601
Notes: Alameda County, California. SOURCE: websites 11/29/16', NULL, '[{"type":"website","url":"http://www.ucahayward.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ffe4fa08-0903-468c-9457-601a5816cb8b', '501df62d-b990-42a3-8066-38a3b4a5e420', 'UCA-Hayward', 'Schedule: Adults: Mon 8:00-9:30pm; Tues & Thurs 7:15-8:45pm; Sat 11:15am-1:00pm; Youth: Tues & Thurs 6:00-7:00pm; Sat 10:00-11:00am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.0816421,37.6746519]},"properties":{"address":"22540 Foothill Blvd. Hayward, CA 94541","displayName":"22540, Foothill Boulevard, Hayward, Alameda County, California, 94541, United States of America","countryCode":"US","boundingBox":[37.6746019,37.6747019,-122.0816921,-122.0815921]}}'::jsonb);

-- Group: Associaco de Capoeira Mestre Bimba - Bay Area
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8caf803b-02f0-42d5-9706-4a6dabf946ee', NOW(), NOW(), 'Associaco de Capoeira Mestre Bimba - Bay Area', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Caçador (Jadson Souza)
Main Contact: - [510] 926 - 1498
Notes: Alameda County, California. SOURCE: website 8/4/17', 'CapoeiraCalifornia@gmail.com', '[{"type":"website","url":"https://capoeiraoaktown.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b9c7035e-f961-46db-bf9b-11379afbeb65', '8caf803b-02f0-42d5-9706-4a6dabf946ee', 'In the Groove Studios', 'Schedule: Wed 7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.255247,37.8091566]},"properties":{"address":"366 Grand Ave, Oakland","displayName":"366, Grand Avenue, Adams Point, Downtown Oakland, Oakland, Alameda County, California, 94606, United States of America","countryCode":"US","boundingBox":[37.8090454,37.8092668,-122.2553408,-122.2551533]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3d8b7bb1-b545-47d8-bc02-6ecadd91348e', '8caf803b-02f0-42d5-9706-4a6dabf946ee', 'Studio Grand', 'Schedule: Mon 7:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2474285,37.8119095]},"properties":{"address":"3234 Grand Ave, Oakland","displayName":"Studio Grand, 3234, Grand Avenue, Grand Lake, Oakland, Alameda County, California, 94610, United States of America","countryCode":"US","boundingBox":[37.8118595,37.8119595,-122.2474785,-122.2473785]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('eb1825e2-951f-4df4-8b6f-44af33f57de1', '8caf803b-02f0-42d5-9706-4a6dabf946ee', 'San Pablo Community Center', 'Schedule: Tues 7:00-8:00pm; Kids Tues 6:00-7:00pm; Sat 10:00-11:00am; Sat 11:00am-12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3448903,37.9631657]},"properties":{"address":"2500 Rd 20, San Pablo","displayName":"Road 20, San Pablo, Contra Costa County, California, 94806, United States of America","countryCode":"US","boundingBox":[37.9627456,37.9633546,-122.3452922,-122.3443137]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('8d8f0287-06f7-4614-ae5c-7521206c15a1', '8caf803b-02f0-42d5-9706-4a6dabf946ee', 'Bladium Sports & Fitness Club', 'Schedule: Kids: Fri 5:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.301157,37.7822885]},"properties":{"address":"800 West Tower ave, Alameda","displayName":"Hangar 40, 800, West Tower Avenue, Alameda, Alameda County, California, 94607, United States of America","countryCode":"US","boundingBox":[37.7817409,37.7828443,-122.3016538,-122.3006595]}}'::jsonb);

-- Group: Capoeira Brasil East Bay
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d0366028-a3f9-4f61-a898-b5d6cbb1e2fa', NOW(), NOW(), 'Capoeira Brasil East Bay', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTORA Foquinh (Tammy Chang)
Main Contact: - 646-265-8800
Notes: Alameda County, California. Also Instrutor Sagui, Graduada Bailarina (Lorin King). Inclusive Capoeira Classes [adapted capoeira for people with disabilities]. SOURCE: website 12/3/16', 'capoeastbay@gmail.com', '[{"type":"website","url":"http://www.capoeirabrasileastbay.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ec956069-20e6-4e57-a746-b8771c5e046d', 'd0366028-a3f9-4f61-a898-b5d6cbb1e2fa', 'Ellen Webb Yoga Studios', 'Schedule: Tues 8:30-10:00pm; Thurs 8:00-10:00pm; Sun 11:00am-1:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.4457082,37.7958727]},"properties":{"address":"2822 Union St, San Francisco, CA 94123","displayName":"2822, Union Street, San Francisco, California, 94123, United States of America","countryCode":"US","boundingBox":[37.7958227,37.7959227,-122.4457582,-122.4456582]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e0b82fbe-71c4-410c-b5cd-588ba23169f3', 'd0366028-a3f9-4f61-a898-b5d6cbb1e2fa', 'Capoeira Brasil Richmond', 'Schedule: Wed 8:00-9:30pm; Sat 12:30-2:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.3237358,37.9317796]},"properties":{"address":"4820 Bissell Ave, Richmond CA","displayName":"4820, Bissell Avenue, Richmond, Contra Costa County, California, 94805, United States of America","countryCode":"US","boundingBox":[37.9317296,37.9318296,-122.3237858,-122.3236858]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5a40dce6-a456-40cd-aa42-526b2a927b60', 'd0366028-a3f9-4f61-a898-b5d6cbb1e2fa', 'BORP studio', 'Schedule: Thurs 5:30-6:30 (on hold for December 2016)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2692597,37.85252]},"properties":{"address":"3075 Adeline Street, Berkeley CA","displayName":"Ed Roberts Campus, 3075, Adeline Street, Lorin, Berkeley, Alameda County, California, 94705, United States of America","countryCode":"US","boundingBox":[37.8520533,37.8529213,-122.2698083,-122.268898]}}'::jsonb);

-- Group: Filhos de Bimba - California Bay Area School of Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('94f70406-3a9b-4d6c-a353-9c72fcfad4b4', NOW(), NOW(), 'Filhos de Bimba - California Bay Area School of Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSOR Malandro
Notes: Alameda County, California. Professor Malandro under Mestre Nenel. SOURCE: website 3/11/16', NULL, '[{"type":"website","url":"http://capoeirabayarea.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('34503d2e-948c-49fd-8c5c-8153061a43be', '94f70406-3a9b-4d6c-a353-9c72fcfad4b4', 'Emeryville Recreation Center', 'Schedule: Adults & Teens: Sat 10:00am-12:30pm; Mon, Tues & Thurs 7:00-9:00; CapoKids [ages 5-7]: Sat 9:00-9:50am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2803088,37.833395]},"properties":{"address":"4300 San Pablo Avenue, Emeryville, CA 94608","displayName":"Emeryville Recreation Department, 4300, San Pablo Avenue, Emeryville, Alameda County, California, 94608, United States of America","countryCode":"US","boundingBox":[37.8331804,37.8336094,-122.2804831,-122.2801344]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('ae6b3e26-7ff3-4783-afeb-b81ca8300fe1', '94f70406-3a9b-4d6c-a353-9c72fcfad4b4', 'Bridgecourt Room', 'Schedule: Young Warriors [ages 7-12]: Mon & Wed 4:00-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2834863,37.8310041]},"properties":{"address":"3990 Harlan St, Emeryville, CA 94608","displayName":"Harlan Street, Emeryville, Alameda County, California, 94608, United States of America","countryCode":"US","boundingBox":[37.8303752,37.8316328,-122.2836879,-122.2832851]}}'::jsonb);

-- Group: Capoeira Omulu
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('0a5ca6aa-e7d8-4b7d-a969-6b9b1ecd4476', NOW(), NOW(), 'Capoeira Omulu', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Busca He'' (Anthony Fidel)
Main Contact: - +1.5109212532
Notes: Alameda County, California. Instructor Busca He'' under Mestre Preguica. SOURCE: website 12/10/16', NULL, '[{"type":"website","url":"http://www.oaklandcapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c634f241-bc97-4ddd-af2f-0c3914cb9dfa', '0a5ca6aa-e7d8-4b7d-a969-6b9b1ecd4476', 'Malonga Casquelourd Center for the Arts', 'Schedule: Adults & Teens: Mon, Wed, & Fri 6:00-7:30pm; Youth: Mon, Wed, & Fri 5:00-6:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2657717,37.8028162]},"properties":{"address":"1428 Alice Street, Oakland, CA","displayName":"Malonga Casquelourd Center for the Arts, 1428, Alice Street, Lakeside, Downtown Oakland, Oakland, Alameda County, California, 94612, United States of America","countryCode":"US","boundingBox":[37.8025764,37.8030558,-122.266107,-122.2654364]}}'::jsonb);

-- Group: Capoeira Mestre Bimba Oakland - Associacao de Capoeira Mestre Bimba
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5bf97a8e-fcc0-4316-92fc-9e5c6b445ef8', NOW(), NOW(), 'Capoeira Mestre Bimba Oakland - Associacao de Capoeira Mestre Bimba', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Cacador (Jadson Souza)
Main Contact: - [510] 926-1498
Notes: Alameda County, California. Website offline 11/30/16. Instuctor Cacador under Mestre Bamba [Salvador, Bahia, Brazil]. LINEAGE: Mestre Bimba > Mestre Vermelho 27 > Mestre Bamba (Mestre Bamba teaches in the school that Mestre Bimba first taught in in the Pelourinho.). SOURCE: email website 2/29/12', 'jadson.cacador@gmail.com', '[{"type":"website","url":"http://www.capoeiraoakland.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6ad0c7a9-4c2f-468a-a600-7019a31952fe', '5bf97a8e-fcc0-4316-92fc-9e5c6b445ef8', 'Addis Habana', 'Schedule: Wed 6:00-7:30pm, Sat 9:30-10:45am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.255247,37.8091566]},"properties":{"address":"366 Grand Ave. Oakland CA","displayName":"366, Grand Avenue, Adams Point, Downtown Oakland, Oakland, Alameda County, California, 94606, United States of America","countryCode":"US","boundingBox":[37.8090454,37.8092668,-122.2553408,-122.2551533]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('749c118b-e0cc-424f-ad90-d5d11aadaa12', '5bf97a8e-fcc0-4316-92fc-9e5c6b445ef8', 'The Works Exercise and Dance Studio', 'Schedule: Mon 6:00-7:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.2589989,37.8636877]},"properties":{"address":"2566 Telegraph Ave. Berkeley CA","displayName":"2566, Telegraph Avenue, Southside, Berkeley, Alameda County, California, 94705, United States of America","countryCode":"US","boundingBox":[37.8635619,37.8638129,-122.2591836,-122.2588132]}}'::jsonb);

-- Group: Utah Valley Capoeira - Capuraginga
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a4a0fe74-2f07-4de7-bbbc-681f173d2770', NOW(), NOW(), 'Utah Valley Capoeira - Capuraginga', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADO Espeto (Arles Lara)
Main Contact: - 801.368.8966
Notes: Utah County. Graduado Espeto under Mestre Loka. SOURCE: website 9/22/19', 'utahcapoeira@gmail.com', '[{"type":"website","url":"http://www.utahcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('faaeed2f-45b9-47ff-8099-060a8c5280c3', 'a4a0fe74-2f07-4de7-bbbc-681f173d2770', 'Utah Valley Capoeira', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.6980078,40.3082614]},"properties":{"address":"578 North 100 West, Orem, UT 84057","displayName":"578, North 100 West, Orem Station, Orem, Utah County, Utah, 84057, United States of America","countryCode":"US","boundingBox":[40.3082114,40.3083114,-111.6980578,-111.6979578]}}'::jsonb);

-- Group: Motumbaxé Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('8c781918-82ad-4fa5-b790-a39777127d3e', NOW(), NOW(), 'Motumbaxé Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADO Negrão (Frank Frimpong-Manso)
Notes: Fairfax County, Virginia. Graduado Negrão under Mestre Lampreia [Brooklyn]. SOURCE: website 5/6/19', NULL, '[{"type":"website","url":"http://www.motumbaxecapoeira.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('b59f3441-93de-40fe-925c-bb71fd86534a', '8c781918-82ad-4fa5-b790-a39777127d3e', 'Pies Fitness Yoga Studio', 'Schedule: Thurs 7-8:30pm, Sun 10-11:30am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.1093718,38.8167953]},"properties":{"address":"531 N. Howard St., Alexandria, VA 22304","displayName":"531, North Howard Street, Foxchase, Patrick Henry, Alexandria, Virginia, 22304, United States of America","countryCode":"US","boundingBox":[38.8166826,38.8169081,-77.1094352,-77.1091964]}}'::jsonb);

-- Group: Abadá Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('c7382302-89e8-4f78-ac6a-391a52b16ce3', NOW(), NOW(), 'Abadá Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: PROFESSORA Yara (Yara Cordeiro)
Main Contact: - 301-947-5806
Notes: Fairfax County, Virginia. SOURCE: website 11/30/19', 'info@abadadc.org', '[{"type":"website","url":"http://www.abadadc.org"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('434ef795-c2a6-4d19-be90-960bf2beeb77', 'c7382302-89e8-4f78-ac6a-391a52b16ce3', 'Fairfax Jiu Jitsu', 'Schedule: Children: Wed & Fri 5:30-6:30pm; Adolescents & Adults: Wed & Fri 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.4311513,38.8941543]},"properties":{"address":"Chantilly, VA 20151","displayName":"Chantilly, Fairfax County, Virginia, 20153, United States of America","countryCode":"US","boundingBox":[38.8541543,38.9341543,-77.4711513,-77.3911513]}}'::jsonb);

-- Group: Grupo Resistência Escola de Capoeira do Mestre Panão
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1d9a1740-a994-4d0c-abc6-b79113d2d1c8', NOW(), NOW(), 'Grupo Resistência Escola de Capoeira do Mestre Panão', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: INSTRUTOR Balancão (Roderick J. Davis)
Main Contact: - [804] 301-5681
Notes: Charlottesville, Virginia. SOURCE: website 11/30/19', 'davis.roderick.82@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/capoeirarva/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('9f791ee6-05be-430e-a72d-d09c569c3559', '1d9a1740-a994-4d0c-abc6-b79113d2d1c8', 'IX Art Park', 'Schedule: Adults [13+ years]: Mon 5:30-6:30pm; Kids [4-12 years of age] Mon: 4:30-5:30PM', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-78.4809426,38.0301927]},"properties":{"address":"963 2nd St. SE, Charlottesville, VA 22902","displayName":"2nd Street Southeast, North Downtown, Charlottesville, Virginia, 22902, United States of America","countryCode":"US","boundingBox":[38.0298203,38.0305652,-78.4811033,-78.4807819]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2fcb4c07-e7e9-41a1-82de-c66d56e02c40', '1d9a1740-a994-4d0c-abc6-b79113d2d1c8', 'The Dance Spot', 'Schedule: Adults [13+ years]: Thurs: 5:30-6:30pm; Kids [4-12 years of age]: Thurs: 4:30-5:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-78.4810929,38.0301895]},"properties":{"address":"109 2nd St. SE, Charlottesville, VA 22902","displayName":"Jack Brown’s Beer & Burger Joint, 109, 2nd Street Southeast, North Downtown, Charlottesville, Virginia, 22902, United States of America","countryCode":"US","boundingBox":[38.0301309,38.0302481,-78.4812048,-78.480981]}}'::jsonb);

-- Group: Capoeira Resistencia
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('4714cc24-e66d-4968-ad53-863ac7367607', NOW(), NOW(), 'Capoeira Resistencia', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Panão (Robson Alexandre Pedro)
Main Contact: - [803] 477-0768
Notes: Richmond, Virginia. SOURCE: website 12/1/19', 'capoeiraRVA@gmail.com', '[{"type":"website","url":"https://sites.google.com/site/capoeirarva/home"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('69e8b4e2-321c-485d-a340-d1539b0f6efd', '4714cc24-e66d-4968-ad53-863ac7367607', 'Randolph Community Center', 'Schedule: Adults [13+ years]: Wed & Fri 7:00-8:00pm; Sat 2:00-3:30pm; Kids [4-12 years of age]: Wed & Fri 6:00-6:50pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.4604533,37.5439101]},"properties":{"address":"1415 Grayland Ave, Richmond, VA 23220","displayName":"1415, Grayland Avenue, Randolph, Richmond, Virginia, 23220, United States of America","countryCode":"US","boundingBox":[37.5438601,37.5439601,-77.4605033,-77.4604033]}}'::jsonb);

-- Group: Abba Capoeira Regional
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('5dea117f-feac-4e44-a46a-85b6a1be133d', NOW(), NOW(), 'Abba Capoeira Regional', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Robson De Jesus (Robson De Jesus)
Main Contact: - 678.240.9017
Notes: Atlanta, Georgia. SOURCE website 12/10/17', 'abbacapoeira@gmail.com', '[{"type":"website","url":"http://abbacapoeira.wixsite.com/abbacapoeira"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5f1a81da-6e05-49ef-a0e8-2b092b5f1944', '5dea117f-feac-4e44-a46a-85b6a1be133d', 'Cirque Freaks Building', 'Schedule: Kids: Mon, Wed, & Fri 6:00-7:00pm; Adults: Mon, Wed, & Fri 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-84.2945964,34.0755962]},"properties":{"address":"Alpharetta, GA 30004","displayName":"Alpharetta, Fulton County, Georgia, United States of America","countryCode":"US","boundingBox":[34.0281476,34.1173451,-84.359435,-84.201218]}}'::jsonb);

-- Group: FICA Hilo Hawaiʻi Study Group - International Capoeira Angola Foundation
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('813ca3e5-b396-4742-8338-b9b70a8a7622', NOW(), NOW(), 'FICA Hilo Hawaiʻi Study Group - International Capoeira Angola Foundation', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: - 808-965-6306
Notes: Hawaii County. Under Mestre Silvinho and Mestre Jurandir [Seattle]. Mailing Address: P.O. Box 1864, Pahoa, Hi 96778. SOURCE: website 12/23/17', 'ficahawaii@gmail.com', '[{"type":"website","url":"http://ficahawaii.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('13a87e3b-b063-4f71-9cbc-13c39a133412', '813ca3e5-b396-4742-8338-b9b70a8a7622', 'Pahoa Community Center', 'Schedule: Thurs 4:30-6:00pm
Phone: 808 238 6933', '{"type":"Feature","geometry":{"type":"Point","coordinates":[76.7031901,11.4133126]},"properties":{"address":"(in the old building)","displayName":"old spencers building, Ooty-Coonoor Road, Udhagamandalam, Nilgiris, Tamil Nadu, 643001, India","countryCode":"IN","boundingBox":[11.4131689,11.413428,76.7030332,76.7033433]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3e3208cc-3cbd-47ba-ac47-e634e80bfe52', '813ca3e5-b396-4742-8338-b9b70a8a7622', 'Kalani Honua', 'Schedule: Sat 4:30-6:00pm
Phone: 808 965 6306', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-154.9108645,19.4058122]},"properties":{"address":"12-6860 Kalapana-Kapoho Rd, Pahoa, HI 96778","displayName":"Kalani Retreat Center, 12-6860, Kapoho-Kalapana Road, Sea View Estates, Opihikao, Pahoa, Hawaiʻi County, Hawaii, 96778, United States of America","countryCode":"US","boundingBox":[19.4057622,19.4058622,-154.9109145,-154.9108145]}}'::jsonb);

-- Group: Capoeira del Norte
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('65a71513-fe2b-41c8-ad85-bc7fafaff89a', NOW(), NOW(), 'Capoeira del Norte', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: Papagaio
Notes: Boise, Idaho. Last website update 11/9/11. Last facebook post 2/11/15. Attempting contact 1/22/18. SOURCE: website facebook 2/1/18', 'papagaio.game@gmail.com', '[{"type":"website","url":"http://capoeiradelnorte.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('156e3811-8fda-44d9-b8b2-9acac8ecd9bd', '65a71513-fe2b-41c8-ad85-bc7fafaff89a', 'Bodies In Motion', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-116.189846,43.5684003]},"properties":{"address":"729 W. Diamond St. Boise, ID 83705","displayName":"Bodies in Motion, 729, West Diamond Street, Broadway Place, Southeast Boise, Boise, Ada County, Idaho, 83705, United States of America","countryCode":"US","boundingBox":[43.5683503,43.5684503,-116.189896,-116.189796]}}'::jsonb);

-- Group: Raca em Movimento University of Connecticut
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f1a9c714-f958-4710-a913-b941d52a2f42', NOW(), NOW(), 'Raca em Movimento University of Connecticut', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Efraim Silva
Main Contact: Greg Dillon (Club President) - 860-427-5778, 203-257-5466
Notes: Tolland County, Connecticut (University of Connecticut). Instructor: Professore Fabiano (Fabiano Lucas) under Mestre Efraim Silva. Club President: Greg Dillon. Club Treasurer: Matthew DeLuzio. SOURCE: google 9/11/17', 'GMD005@aol.com, uconncapoeira@gmail.com, uconncapoeira@yahoo.com', '[{"type":"website","url":"http://uconncapoeira.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('3f9fa6c9-3493-42f5-8518-f8fd298a719e', 'f1a9c714-f958-4710-a913-b941d52a2f42', 'University of Connecticut', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-72.2483889,41.8111114]},"properties":{"address":"University of Connecticut, Storrs, CT","displayName":"University of Connecticut, North Eagleville Road, Towers, Storrs, Mansfield, Capitol Planning Region, Connecticut, 06269, United States of America","countryCode":"US","boundingBox":[41.796721,41.8255142,-72.2788641,-72.2384722]}}'::jsonb);

-- Group: Capoeira Barro Vermelho DC
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2741acbc-7d96-495c-94dc-abc1c11e3a53', NOW(), NOW(), 'Capoeira Barro Vermelho DC', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Bomba
Main Contact: Mestre Bomba - +1 [202] 838-3907
Notes: District of Columbia (Washington DC). Mestre Bomba. Mail: 4103 18th St., NW Washington, DC 20011. SOURCE: website 5/19/18', 'bombabahia@gmail.com', '[{"type":"website","url":"http://www.capoeirafitnessdc.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('46f9baa5-68ec-4530-9313-9f75b0c96bba', '2741acbc-7d96-495c-94dc-abc1c11e3a53', 'Church of the Holy City', 'Schedule: Kids: Tues 5:30-6:15pm; Thurs 6:30-7:10pm; Adult Beginners: Tues 6:30-7:15pm; Adult All Levels: Tues 7:30-8:45pm; Thurs 7:15-8:30pm; Music: Thurs 8:30-9:15pm; Adult Fundamentals: Sat 10:00-11:00am; All Levels and Roda: Sat 11:15am 12:45pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0360439,38.9116731]},"properties":{"address":"1611 16th Street NW, Washington, DC","displayName":"Church of the Holy City, 1611, 16th Street Northwest, Dupont Circle, Ward 2, Washington, District of Columbia, 20012, United States of America","countryCode":"US","boundingBox":[38.9115564,38.9117995,-77.0362503,-77.0358482]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('93aac540-88ff-4f53-a9b5-cff9d5c32de3', '2741acbc-7d96-495c-94dc-abc1c11e3a53', 'Dupont Circle Park', 'Schedule: (Adult Saturday classes are move here during good weather in the summer)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0427259,38.9109436]},"properties":{"address":"Dupont Circle, Washington, DC 20036","displayName":"Dupont Circle, 1526, New Hampshire Avenue Northwest, Dupont Circle, Ward 2, Washington, District of Columbia, 20036, United States of America","countryCode":"US","boundingBox":[38.9108936,38.9109936,-77.0427759,-77.0426759]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('c563cdf5-56f4-4af7-b61b-ac0268eca9d7', '2741acbc-7d96-495c-94dc-abc1c11e3a53', 'BloomBars', 'Schedule: Kids: Sat 8:30-9:15am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0280991,38.9302021]},"properties":{"address":"3222 11th St NW, Washington, DC 20001","displayName":"BloomBars, 3222, 11th Street Northwest, Ward 1, Washington, District of Columbia, 20010, United States of America","countryCode":"US","boundingBox":[38.9301775,38.9302321,-77.0281829,-77.0280218]}}'::jsonb);

-- Group: Capoeira Malês DC
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f1ff7b5b-d200-49f6-ae93-9339283c5cf5', NOW(), NOW(), 'Capoeira Malês DC', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Curisco
Main Contact: Instructor: Gaviao
Notes: District of Columbia (Washington DC). Instructor: Gaviao under the guidance of Mestre Curisco [Seattle]. SOURCE: email 9/22/10 website 2/25/11', NULL, '[{"type":"website","url":"http://www.capoeiradc.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cdcfe3f0-efca-4ab2-a2a6-37080d70059b', 'f1ff7b5b-d200-49f6-ae93-9339283c5cf5', 'The Capoeira Spot', 'Schedule: (Full schedule of classes. See website)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-76.9757441,38.9295666]},"properties":{"address":"2008 Rhode Island Ave NE, Washington, DC 20018","displayName":"2008, Rhode Island Avenue Northeast, Ward 5, Washington, District of Columbia, 20018, United States of America","countryCode":"US","boundingBox":[38.9294877,38.9296576,-76.9758377,-76.9756602]}}'::jsonb);

-- Group: International Capoeira Angola Federation DC
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('843d8bfa-57f6-4190-93bc-66d965d11df9', NOW(), NOW(), 'International Capoeira Angola Federation DC', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: District of Columbia (Washington DC). SOURCE: website 5/15/18', NULL, '[{"type":"website","url":"https://ficadc.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2e34cfe1-032c-458d-bc64-c3e1457ab866', '843d8bfa-57f6-4190-93bc-66d965d11df9', 'Emergence Community Arts Collective', 'Schedule: (Full schedule of classes. See website)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-77.0237431,38.9243714]},"properties":{"address":"733 Euclid St. NW Washington DC.","displayName":"733, Euclid Street Northwest, Columbia Heights, Ward 1, Washington, District of Columbia, 20001, United States of America","countryCode":"US","boundingBox":[38.9242103,38.9244569,-77.0238223,-77.0236526]}}'::jsonb);

-- Group: Capoeira Cordao de Ouro Perth
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('f18d0356-d4cb-42b1-96bb-3efed8eea425', NOW(), NOW(), 'Capoeira Cordao de Ouro Perth', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: CONTRA-MESTRE Kuata
Main Contact: Ourico (Lee Coumbe) - 0408924490
Notes: Perth, Western Australia, Australia. Ourico (Lee Coumbe) under Contra Mestre Kuata [Sao Paulo]. SOURCE: website 12/16/16', NULL, '[{"type":"website","url":"http://www.capoeiracdoperth.com.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6764ca89-83b7-4bd6-963c-328abc7e3fe7', 'f18d0356-d4cb-42b1-96bb-3efed8eea425', 'Total Worx Health and Fitness Club', 'Schedule: Tues & Thurs 7:30-9:00pm; Sat 9:00-10:30am', '{"type":"Feature","geometry":{"type":"Point","coordinates":[115.8170449,-31.90431]},"properties":{"address":"7A 44 Hutton St Osborne Park WA 6017","displayName":"Hutton Street, Osborne Park, City of Stirling, Western Australia, 6017, Australia","countryCode":"AU","boundingBox":[-31.904382,-31.9042627,115.816935,115.817165]}}'::jsonb);

-- Group: Bantus Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('20fb2a0b-38e0-4def-8563-37443e48a28e', NOW(), NOW(), 'Bantus Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Pintor
Main Contact: Professor Grao (Fabiano Franca), Instructor Risadinha (Beth), Committee President Voodoo (Chris) - 0414 076 655, 0403 539 187, 0409 890 844
Notes: Perth, Western Australia, Australia. Professor Grao (Fabiano Franca), Instructor Risadinha (Beth), Committee President Voodoo (Chris) under Mestre Pintor [Belo Horizonte]. SOURCE: website 12/15/16', NULL, '[{"type":"website","url":"http://bantus.asn.au/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1801f5c5-ebac-4ac2-83f5-fef112a5994a', '20fb2a0b-38e0-4def-8563-37443e48a28e', 'Loftus Community Centre', 'Schedule: 3-5 year olds: Sat 9:30-10:15am; 6-12 year olds Sat 10:00-10:45am; Adults: Sat 9:30-10:15am Wed 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[115.8464939,-31.9355149]},"properties":{"address":"2/99 Loftus St, Leederville, Western Australia","displayName":"Loftus Street, Leederville, City of Vincent, Western Australia, 6007, Australia","countryCode":"AU","boundingBox":[-31.9361879,-31.9348661,115.8463018,115.8465506]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('bd2a489b-633d-4716-8a2f-2c90d6c83e91', '20fb2a0b-38e0-4def-8563-37443e48a28e', 'Asian Association', 'Schedule: Capoeira Angola: Thurs 6:30-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[115.8638154,-31.9499848]},"properties":{"address":"275 Stirling St Perth","displayName":"Stirling Street, Perth, City of Perth, Western Australia, 6000, Australia","countryCode":"AU","boundingBox":[-31.9508449,-31.9491276,115.8632652,115.8643703]}}'::jsonb);

-- Group: Centro Capoeira Angola OuroVerde Flagstaff
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('732361f5-02cf-4527-919f-ce85d333798f', NOW(), NOW(), 'Centro Capoeira Angola OuroVerde Flagstaff', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Professor Avi (Avi Henn) - [928] 525-4503
Notes: Flagstaff, Arizona. Professor Avi (Avi Henn). SOURCE: website facebook 12/14/16', 'capoeiraflag@gmail.com', '[{"type":"website","url":"http://capoeiraflagstaff.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('02004631-b8a8-490d-aaf5-124e1a442564', '732361f5-02cf-4527-919f-ce85d333798f', 'Center for Indigenous Music and Culture', 'Schedule: General: Mon & Thurs 6:30-8:30; Beginners: Mon 6:00-7:00pm; Kids: Sat 10:30-11:15am; Youth: 11:30am-1:30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.6495084,35.1942993]},"properties":{"address":"213 South San Francisco St. Flagstaff, AZ 86001","displayName":"213, South San Francisco Street, Flagstaff Normal Addition, Flagstaff, Coconino County, Arizona, 86001, United States of America","countryCode":"US","boundingBox":[35.1942493,35.1943493,-111.6495584,-111.6494584]}}'::jsonb);

-- Group: Axé Capoeira Arizona
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('ddce3275-4604-441b-89d8-c89f7bf1f8df', NOW(), NOW(), 'Axé Capoeira Arizona', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Barrão
Main Contact: Contra Mestre Camara (Jay Spain) - [602] 614-7367
Notes: Phoenix/Tempe, Arizona. Contra Mestre Camara (Jay Spain) under Mestre Barrão [Vancouver]. SOURCE: website 6/18/18', 'info@axecapoeira-az.com', '[{"type":"website","url":"http://www.axecapoeira-az.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('15a80bac-4277-4439-9232-839f643a31da', 'ddce3275-4604-441b-89d8-c89f7bf1f8df', 'Axé Capoeira Arizona Academy', 'Schedule: (Full schedule of classes for adults and kids)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.940016,33.4255117]},"properties":{"address":"Tempe, AZ 85281","displayName":"Tempe, Maricopa County, Arizona, United States of America","countryCode":"US","boundingBox":[33.31986,33.4639799,-111.9784718,-111.8773587]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6d3f019f-201d-46bb-afc1-468c4faa512c', 'ddce3275-4604-441b-89d8-c89f7bf1f8df', 'Arizona State University', NULL, '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.9331631,33.4213174]},"properties":{"address":"Arizona State University","displayName":"Arizona State University, 1151, South Forest Avenue, Tempe Junction, Tempe, Maricopa County, Arizona, 85281, United States of America","countryCode":"US","boundingBox":[33.4102062,33.4329786,-111.9411651,-111.9092447]}}'::jsonb);

-- Group: Grupo Topazio Arizona
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('d9479de2-8c04-420a-9d1c-f4eebb123090', NOW(), NOW(), 'Grupo Topazio Arizona', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instrutor Kino - 480-241-8365
Notes: Chandler, Arizona. Instrutor Kino. SOURCE: website 8/3/19', 'topazioaz@gmail.com', '[{"type":"website","url":"http://topazioaz.wixsite.com/topazioaz"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('6dd42196-33a2-423e-b060-970f9cf2376a', 'd9479de2-8c04-420a-9d1c-f4eebb123090', 'Arizona Wado Karate & Martial Arts Center', 'Schedule: Mon, Wed & Fri 8.00-9.30pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-111.8591657,33.3348818]},"properties":{"address":"1992 N. Alma School Rd, Chandler, AZ 85224","displayName":"1992, North Alma School Road, Chandler, Maricopa County, Arizona, 85224, United States of America","countryCode":"US","boundingBox":[33.3348318,33.3349318,-111.8592157,-111.8591157]}}'::jsonb);

-- Batch: batch-07.json (11 groups)

-- Group: Capoeira Brasil Arizona
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('97909cbe-dd6e-4e29-bfee-e88647c27ff6', NOW(), NOW(), 'Capoeira Brasil Arizona', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Professora Borboleta (Angelique Starks) and Instrutor Lagarta de Goiaba Branca (Matthew Underwood) - [480]510-4741
Notes: Phoenix, Arizona. Professora Borboleta (Angelique Starks) and Instrutor Lagarta de Goiaba Branca (Matthew Underwood). SOURCE: website 6/12/18', 'info@capoeiraarizona.com', '[{"type":"website","url":"http://capoeiraarizona.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('cdc9f781-c135-4585-aa44-4ea1e7e84b2e', '97909cbe-dd6e-4e29-bfee-e88647c27ff6', 'Capoeira Brasil Arizona', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-112.0833679,33.4952155]},"properties":{"address":"4113 N 7th Ave, Phoenix, AZ 85013","displayName":"4113, North 7th Avenue, Melrose District, Encanto, Phoenix, Maricopa County, Arizona, 85013, United States of America","countryCode":"US","boundingBox":[33.4951655,33.4952655,-112.0834179,-112.0833179]}}'::jsonb);

-- Group: Omulu Capoeira Guanabara - Madison
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bb2c0d9d-f319-4aa3-bafc-6ddb7fe403db', NOW(), NOW(), 'Omulu Capoeira Guanabara - Madison', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MONITORA Guerreira (Kelly Schumann)
Main Contact: Monitora Guerreira - [608] 492-1919, 608-469-5843
Notes: Madison, Wisconsin. Monitora Guerreira (Kelly Schumann) under Mestre Preguiça [Los Angeles]. UW Omulu Capoeira Club. SOURCE: website 1/4/20', 'madcapoeira@gmail.com, Kelly_schumann@hotmail.com', '[{"type":"website","url":"http://www.madisoncapoeira.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('5c361a6e-f6b7-4793-a102-9f6601d7b7a3', 'bb2c0d9d-f319-4aa3-bafc-6ddb7fe403db', 'Kanopy Dance', 'Schedule: Mixed: Mon, Wed, & Fri 7:00pm; Kids: Sat 12:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-89.3906996,43.0746911]},"properties":{"address":"341 State St . Madison, WI 53703","displayName":"341, State Street, Mifflin West, Downtown, Madison, Dane County, Wisconsin, 53703, United States of America","countryCode":"US","boundingBox":[43.0746411,43.0747411,-89.3907496,-89.3906496]}}'::jsonb);

-- Group: Afro-Brazilian Capoeira Association
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('597cb761-12dd-4a1b-9933-7158880a77a8', NOW(), NOW(), 'Afro-Brazilian Capoeira Association', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Yoji Senna
Main Contact: Mestre Yoji Senna - 612-298-3402
Notes: Minneapolis-St.Paul, Minnesota. Mestre Yoji Senna. SOURCE: website 10/4/18', 'abcapoeira@gmail.com', '[{"type":"website","url":"http://www.abcapoeira.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('1a36da69-9d74-4d76-8123-4d7834044258', '597cb761-12dd-4a1b-9933-7158880a77a8', 'South High School', 'Schedule: Tues & Thurs 7:00-9:00pm; Roda Sat 2:00pm (intermittent schedule, contact for dates)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-93.243599,44.9456577]},"properties":{"address":"3131 S 19th Ave, Minneapolis, MN 55407","displayName":"South High School, 3131, 19th Avenue South, Standish, Corcoran, Powderhorn, Minneapolis, Hennepin County, Minnesota, 55407, United States of America","countryCode":"US","boundingBox":[44.9448404,44.9475235,-93.2448078,-93.2424024]}}'::jsonb);

-- Group: Capoeira Floração
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('a1d1b762-a73f-4f93-927a-8eae496b17e8', NOW(), NOW(), 'Capoeira Floração', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instrutor Coruja (James Lynch) and Monitora Vespa (Jenny Johnson-Blanchard) - 612-326-0809
Notes: Minneapolis, Minnesota. Instrutor Coruja (James Lynch) and Monitora Vespa (Jenny Johnson-Blanchard). SOURCE: website 2/18/18', 'minnesotacap@gmail.com', '[{"type":"website","url":"http://www.mncapoeira.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('f96178af-f4a5-4da0-a4f7-fe74b3c2bfb9', 'a1d1b762-a73f-4f93-927a-8eae496b17e8', 'Minnesota Capoeira Academy', 'Schedule: (full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-93.2868223,44.8859142]},"properties":{"address":"6463 Lyndale Avenue South, Richfield, MN 55423","displayName":"6463, Lyndale Avenue South, Richfield, Hennepin County, Minnesota, 55423, United States of America","countryCode":"US","boundingBox":[44.8858642,44.8859642,-93.2868723,-93.2867723]}}'::jsonb);

-- Group: Axe Capoeira Kansas City
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b93e7c13-cf11-48ee-b9a0-994317815175', NOW(), NOW(), 'Axe Capoeira Kansas City', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: GRADUADA Arara (Sonia Duncombe)
Main Contact: Graduada Arara (Sonia Duncombe) - [816] 442-9907
Notes: Kansas City, Missouri. Graduada Arara (Sonia Duncombe). SOURCE: website 3/19/18', 'axecapoeirakc1@gmail.com', '[{"type":"website","url":"http://www.capoeirakc.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('005e1c51-83f5-43f5-a50e-af6e990c7237', 'b93e7c13-cf11-48ee-b9a0-994317815175', 'Axe Capoeira Kansas City', 'Schedule: (Full schedule of classes)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-94.5749955,39.010136]},"properties":{"address":"6430 Troost Ave, Kansas City, MO 64131","displayName":"6430, Troost Avenue, Oak Meyer Gardens, Kansas City, Jackson County, Missouri, 64131, United States of America","countryCode":"US","boundingBox":[39.0100595,39.0102125,-94.5751173,-94.5748737]}}'::jsonb);

-- Group: Capoeira Luanda of St. Louis
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('b2201316-59ea-4203-b927-3973752fb79e', NOW(), NOW(), 'Capoeira Luanda of St. Louis', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Instructor Beija-flor (Keith Wilson) - [618] 530-3132
Notes: Saint Louis, Missouri. Instructor Beija-flor (Keith Wilson) Founder & Executive Director. SOURCE: website 4/19/17', 'beijaflor@capoeirastl.org', '[{"type":"website","url":"http://www.capoeirastl.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('192bb38c-9e4f-4944-87f7-7022ec8a6b71', 'b2201316-59ea-4203-b927-3973752fb79e', 'University Tower', 'Schedule: Kids: Mon & Wed 7:30-8:30pm; Adults: Mon & Wed 7:30-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.3443545,38.6362618]},"properties":{"address":"1034 S Brentwood Blvd, St. Louis, MO 63117","displayName":"Passport Health Richmond Heights Travel Clinic, 1034, South Brentwood Boulevard, Richmond Heights, Saint Louis County, Missouri, 63117, United States of America","countryCode":"US","boundingBox":[38.6362118,38.6363118,-90.3444045,-90.3443045]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('e0e2c4c1-56ad-4136-b412-00c83b962e88', 'b2201316-59ea-4203-b927-3973752fb79e', 'Be Well Now', 'Schedule: Tues & Thurs 8:00-9:30pm
Phone: [618] 225-9246', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.1739251,38.9212312]},"properties":{"address":"221 Center Drive, Alton, IL 62002","displayName":"221, East Center Drive, Alton Square Mall, Alton, Madison County, Illinois, 62002, United States of America","countryCode":"US","boundingBox":[38.9211812,38.9212812,-90.1739751,-90.1738751]}}'::jsonb);

-- Group: Centro Esportivo de Capoeira Angola [CECA] St Louis, MO
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('1d08fd26-c181-4294-8ed6-b5276fca8ec7', NOW(), NOW(), 'Centro Esportivo de Capoeira Angola [CECA] St Louis, MO', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Notes: Saint Louis, Missouri. SOURCE: website 3/2/18', NULL, '[{"type":"website","url":"https://capoeiraangolasaintlouis.wordpress.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('2ac5ce72-ae58-4a8f-b29b-a0fe9b3c1dd6', '1d08fd26-c181-4294-8ed6-b5276fca8ec7', 'Yeyo Arts Collective', 'Schedule: Wed 7:00pm-8:30pm; Sat: 4:00-6:00pm (no classes on fourth Wed each month)', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-90.2242087,38.6008258]},"properties":{"address":"2907 South Jefferson Ave, Saint Louis, MO 63118","displayName":"2907-2909, South Jefferson Avenue, Fox Park, Benton Park West, Saint Louis, Missouri, 63118, United States of America","countryCode":"US","boundingBox":[38.6007377,38.6009086,-90.2243251,-90.2240998]}}'::jsonb);

-- Group: Centro Esportivo de Capoeira Angola Asheville
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bac4d6bb-5103-485b-b268-cdcdb1f58a2c', NOW(), NOW(), 'Centro Esportivo de Capoeira Angola Asheville', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Stefan and Jashwant - 828-712-4013
Notes: Asheville, North Carolina. Stefan and Jashwant under Mestre Pe de Chumbo [Germany]. SOURCE: website 5/30/19', NULL, '[{"type":"website","url":"http://www.capoeiraasheville.org/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('88557dd0-362e-4ddd-b6c2-379d34022cd6', 'bac4d6bb-5103-485b-b268-cdcdb1f58a2c', 'Burton Street Community Center', 'Schedule: Wed 6:00-8:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.5844158,35.5830269]},"properties":{"address":"134 Burton St, Asheville, NC 28806","displayName":"Burton Street Community Center, 134, Burton Street, Hazel Green, West Asheville, Asheville, Buncombe County, North Carolina, 28806, United States of America","countryCode":"US","boundingBox":[35.5828282,35.583209,-82.5846116,-82.5842062]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('de569bb6-b391-4968-a670-12fdc65aeee9', 'bac4d6bb-5103-485b-b268-cdcdb1f58a2c', 'Montford Community Center', 'Schedule: Sat 10:00am-12:00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.5651653,35.6003947]},"properties":{"address":"34 Pearson Drive, Asheville, NC, 28801","displayName":"Tempie Avery Montford Community Center, 34, Pearson Drive, Montford Hills, Asheville, Buncombe County, North Carolina, 28801, United States of America","countryCode":"US","boundingBox":[35.6002032,35.6005681,-82.565394,-82.5649226]}}'::jsonb);
INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('752ed064-ebf4-4d15-a33d-0b9ed7501da7', 'bac4d6bb-5103-485b-b268-cdcdb1f58a2c', 'Broad River Community Center', 'Schedule: Senior focus: Tues & Thurs 6:30-8:00', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-82.257718,35.5100929]},"properties":{"address":"44 Broad River VFD Road, Black Mountain, NC","displayName":"The Broad River Volunteer Fire & Rescue Department, 44, Broad River VFD Road, Black Mountain, Buncombe County, North Carolina, 28711, United States of America","countryCode":"US","boundingBox":[35.5100429,35.5101429,-82.257768,-82.257668]}}'::jsonb);

-- Group: Cordão de Ouro Carolinas
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('bd44370f-15bb-4903-b2bb-1fbf273f813b', NOW(), NOW(), 'Cordão de Ouro Carolinas', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRE Neguinho
Notes: Charlotte, North Carolina. Mestre Neguinho. SOURCE: website 6/6/19', NULL, '[{"type":"website","url":"https://neguinhocdo.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('a9bd4ba1-dfd6-4765-9033-ad5ec1b19c3b', 'bd44370f-15bb-4903-b2bb-1fbf273f813b', 'Budokon Academy Charlotte', 'Schedule: Adults: Mon 8:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-80.8697823,35.200317]},"properties":{"address":"2935 Griffith Street, Charlotte, NC","displayName":"2935, Griffith Street, Silos, Sedgefield, Charlotte, Mecklenburg County, North Carolina, 28203, United States of America","countryCode":"US","boundingBox":[35.200267,35.200367,-80.8698323,-80.8697323]}}'::jsonb);

-- Group: Upstate Capoeira
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('93aaee8f-3bfd-444d-953e-4a441f9ff790', NOW(), NOW(), 'Upstate Capoeira', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Main Contact: Contra Mestre Neguinho (Elias Martins) and Professora Risadinha (Melinda Erickson-Martins)
Notes: Gastonia, North Carolina. Contra Mestre Neguinho (Elias Martins) and Professora Risadinha (Melinda Erickson-Martins). SOURCE: website 6/13/18', NULL, '[{"type":"website","url":"https://projectbacana.com"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('35243e3b-bed5-4e76-bc3c-505bba1dd98c', '93aaee8f-3bfd-444d-953e-4a441f9ff790', 'Equilíbrio - Movement Culture Center', 'Schedule: Kids'' Capoeira: Mon & Wed 7:30-8:15pm; Adults'' Capoeira: Mon & Wed 8:00-9:00pm', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-81.1889188,35.2625292]},"properties":{"address":"182 W. Main Avenue, Gastonia, NC 28052","displayName":"182, West Main Avenue, FUSE, Gastonia, Gaston County, North Carolina, 28052, United States of America","countryCode":"US","boundingBox":[35.2624792,35.2625792,-81.1889688,-81.1888688]}}'::jsonb);

-- Group: Capoeira Oregon - CapuraGinga - Beaverton
INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('2417754e-e662-4ebb-acf0-4cfb1b3f7e43', NOW(), NOW(), 'Capoeira Oregon - CapuraGinga - Beaverton', 'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.

Leader: MESTRANDO Mago
Notes: Beaverton, Oregon. Mestrando Mago under the guidance of Mestre Loka. Classes for Adults Children, and Families Contact for Details. SOURCE: website 6/25/19', NULL, '[{"type":"website","url":"http://bodyofbrazil.com/"}]'::jsonb, NULL, NULL, NULL);

INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('4bc73fce-3ea5-4d40-8253-d566b1102930', '2417754e-e662-4ebb-acf0-4cfb1b3f7e43', 'Body of Brazil', 'Schedule: Kids Beginning: Wed 5:05pm
Phone: 03.530.8176', '{"type":"Feature","geometry":{"type":"Point","coordinates":[-122.7802165,45.4868334]},"properties":{"address":"9955 SW Beaverton Hillsdale Hwy, Beaverton, OR 97005","displayName":"Studio 10 Karaoke Box, 9955, Southwest Beaverton Hillsdale Highway, Raleigh West, Denney Whitford/Raleigh West, Beaverton, Washington County, Oregon, 97005, United States of America","countryCode":"US","boundingBox":[45.4867834,45.4868834,-122.7802665,-122.7801665]}}'::jsonb);

COMMIT;

-- Summary: 253 groups, 396 locations imported
-- Skipped: 0 groups