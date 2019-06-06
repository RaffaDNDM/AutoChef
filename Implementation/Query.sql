-- Take all groups linked to a certain user and print the resulting eating plan
WITH linked_groups AS(
	SELECT
		usergroup.name,
		usergroup.id
	FROM autochefuser
		INNER JOIN usergroup ON usergroup.username = autochefuser.username
	WHERE usergroup.username = 'jsimonato3'

	UNION

	SELECT
		usergroup.name,
		usergroup.id
	FROM usergroup
		INNER JOIN add ON usergroup.id = add.id
	WHERE add.invitedusername = 'jsimonato3'
), plan_recipes AS(
	SELECT
		linked_groups.name as groupname,
		menu.menudate,
		menu.name as meal,
		include1.name as course,
		recipe.name as menu
	FROM linked_groups
		INNER JOIN eatingplan ON linked_groups.id = eatingplan.groupid
		INNER JOIN menu ON menu.planid = eatingplan.id
		INNER JOIN include1 ON include1.menuid = menu.id
		INNER JOIN recipe ON include1.recipeid = recipe.id
), plan_products AS(
	SELECT
		linked_groups.name as groupname,
		menu.menudate,
		menu.name as meal,
		include2.coursename as course,
		include2.productname as menu
	FROM linked_groups
		INNER JOIN eatingplan ON linked_groups.id = eatingplan.groupid
		INNER JOIN menu ON menu.planid = eatingplan.id
		INNER JOIN include2 ON include2.id = menu.id
)
SELECT * FROM plan_recipes UNION SELECT * FROM plan_products
ORDER BY menudate ASC;


--Print the list of recipes and the number of eating plans in which they are included.
SELECT
	PlanRecipe.Name,
	count(PlanRecipe.PlanID)
FROM
(
  SELECT DISTINCT
	  Menu.PlanID,
	  RecipeMenu.Name
  FROM Menu
    INNER JOIN
    (
      SELECT
	  	Include1.MenuID,
		Recipe.Name
      FROM Recipe
        INNER JOIN Include1 ON Recipe.id = Include1.RecipeID
    ) AS RecipeMenu
    ON Menu.ID = RecipeMenu.MenuID
) AS PlanRecipe
GROUP BY PlanRecipe.Name;

--Print the list of products and the number of recipes in which they are contained.
SELECT
	Product.Name,
	count(Recipe.Id)
FROM Product
	INNER JOIN MadeWith ON Product.Name = MadeWith.Name
    INNER JOIN Recipe ON Recipe.Id = MadeWith.Id
GROUP BY Product.Name;

--Print the list of recipes with their author and average rating.
SELECT
	Recipe.Name,
	Recipe.Username,
	TRUNC(AVG(Vote.Rating),2) AS Average
FROM Recipe
  	INNER JOIN Vote ON Recipe.Id = Vote.Id
    GROUP BY Recipe.Id;
