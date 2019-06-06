--Compute the shopping list for a given group and eating plan and add it to Buy.
CREATE OR REPLACE FUNCTION initial_shopping_list(param_GroupId UUID, param_PlanId UUID)
RETURNS VOID AS $$
BEGIN
	WITH shopping_list AS (
		--Select all products directly included in the eating plan.
		SELECT
			EatingPlan.GroupId AS UserGroupId,
			EatingPlan.Id AS EatingPlanId,
			Product.Name,
			Include2.Amount
		FROM EatingPlan
		INNER JOIN Menu ON EatingPlan.Id = Menu.PlanId
		INNER JOIN Include2 ON Menu.Id = Include2.Id
		INNER JOIN Product ON Include2.ProductName = Product.Name
		WHERE (EatingPlan.GroupId = param_GroupId
		     AND EatingPlan.Id = param_PlanId)

		UNION ALL --Put together all products required for the eating plan.

		--Select all products needed to prepare recipes included in the current eating plan.
		SELECT
			EatingPlan.GroupId AS UserGroupId,
			EatingPlan.Id AS EatingPlanId,
			Product.Name,
			MadeWith.Amount
		FROM EatingPlan
		INNER JOIN Menu ON EatingPlan.Id = Menu.PlanId
		INNER JOIN Include1 ON Menu.Id = Include1.MenuId
		INNER JOIN Recipe ON Include1.RecipeId = Recipe.Id
		INNER JOIN MadeWith ON Recipe.Id = MadeWith.Id
		INNER JOIN Product ON MadeWith.Name = Product.Name
		WHERE (EatingPlan.GroupId = param_GroupId
		     AND EatingPlan.Id = param_PlanId)
	), pantry AS (
		--Select all products already present in the group's pantry.
		SELECT *
		FROM store
		WHERE Store.GroupId = param_GroupId
	), temp_list AS (
		--Sum the amounts of duplicate products in shopping_list.
		SELECT
			UserGroupId,
			EatingPlanId,
			shopping_list.Name,
			SUM(shopping_list.Amount) AS amount
		FROM shopping_list
		GROUP BY shopping_list.Name, EatingPlanId, UserGroupId
	), item_list AS (
		--Compute the final shopping list taking into account the group's pantry.
		SELECT
			temp_list.UserGroupId AS GroupId,
			temp_list.EatingPlanId AS EatingPlanId,
			temp_list.Name AS ProductName,
		CASE WHEN pantry.Name IS NOT NULL THEN
			temp_list.Amount - pantry.Amount
		ELSE
			temp_list.Amount
		END AS necessary_amount
		FROM temp_list
		FULL OUTER JOIN pantry ON temp_list.Name = pantry.Name
		WHERE (
			CASE WHEN pantry.Name IS NOT NULL THEN
				temp_list.Amount - pantry.Amount > 0
			ELSE
				temp_list.Amount > 0
			END)
	)
	INSERT INTO Buy SELECT * FROM item_list;
END
$$ LANGUAGE PLPGSQL;

--Return the most relevant information of the shopping list.
CREATE OR REPLACE FUNCTION print_shopping_list(param_GroupId UUID, param_PlanId UUID)
RETURNS TABLE(Name VARCHAR, Amount INTEGER, UnitName VARCHAR, Cost NUMERIC(1000,2)) AS $$
BEGIN
	RETURN QUERY SELECT
		Product.Name,
		Buy.Amount,
		Product.UnitName,
		TRUNC(((Product.AverageCost * Buy.Amount) / 100),2) AS Cost
	FROM Buy
		INNER JOIN Product ON Buy.Name = Product.Name
	WHERE (Buy.GroupId = param_GroupId
		   AND Buy.PlanId = param_PlanId);
END
$$ LANGUAGE PLPGSQL;

--Return the list of groups for a given user.
CREATE OR REPLACE FUNCTION find_user(param_Username VARCHAR)
RETURNS TABLE(GroupId UUID, GroupName VARCHAR) AS $$
BEGIN
	RETURN QUERY SELECT
		UserGroup.Id,
		UserGroup.Name
	FROM AutoChefUser
		INNER JOIN UserGroup ON UserGroup.Username = param_Username

	UNION

	SELECT
		UserGroup.Id,
		UserGroup.Name
	FROM AutoChefUser
		INNER JOIN Add ON Add.InvitedUsername = param_Username
		INNER JOIN UserGroup ON UserGroup.Id = Add.Id;
END
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION find_plans(param_GroupId UUID)
RETURNS TABLE(Id UUID, StartDate DATE, EndDate DATE) AS $$
BEGIN
	RETURN QUERY SELECT
		EatingPlan.Id,
		EatingPlan.StartDate,
		EatingPlan.EndDate
	FROM EatingPlan
	WHERE EatingPlan.GroupId=param_GroupId;
END
$$ LANGUAGE PLPGSQL;
