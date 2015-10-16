CREATE TABLE days_of_week
(
  id int PRIMARY KEY,
  name varchar(10) NOT NULL UNIQUE
);

CREATE TABLE bars
(
  id int PRIMARY KEY,
  name VARCHAR(20) UNIQUE,
  latitude DECIMAL(9,7),
  longitude DECIMAL(9,7)
);

CREATE TABLE offers
(
  id int PRIMARY KEY,
  bar_id int NOT NULL,
  day_of_week_id int NOT NULL,
  starts_at int NOT NULL,
  ends_at int NOT NULL,
  tags VARCHAR(50),
  type VARCHAR(15) NOT NULL
);

CREATE TABLE prices
(
  id int PRIMARY KEY,
  type VARCHAR(15) NOT NULL,
  price int NOT NULL
);

-- the days of the week
INSERT INTO days_of_week (id, name) VALUES (1, 'monday');
INSERT INTO days_of_week (id, name) VALUES (2, 'tueday');
INSERT INTO days_of_week (id, name) VALUES (3, 'wednesday');
INSERT INTO days_of_week (id, name) VALUES (4, 'thursday');
INSERT INTO days_of_week (id, name) VALUES (5, 'friday');
INSERT INTO days_of_week (id, name) VALUES (6, 'saturday');
INSERT INTO days_of_week (id, name) VALUES (7, 'sunday');


-- all of the bars
INSERT INTO bars (id, name, latitude, longitude) VALUES (1, 'Monkey Bar', 45.9190977, 6.8657143);
INSERT INTO bars (id, name, latitude, longitude) VALUES (2, 'Munster', 45.9189752, 6.8653393);
INSERT INTO bars (id, name, latitude, longitude) VALUES (3, 'Bard Up', 45.924706, 6.870534);
INSERT INTO bars (id, name, latitude, longitude) VALUES (4, 'Boogie Woogie', 45.924225, 6.870329);
INSERT INTO bars (id, name, latitude, longitude) VALUES (5, 'MBC', 45.9274404, 6.873646);
INSERT INTO bars (id, name, latitude, longitude) VALUES (6, 'Chambre Neuf', 45.9226919, 6.8705356);
INSERT INTO bars (id, name, latitude, longitude) VALUES (7, 'Poco Loco', 45.9225167, 6.8667908);


-- offers by day
--   monday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (1,1,1,720,900,'burger,drink,fries','meal_deal');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (2,1,1,960,1080,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (3,2,1,975,1140,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (4,5,1,990,1290,'bird','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (5,1,1,1080,1200,'burger','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (6,6,1,1200,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (7,1,1,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (8,2,1,1260,1320,'cocktails','half_price');

-- tuesday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (9,1,2,960,1080,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (10,2,2,975,1140,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (29,3,2,1140,1410,'shots,tequila','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (11,6,2,1200,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (12,1,2,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (13,2,2,1260,1320,'cocktails','half_price');

-- wednesday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (14,1,3,960,1080,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (15,2,3,975,1140,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (16,6,3,1200,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (17,1,3,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (18,2,3,1260,1320,'cocktails','half_price');

-- thursday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (19,1,4,960,1080,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (20,2,4,975,1140,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (29,3,6,1140,1410,'shots,genepi','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (21,6,4,1200,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (22,1,4,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (23,2,4,1260,1320,'cocktails','half_price');

-- friday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (24,1,5,960,1080,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (25,2,5,975,1140,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (26,6,5,1200,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (27,1,5,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (28,2,5,1260,1320,'cocktails','half_price');

-- saturday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (29,3,6,780,900,'beer,football,jugs','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (29,3,6,960,1080,'beer,football,jugs','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (29,3,6,1095,1215,'beer,football,jugs','two_for_one');

--sunday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (29,3,6,900,1020,'beer,football,jugs','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (29,3,6,1020,1140,'beer,football,jugs','two_for_one');

