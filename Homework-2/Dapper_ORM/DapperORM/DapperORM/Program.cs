using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Dapper;

namespace DapperORM
{
    class Program
    {
        static void Main(string[] args)
        {
            using (IDbConnection con = new SqlConnection("Data Source =Bahar\\SQLEXPRESS; Initial Catalog =Course; Integrated Security = True;"))
            {

                con.Open();

                var students = new[] { new { Name = "Mehmet", Student_number = 35, Class = 1, Major = "Statistics" }, new { Name = "Kate", Student_number = 36, Class = 2, Major = "Fine-Arts" } };

                con.Execute("INSERT INTO Student(Name, Student_number, Class, Major) VALUES (@Name, @Student_number, @Class, @Major)", students);

                String query = "select * from Student";

                List<Student> studentList = con.Query<Student>(query).ToList();
                foreach (var stu in studentList)
                {
                    Console.WriteLine(stu.Name.ToString() + " " + stu.Class.ToString() + " " + stu.Major.ToString());

                }

                con.Close();

            }
        }
    }
}
