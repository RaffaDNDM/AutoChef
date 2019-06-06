import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.SQLWarning;
import java.util.ArrayList;
import java.util.Scanner;

public class AutoChef
{
	/* Database connection information. */
	private static final String DRIVER = "org.postgresql.Driver";
	private static final String DATABASE = "jdbc:postgresql://localhost/autochef";
	private static final String USER = "postgres";
	private static final String PASSWORD = "postgres";

	/* Queries. */
	private static final String SQL0 = "SELECT Name, Surname, Birthdate, Sex  FROM AutoChefUser;";
	private static final String SQL1 = "SELECT PlanRecipe.Name, count(PlanRecipe.PlanID) FROM (  SELECT DISTINCT Menu.PlanID, RecipeMenu.Name  FROM Menu INNER JOIN  (  SELECT Include1.MenuID, Recipe.Name FROM Recipe INNER JOIN Include1 ON Recipe.id = Include1.RecipeID  ) AS RecipeMenu   ON Menu.ID=RecipeMenu.MenuID ) AS PlanRecipe GROUP BY PlanRecipe.Name;";

	/**********MAIN**********/
	public static void main(String[] args)
	{
		/* Variable initialization. */
		Connection con = null; //Connection to the database.
		Statement stmt = null; //Statement object needed to execute SQL queries.
		ResultSet rs = null; //Query results.
		/* Time monitoring variables. */
		long start = 0;
		long end = 0;
		/* Variables that represent a user (Query 0)*/
		String Name = null;
		String Surname  = null;
		Date Birthdate = null;
		String Sex = null;
		/* Variables of query 1. */
		String PlanRecipe = null;
		Integer CountRecipe = null;
		/* Variables of query 2/3. */
		String ProductName = null;
		Integer Amount = null;
		String UnitName = null;
		BigDecimal Cost = null;
        /* Standard input wrapper. */
        Scanner input = null;
        
        /* Interface init. */
        System.out.println();
        System.out.println("                  Welcome to AutoChef!!                  ");
        System.out.println("---------------------------------------------------------");
        System.out.println();
        
		/* Driver registration*/
		try
		{
            start = System.currentTimeMillis();
			Class.forName(DRIVER);
            end = System.currentTimeMillis();
			System.out.printf("Driver registration: OK  (%,3d ms)%n", end-start);
		}
		catch (ClassNotFoundException e)
		{
            System.out.println("Driver registration: FAILED%n");
			System.out.printf("Driver %s not found: %s.%n", DRIVER, e.getMessage());
			System.exit(-1);
		}

		/* Database connection and statement creation. */
		try
		{
			/* Connect to the database. */
			start = System.currentTimeMillis();
			con = DriverManager.getConnection(DATABASE, USER, PASSWORD);
			end = System.currentTimeMillis();
			System.out.printf("Database connection: OK  (%,3d ms)%n", end-start);

			/* Create a statement. */
			start = System.currentTimeMillis();
			stmt = con.createStatement();
			end = System.currentTimeMillis();
			System.out.printf("Statement creation:  OK  (%,3d ms)%n", end-start);
            
            start = System.currentTimeMillis();
            input = new Scanner(System.in);
            end = System.currentTimeMillis();
            System.out.printf("Input startup:       OK  (%,3d ms)%n", end-start);
		}
		catch (SQLException e)
		{
			System.out.printf("Database access error:%n");
			printErrorMessages(e);
			releaseResources(con, stmt, rs);
			System.exit(-1);
		}
        
        /* Query start interface. */
        System.out.println();
        System.out.println("                      System ready                       ");
        System.out.println("---------------------------------------------------------");        
        System.out.println();

        System.out.println("Press enter to continue...");
        input.nextLine();
        
		/* First query: SQL0. */
		try
		{
			start = System.currentTimeMillis();
			rs = stmt.executeQuery(SQL0);
			end = System.currentTimeMillis();

			/* Gather and print the query results. */
			System.out.println("                     Autochef Users                      ");
			System.out.println("---------------------------------------------------------");

			while (rs.next())
			{
				Name = rs.getString("Name");
				Surname = rs.getString("Surname");
				Birthdate = rs.getDate("Birthdate");
				Sex = rs.getString("Sex");
				System.out.printf("- %12s, %15s, %13s, %9s%n", Name, Surname, Birthdate.toString(), Sex);
			}
			System.out.println("---------------------------------------------------------");
            
            System.out.println();
            System.out.printf("Query 1 successful (%,d ms)%n", end-start);
			System.out.println();

		}
		catch (SQLException e)
		{
			System.out.printf("Database access error:%n");
			printErrorMessages(e);
			releaseResources(con, stmt, rs);
			System.exit(-1);
		}
        
        System.out.println("Press enter to continue...");
        input.nextLine();

		/* Second query: SQL1. */
		try
		{
			start = System.currentTimeMillis();
			rs = stmt.executeQuery(SQL1);// SQL1
			end = System.currentTimeMillis();

			/* Gather and print the query results. */
			System.out.println("\n  Number of plans that contain each recipe  ");
			System.out.println("---------------------------------------------");
			while (rs.next())
			{
				PlanRecipe = rs.getString("Name");
				CountRecipe = rs.getInt("count");
				System.out.printf("- %35s, %6s%n", PlanRecipe, CountRecipe.toString());

			}
			System.out.println("---------------------------------------------\n");
            
            System.out.printf("Query 2 successful (%,d ms)%n", end-start);
			System.out.println();
		}
		catch (SQLException e)
		{
			System.out.printf("Database access error:%n");
			printErrorMessages(e);
			releaseResources(con, stmt, rs);
			System.exit(-1);
		}

		/* Creation and display of a shopping list for a specific user. */
		try
		{
			boolean flag= false;

			while(!flag)
			{
				System.out.println("Insert your Autochef Username (or q to exit)");
				String line = input.nextLine();

				//exit condition from the database
				if(line.compareTo("q")==0)
				{
					flag=true;
				}
				else
				{
					int i = 0;
					ArrayList<String> all_GroupIDs=new ArrayList<>();

					//Search the username in the database
					start = System.currentTimeMillis();
					rs = stmt.executeQuery("SELECT * FROM find_user('"+line+"');");
					end = System.currentTimeMillis();
                    
                    System.out.println();
                    System.out.printf("Query successful (%,d ms)\n", end-start);
                    System.out.println();

					int groupCount = 0;
					i=1;
					String output = "";

					//Print the list of all groups of the user
					while (rs.next())
					{
						groupCount++;

						all_GroupIDs.add(rs.getString("GroupId"));
						output += String.format("%2d: %12s%n", i, rs.getString("GroupName"));
						i++;
					}

					if (groupCount != 0)
					{
						//If the username is found
						System.out.println("\n  Your groups  ");
						System.out.println("----------------");
						System.out.println(output);

						//Ask to the user which group they want to select
						System.out.println("----------------");
						int choice1=0;
						while(choice1<1 || choice1>=i)
						{
							System.out.println("\nChoose your group number (1-"+(i-1)+")");
							try
							{
								choice1=Integer.parseInt(input.nextLine());
							}
							catch(NumberFormatException e)
							{
								System.out.println("\n You must enter an integer");
								choice1=0;
							}
						}

						//Search all eating plans of the chosen group
						String SQL2 ="SELECT * FROM find_plans('"+all_GroupIDs.get(choice1-1)+"');";
						start = System.currentTimeMillis();
						rs = stmt.executeQuery(SQL2);
						end = System.currentTimeMillis();
                        
                        System.out.println();
						System.out.printf("Query successful (%,d ms)%n", end-start);
                        System.out.println();

						ArrayList<String> all_PlanIDs=new ArrayList<>();

						i=1;

						System.out.println("\n        Available plans      ");
						System.out.println("-------------------------------");


						while (rs.next())
						{
							//Print the list of all eating plans of the chosen group
							all_PlanIDs.add(rs.getString("Id"));
							System.out.printf("%2d: %27s%n", i, rs.getDate("StartDate")+" / "+rs.getDate("EndDate"));
							i++;
						}
						System.out.println("-------------------------------");

						//Ask to the user which eating plan they want to select
						int choice2=0;
						while(choice2<1 || choice2>=i)
						{

							System.out.println("\nChoose your plan number (1-"+(i-1)+")");
							try
							{
								choice2=Integer.parseInt(input.nextLine());
							}
							catch(NumberFormatException e)
							{
								System.out.println("\n TYou must enter an integer");
								choice2=0;
							}
						}

						//Initialization of the shopping list for this eating plan
						String SQL3 = "SELECT initial_shopping_list('"+ all_GroupIDs.get(choice1-1) +"', '"+ all_PlanIDs.get(choice2-1) +"');";
						start = System.currentTimeMillis();
						rs = stmt.executeQuery(SQL3);
						end = System.currentTimeMillis();
                        
                        System.out.println();
						System.out.printf("Query successful (%,d ms)%n", end-start);
                        System.out.println();
						
                        /* Detect trigger activation. */
                        System.out.println();
                        SQLWarning warning = stmt.getWarnings();
                        while (warning != null)
                        {
                            System.out.println(warning.getMessage());
                            warning = warning.getNextWarning();
                        }
                        System.out.println();

						//Retrieve relevant information for the shopping list
						String SQL4 = "SELECT * FROM print_shopping_list('"+all_GroupIDs.get(choice1-1)+"', '"+all_PlanIDs.get(choice2-1) +"');";
						start = System.currentTimeMillis();
						rs = stmt.executeQuery(SQL4);
						end = System.currentTimeMillis();
                        System.out.println();
						System.out.printf("Query successful (%,d ms)%n", end-start);
                        System.out.println();
                        

						/* Gather and print the query results. */
						System.out.println("\n             Shopping list          ");
						System.out.println("--------------------------------------");
						while (rs.next())
						{
							ProductName = rs.getString("Name");
							Amount = rs.getInt("Amount");
							UnitName = rs.getString("UnitName");
							Cost = rs.getBigDecimal("Cost");
							System.out.printf("- %15s, %5s, %5s, %5s%n", ProductName, Amount.toString(), UnitName, Cost.toString());
						}
						System.out.println("--------------------------------------");
						System.out.println();
                        System.out.println();
					}
					else
					{
						//if the username is not found in table AutoChefUser
						System.out.println("This username doesn't exist, try again");
						System.out.println("----------------");
                        System.out.println();
					}

				}
			}

			input.close();
		}
		catch (SQLException e)
		{
			System.out.printf("Database access error:%n");
			printErrorMessages(e);
			releaseResources(con, stmt, rs);
			System.exit(-1);
		}

		/* Release the resources and end the program. */
		releaseResources(con, stmt, rs);
		System.out.printf("Program end.%n");

	}

	/* Print error messages related to an SQLException. */
	private static void printErrorMessages(SQLException e)
	{
		while (e != null)
		{
			System.out.printf("- Message: %s%n", e.getMessage());
			System.out.printf("- SQL status code: %s%n", e.getSQLState());
			System.out.printf("- SQL error code: %s%n", e.getErrorCode());
			System.out.printf("%n");
			e = e.getNextException();
		}
	}

	/* Release the database resources. */
	private static void releaseResources(Connection con, Statement stmt, ResultSet rs)
	{
		long start = 0;
		long end = 0;
        System.out.println();
        System.out.println("Closing connection...");
        
		try
		{
			/* Close the result set. */
			if (rs != null)
			{
				start = System.currentTimeMillis();
				rs.close();
				end = System.currentTimeMillis();

				System.out.printf("Result set: CLOSED (%,d ms)%n", end-start);
			}

			/* Close the statement. */
			if (stmt != null)
			{
				start = System.currentTimeMillis();
				stmt.close();
				end = System.currentTimeMillis();

				System.out.printf("Statement:  CLOSED (%,d ms)%n", end-start);
			}

			/* Close the connection. */
			if (con != null)
			{
				start = System.currentTimeMillis();
				con.close();
				end = System.currentTimeMillis();

				System.out.printf("Connection: CLOSED (%,d ms)%n", end-start);
			}
            
            System.out.println();
			System.out.printf("Connection closed.%n");

		}
		catch (SQLException e)
		{
			System.out.printf("Error while releasing resources:%n");
			printErrorMessages(e);
		}
		finally
		{
			/* Release resources to the garbage collector. */
			rs = null;
			stmt = null;
			con = null;
			System.out.printf("Resources released to the garbage collector.%n");
		}
	}
}
