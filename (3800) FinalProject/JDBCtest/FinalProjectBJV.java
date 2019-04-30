import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.io.BufferedReader;
import java.io.InputStreamReader;

/*
 * 		CSC 3800 Final Project
 * 		Created by:
 * 		Brandan Riley
 * 		Javon Gilchrist
 * 		Victor Borrome 
 * 
 * 
 ******************************/



public class FinalProjectBJV {

	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/movieTheater";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "rootpassword";

	public static void main(String[] args) {
		Connection conn = null;

		try {
			// Step 0: Read inputs for later on

			// Scanner scanner = new Scanner(System.in);
			BufferedReader scanner = new BufferedReader(new InputStreamReader(System.in));

			// STEP 2: Register JDBC driver
			Class.forName(JDBC_DRIVER).newInstance();

			// STEP 3: Open a connection
			System.out.println("Connecting to the database...");
			Thread.sleep(1000);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: List names of tables
			System.out.println("The tables in this database are as follows: " + "\n" + "Movie" + "\nActor" + "\nActsIn"
					+ "\nDirector" + "\nDirects" + "\nTheater" + "\nScreen" + "\nPlayingInScreen" + "\nTicket"
					+ "\nStaff" + "\nPosition" + "\nStaffPosition" + "\nStaffSalary");

			String repeat = null;
			do {

				// Step 5: Take user input
				System.out.println("\nWhich table would you like to perform an operation on?");

				String tableName = scanner.readLine();

				String sql = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				java.sql.ResultSetMetaData rsmd = null;

				switch (tableName) {
				case "Movie":
					System.out.print("The columns for Movie are as follows: \n\n");
					System.out.printf("%-25s%s\n", "MovieId", "Char 8");
					System.out.printf("%-25s%s\n", "MovieName", "Varchar 100");
					System.out.printf("%-25s%s\n", "MovieDescription", "Varchar 1024");
					System.out.printf("%-25s%s\n", "MovieRating", "Varchar 5");
					System.out.printf("%-25s%s\n", "MovieReleaseDate", "Date");
					System.out.printf("%-25s%s\n", "MovieLength", "Int");

					System.out.println("\nYou can perform a SELECT, INSERT, or DELETE on this table."
							+ " What would you like to do? Enter S, I, D, or N for none: ");

					String movieChoice = scanner.readLine();
					switch (movieChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "I":
						System.out.println("Please enter your INSERT INTO query now, following the"
								+ " constraints for the record." + "\nEnter INSERT INTO and VALUES on the same line.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						stmt.executeUpdate(sql);
						stmt.close();
						System.out.print("INSERT INTO completed!");
						break;

					case "D":
						System.out.println("Please enter your DELETE query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						stmt.executeUpdate(sql);
						stmt.close();
						System.out.print("DELETE completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}

					break;

				case "Actor":
					System.out.print("The columns for Actor are as follows: \n");
					System.out.printf("%-25s%s\n", "ActorId", "Char 8");
					System.out.printf("%-25s%s\n", "ActorName", "Varchar 40");
					System.out.printf("%-25s%s\n", "ActorGender", "Char");
					System.out.printf("%-25s%s\n", "ActorDOB", "Date");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String actorChoice = scanner.readLine();
					switch (actorChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;
				case "ActsIn":
					System.out.print("The columns for ActsIn are as follows: \n");
					System.out.printf("%-25s%s\n", "ActorId", "Char 8");
					System.out.printf("%-25s%s\n", "MovieId", "Char 8");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String actsInChoice = scanner.readLine();
					switch (actsInChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;

				case "Director":
					System.out.print("The columns for Director are as follows: \n");
					System.out.printf("%-25s%s\n", "DirectorId", "Char 8");
					System.out.printf("%-25s%s\n", "DirectorName", "Varchar 40");
					System.out.printf("%-25s%s\n", "DirectorGender", "Char");
					System.out.printf("%-25s%s\n", "DirectorDOB", "Date");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String directorChoice = scanner.readLine();
					switch (directorChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;

				case "Directs":
					System.out.print("The columns for Directs are as follows: \n");
					System.out.printf("%-25s%s\n", "DirectorId", "Char 8");
					System.out.printf("%-25s%s\n", "MovieId", "Char 8");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String directsChoice = scanner.readLine();
					switch (directsChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;

				case "Theater":
					System.out.print("The columns for Theater are as follows: \n");
					System.out.printf("%-25s%s\n", "TheaterId", "Char 8");
					System.out.printf("%-25s%s\n", "TheaterName", "Varchar 40");
					System.out.printf("%-25s%s\n", "StreetAddress", "Varchar 100");
					System.out.printf("%-25s%s\n", "City", "Varchar 40");
					System.out.printf("%-25s%s\n", "State", "Varchar 2");
					System.out.printf("%-25s%s\n", "ZipCode", "Varchar 5");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String theaterChoice = scanner.readLine();
					switch (theaterChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;
					
				case "Screen":
					System.out.print("The columns for Screen are as follows: \n");
					System.out.printf("%-25s%s\n", "ScreenId", "Char 8");
					System.out.printf("%-25s%s\n", "TheaterId", "Char 8");
					System.out.printf("%-25s%s\n", "ScreenName", "Varchar 40");
					System.out.printf("%-25s%s\n", "ScreenSeatingCapacity", "Int");

					System.out.println("You can perform a SELECT, INSERT, or DELETE on this table."
							+ " What would you like to do? Enter S, I, D, or N for none: ");

					String screenChoice = scanner.readLine();
					switch (screenChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "I":
						System.out.println("Please enter your INSERT INTO query now, following the"
								+ " constraints for the record." + "\nEnter INSERT INTO and VALUES on the same line.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						stmt.executeUpdate(sql);
						stmt.close();
						System.out.print("INSERT INTO completed!");
						break;

					case "D":
						System.out.println("Please enter your DELETE query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						stmt.executeUpdate(sql);
						stmt.close();
						System.out.print("DELETE completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;

				case "PlayingInScreen":
					System.out.print("The columns for PlayingInScreen are as follows: \n");
					System.out.printf("%-25s%s\n", "ScreenId", "Char 8");
					System.out.printf("%-25s%s\n", "TheaterId", "Char 8");
					System.out.printf("%-25s%s\n", "MovieId", "Char 8");
					System.out.printf("%-25s%s\n", "StartTime", "Date");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String playingInScreenChoice = scanner.readLine();
					switch (playingInScreenChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;

				case "Ticket":
					System.out.print("The columns for Ticket are as follows: \n");
					System.out.printf("%-25s%s\n", "TicketId", "Char 8");
					System.out.printf("%-25s%s\n", "TheaterId", "Char 8");
					System.out.printf("%-25s%s\n", "ScreenId", "Char 8");
					System.out.printf("%-25s%s\n", "StartTime", "Date");
					System.out.printf("%-25s%s\n", "Price", "Int");
					System.out.printf("%-25s%s\n", "StaffId", "Char 8");
					System.out.printf("%-25s%s\n", "SellingTimestamp", "Date");

					System.out.println("You can perform a SELECT, INSERT, or DELETE on this table."
							+ " What would you like to do? Enter S, I, D, or N for none: ");

					String ticketChoice = scanner.readLine();
					switch (ticketChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "I":
						System.out.println("Please enter your INSERT INTO query now, following the"
								+ " constraints for the record." + "\nEnter INSERT INTO and VALUES on the same line.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						stmt.executeUpdate(sql);
						stmt.close();
						System.out.print("INSERT INTO completed!");
						break;

					case "D":
						System.out.println("Please enter your DELETE query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						stmt.executeUpdate(sql);
						stmt.close();
						System.out.print("DELETE completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;

				case "Staff":
					System.out.print("The columns for Staff are as follows: \n");
					System.out.printf("%-25s%s\n", "StaffId", "Char 8");
					System.out.printf("%-25s%s\n", "StaffName", "Varchar 40");
					System.out.printf("%-25s%s\n", "StaffStreetAddress", "Varchar 100");
					System.out.printf("%-25s%s\n", "StaffCity", "Varchar 20");
					System.out.printf("%-25s%s\n", "StaffState", "Varchar 2");
					System.out.printf("%-25s%s\n", "StaffZipcode", "Varchar 5");
					System.out.printf("%-25s%s\n", "StaffPhoneNumber", "Varchar 16");
					System.out.printf("%-25s%s\n", "StaffEmail", "Varchar 40");
					System.out.printf("%-25s%s\n", "Gender", "Char");
					System.out.printf("%-25s%s\n", "SSN", "Varchar 9");
					System.out.printf("%-25s%s\n", "DOB", "Date");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String staffChoice = scanner.readLine();
					switch (staffChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;

				case "Position":
					System.out.print("The columns for Position are as follows: \n");
					System.out.printf("%-25s%s\n", "PositionId", "Char 8");
					System.out.printf("%-25s%s\n", "PositionName", "Varchar 20");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String positionChoice = scanner.readLine();
					switch (positionChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;

				case "StaffPosition":
					System.out.print("The columns for Screen are as follows: \n");
					System.out.printf("%-25s%s\n", "StaffId", "Char 8");
					System.out.printf("%-25s%s\n", "PositionId", "Char 8");
					System.out.printf("%-25s%s\n", "Theater", "Char 8");
					System.out.printf("%-25s%s\n", "StartingDate", "Date");
					System.out.printf("%-25s%s\n", "EndingDate", "Date");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String staffPositionChoice = scanner.readLine();
					switch (staffPositionChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;

				case "StaffSalary":
					System.out.print("The columns for StaffSalary are as follows: \n");
					System.out.printf("%-25s%s\n", "StaffId", "Char 8");
					System.out.printf("%-25s%s\n", "PositionId", "Char 8");
					System.out.printf("%-25s%s\n", "Salary", "Int");
					System.out.printf("%-25s%s\n", "EffectiveDate", "Date");

					System.out.println("You can perform a SELECT on this table."
							+ " What would you like to do? Enter S, or N for none.");

					String staffSalaryChoice = scanner.readLine();
					switch (staffSalaryChoice) {

					case "S":
						System.out.println("Please enter your SELECT query now.");
						sql = scanner.readLine();
						stmt = conn.prepareStatement(sql);
						rs = stmt.executeQuery();
						rsmd = rs.getMetaData();
						int columnNum = rsmd.getColumnCount();

						while (rs.next()) {
							for (int i = 1; i <= columnNum; i++) {
								if (i > 1)
									System.out.print("");
								String columnVal = rs.getString(i);
								System.out.printf("%-30s", columnVal);
							}
							System.out.println("");
						}
						System.out.print("\nSELECT completed!");
						break;

					case "N":
						System.out.print("None selected...");
						break;

					default:
						System.out.println("You did not enter a valid choice.");
					}
					break;
					
				default:
					System.out.println("*WARNING* Please enter a valid table name. *WARNING*");
				}

				System.out.println("\nWould you like to Restart (yes) or Quit (no)?");
				try {
					repeat = scanner.readLine();
				} catch (Exception e) {
					System.out.print("Invalid input, restarting program...");
					Thread.sleep(1000);
				}
			} while (repeat.equals("yes"));

			scanner.close();
			System.out.print("\nCommitting data then closing connection...");
			conn.close();
			Thread.sleep(1000);
			System.out.print("connection closed. Until next time!");

		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		}
	}
}
