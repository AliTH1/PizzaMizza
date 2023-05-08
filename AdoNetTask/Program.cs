using AdoNetTask.Constants;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;


Start:
Console.WriteLine("Select operations: ");
Console.WriteLine("1. Show all pizzas");
Console.WriteLine("2. Create new pizza");
Console.Write("Choise: ");
int answer = Convert.ToInt32(Console.ReadLine());
Console.Clear();

if (answer == 1)
{

    GetAllPizzaInfo();
    Console.Write("If you want to learn more about a pizza," +
    " enter the ID of the pizza. If you want to return - enter 0: ");
    answer = Convert.ToInt32(Console.ReadLine());

    if (answer == 0)
    {
        Console.Clear();
        goto Start;
    }
}
else if (answer == 2)
{
    string namePizza = Console.ReadLine();


}

void GetAllPizzaInfo()
{
    using (SqlConnection sqlConnection = new SqlConnection(Urls.connectionString))
    {
        sqlConnection.Open();
        string commandText = "SELECT p.Id, p.Name, pt.TypeId, ps.Price" +
            " FROM Pizzas AS p" +
            " INNER JOIN PizzaTypes AS pt" +
            " ON p.Id = pt.PizzaId" +
            " INNER JOIN Prices AS ps" +
            " ON ps.PizzaId = p.Id";
        using (SqlCommand sqlCommand = new SqlCommand(commandText, sqlConnection))
        {

            using (SqlDataReader reader = sqlCommand.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Console.WriteLine("Id: " + reader.GetInt32(0));
                        Console.WriteLine("Name: " + reader.GetString(1));
                        Console.WriteLine("TypeId: " + reader.GetInt32(2));
                        Console.WriteLine("Price: {0}AZN", reader.GetInt32(3));
                        Console.WriteLine("\r");
                    }
                }
                else
                {
                    Console.WriteLine("Table is empty");
                }
            }
        }
    }
}


void CreateNewPizza(string name, string description, int categorieId)
{
    using (SqlConnection sqlConnection = new SqlConnection(Urls.connectionString))
    {
        sqlConnection.Open();

        string commandText = "";


    }
}


SqlParameter CreateSqlParameter(string name, SqlDbType sqlDbType, object newObj)
{
    SqlParameter sqlParameter = new SqlParameter(name, sqlDbType);
    sqlParameter.Value = newObj;
    return sqlParameter;
}