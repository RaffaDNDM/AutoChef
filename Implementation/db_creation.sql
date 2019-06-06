-- Database Creation
CREATE DATABASE autochef OWNER POSTGRES ENCODING = 'UTF8';

-- Connect to autochef db to create data for its 'public' schema
\c autochef 

-- Create new domains
-- Correct password format
CREATE DOMAIN pwd AS character varying(254)
	CONSTRAINT properpassword CHECK (((VALUE)::text ~* '[A-Za-z0-9._%-]{5,}'::text));

--Correct mail format
CREATE DOMAIN mail AS character varying(254)
  CONSTRAINT propermail CHECK (((VALUE)::text ~* '[A-Za-z0-9._%-]+@[A-Za-z0-9._%]+$'::text));

--Create new data type
CREATE TYPE gendertype AS ENUM (
    'Male',
    'Female'
);


--Create tables

CREATE TABLE Role(
    Name VARCHAR,
    PRIMARY KEY (Name)
);

COMMENT ON TABLE Role IS 'Role that a user can perform inside the database.';
COMMENT ON COLUMN Role.Name IS 'Name that identifies the role of a user (Moderator, Banned)';

CREATE TABLE Tool(
    Name VARCHAR,
    PRIMARY KEY (Name)
);

COMMENT ON TABLE Tool IS 'Instrument that has to be used in the preparation of a recipe (e. g. oven, spoon, ...).';
COMMENT ON COLUMN Tool.Name IS 'Name of the tool';

CREATE TABLE Nutrient(
    Name VARCHAR,
    PRIMARY KEY (Name)
);

COMMENT ON TABLE Nutrient IS 'Basic nutrient (e. g. protein, carbohydrate, ...).';
COMMENT ON COLUMN Nutrient.Name IS 'Name of the nutrient';

CREATE TABLE FoodNecessity(
    Name VARCHAR,
    PRIMARY KEY (Name)
);

COMMENT ON TABLE FoodNecessity IS 'Allergy or food preference.';
COMMENT ON COLUMN FoodNecessity.Name IS 'Name of the allergy or the food preference';

CREATE TABLE FoodType(
    Name VARCHAR,
    PRIMARY KEY (Name)
);

COMMENT ON TABLE FoodType IS 'Type of food (e. g. vegetable, meat, dairy product, ...).';
COMMENT ON COLUMN FoodType.Name IS 'Name of the type of food';

CREATE TABLE Meal(
    Name VARCHAR,
    PRIMARY KEY (Name)
);

COMMENT ON TABLE Meal IS 'A meal during a day (e.g. breakfast, lunch, ...).';
COMMENT ON COLUMN Meal.Name IS 'Name that identifies the meal';

CREATE TABLE UnitOfMeasurement(
    Name VARCHAR,
    PRIMARY KEY (Name)
);

COMMENT ON TABLE UnitOfMeasurement IS 'Unit of measurement of a product.';
COMMENT ON COLUMN UnitOfMeasurement.Name IS 'Name of the unit of measurement';

CREATE TABLE Course(
    Name VARCHAR,
    PRIMARY KEY (Name)
);

COMMENT ON TABLE Course IS 'Course during a meal (Starter, First Course, Second Course, Side, Dessert).';
COMMENT ON COLUMN Course.Name IS 'Name of the course';

CREATE TABLE AutoChefUser (
    Email MAIL,
    Birthdate DATE NOT NULL,
    Height INTEGER NOT NULL,
    Weight REAL NOT NULL,
    Sex GENDERTYPE NOT NULL,
    Name VARCHAR NOT NULL,
    Surname VARCHAR NOT NULL,
    Username VARCHAR,
    Password PWD,
    RoleName VARCHAR NOT NULL,
    CONSTRAINT Physical CHECK ((Height > 0) AND (Weight > 0)),
    PRIMARY KEY (Username),
    FOREIGN KEY(RoleName) REFERENCES Role(Name)
);

COMMENT ON TABLE AutoChefUser IS 'User of AutoChef.';
COMMENT ON COLUMN AutoChefUser.Email IS 'E-mail of the user';
COMMENT ON COLUMN AutoChefUser.Birthdate IS 'Birthday of the user';
COMMENT ON COLUMN AutoChefUser.Height IS 'Height of the user';
COMMENT ON COLUMN AutoChefUser.Weight IS 'Weight of the user';
COMMENT ON COLUMN AutoChefUser.Sex IS 'Sex of the user';
COMMENT ON COLUMN AutoChefUser.Name IS 'Name of the user';
COMMENT ON COLUMN AutoChefUser.Surname IS 'Surname of the user';
COMMENT ON COLUMN AutoChefUser.Username IS 'Unique name that identifies a user in the database';
COMMENT ON COLUMN AutoChefUser.Password IS 'Personal password for user authentication';
COMMENT ON COLUMN AutoChefUser.RoleName IS 'Name that identifies the role of a user (Subscriber, Moderator, Banned)';

CREATE TABLE Recipe (
    Id UUID,
    Name VARCHAR NOT NULL,
    Access BOOLEAN NOT NULL, --TRUE if public FALSE if private
    Username VARCHAR NOT NULL,
    CookingTime INTEGER NOT NULL,
    CreationDate DATE NOT NULL,
    Difficulty INTEGER NOT NULL,
    Instructions TEXT NOT NULL,
    CONSTRAINT Details CHECK ((CookingTime > 0) AND (Difficulty > 0 AND Difficulty < 6)),
    PRIMARY KEY (Id),
    FOREIGN KEY (Username) REFERENCES AutoChefUser(Username)
);

COMMENT ON TABLE Recipe IS 'Set of instructions that users can follow to transform a set of products into courses.';
COMMENT ON COLUMN Recipe.Access IS 'Current state of the recipe (private or public)';
COMMENT ON COLUMN Recipe.CookingTime IS 'Minutes needed to complete the recipe';
COMMENT ON COLUMN Recipe.CreationDate IS 'Date in which the author created the recipe';
COMMENT ON COLUMN Recipe.Difficulty IS 'Difficulty of the recipe (from 1 to 5)';
COMMENT ON COLUMN Recipe.Instructions IS 'Steps to follow in order to prepare the recipe';
COMMENT ON COLUMN Recipe.Name IS 'Name of the recipe';
COMMENT ON COLUMN Recipe.Username IS 'Username of the author, from the entity User';
COMMENT ON COLUMN Recipe.Id IS 'Identifier of a recipe';

CREATE TABLE RecipeRequest (
    Id UUID,
    Comment TEXT NOT NULL,
    Access BOOLEAN NOT NULL, --TRUE if public FALSE if private
    Username VARCHAR NOT NULL,
    RecipeId UUID NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (Username) REFERENCES AutoChefUser(Username),
    FOREIGN KEY (RecipeId) REFERENCES Recipe(Id)
);

COMMENT ON TABLE RecipeRequest IS 'Request to make a recipe public or to suggest some modifications to it.';
COMMENT ON COLUMN RecipeRequest.Access IS 'Current state of the recipe (private or public)';
COMMENT ON COLUMN RecipeRequest.Comment IS 'Details of the request';
COMMENT ON COLUMN RecipeRequest.Id IS 'Identifier of the recipe request';
COMMENT ON COLUMN RecipeRequest.Username IS 'Unique name that identifies a user in the database';
COMMENT ON COLUMN RecipeRequest.RecipeId IS 'Identifier of a recipe';

CREATE TABLE Need (
    Id UUID,
    Name VARCHAR,
    PRIMARY KEY (Id,Name),
    FOREIGN KEY (Id) REFERENCES Recipe(Id),
    FOREIGN KEY (Name) REFERENCES Tool(Name)
);

COMMENT ON TABLE Need IS 'Associates a Recipe to the set of Tools needed to prepare it.';
COMMENT ON COLUMN Need.Id IS 'Identifier of a recipe';
COMMENT ON COLUMN Need.Name IS 'Name of the tool needed for the recipe';

CREATE TABLE Favourite (
    Username VARCHAR,
    Id UUID,
    PRIMARY KEY (Id,Username),
    FOREIGN KEY (Id) REFERENCES Recipe(Id),
    FOREIGN KEY (Username) REFERENCES AutoChefUser(Username)
);

COMMENT ON TABLE Favourite IS 'Allows a User to mark their favourite public Recipes.';
COMMENT ON COLUMN Favourite.Username IS 'Unique name that identifies a user in the database';
COMMENT ON COLUMN Favourite.Id IS 'ID Identifier of a recipe';

CREATE TABLE Purchase (
    Id UUID,
    PurchaseDate DATE NOT NULL,
    PRIMARY KEY (Id)
);

COMMENT ON TABLE Purchase IS 'Purchase of a set of products.';
COMMENT ON COLUMN Purchase.Id IS 'Identifier of the purchase';
COMMENT ON COLUMN Purchase.PurchaseDate IS 'Date in which the purchase is made';

CREATE TABLE UserGroup (
    Id UUID,
    Username VARCHAR NOT NULL,
    Name VARCHAR NOT NULL,
    NumberOfPeople INTEGER NOT NULL DEFAULT 1 CHECK (NumberOfPeople > 0),

    PRIMARY KEY (Id),
    FOREIGN KEY (Username) REFERENCES AutoChefUser(Username)
);

COMMENT ON TABLE UserGroup IS 'Set of one or more users.';
COMMENT ON COLUMN UserGroup.Name IS 'Name of the group';
COMMENT ON COLUMN UserGroup.NumberOfPeople IS 'Number of participants of the group';
COMMENT ON COLUMN UserGroup.Id IS 'Identifier of the group';
COMMENT ON COLUMN UserGroup.Username IS 'Unique name that identifies a user in the database';

CREATE TABLE EatingPlan (
    Id UUID,
    GroupId UUID NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL CHECK (EndDate - StartDate > 0),

    PRIMARY KEY (Id),
    FOREIGN KEY (GroupId) REFERENCES UserGroup(Id)
);

COMMENT ON TABLE EatingPlan IS 'Ordered sequence of menus organized for a certain time period.';
COMMENT ON COLUMN EatingPlan.StartDate IS 'Date in which the plan begins';
COMMENT ON COLUMN EatingPlan.EndDate IS 'Date in which the plan ends';
COMMENT ON COLUMN EatingPlan.Id IS 'Identifier of the eating plan';
COMMENT ON COLUMN EatingPlan.GroupId IS 'Identifier of the group';

CREATE TABLE Product (
    Name VARCHAR,
    AverageDuration INTEGER NOT NULL CHECK (AverageDuration > 0),
    AverageCost NUMERIC(1000,2) NOT NULL CHECK (AverageCost > 0),
    Kcal REAL NOT NULL CHECK (Kcal > 0),
    StartMonth INTEGER NOT NULL CHECK (StartMonth >= 0 AND StartMonth <= 12),
    EndMonth INTEGER NOT NULL CHECK (EndMonth >= 0 AND EndMonth <= 12),
    UnitName VARCHAR NOT NULL,

    PRIMARY KEY (Name),
    FOREIGN KEY (UnitName) REFERENCES UnitOfMeasurement(Name)
);

COMMENT ON TABLE Product IS 'Raw material or processed food.';
COMMENT ON COLUMN Product.Name IS 'Name of the product';
COMMENT ON COLUMN Product.AverageDuration IS 'Average expiration time of the product';
COMMENT ON COLUMN Product.AverageCost IS 'Average cost of the product';
COMMENT ON COLUMN Product.Kcal IS 'Amount of kcal of the product';
COMMENT ON COLUMN Product.StartMonth IS 'First month in which the product is available';
COMMENT ON COLUMN Product.EndMonth IS 'Last month in which the product is available';
COMMENT ON COLUMN Product.UnitName IS 'Name of the unit of measurement';

CREATE TABLE Buy (
    GroupId UUID,
    PlanId UUID,
    Name VARCHAR,
    Amount INTEGER NOT NULL CHECK (Amount > 0),
    PRIMARY KEY(GroupId, PlanId, Name),
    FOREIGN KEY(GroupId) REFERENCES UserGroup(Id),
    FOREIGN KEY(PlanID) REFERENCES EatingPlan(Id),
    FOREIGN KEY(Name) REFERENCES Product(Name)
);

COMMENT ON TABLE Buy IS 'Indicates which Products a Group needs to buy for a specific Eating Plan.';
COMMENT ON COLUMN Buy.GroupId IS 'Identifier of the group';
COMMENT ON COLUMN Buy.PlanId IS 'Identifier of the eating plan';
COMMENT ON COLUMN Buy.Name IS 'Name of the product';
COMMENT ON COLUMN Buy.Amount IS 'Amount to be purchased';

CREATE TABLE MadeWith (
    Id UUID,
    Name VARCHAR,
    Amount INTEGER NOT NULL,
    CONSTRAINT AmountConstraint CHECK (Amount > 0),
    PRIMARY KEY (Id, Name),
    FOREIGN KEY (Id) REFERENCES Recipe(Id),
    FOREIGN KEY (Name) REFERENCES Product(Name)
);

COMMENT ON TABLE MadeWith IS 'Associates a Recipe to the Products it needs.';
COMMENT ON COLUMN MadeWith.Id IS 'Identifier of the recipe';
COMMENT ON COLUMN MadeWith.Name IS 'Name of the product';
COMMENT ON COLUMN MadeWith.Amount IS 'Quantity of a product needed for the recipe';

CREATE TABLE ProductRequest (
    Id UUID,
    Comment TEXT NOT NULL,
    Name VARCHAR NOT NULL,
    Username VARCHAR NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (Username) REFERENCES AutoChefUser(Username)
);

COMMENT ON TABLE ProductRequest IS 'Raw material or processed food.';
COMMENT ON COLUMN ProductRequest.Id IS 'Identifier of the product request';
COMMENT ON COLUMN ProductRequest.Comment IS 'Description of the product that a user wants to add';
COMMENT ON COLUMN ProductRequest.Name IS 'Name of the product';
COMMENT ON COLUMN ProductRequest.Username IS 'Unique name that identifies a user in the database';

CREATE TABLE Have (
    NutrientName VARCHAR,
    ProductName VARCHAR,
    Amount INTEGER NOT NULL CHECK (Amount > 0),

    PRIMARY KEY (NutrientName, ProductName),
    FOREIGN KEY (NutrientName) REFERENCES Nutrient(Name),
    FOREIGN KEY (ProductName) REFERENCES Product(Name)
);

COMMENT ON TABLE Have IS 'Associates a Product to the set of Nutrients it contains.';
COMMENT ON COLUMN Have.NutrientName IS 'Name of the nutrient';
COMMENT ON COLUMN Have.ProductName IS 'Name of the product';
COMMENT ON COLUMN Have.Amount IS 'Quantity of a nutrient in a product';

CREATE TABLE Assign (
    TypeName VARCHAR,
    ProductName VARCHAR,

    PRIMARY KEY (TypeName, ProductName),
    FOREIGN KEY (TypeName) REFERENCES FoodType(Name),
    FOREIGN KEY (ProductName) REFERENCES Product(Name)
);

COMMENT ON TABLE Assign IS 'Associates a Type of food to a Product.';
COMMENT ON COLUMN Assign.TypeName IS 'Name of the type of food';
COMMENT ON COLUMN Assign.ProductName IS 'Name of the product';

CREATE TABLE Store (
    PurchaseId UUID,
    Name VARCHAR,
    GroupId UUID,
    Amount INTEGER NOT NULL CHECK (Amount > 0),

    PRIMARY KEY (PurchaseId, Name, GroupId),
    FOREIGN KEY (PurchaseId) REFERENCES Purchase(Id),
    FOREIGN KEY (Name) REFERENCES Product(Name),
    FOREIGN KEY (GroupId) REFERENCES UserGroup(Id)
);

COMMENT ON TABLE Store IS 'Stores a Product, bought by a Group, after its Purchase.';
COMMENT ON COLUMN Store.PurchaseId IS 'Identifier of the purchase';
COMMENT ON COLUMN Store.Name IS 'Name of the product';
COMMENT ON COLUMN Store.GroupId IS 'Identifier of the group';
COMMENT ON COLUMN Store.Amount IS 'Quantity of the product stored after a purchase';

CREATE TABLE Satisfy (
    FoodNecessityName VARCHAR,
    ProductName VARCHAR,

    PRIMARY KEY (FoodNecessityName, ProductName),
    FOREIGN KEY (FoodNecessityName) REFERENCES FoodNecessity(Name),
    FOREIGN KEY (ProductName) REFERENCES Product(Name)
);

COMMENT ON TABLE Satisfy IS 'Associates a Product to the Food Necessities that it satisfies.';
COMMENT ON COLUMN Satisfy.FoodNecessityName IS 'Name of the allergy or the food preference';
COMMENT ON COLUMN Satisfy.ProductName IS 'Name of the product';

CREATE TABLE Vote(
    Rating INTEGER NOT NULL,
    Username VARCHAR NOT NULL,
    Id UUID,
    Comment TEXT NOT NULL,
    CONSTRAINT Vote CHECK (Rating>0 AND Rating<6),
    PRIMARY KEY (Username, Id ),
    FOREIGN KEY (Username) REFERENCES AutoChefUser(Username),
    FOREIGN KEY (Id) REFERENCES Recipe(Id)
);

COMMENT ON TABLE Vote IS 'Addition of a review by a User to a public Recipe.';
COMMENT ON COLUMN Vote.Rating IS 'Number of stars (1-5)';
COMMENT ON COLUMN Vote.Username IS 'Unique name that identifies a user in the database';
COMMENT ON COLUMN Vote.Id IS 'ID Identifier of a recipe';
COMMENT ON COLUMN Vote.Comment IS 'Comment A short review of the recipe';

CREATE TABLE Add(
    InvitedUsername VARCHAR,
    Id UUID,
    PRIMARY KEY (InvitedUsername, Id),
    FOREIGN KEY (InvitedUsername) REFERENCES AutoChefUser(Username),
    FOREIGN KEY (Id) REFERENCES UserGroup(Id)
);

COMMENT ON TABLE Add IS 'Addition of a User to a group created by a User.';
COMMENT ON COLUMN Add.InvitedUsername IS 'Unique name that identifies a user in the database';
COMMENT ON COLUMN Add.Id IS 'Identifier of the group';

CREATE TABLE Menu(
    MenuDate DATE NOT NULL,
    Name VARCHAR NOT NULL,
    PlanId UUID NOT NULL,
    Id UUID,
    PRIMARY KEY (Id),
    FOREIGN KEY (PlanId) REFERENCES EatingPlan(Id),
    FOREIGN KEY (Name) REFERENCES Meal(Name)
);

COMMENT ON TABLE Menu IS 'Set of dishes that are served during a meal.';
COMMENT ON COLUMN Menu.MenuDate IS 'Day in which the menu will be prepared';
COMMENT ON COLUMN Menu.Name IS 'Name that identifies the meal';
COMMENT ON COLUMN Menu.PlanId IS 'Identifier of the eating plan';
COMMENT ON COLUMN Menu.Id IS 'Identifier of the menu';

CREATE TABLE Include1 (
    MenuId UUID,
    RecipeId UUID,
    Name VARCHAR,
    PRIMARY KEY (MenuId, RecipeId, Name),
    FOREIGN KEY (MenuId) REFERENCES Menu(Id),
    FOREIGN KEY (RecipeId) REFERENCES Recipe(Id),
    FOREIGN KEY (Name) REFERENCES Course(Name)
);

COMMENT ON TABLE Include1 IS 'Addition of a Recipe to a specific Course in a Menu.';
COMMENT ON COLUMN Include1.MenuId IS 'Identifier of the menu';
COMMENT ON COLUMN Include1.RecipeId IS 'Identifier of the recipe';
COMMENT ON COLUMN Include1.Name IS 'Name of the course';

CREATE TABLE Include2(
    Id UUID,
    CourseName VARCHAR,
    ProductName VARCHAR,
    Amount INTEGER NOT NULL CHECK (Amount > 0),
    PRIMARY KEY (Id, CourseName, ProductName),
    FOREIGN KEY (Id) REFERENCES Menu(Id),
    FOREIGN KEY (ProductName) REFERENCES Product(Name),
    FOREIGN KEY (CourseName) REFERENCES Course(Name)
);

COMMENT ON TABLE Include2 IS 'Addition of a Product to a specific Course in a Menu.';
COMMENT ON COLUMN Include2.Id IS 'Identifier of the menu';
COMMENT ON COLUMN Include2.CourseName IS 'Name of the course';
COMMENT ON COLUMN Include2.ProductName IS 'Name of the product';
COMMENT ON COLUMN Include2.Amount IS 'Amount of product included in the menu';

CREATE TABLE Require1(
    Id UUID,
    Name VARCHAR,
    PRIMARY KEY (Id, Name),
    FOREIGN KEY (Id) REFERENCES UserGroup(Id),
    FOREIGN KEY (Name) REFERENCES FoodNecessity(Name)
);

COMMENT ON TABLE Require1 IS 'Associates a Group to a set of Food Necessities (allergies or food preferences).';
COMMENT ON COLUMN Require1.Id IS 'Identifier of the group';
COMMENT ON COLUMN Require1.Name IS 'Name of the allergy or of the food preference';

CREATE TABLE Require2(
    Id UUID,
    Name VARCHAR,
    Amount INTEGER NOT NULL,
    PRIMARY KEY (Id, Name),
    FOREIGN KEY (Id) REFERENCES UserGroup(Id),
    CONSTRAINT Quantity CHECK (Amount>0),
    FOREIGN KEY (Name) REFERENCES Nutrient(Name)
);

COMMENT ON TABLE Require2 IS 'Associates the Group to the amount of the Nutrient needed.';
COMMENT ON COLUMN Require2.Id IS 'Identifier of the group';
COMMENT ON COLUMN Require2.Name IS 'Name of the nutrient';
COMMENT ON COLUMN Require2.Amount IS 'Quantity of nutrient needed by a group';
