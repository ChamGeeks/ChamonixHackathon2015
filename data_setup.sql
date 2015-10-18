DROP TABLE days_of_week;
DROP TABLE bars;
DROP TABLE offers;
DROP TABLE items;

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
  longitude DECIMAL(9,7),
  image_url VARCHAR(255)
);

CREATE TABLE offers
(
  id int PRIMARY KEY,
  bar_id int NOT NULL,
  day_of_week_id int NOT NULL,
  starts_at int NOT NULL,
  ends_at int NOT NULL,
  tags VARCHAR(50),
  type VARCHAR(15) NOT NULL,
  extra_info VARCHAR(255)
);

CREATE TABLE items
(
  id int PRIMARY KEY,
  bar_id int NOT NULL,
  type VARCHAR(15) NOT NULL,
  price int NOT NULL
);

-- the days of the week
INSERT INTO days_of_week (id, name) VALUES (1, 'monday');
INSERT INTO days_of_week (id, name) VALUES (2, 'tuesday');
INSERT INTO days_of_week (id, name) VALUES (3, 'wednesday');
INSERT INTO days_of_week (id, name) VALUES (4, 'thursday');
INSERT INTO days_of_week (id, name) VALUES (5, 'friday');
INSERT INTO days_of_week (id, name) VALUES (6, 'saturday');
INSERT INTO days_of_week (id, name) VALUES (7, 'sunday');


-- all of the bars
INSERT INTO bars (id, name, latitude, longitude, image_url) VALUES (1, 'Monkey Bar', 45.9190977, 6.8657143, 'http://media-cdn.tripadvisor.com/media/photo-s/02/9f/05/48/spring-terrace.jpg');
INSERT INTO bars (id, name, latitude, longitude, image_url) VALUES (2, 'Munster', 45.9189752, 6.8653393, 'http://www.irishpubsglobal.com/wp-content/uploads/2015/10/Munster-Bar5.jpeg');
INSERT INTO bars (id, name, latitude, longitude, image_url) VALUES (3, 'Bard Up', 45.924706, 6.870534, 'http://static1.chamonet.com/image_uploader/photos/large/bar-d-up-snow-sign-1_7700.jpg');
INSERT INTO bars (id, name, latitude, longitude, image_url) VALUES (4, 'Boogie Woogie', 45.924225, 6.870329, 'https://fbcdn-photos-c-a.akamaihd.net/hphotos-ak-xfp1/v/t1.0-0/s480x480/11027435_450267481803017_1587677382271231108_n.jpg?oh=cb83cbf3f5ef78d71dd20c3d7db8bb7a&oe=56A01D74&__gda__=1449340228_a64e50c83f141a8b256de4f3b6e958da');
INSERT INTO bars (id, name, latitude, longitude, image_url) VALUES (5, 'MBC', 45.9274404, 6.873646, 'http://images.chamonix.net/images/originals/14775-original/image-chamonix.jpg');
INSERT INTO bars (id, name, latitude, longitude, image_url) VALUES (6, 'Chambre Neuf', 45.9226919, 6.8705356, 'http://www.peaktransfer.com/blog/wp-content/uploads/2014/02/chamonix-nightlife.jpg');
INSERT INTO bars (id, name, latitude, longitude, image_url) VALUES (7, 'Poco Loco', 45.9225167, 6.8667908, 'http://media-cdn.tripadvisor.com/media/photo-s/08/22/c6/f8/photo1jpg.jpg');


-- offers by day
--   monday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type, extra_info) VALUES (1,1,1,720,900,'burger,drink,fries','meal_deal', 'Burger, fries and drink for 12€');
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
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type, extra_info) VALUES (11,3,2,1140,1410,'shots,tequila','half_price', 'Tequila Tuesdays');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (12,6,2,1200,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (13,1,2,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (14,2,2,1260,1320,'cocktails','half_price');

-- wednesday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (15,1,3,960,1080,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (16,2,3,975,1140,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (17,6,3,1200,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (18,1,3,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (19,2,3,1260,1320,'cocktails','half_price');

-- thursday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (20,1,4,960,1080,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (21,2,4,975,1140,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type, extra_info) VALUES (22,3,6,1140,1410,'shots,genepi','half_price', 'Genepi Jeudi');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (23,6,4,1200,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (24,1,4,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (25,2,4,1260,1320,'cocktails','half_price');

-- friday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (26,1,5,960,1080,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type, extra_info) VALUES (27,3,5,960,1020,'beer','discount', 'Power Hour 3€ pints');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (28,2,5,975,1140,'beer','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (29,3,5,1020,1140,'cocktails','two_for_one');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (30,6,5,1200,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (31,1,5,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (32,2,5,1260,1320,'cocktails','half_price');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type) VALUES (33,3,5,1260,1320,'cocktails','two_for_one');

-- saturday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type, extra_info) VALUES (34,3,6,780,900,'beer,football,jugs','discount', '10€ beer jugs during Premier League matches');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type, extra_info) VALUES (35,3,6,960,1080,'beer,football,jugs','discount', '10€ beer jugs during Premier League matches');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type, extra_info) VALUES (36,3,6,1095,1215,'beer,football,jugs','discount', '10€ beer jugs during Premier League matches');

--sunday
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type, extra_info) VALUES (37,3,7,900,1020,'beer,football,jugs','discount', '10€ beer jugs during Premier League matches');
INSERT INTO offers (id, bar_id, day_of_week_id, starts_at, ends_at, tags, type, extra_info) VALUES (38,3,7,1020,1140,'beer,football,jugs','discount', '10€ beer jugs during Premier League matches');


-- Items sticked by bars
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (1, 1, 'beer', 550);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (2, 2, 'beer', 450);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (3, 3, 'beer', 550);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (4, 4, 'beer', 450);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (5, 5, 'beer', 600);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (6, 6, 'beer', 550);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (7, 7, 'beer', 550);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (8, 1, 'burger', 850);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (12, 5, 'burger', 1000);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (13, 6, 'burger', 1500);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (14, 7, 'burger', 600);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (15, 1, 'cocktail', 650);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (16, 2, 'cocktail', 550);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (17, 3, 'cocktail', 600);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (18, 4, 'cocktail', 550);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (19, 5, 'cocktail', 650);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (20, 6, 'cocktail', 650);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (21, 5, 'wings', 600);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (22, 1, 'shot', 300);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (23, 2, 'shot', 200);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (24, 3, 'shot', 250);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (25, 4, 'shot', 100);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (26, 5, 'shot', 300);
INSERT INTO ITEMS (id, bar_id, type, price) VALUES (27, 6, 'shot', 250);
