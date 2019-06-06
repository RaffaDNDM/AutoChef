--Connect to autochef database
\c autochef

--Update the Buy table.
CREATE OR REPLACE FUNCTION update_shopping_list() RETURNS TRIGGER AS $$
BEGIN
	--Check whether the product needed is already present in the shopping list.
	PERFORM GroupId, PlanId, Name
	FROM Buy
	WHERE (Buy.GroupId = NEW.GroupId AND Buy.PlanId = NEW.PlanId AND Buy.Name = NEW.Name);
	--If it is, then delete the previous row.
	IF FOUND THEN
		RAISE NOTICE 'Trigger activated';
		DELETE FROM Buy
		WHERE (Buy.GroupId = NEW.GroupId AND Buy.PlanId = NEW.PlanId AND Buy.Name = NEW.Name);
	END IF;

	RETURN NEW;
END
$$ LANGUAGE PLPGSQL;

--Trigger that activates before any insert is executed on Buy.
CREATE TRIGGER shopping_list_trigger BEFORE INSERT
ON Buy
FOR EACH ROW
EXECUTE PROCEDURE update_shopping_list();
