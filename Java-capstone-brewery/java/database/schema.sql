BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS breweries;
DROP TABLE IF EXISTS reviews;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE beers (
        name varchar(50) NOT NULL,     
        beerType varchar(50) NOT NULL,
        abv varchar(10) NOT NULL,
        brewerName varchar(100),
        description varchar(500) NOT NULL,
        image_URL TEXT
);

CREATE TABLE breweries (
        name varchar(50),
        city varchar(50),
        state varchar(50),
        stateAbbr varchar(10),
        brewer varchar(100)
);

CREATE TABLE reviews (
        beerName varchar(50) NOT NULL,
        date varchar(20),
        review varchar(500),
        rating varchar(10)
        );
        
    

-- ADD THREE BREWERIES THAT API PULLED
INSERT INTO breweries (name, city, state, stateAbbr, brewer)
VALUES ('Great Lakes Brewing Co', 'Cleveland', 'Ohio', 'OH', 'brewer');

INSERT INTO breweries (name, city, state, stateAbbr, brewer)
VALUES ('McFate''s Tap + Barrel', 'Scottsdale', 'Arizona', 'AZ', 'brewer'); 

INSERT INTO breweries (name, city, state, stateAbbr, brewer)
VALUES ('SunRift Beer Company', 'Kalispell', 'Montana', 'MT', 'brewer');


-- ADD ALL BEERS ON BEER LIST FOR GREAT LAKES BREWING CO.
INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Dortmunder Gold Lager', 'Lager', 'ABV: 5.8%', 'Great Lakes Brewing Co', 'A humble hometown hero, draped in a people-pleasing blend of smooth malt and crisp hop flavors.', 'https://www.greatlakesbrewing.com/sites/default/files/dort-beer-page-2.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Eliot Ness Amber Lager', 'Lager', 'ABV: 6.1%', 'Great Lakes Brewing Co', 'Almost untouchably smooth--armed with lightly toasted malts and noble hops.', 'https://www.greatlakesbrewing.com/sites/default/files/ness-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Burning River Pale Ale', 'Pale Ale', 'ABV: 6.0%', 'Great Lakes Brewing Co', 'Crisp and bright, with refreshing flickers of citrus and pine that ignite the senses (not our local waterways).', 'https://www.greatlakesbrewing.com/sites/default/files/burning-river-rendering_0.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Great Lakes IPA', 'IPA', 'ABV: 6.5%', 'Great Lakes Brewing Co', 'Hike, bike, sail, or laze your way through a dry-hopped, easy-drinking American IPA that is perfectly suited for wherever the trail takes you.', 'https://www.greatlakesbrewing.com/sites/default/files/glipa-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Commodore Perry IPA', 'IPA', 'ABV: 7.7%', 'Great Lakes Brewing Co', 'Victoriously hopped, with an arsenal of caramel malt flavors befitting the Hero of Lake Erie.', 'https://www.greatlakesbrewing.com/sites/default/files/commodore-render.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Edmund Fitzgerald Porter', 'Porter', 'ABV: 6.0%', 'Great Lakes Brewing Co', 'Brewed in memory of the sunken freighter, with rich roasted barley and bittersweet chocolate-coffee notes.', 'https://www.greatlakesbrewing.com/sites/default/files/fitz-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Hazecraft IPA', 'IPA', 'ABV: 6.7%', 'Great Lakes Brewing Co', 'Blast into orbit through a hazy galaxy of otherworldly tropical fruit aromas', 'https://www.greatlakesbrewing.com/sites/default/files/hazecraft-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Crushworthy Lo-Cal Citrus Wheat', 'Wheat', 'ABV: 4.0%', 'Great Lakes Brewing Co', 'Get smitten with a totally crushable Lo-Cal Wheat Ale, gushing with dreamy doses of real citrus', 'https://www.greatlakesbrewing.com/sites/default/files/crushworthy-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('TropCoastal Tropical IPA', 'IPA', 'ABV: 6.0%', 'Great Lakes Brewing Co', 'Slip away to a shimmering cove of refreshment, bursting with ripe tropical fruit flavors.', 'https://www.greatlakesbrewing.com/sites/default/files/tropicoastal-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Conway''s Irish Ale', 'Irish Ale', 'ABV: 6.3%', 'Great Lakes Brewing Co', 'Stationed at the intersection of sweet and toasty, where biscuit and caramel malt flavors always have the right-of-way.', 'https://www.greatlakesbrewing.com/sites/default/files/commodore-rendering_1.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Mexican Lager with Lime', 'Mexican Lager', 'ABV: 5.4%', 'Great Lakes Brewing Co', 'Spread a blanket and luxuriate in sunny rays of zesty lime and crisp, clean malt flavors.', 'https://www.greatlakesbrewing.com/sites/default/files/mexican-lager-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Chillwave Double IPA', 'IPA', 'ABV: 9.0%', 'Great Lakes Brewing Co', 'Glide across waves of tropical Mosaic hops and sweet honey malt.', 'https://www.greatlakesbrewing.com/sites/default/files/chillwave-rendering_0.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Rally Drum Premium Lager', 'Lager', 'ABV: 4.2%', 'Great Lakes Brewing Co', 'An all-star roster of malt and hops swings for the fences and slides into a crisp, clean finish in this classic American Lager.', 'https://www.greatlakesbrewing.com/sites/default/files/rally-drum-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Lemon Hefeweizen', 'Hefeweizen', 'ABV: 5.1%', 'Great Lakes Brewing Co', 'Fresh and zestful as boardwalk lemonade, with a clean, effervescent body that travels light.', 'https://www.greatlakesbrewing.com/sites/default/files/lemon-hefe-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Lake Erie Monster Imperial IPA', 'IPA', 'ABV: 9.5%', 'Great Lakes Brewing Co', 'Face your fears with a full-bodied hop behemoth', 'https://www.greatlakesbrewing.com/sites/default/files/lem-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Oktoberfest', 'Seasonal', 'ABV: 6.5%', 'Great Lakes Brewing Co', 'Uber smooth with vibrant malt flavors and a festive flourish of noble hops (lederhosen not included).', 'https://www.greatlakesbrewing.com/sites/default/files/oktoberfest-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('73 Kolsch', 'Ale', 'ABV: 5.7%', 'Great Lakes Brewing Co', 'Reliably crisp and smooth, with consecutive snaps of earthy hop aromas and subtle rye bitterness', 'https://www.greatlakesbrewing.com/sites/default/files/73-kolsch-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Tidal Fury Imperial Hazy IPA', 'IPA', 'ABV: 8.0%', 'Great Lakes Brewing Co', 'Summon a mighty, swirling citrus storm with rolling waves of passion fruit.', 'https://www.greatlakesbrewing.com/sites/default/files/tidal-fury-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Nosferatu Imerial Red IPA', 'IPA', 'ABV: 8.0%', 'Great Lakes Brewing Co', 'Sink your teeth into rich, roasted malt and a stunning hop bite.', 'https://www.greatlakesbrewing.com/sites/default/files/nosferatu-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Ohio City Oatmeal Stout', 'Stout', 'ABV: 5.4%', 'Great Lakes Brewing Co', 'Oh, what fun it is to ride through a flurry of flaked oats oer a field of rich roasted malt flavors!', 'https://www.greatlakesbrewing.com/sites/default/files/ohio-city-oatmeal-stout.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Christmas Ale', 'Seasonal', 'ABV: 7.5%', 'Great Lakes Brewing Co', 'A holiday classic, fully decked with fresh ginger, cinnamon, and sweet honey.', 'https://www.greatlakesbrewing.com/sites/default/files/christmas-ale-rendering.png');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Dank Demon Imperial Dank IPA', 'IPA', 'ABV: 8.0%', 'Great Lakes Brewing Co', 'Explore a sticky swamp of pungent, resinous hop flavors', 'https://www.greatlakesbrewing.com/sites/default/files/dank-demon-rendering.png');




--  ADD ALL BEERS ON BEER LIST FOR MCFATES TAP + BARREL
INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Mrs. Claus'' Cookies Brown Ale', 'Ale', 'ABV: 5.8%', 'McFate''s Tap + Barrel', 'Brewed with molasses, Canela cinnamon, clove, cardamom, nutmeg, and a touch of vanilla. Comforting malt flavors with rich spiced sugar cookie notes.', 'https://2eat2drink.files.wordpress.com/2013/12/2eat2drink-beer-and-cookies.jpg?w=768&h=1048');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Candy Bar Milk Stout', 'Stout', 'ABV: 6.0%', 'McFate''s Tap + Barrel', 'Brewed with honey roasted peanuts, cacao nibs, vanilla bean, and a touch of sea salt. Decadent and slightly sweet with a chocolate/peanut nose and balanced roasty finish.', 'https://mouthbysouthwest.com/wp-content/uploads/2017/10/McFateCandyBarMilkStout102317.jpg');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('King Size Candy Bar Milk Stout', 'Stout', 'ABV: 11.0%', 'McFate''s Tap + Barrel', 'Aged in Buffalo Trace barrels, it''s a big thick beer with whiskey on the nose and a sweet, smooth, chocolatey finish. Allergy alert: contains peanuts and lactose.', 'https://mouthbysouthwest.com/wp-content/uploads/2017/10/McFateCandyBarMilkStout102317.jpg');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Buena Vista Blonde Ale', 'Ale', 'ABV: 4.5%', 'McFate''s Tap + Barrel', 'Light and crisp beer with a nice tropical aroma. Dry-hopped with Mandarina hops for aroma not taste. ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMPyo6w_JoDJjYds8MoXtOnahF1ZxzIvopjg&usqp=CAU');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Hatch Chile Gatos', 'Ale', 'ABV: 4.8%', 'McFate''s Tap + Barrel', 'Oh my Gatos Golden ale with the addition of roasted Hatch Chiles. Huge Chile aroma, mild flavor and very little heat.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMe08KQ2pCPMgGjhfoyUoQlmax4KOBG3uDGw&usqp=CAU');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Half Way To Heffen', 'Hefewiezen', 'ABV: 4.8%', 'McFate''s Tap + Barrel', 'This crisp and refreshing summertime brew has notes of banana and vanilla on the nose. Beautifully mastered to quench the deepest of thirsts, this wheat-based hefe will leave you basking in the sun!', 'https://untappd.akamaized.net/photos/2021_11_28/33d6e7fc8c57973c4bdc556fa530cc22_640x640.jpg');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('German Pilsner', 'Pilsner', 'ABV: 5.3%', 'McFate''s Tap + Barrel', 'A blend of hops from the Hallertau region of Germany giving a pronounced floral and spicy flavor and aroma. It''s crisp and dry finishing with a light grainy malt profile.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRllWgVZFmDpaq87Qe9veg0Dsw2HjbaAUx8BA&usqp=CAU');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Pueblo Vienna Lager', 'Lager', 'ABV: 5.5%', 'McFate''s Tap + Barrel', 'Mexican-style Vienna lager brewed with corn. An easy to drink Lager with medium copper body. Crisp on the front end slightly toasted on the finish.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp-jz6G6ktuH30JDuqfFMSFMVm2Ku4cKhmHg&usqp=CAU');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Irish Red Ale', 'Ale', 'ABV: 5.4%', 'McFate''s Tap + Barrel', 'Copper red, malt focused with initial sweetness and a dry, roasty finish. Low hop aroma, light hop flavor and medium body.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbGE9-IkaU5udpiW-aUuELRtZB9It-S-2ShA&usqp=CAU');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Fatetoberfest', 'Seasonal', 'ABV: 5.5%', 'McFate''s Tap + Barrel', 'Our interpretation of a classic Oktoberfest beer. Brewed with all imported German malts and a touch of Saaz hops. Rich toasty malt background with just enough hops.', 'https://www.gannett-cdn.com/presto/2020/09/17/PPHX/0728dd49-8d04-429f-88ae-3ce62a4455ff-Pedal_Haus.jpg?crop=3023,4031,x0,y0&quality=50&width=640');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Belleview Hazy Pale Ale', 'Ale', 'ABV: 5.8%', 'McFate''s Tap + Barrel', 'Juicy pale ale with a balanced crisp malt character and an abundance of hop aromatics from a healthy dose of Citra and CTZ hops. ', 'https://untappd.akamaized.net/photos/2021_11_26/8c4c893bde72342cb20cdcd9f121b84f_640x640.jpg');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('False Promises IPA', 'IPA', 'ABV: 6.2%', 'McFate''s Tap + Barrel', 'The polar opposite of Fatality. No bitterness but massive amounts of aroma and juiciness. Dry-hopped with Citra and CTZ. ', 'https://lh3.googleusercontent.com/J-pE0vBu1QuwJRQrtSKndFaobEn74omVCSf5sg5e-m02raxYzfFDnwdj6tiexUd8K_NMZQ=s85');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Fateful IPA', 'IPA', 'ABV: 6.6%', 'McFate''s Tap + Barrel', 'Brewed with Warrior, Columbus, Simcoe, Cascade and Amarillo hops. Cheers to making you extra hoppy!', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqYzmmbthKLpDGvFc9qDPEb2G3UfYklxHF_A&usqp=CAU');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Lil J. IPA', 'IPA', 'ABV: 4.8%', 'McFate''s Tap + Barrel', 'Brewed with a simple malt bill of Canadian two row and red wheat. Refreshing notes of bitter orange peel finishing with a zesty grapefruit bitterness.', 'https://lh3.googleusercontent.com/2bAOSRFAf7OTxJnZ2kgqfqSFJiA1wWcmVTv81wWHS7vOsK_3pcSNWwgMAVn1vhIUK2utxg=s85');






-- ADD ALL BEERS ON BEER LIST FOR SUNRIFT BEER COMPANY
INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('SunRift IPA', 'IPA', 'ABV: 6.6%', 'SunRift Beer Company', 'Boasting clean bitterness and select American hop variety flavors and aromas. ', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637268251308-XOQ0F5V3PQEEWGVSJ1ZL/SunriftBeers-06.png?format=300w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Sundown Honey Brown', 'Ale', 'ABV: 5.5%', 'SunRift Beer Company', 'This easy drinking malt- forward brown ale is brewed with Honey and Chocolate Malts. ', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637268314848-20A0KF0VN94IUNI2BF9M/SunriftBeers-05.png?format=300w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Blonde Bomber', 'Ale', 'ABV: 6.0%', 'SunRift Beer Company', 'Mild esters and light malt character balanced with low hop bitterness.', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637605138680-HLJWEICBYVP37EBZTB9H/SunriftBeers-04+%281%29.png?format=300w ');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Sol Gravy Stout', 'Stout', 'ABV: 6.8%', 'SunRift Beer Company', 'Bold roasted malt and bittersweet Chocolate notes blend with herbal Noble Hops and Oats for a smooth finish. ', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637604465731-444VYWX365OLF1MA5CMC/SunriftBeers-01.png?format=300w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Hefty Nuts', 'Hefewiezen', 'ABV: 4.2%', 'SunRift Beer Company', 'Citrusy American- style Hefewiezen brewed with Coconut for a tropical twist. ', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637263842830-QQT7HJEAHW37SHVIRONI/Nuts.jpg?format=500w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Big Arm Strong Holden Ale', 'Ale', 'ABV: 7.1%', 'SunRift Beer Company', 'Classic Belgian- style beer with hints of Apricots, Pears and mild Honey. A clean, dry and mildly tart finish gives a smooth drink-ability.', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637268251308-XOQ0F5V3PQEEWGVSJ1ZL/SunriftBeers-06.png?format=300w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Over Under Belgian Dubbel', 'Ale', 'ABV: 7.5%', 'SunRift Beer Company', 'Cool fermentation temeratures result in mild esters of ripe orchard fruits. Notes of Cranberries, Plums and lush Red Apple make for a remarkably easy drinking ale.', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637263525806-B26H2WE26BO7AC36FPMC/Dubbel.jpg?format=500w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Working Man''s Wheat', 'Wheat', 'ABV: 4.7%', 'SunRift Beer Company', 'Traditional Belgian Wit Bier brewed with additions of Coriander and Orange Peel. Low bitterness accentuates a bright citrus fruit character and a dry quenching finish. ', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637604932960-6UONQH0MF4ZDU4HG6QXL/SunriftBeers-03+%281%29.png?format=300w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Dip Hopped Oktoberfest Belgian Pale Ale', 'Ale', 'ABV: 7.1%', 'SunRift Beer Company', 'An American take on a German fall classic. We used the cutting edge method of dip hopping to create more hop aroma and flavor without extra bitterness. A must try! ', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637952523922-BGMU0FBSESOJJNA6LYNB/Oktoberfest.jpg?format=500w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Bodacious Imperial Blonde Ale', 'Ale', 'ABV: 10.0%', 'SunRift Beer Company', 'A radically fruity, easy drinking Imperial Blonde ale with low bitterness and huge bang. ', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637952579382-FN4JEHSU39CR9QTVFMAQ/B.B.jpg?format=300w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Campfire Scotch Ale', 'Ale', 'ABV: 7.9%', 'SunRift Beer Company', 'Medium bodied and malt forward. Subtle smoke and dried fruit sweetness make the Campfire a wonderful winter beer.  ', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637263842830-QQT7HJEAHW37SHVIRONI/Nuts.jpg?format=500w');

INSERT INTO beers (name, beertype, abv, brewername, description, image_URL)
VALUES ('Blizzard White Ale', 'Ale', 'ABV: 4.8%', 'SunRift Beer Company', 'Floral and Citrus hop character pair with this wheat forward beer to create a delicious and drinkable session pale ale.', 'https://images.squarespace-cdn.com/content/v1/6196a197623eaf3d814287ac/1637952705571-ABS8L6AQMDTTL3RYT8BG/Blizzard.jpg?format=300w');



-- ADD REVIEWS TO EACH BEER IN REVIEW TABLE

-- Great Lakes Brewing Co. Beer Reviews
INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Dortmunder Gold Lager', '01/01/2021', 'It is an enjoyable, easy drinking beer that packs a bit more punch than a traditional lager. It has a medium body with no hip bitterness. I am looking forward to another one.', '4.04');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Eliot Ness Amber Lager', '01/01/2021', 'Poured from a bottle into a plastic cup. Pours deep red orange with a small off white head. Smells of dark roasted grain and some fruitiness. Tastes of dark roasted grain with bright fruit notes. Beer is light bodied and easy drinking, good carbonation. Overall, a very good beer.', '3.94');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Burning River Pale Ale', '01/01/2021', 'This is one of my favorite go to pale ale. Copper in color and very light on the nose. A nice crisp flavor that is malty on the Frontline with a refreshing hop character on the finish.', '4.85');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Great Lakes IPA', '01/01/2021', 'Extremely solid IPA. Citrus hop aromas (orange, lemon) along with doughy malt. Flavor is well balanced, again with citrus prominent with a touch of pine resin and a touch of earthiness.', '4.01');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Commodore Perry IPA', '01/01/2021', 'Medium amber color with a small white head. Hoppy and malty aroma, but not much. Taste is pretty sweet up front with piney hippiness and a good helping of bitterness. Medium mouthfeel, nothing special.', '3.08');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Edmund Fitzgerald Porter', '01/01/2021', 'Close to black with a dark brown head. Roasty aroma, and the taste is roasty malts for miles, a little touch of sourness on the top and a lasting bitterness on the back. Medium body, decently creamy mouthfeel. Very good for a porter you can find anywhere.', '4.28');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Hazecraft IPA', '01/01/2021', 'Feel is heavily carbonated, almost painfully so, with some hard water for the style (but I''ve had harder), lots of resins, and slight juiciness. Alcohol is felt but not a furnace.', '3.75');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Crushworthy Lo-Cal Citrus Wheat', '01/01/2021', 'Pours a hazy yellow with a decent white head that fades quickly to a ring, no lacing. Aroma of wheat, grass and lemon. Taste follow. It''s a bit thin, lightly carbonated. A great weekend "crusher", surprisingly good.', '3.67');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('TropCoastal Tropical IPA', '01/01/2021', 'This is a pretty solid IPA. It has a solid tropical vibe while drinking like an actual IPA. It''s not flashy, but it''s enjoyable stuff. The flavors and the bitterness blend well together. The craftsmanship is on point. I like it.', '3.83');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Conway''s Irish Ale', '01/01/2021', 'A true Irish Red--deep amber pour with a sturdy off-white head. This beer is a straight-shooter, just like it''s namesake. It has a medium dense mouthfeel and caramel flavors that intensify as the beer warms. This ale is on the sweeter side, but stops short of cloying. Overall, a straight-from-the-hip Irish Red.', '3.52');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Bierwolf Dunkelweizen', '01/01/2021', 'I''m not getting the orange peel or chocolate, but that coffee is there. The feel is very strange. Until it hits the back of your throat it''s a little heavy, then it feels like water goin down. Would like a little higher abv but overall a good beer.', '3.66');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Mexican Lager with Lime', '01/01/2021', 'Taste: crisp, some refreshing lime, citrus, cracker notes, slight sweet. Mild lime zest nose. Golden/straw color hue, clear, white head with ring of lace. Medium/light body. Easy finish for boating. 20 IBUs', '3.32');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Chillwave Double IPA', '01/01/2021', 'Whoa. I mean, whoa! This one has Raul pumping the breaks! What is going on here? This one is wild! It is like if Winnie The Pooh and Eeore dropped some acid and brewed a beer - because this one is flying on all cylinders! Waboom! Like James Dean ghost riding the whip, this damn sucker is legendary.', '4.25');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Rally Drum Premium Lager', '01/01/2021', ' ', '3.63');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Lemon Hefeweizen', '01/01/2021', 'Pours a foggy pale yellow, white head, no lacing. Aroma of lemons, wheat, spice and grassy hops, taste is similar with lemon dominating the taste. Thin, mild carbonation, a summertime crusher.', '3.43');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Lake Erie Monster Imperial IPA', '01/01/2021', 'Pours a clear amber. Not much foam. Mild hoppy aroma. The taste however is far from mild. Very strong. Almost like whiskey. Bitter syrupy finish. Tastes like the lake monster pissed it out, but in a good way.', '4.0');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Oktoberfest', '01/01/2021', 'Frankly surprised by this beer being listed as Outstanding. It''s a marginal marzen. It looks the part-amber, off-white foamy head. But the flavors, though malt forward, are weak and lacking in substance. There is a bit of Noble hop bounce that emerges late, but still a bland experience.', '3.11');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('73 Kolsch', '01/01/2021', 'It took awhile to find this beer in my area and I was happy when I finally did! I cracked a tall boy open and slugged it down and wanted more. The taste is excellent and it is definitely a beer you would be able to drink all day. I will admit I am a Browns fan and could have been bias to this tribute to the Iron Man, Joe Thomas, but it is really a well designed beer worth trying even if you like some other team.', '4.18');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Tidal Fury Imperial Hazy IPA', '01/01/2021', 'Dark copper colored with an inch of dense and creamy beige on top. Light lacing is present. The aroma is of citrus and tangerine. I am tasting melon and tangerine. The mouth is sticky and dry.', '4.02');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Nosferatu Imerial Red IPA', '01/01/2021', 'A very malt forward yet refreshingly happy ale with a very nicely balanced bitter finish. A very nice tribute to one of the greatest classic horror movies. Count orlok would be pleased.', '4.37');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Ohio City Oatmeal Stout', '01/01/2021', 'Stoutly dark with a large tan head that faded fast but left good lacing. Earthy roasted malt aroma with plenty of coffee, a little smoke and a little chocolate. Taste stays pretty true to style; the roastiness persists while smooth on the palate as the balance between sweet and bitter rolls on. Getting some nuttiness in the aftertaste. Full-to-medium bodied, softly carbonated mouthfeel well suited to this cool Fall evening.', '4.0');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Christmas Ale', '01/01/2021', 'A bit too bitter of an aftertaste, for me. Spiced, but not in a cloying way. Looking forward to making the Gingerbread cookies recipe found on their website with a bottle in the future. Nice for the season...it is not my fave Christmas Ale, however.', '3.05');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Dank Demon Imperial Dank IPA', '01/01/2021', 'Taste is resinous, piney, more dank hops with some grapefruit pith, earth, herbal notes, light spice and wood; then the sweetness emerges with caramel, toffee, base malt just general goodness.', '4.24');



-- McFate's Tap + Barrel Beer Reviews
INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Mrs. Claus'' Cookies Brown Ale', '01/01/2021', 'Best damn beer on the Fate menu...should be on tap 365 days per year...no bloody excuse for it not sitting there waiting to be consumed by all who love hoppy beer!', '4.53');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Candy Bar Milk Stout', '01/01/2021', 'Liquid Snickers bar, with a body that belies its single stout strength. Never cloying, though, just loads of chocolate/peanut flavor combos and a nose that''s similarly dialed in. Sure, it''s a novelty, but it''s incredibly well executed.', '4.35');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('King Size Candy Bar Milk Stout', '01/01/2021', 'Nice barrel hit with decent chocolate notes, nice nutty flavor, soft vanilla and malt sweetness. Barrel is mild/medium.', '4.29');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Buena Vista Blonde Ale', '01/01/2021', '', '2.75');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Hatch Chile Gatos', '01/01/2021', 'Very nice balanced and drinkable chile beer, the heat not overpowering. On tap at the source.fuller mouthfeel. Mild aroma. AZ is a good chile beer town.', '3.79');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Half Way To Heffen', '01/01/2021', '', '3.72');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('German Pilsner', '01/01/2021', 'Super refreshing, nice and easy drinking. Crisp and very clean with a hint of corn sweetness in the aroma and aftertaste. Noble hops, decent bitterness. Pillowy bone white head from modest pour down the center of the glass. Great summer beer.', '3.97');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Pueblo Vienna Lager', ' ', 'No Reviews Yet.', ' ');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Irish Red Ale', '01/01/2021', 'I''ve had several beers from Fate now, and this one has been my favorite. Solid balance of malt and hops, good color, not too high-alcohol, and right in the wheelhouse for an Irish red. I''d get this one again. They should have this one year-round.', '4.1');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Fatetoberfest', '01/01/2021', 'This beer is dark amber in color and a rich bready malt flavor. These were made for our slightly hoppier beer compared to a Wiesen Oktoberfest beer in Munich. The malt and hops balance each other nicely and the alcohol is well hidden for 5.8% in a lager. Try some.', '4.11');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Dortmunder Export Lager', '01/01/2021', 'I''m not overly familiar with the style although I love Great Lakes'' Dortmunder Gold. This one has similar qualities - basically a malty golden lager with a bit more body than a german pilsner but not as deep in flavor as a Marzen or a Vienna Lager. Still very flavorful though with the clean yet sweet breadiness and a clean balanced finish.', '4.01');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Belleview Hazy Pale Ale', '01/01/2021', '', '3.73');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('False Promises IPA', '01/01/2021', 'Appearance: golden yellow in color with a 1/2" head that lasts a while. Smell: floral hop aroma here. Taste: caramel, mango, pineapple, and a juicy hop bitterness are the main flavors. Mouthfeel: medium bodied beer. Crisp to start, less crisp at the finish and a bit dry. Overall: another solid beer from McFate.', '3.73');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Fateful IPA', '01/01/2021', 'Beer poured golden with a very nice white head that is leaving lacing rings behind.', '3.98');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Lil J. IPA', ' ', 'No Reviews Yet.', ' ');



-- SunRift Beer Company Beer Reviews
INSERT INTO reviews (beerName, date, review, rating)
VALUES ('SunRift IPA', '01/01/2021', 'Appearance is gold colored with a thin layer of white foam. Not much for head retention. Slightly hazy.', '2.08');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Sundown Honey Brown', '01/01/2021', 'a robust and tasty brown ale here done with honey, deep brown in color, smooth to drink, short of roasty but full of malt depth, a picked up by a lot of honey flavor without much residual sugar, a smart recipe and very well executed.', '3.96');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Blonde Bomber', '01/01/2021', 'I poured this from a bottle into a clear teardrop glass. It pours a slightly hazy golden with a 2 finger whitehead. I taste grain and hops. Very little sweetness here. It''s ok. It blows away most all big commercial beers, but doesn''t match up to most craft beers.', '3.12');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Sol Gravy Stout', ' ', ' ', '3.75');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Hefty Nuts', '01/01/2021', 'a really exciting brew, my favorite from my visit here, a coconut hefe, which i have always thought made sense, but you dont really see it. ill start by saying that without the coconut, i am not sure how compelling this would be overall as a basic hefe, its a little thin, not bubbly enough, lacking full wheat flavor, and maybe just a tad underdeveloped in terms of the yeast, not bad, but certainly not excellent.', '4.22');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Big Arm Strong Holden Ale', '01/01/2021', 'Hazy golden with big, fluffy head. Aroma is citrusy, bready. Taste is, more of the same, citrusy, mild tart bitterness, somewhat juicy. Nice feel, thick.', '3.88');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Over Under Belgian Dubbel', '01/01/2021', 'Residual sweetness in the flavor as the caramel malts show up. Spicy notes found in the aroma are still there along with a hint of tobacco. Faint herbal hop presence in the aftertaste. Creamy, medium bodied mouthfeel and a long lasting finish. A great bargain.', '4.22');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Working Man''s Wheat', '01/01/2021', 'Mild carbonation evident. The smell was surprisingly non-existent; MAYBE a little banana, but that''s pushing it. The taste was a little more flavorful, in terms of citrus and banana, but that''s not saying much.', '2.93');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Dip Hopped Oktoberfest Belgian Pale Ale', '01/01/2021', 'Poured into a tulip, the appearance was a hazy burnt yellow color with a light ruddy orange color. Rimmed with a fingers worth of white foamy head that dissipated at a nice pace. Messy lace ends up becoming stringy. The aroma starts off with some citrus, tropical and grassy hops.', '3.75');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Bodacious Imperial Blonde Ale', '01/01/2021', 'Appearance is transparent golden amber with a moderate white head of average retention and lacing. Aroma is bready malt. Taste is malt forward without being too heavy, with a mild herbal hop finish. Mouthfeel is soft and clean.', '3.71');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Campfire Scotch Ale', ' ', ' ', '4.12');

INSERT INTO reviews (beerName, date, review, rating)
VALUES ('Blizzard White Ale', '01/01/2021', 'I''m not a big fan of pale ales generally, but this double hopped pale ale has 0 IBU''s according to the can, and my experience certainly confirms it. Really good fresh summer brew.', '3.75');



INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('brewer', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_BREWER');

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO final_capstone_appuser;
GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_appuser;


COMMIT TRANSACTION;

