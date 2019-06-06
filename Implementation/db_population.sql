SET DATESTYLE TO DMY;

-- Role population (controlled vocabulary)
INSERT INTO Role VALUES ('Subscriber');
INSERT INTO Role VALUES ('Banned');
INSERT INTO Role VALUES ('Moderator');

-- Tool population (controlled vocabulary)
INSERT INTO Tool VALUES ('Pot');
INSERT INTO Tool VALUES ('Microwave');
INSERT INTO Tool VALUES ('Pan');
INSERT INTO Tool VALUES ('Whisk');
INSERT INTO Tool VALUES ('Rolling pin');
INSERT INTO Tool VALUES ('Fork');
INSERT INTO Tool VALUES ('Spoon');
INSERT INTO Tool VALUES ('Knife');

-- Nutrient Population (controlled vocabulary)
INSERT INTO Nutrient VALUES('Carbohydrate');
INSERT INTO Nutrient VALUES('Protein');
INSERT INTO Nutrient VALUES('Vitamin A');
INSERT INTO Nutrient VALUES('Vitamin B12');
INSERT INTO Nutrient VALUES('Vitamin C');
INSERT INTO Nutrient VALUES('Vitamin D');
INSERT INTO Nutrient VALUES('Iron');
INSERT INTO Nutrient VALUES('Potassium');

-- Necessity Population (controlled vocabulary)
INSERT INTO FoodNecessity VALUES('Lactose Free');
INSERT INTO FoodNecessity VALUES('Gluten Free');
INSERT INTO FoodNecessity VALUES('Vegan');
INSERT INTO FoodNecessity VALUES('Vegetarian');
INSERT INTO FoodNecessity VALUES('Fruitarian');

-- Course Population (controlled vocabulary)
INSERT INTO Course VALUES('Starter');
INSERT INTO Course VALUES('First Course');
INSERT INTO Course VALUES('Second Course');
INSERT INTO Course VALUES('Side');
INSERT INTO Course VALUES('Dessert');

-- Food Type Population (controlled vocabulary)
INSERT INTO FoodType VALUES('Vegetable');
INSERT INTO FoodType VALUES('Fruit');
INSERT INTO FoodType VALUES('Meat');
INSERT INTO FoodType VALUES('Dairy');
INSERT INTO FoodType VALUES('Seafood');
INSERT INTO FoodType VALUES('Frozen');
INSERT INTO FoodType VALUES('Precooked');
INSERT INTO FoodType VALUES('Grain Derivate');

-- Meal Type Population (controlled vocabulary)
INSERT INTO Meal VALUES('Breakfast');
INSERT INTO Meal VALUES('Lunch');
INSERT INTO Meal VALUES('Dinner');
INSERT INTO Meal VALUES('Morning Snack');
INSERT INTO Meal VALUES('Afternoon Snack');
INSERT INTO Meal VALUES('Midnight Snack');

-- Units of measurements (controlled vocabulary)
INSERT INTO UnitOfMeasurement VALUES ('kg');
INSERT INTO UnitOfMeasurement VALUES ('g');
INSERT INTO UnitOfMeasurement VALUES ('ml');
INSERT INTO UnitOfMeasurement VALUES ('L');
INSERT INTO UnitOfMeasurement VALUES ('cl');

-- Users population
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('azurediamond@hotmail.com', '12/6/2004', 180, 82, 'Male', 'Azure', 'Diamond', 'AzureDiamond', 'hunter2', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('tlascell1@imgur.com', '09/10/1990', 196, 113, 'Male', 'Thoma', 'Lascell', 'tlascell1', 'dVCs1P', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('cmenichino2@de.vu', '22/09/1965', 180, 107, 'Female', 'Chelsea', 'Menichino', 'cmenichino2', '4YtiQEynSn3', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('jsimonato3@scientificamerican.com', '18/04/1973', 180, 53, 'Female', 'Josefa', 'Simonato', 'jsimonato3', 'uXPgVO4YCm', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('gjandac4@ucla.edu', '25/10/1962', 179, 101, 'Female', 'Ginelle', 'Jandac', 'gjandac4', 'aaYGqPms', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('civanovic5@bluehost.com', '14/09/1969', 167, 55, 'Female', 'Cathe', 'Ivanovic', 'civanovic5', 'JPwEoY', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('ksherrocks6@is.gd', '31/12/1964', 195, 70, 'Male', 'Kennett', 'Sherrocks', 'ksherrocks6', 'ky8XglngG', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('ekneesha7@ftc.gov', '13/03/1963', 157, 52, 'Male', 'Elston', 'Kneesha', 'ekneesha7', 'YKLyK0', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('hdyment8@studiopress.com', '09/09/1989', 157, 50, 'Female', 'Hedwiga', 'Dyment', 'hdyment8', 'jn4C0c1', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('ktweedy9@time.com', '03/07/1989', 188, 73, 'Female', 'Karoline', 'Tweedy', 'ktweedy9', 'mOB4KFs', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('etiddya@irs.gov', '02/09/1978', 159, 118, 'Female', 'Elisabet', 'Tiddy', 'etiddya', '3iVGbtZ', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('aeilhermannb@biblegateway.com', '20/04/1974', 154, 101, 'Female', 'Allie', 'Eilhermann', 'aeilhermannb', 'yAk4iB', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('jbrontc@tripod.com', '27/04/1985', 162, 104, 'Female', 'Jolee', 'Bront', 'jbrontc', 'KFIIc8PEoR9', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('jcamberd@walmart.com', '01/03/1996', 192, 87, 'Male', 'Jarret', 'Camber', 'jcamberd', 'hHUDCK', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('vfranciottie@example.com', '30/03/1959', 192, 73, 'Female', 'Vonny', 'Franciotti', 'vfranciottie', 'gas7MiM', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('rwitherupf@dropbox.com', '03/06/1971', 158, 119, 'Male', 'Ram', 'Witherup', 'rwitherupf', '55fbNCso', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('cpulbrookg@devhub.com', '20/08/1974', 169, 59, 'Female', 'Cissy', 'Pulbrook', 'cpulbrookg', 'RDN15VhgKze5', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('dborastonh@bizjournals.com', '15/12/1963', 192, 56, 'Male', 'Duke', 'Boraston', 'dborastonh', 'LsQsDCsS3AT', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('ecanningi@mapquest.com', '14/02/1977', 152, 79, 'Female', 'Emilee', 'Canning', 'ecanningi', 'tEmzus', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('mworgj@businessweek.com', '07/10/1991', 192, 101, 'Female', 'Melina', 'Worg', 'mworgj', '1tAXIw', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('ovanyukovk@flavors.me', '16/11/1985', 198, 63, 'Female', 'Orella', 'Vanyukov', 'ovanyukovk', 'alLBT2', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('uhulstroml@exblog.jp', '09/11/1970', 195, 119, 'Male', 'Urban', 'Hulstrom', 'uhulstroml', 'g4Yo5kcp', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('dlathwoodm@scientificamerican.com', '22/08/1958', 200, 120, 'Female', 'Dorree', 'Lathwood', 'dlathwoodm', 'fVqs14dSn', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('cspellecyn@google.cn', '28/05/1994', 160, 98, 'Female', 'Cassandra', 'Spellecy', 'cspellecyn', 'LhJt5ty', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('yguitteo@paypal.com', '07/09/1982', 163, 104, 'Male', 'Yorgo', 'Guitte', 'yguitteo', '2eJYZ4f', 'Subscriber');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('btimbsp@tiny.cc', '19/03/1999', 164, 98, 'Male', 'Billy', 'Timbs', 'btimbsp', 'v21eKY', 'Moderator');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('aklementq@go.com', '19/01/1987', 181, 65, 'Male', 'Ari', 'Klement', 'aklementq', 'FOzoOgKzct', 'Moderator');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('nfountainer@oaic.gov.au', '02/11/1962', 156, 95, 'Male', 'Nollie', 'Fountaine', 'nfountainer', 'q2yNVeB', 'Moderator');
INSERT INTO AutoChefUser (Email, Birthdate, Height, Weight, Sex, Name, Surname, Username, Password, RoleName) VALUES ('mscheffels@oakley.com', '05/03/1986', 172, 95, 'Female', 'Muire', 'Scheffel', 'mscheffels', 'N1jO6VM', 'Banned');

-- Subscriber Groups (personal one for each user)
INSERT INTO UserGroup (Id, Username, Name) VALUES ('6e7590da-9251-4cd1-8de9-de13d96066b2', 'AzureDiamond', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('f51c0a5d-fae4-481a-8b1a-3f8c6d477045', 'tlascell1', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('f46c15d0-2e3d-484d-aa16-58baf861386d', 'cmenichino2', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('dced3581-3853-4ed5-9cd3-ecce4bb95969', 'jsimonato3', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('3c913666-85bc-4655-b755-4d3e20b4d830', 'gjandac4', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('76095e21-3fbd-4297-8a69-cb9ed2822126', 'civanovic5', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('71530c78-4eba-45d4-b694-eb002ccb6c4a', 'ksherrocks6', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('19c88680-fb99-4542-beb6-28e942b17272', 'ekneesha7', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('59f63908-e5f0-49b6-9f8c-12fe93f50b5e', 'hdyment8', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('83e24632-da54-469d-8851-d9897796323f', 'ktweedy9', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('1fa87cf5-f948-46e3-875d-db472a40c41b', 'etiddya', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('1f36451c-6588-45a1-8359-d116d309a33b', 'aeilhermannb', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('30538641-bf0c-4d94-a9f0-2b13ce2ee154', 'jbrontc', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('6b5be93f-3fff-4d60-aff5-e7f1474726db', 'jcamberd', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('23429e3d-4745-4307-82d1-221747a6c54b', 'vfranciottie', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('a1d857b8-e10c-4592-bcf7-10b069e1e6b9', 'rwitherupf', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('4ede745b-dc22-45cb-8d1e-e4960bba2a03', 'cpulbrookg', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('3b25cdbb-ba35-4a7f-af2c-0268ed118e68', 'dborastonh', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('8d70c6f5-7a13-41a2-9acd-fed8c8642f87', 'ecanningi', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('5343a244-89d8-42a7-a52a-a8bb88f643a4', 'mworgj', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('5328fb68-dd67-4f44-b795-b7b25dd5dbad', 'ovanyukovk', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('65fa74ce-a980-4428-89e0-2ee7abeabb05', 'uhulstroml', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('ba53d2e0-607b-49c8-8f42-993700db23d6', 'dlathwoodm', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('60421ceb-2ccc-4b1e-96ba-231fa7c06559', 'cspellecyn', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('708a73d5-5e94-4c63-b017-7057927d5db9', 'yguitteo', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('6c221728-c857-474f-96f4-c9aef9d135e4', 'btimbsp', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('3088ba21-63e8-4712-87d9-b0608ceef219', 'aklementq', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('22ecd507-dfd1-45aa-bb78-3669e02ada41', 'nfountainer', 'Personal');
INSERT INTO UserGroup (Id, Username, Name) VALUES ('f05fc096-ed21-4ebb-97fe-689981e2c5d8', 'mscheffels', 'Personal');

-- Generic group creation
INSERT INTO UserGroup (Id, Username, Name, NumberOfPeople) VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', 'jsimonato3', 'Family', 4);
INSERT INTO UserGroup (Id, Username, Name, NumberOfPeople) VALUES ('9bc0659a-6b91-4491-919c-660ba8c1ad0a', 'cspellecyn', 'Family', 4);
INSERT INTO UserGroup (Id, Username, Name, NumberOfPeople) VALUES ('20fd082e-6ee5-4a96-a95d-39607ae21907', 'etiddya', 'Friends', 5);
INSERT INTO UserGroup (Id, Username, Name, NumberOfPeople) VALUES ('d173dadb-ed21-4284-8d9b-e8437963cb1c', 'vfranciottie', 'Camping Group', 12);

-- Group Participation
INSERT INTO Add VALUES ('rwitherupf', '3f151df9-187c-4c31-9f65-ce7feac98c7b');
INSERT INTO Add VALUES ('ovanyukovk', '3f151df9-187c-4c31-9f65-ce7feac98c7b');
INSERT INTO Add VALUES ('cmenichino2', '3f151df9-187c-4c31-9f65-ce7feac98c7b');
INSERT INTO Add VALUES ('dborastonh', '9bc0659a-6b91-4491-919c-660ba8c1ad0a');
INSERT INTO Add VALUES ('mworgj', '20fd082e-6ee5-4a96-a95d-39607ae21907');
INSERT INTO Add VALUES ('dborastonh', '20fd082e-6ee5-4a96-a95d-39607ae21907');
INSERT INTO Add VALUES ('uhulstroml', 'd173dadb-ed21-4284-8d9b-e8437963cb1c');
INSERT INTO Add VALUES ('AzureDiamond', 'd173dadb-ed21-4284-8d9b-e8437963cb1c');
INSERT INTO Add VALUES ('aeilhermannb', 'd173dadb-ed21-4284-8d9b-e8437963cb1c');
INSERT INTO Add VALUES ('dlathwoodm', 'd173dadb-ed21-4284-8d9b-e8437963cb1c');

-- Products
INSERT INTO Product VALUES ('Salmon', 2, 2.5, 206, 1, 12, 'g');
INSERT INTO Product VALUES ('Cucumber', 5, 1, 15, 4, 8, 'g');
INSERT INTO Product VALUES ('Feta', 4, 1.5, 264, 1, 12, 'g');
INSERT INTO Product VALUES ('Flour', 15, 0.8, 455, 1, 12, 'g');
INSERT INTO Product VALUES ('Tomato Sauce', 18, 1, 29, 1, 12, 'g');
INSERT INTO Product VALUES ('Olive Oil', 20, 2, 129, 1, 12, 'ml');
INSERT INTO Product VALUES ('Apple', 12, 1, 95, 8, 5, 'g');
INSERT INTO Product VALUES ('Oatmeal', 25, 1.2, 166, 1, 12, 'g');
INSERT INTO Product VALUES ('Tuna', 5, 1.4, 111, 1, 12, 'g');
INSERT INTO Product VALUES ('Pasta', 25, 1.3, 196, 1, 12, 'g');
INSERT INTO Product VALUES ('Chicken Wings', 1, 2.4, 352, 1, 12, 'g');

-- Product Type
INSERT INTO Assign VALUES ('Seafood', 'Salmon');
INSERT INTO Assign VALUES ('Vegetable', 'Cucumber');
INSERT INTO Assign VALUES ('Dairy', 'Feta');
INSERT INTO Assign VALUES ('Grain Derivate', 'Flour');
INSERT INTO Assign VALUES ('Vegetable', 'Tomato Sauce');
INSERT INTO Assign VALUES ('Vegetable', 'Olive Oil');
INSERT INTO Assign VALUES ('Fruit', 'Apple');
INSERT INTO Assign VALUES ('Precooked', 'Oatmeal');
INSERT INTO Assign VALUES ('Seafood', 'Tuna');
INSERT INTO Assign VALUES ('Grain Derivate', 'Pasta');
INSERT INTO Assign VALUES ('Precooked', 'Chicken Wings');

-- Recipes
INSERT INTO Recipe VALUES('32f49c37-91bc-4e6f-b273-285b48b0f370', 'Pasta with tuna and tomato sauce', true, 'ksherrocks6', 20, '10/05/2019', '1',
'1) Heat the oil in a pan, throw in the onion and cook for a couple of minutes. Stir in the garlic, tomatoes, chilli and sugar.
Season with salt and pepper and bring to the boil. Give it a good stir, then reduce the heat and simmer for 5 minutes.
2) Meanwhile, bring a large pan of salted water to the boil. Add the pasta and cook according to packet instructions.
Flake the tuna into the sauce and heat through. Drain the pasta, return to the pan and stir in the sauce and basil leaves if you have any.
Serve with a generous grinding of pepper.');
INSERT INTO Recipe VALUES('cdb95208-2e45-4a31-bff3-9de5a9d412c6', 'Apple Cinnamon Oatmeal Cookies', false, 'ksherrocks6', 45, '29/09/2017', '2',
'1) Preheat oven and line baking sheets.
2) Whisk together flour, oats, cinnamon, baking soda and salt.
3) In an electric mixer cream butter and brown sugar.
4) Mix in egg and vanilla extract.
5) Toss apples with lemon juice.
6) Add flour mixture to dough mix until combined, then mix in apples.
7) Scoop dough out using a medium cookie scoop and drop onto prepared baking sheets. Flatten slightly.
8) Bake in oven until cookies are set. Cool on wire rack.');
INSERT INTO Recipe VALUES('609a12af-74f9-4704-aed5-9dba62398871', 'Pizza', true, 'AzureDiamond', 50, '17/05/2016', '3',
'1) Make the base: Put the flour into a large bowl, then stir in the yeast and salt.
Make a well, pour in 200ml warm water and the olive oil and bring together with a wooden spoon until you have a soft, fairly wet dough.
Turn onto a lightly floured surface and knead for 5 mins until smooth.
Cover with a tea towel and set aside. You can leave the dough to rise if you like, but it is not essential for a thin crust.
2) Make the sauce: Mix the passata, basil and crushed garlic together, then season to taste.
Leave to stand at room temperature while you get on with shaping the base.
3) Roll out the dough: If you have let the dough rise, give it a quick knead, then split into two balls.
On a floured surface, roll out the dough into large rounds, about 25cm across, using a rolling pin.
The dough needs to be very thin as it will rise in the oven. Lift the rounds onto two floured baking sheets.
4) Top and bake: Heat oven to 240C/fan 220C /gas 8.
Put another baking sheet or an upturned baking tray in the oven on the top shelf.
Smooth sauce over bases with the back of a spoon.
Scatter with cheese and tomatoes, drizzle with olive oil and season.
Put one pizza, still on its baking sheet, on top of the preheated sheet or tray.
Bake for 8-10 mins until crisp. Serve with a little more olive oil, and basil leaves if using.
Repeat step for remaining pizza.');
INSERT INTO Recipe VALUES('64acc5fb-4d58-48ac-85d1-3b9697597951', 'Salmon with Creamy Feta Cucumbers', true, 'cpulbrookg', 20, '17/05/2016', '2',
'1) Heat oil in a large skillet on medium.
Halve 1 lemon and place halves, cut sides down, in the skillet.
Season salmon with 1/2 tsp each salt and pepper and cook until golden brown and opaque throughout,
3 to 6 minutes per side. Transfer salmon fillets to plates.
Transfer lemon halves to a cutting board and cut each in half.
2) Meanwhile, in a large bowl, toss cucumbers with 1/4 tsp salt.
Finely grate zest of remaining lemon into a food processor and squeeze in 3 Tbsp juice.
Add feta and yogurt and puree until smooth.
3) Toss with cucumbers to coat, then fold in mint and freshly cracked pepper.
Serve with salmon and a charred lemon wedge for squeezing.');

-- Recipe Ingredients
INSERT INTO MadeWith VALUES ('32f49c37-91bc-4e6f-b273-285b48b0f370', 'Pasta', 100);
INSERT INTO MadeWith VALUES ('32f49c37-91bc-4e6f-b273-285b48b0f370', 'Tuna', 50);
INSERT INTO MadeWith VALUES ('32f49c37-91bc-4e6f-b273-285b48b0f370', 'Tomato Sauce', 25);
INSERT INTO MadeWith VALUES ('cdb95208-2e45-4a31-bff3-9de5a9d412c6', 'Apple', 65);
INSERT INTO MadeWith VALUES ('cdb95208-2e45-4a31-bff3-9de5a9d412c6', 'Oatmeal', 70);
INSERT INTO MadeWith VALUES ('609a12af-74f9-4704-aed5-9dba62398871', 'Flour', 120);
INSERT INTO MadeWith VALUES ('609a12af-74f9-4704-aed5-9dba62398871', 'Tomato Sauce', 20);
INSERT INTO MadeWith VALUES ('609a12af-74f9-4704-aed5-9dba62398871', 'Olive Oil', 2);
INSERT INTO MadeWith VALUES ('64acc5fb-4d58-48ac-85d1-3b9697597951', 'Salmon', 150);
INSERT INTO MadeWith VALUES ('64acc5fb-4d58-48ac-85d1-3b9697597951', 'Cucumber', 30);
INSERT INTO MadeWith VALUES ('64acc5fb-4d58-48ac-85d1-3b9697597951', 'Feta', 25);

-- Tools Needed
INSERT INTO Need VALUES ('609a12af-74f9-4704-aed5-9dba62398871', 'Rolling pin');
INSERT INTO Need VALUES ('32f49c37-91bc-4e6f-b273-285b48b0f370', 'Pot');
INSERT INTO Need VALUES ('64acc5fb-4d58-48ac-85d1-3b9697597951', 'Pan');
INSERT INTO Need VALUES ('64acc5fb-4d58-48ac-85d1-3b9697597951', 'Spoon');

-- Recipe Requests
INSERT INTO RecipeRequest VALUES ('7c8c0211-4cee-4390-8417-4c97e70b43eb', 'Make Public', true, 'ksherrocks6', '64acc5fb-4d58-48ac-85d1-3b9697597951');
INSERT INTO RecipeRequest VALUES ('01b0a2b3-e39a-41f6-9df8-ae591a8efb05', 'Increase Difficulty Rating by 1', false, 'gjandac4', '609a12af-74f9-4704-aed5-9dba62398871');

-- Product Requests
INSERT INTO ProductRequest VALUES ('8a44aa4a-b68e-456d-a0c6-763311a62964', 'Add basil to products!', 'Basil', 'rwitherupf');
INSERT INTO ProductRequest VALUES ('a9d9e044-5801-46c7-b16a-efb537ccb2c8', 'Increase Olive Oil average duration', 'Olive Oil', 'tlascell1');

-- Ratings
INSERT INTO Vote VALUES (4, 'hdyment8', '609a12af-74f9-4704-aed5-9dba62398871', 'Great Recipe but a little convoluted.');
INSERT INTO Vote VALUES (3, 'hdyment8', 'cdb95208-2e45-4a31-bff3-9de5a9d412c6', 'They did not turn out too great...');
INSERT INTO Vote VALUES (5, 'aeilhermannb', '609a12af-74f9-4704-aed5-9dba62398871', 'Finally a really good pizza recipe!');
INSERT INTO Vote VALUES (3, 'tlascell1', '609a12af-74f9-4704-aed5-9dba62398871', 'Not really that good.');
INSERT INTO Vote VALUES (1, 'tlascell1', '64acc5fb-4d58-48ac-85d1-3b9697597951', 'Yuk, I love cucumber but the feta ruined it!');
INSERT INTO Vote VALUES (3, 'mworgj', '64acc5fb-4d58-48ac-85d1-3b9697597951', 'It''s ok');

-- Nutrients in Products
INSERT INTO Have VALUES ('Carbohydrate', 'Pasta', 38);

-- Nutrients Needs
INSERT INTO Require2 VALUES ('76095e21-3fbd-4297-8a69-cb9ed2822126', 'Vitamin D', 15);

-- Food Necessities satisfied by Products
INSERT INTO Satisfy VALUES ('Vegetarian', 'Salmon');
INSERT INTO Satisfy VALUES ('Lactose Free', 'Salmon');
INSERT INTO Satisfy VALUES ('Gluten Free', 'Salmon');
INSERT INTO Satisfy VALUES ('Vegan', 'Cucumber');
INSERT INTO Satisfy VALUES ('Lactose Free', 'Cucumber');
INSERT INTO Satisfy VALUES ('Gluten Free', 'Cucumber');
INSERT INTO Satisfy VALUES ('Vegetarian', 'Feta');
INSERT INTO Satisfy VALUES ('Gluten Free', 'Feta');
INSERT INTO Satisfy VALUES ('Vegetarian', 'Flour');
INSERT INTO Satisfy VALUES ('Vegan', 'Flour');
INSERT INTO Satisfy VALUES ('Lactose Free', 'Flour');
INSERT INTO Satisfy VALUES ('Vegan', 'Tomato Sauce');
INSERT INTO Satisfy VALUES ('Vegetarian', 'Tomato Sauce');
INSERT INTO Satisfy VALUES ('Lactose Free', 'Tomato Sauce');
INSERT INTO Satisfy VALUES ('Gluten Free', 'Tomato Sauce');
INSERT INTO Satisfy VALUES ('Fruitarian', 'Apple');

-- Eating Plans
INSERT INTO EatingPlan VALUES ('2af5de30-2d93-441b-8d5a-3b6e0dfd51c2', 'dced3581-3853-4ed5-9cd3-ecce4bb95969', '12/05/2019', '14/05/2019');
INSERT INTO EatingPlan VALUES ('90be8e4e-f923-4ac1-9193-bfe129e0fea0', '3f151df9-187c-4c31-9f65-ce7feac98c7b', '12/05/2019', '19/05/2019');

-- Menus
INSERT INTO Menu VALUES ('12/05/2019', 'Lunch', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', '27c0e4d2-8b22-4a48-9cb4-24ff688401c8');
INSERT INTO Menu VALUES ('12/05/2019', 'Dinner', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', '8857a4de-8eb2-444f-9a93-9b3902517d88');
INSERT INTO Menu VALUES ('13/05/2019', 'Lunch', '2af5de30-2d93-441b-8d5a-3b6e0dfd51c2', '0e9056ae-8dac-4579-bd8a-f3aa492bf6f3');
INSERT INTO Menu VALUES ('13/05/2019', 'Dinner', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', '6b606a67-ecb1-40e7-9996-664ecb26f95c');
INSERT INTO Menu VALUES ('14/05/2019', 'Dinner', '2af5de30-2d93-441b-8d5a-3b6e0dfd51c2', '0e9056ae-8dac-4579-bd8a-f3aa422bf6f3');
INSERT INTO Menu VALUES ('14/05/2019', 'Midnight Snack', '2af5de30-2d93-441b-8d5a-3b6e0dfd51c2', '0e9056ae-8dac-4579-bd8b-f3aa492bf6f3');
INSERT INTO Menu VALUES ('15/05/2019', 'Lunch', '2af5de30-2d93-441b-8d5a-3b6e0dfd51c2', '0e9056ae-8dac-4879-bd8a-f3aa492bf6f3');
INSERT INTO Menu VALUES ('15/05/2019', 'Dinner', '2af5de30-2d93-441b-8d5a-3b6e0dfd51c2', '0e9056ae-8dac-4579-bd8a-f3ad492bf6f3');

-- Menus Compositions (Includes)
-- Include1
INSERT INTO Include1 VALUES ('27c0e4d2-8b22-4a48-9cb4-24ff688401c8', '32f49c37-91bc-4e6f-b273-285b48b0f370', 'First Course');
INSERT INTO Include1 VALUES ('8857a4de-8eb2-444f-9a93-9b3902517d88', '609a12af-74f9-4704-aed5-9dba62398871', 'Second Course');
INSERT INTO Include1 VALUES ('6b606a67-ecb1-40e7-9996-664ecb26f95c', '64acc5fb-4d58-48ac-85d1-3b9697597951', 'Second Course');
INSERT INTO Include1 VALUES ('6b606a67-ecb1-40e7-9996-664ecb26f95c', 'cdb95208-2e45-4a31-bff3-9de5a9d412c6', 'Dessert');
INSERT INTO Include1 VALUES ('0e9056ae-8dac-4579-bd8a-f3aa422bf6f3', '32f49c37-91bc-4e6f-b273-285b48b0f370', 'First Course');
INSERT INTO Include1 VALUES ('0e9056ae-8dac-4579-bd8a-f3aa422bf6f3', '64acc5fb-4d58-48ac-85d1-3b9697597951', 'Second Course');
INSERT INTO Include1 VALUES ('0e9056ae-8dac-4579-bd8a-f3aa422bf6f3', 'cdb95208-2e45-4a31-bff3-9de5a9d412c6', 'Dessert');
INSERT INTO Include1 VALUES ('0e9056ae-8dac-4579-bd8b-f3aa492bf6f3', '609a12af-74f9-4704-aed5-9dba62398871', 'First Course');
INSERT INTO Include1 VALUES ('0e9056ae-8dac-4879-bd8a-f3aa492bf6f3', '64acc5fb-4d58-48ac-85d1-3b9697597951', 'First Course');
INSERT INTO Include1 VALUES ('0e9056ae-8dac-4579-bd8a-f3ad492bf6f3', '609a12af-74f9-4704-aed5-9dba62398871', 'First Course');
--Include2
INSERT INTO Include2 VALUES ('0e9056ae-8dac-4579-bd8a-f3aa492bf6f3', 'Second Course', 'Chicken Wings', 100);

-- Shopping List Population
INSERT INTO Buy VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', 'Chicken Wings', 5);
INSERT INTO Buy VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', 'Salmon', 2);
INSERT INTO Buy VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', 'Pasta', 10);
INSERT INTO Buy VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', 'Apple', 3);
INSERT INTO Buy VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', 'Flour', 10);
INSERT INTO Buy VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', 'Oatmeal', 1);
INSERT INTO Buy VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', 'Olive Oil', 1);
INSERT INTO Buy VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', 'Cucumber', 1);
INSERT INTO Buy VALUES ('3f151df9-187c-4c31-9f65-ce7feac98c7b', '90be8e4e-f923-4ac1-9193-bfe129e0fea0', 'Feta', 500);

-- Purchases
INSERT INTO Purchase VALUES ('7d0db993-ee78-41af-be91-6f3a3428d2a5', '05/05/2019');
INSERT INTO Purchase VALUES ('9d0da993-ee78-41af-be91-6f3a3428d2a5', '10/05/2019');

-- Store
INSERT INTO Store VALUES ('7d0db993-ee78-41af-be91-6f3a3428d2a5', 'Tomato Sauce', '3f151df9-187c-4c31-9f65-ce7feac98c7b', 150);
INSERT INTO Store VALUES ('7d0db993-ee78-41af-be91-6f3a3428d2a5', 'Feta', '3f151df9-187c-4c31-9f65-ce7feac98c7b', 50);
INSERT INTO Store VALUES ('9d0da993-ee78-41af-be91-6f3a3428d2a5', 'Salmon', 'dced3581-3853-4ed5-9cd3-ecce4bb95969', 400);
