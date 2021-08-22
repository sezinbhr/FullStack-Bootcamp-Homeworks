using System;

namespace Extension_Method
{
    class Program//Define the class name
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Do you wanna play a game?");
            Console.WriteLine("Enter a number between 1 and 100:");
            string input = Console.ReadLine();
            input.PositiveCheck().Im_Bored();

        }
    }


}
