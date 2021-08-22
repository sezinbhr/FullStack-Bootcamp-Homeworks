using System;
public static class Extension //extension class and methods have to be static 
{
    public static void Im_Bored(this int param)
    {
        int kept, counter = 0;
        Random random = new Random();
        kept = random.Next(1, 100);
        while (param != kept)
        {
            counter++;

            if (param > kept)
            {
                Console.WriteLine("You've gone too far!");

            }
            else if (param < kept)
            {
                Console.WriteLine("You should raise your bet!");
            }

            Console.WriteLine("Enter a number again between 1 and 100");
            param = Convert.ToInt32(Console.ReadLine());

        }

        Console.WriteLine("You guessed it! The number was {0}!", kept);
        Console.WriteLine("It took you {0} {1}.\n", counter, counter == 1 ? "try" : "tries");
        Console.ReadKey();

    }

    public static int PositiveCheck(this string number)
    {
        try
        {
            int n = Int32.Parse(number);

            if (n <= 0)
            {
                Console.WriteLine("You entered an invalid value, enter a valid value!");
                number = Console.ReadLine();
                return PositiveCheck(number);
            }

            return n;
        }
        catch (FormatException)
        {
            Console.WriteLine("You entered an invalid value, enter a valid value!");
            number = Console.ReadLine();
            return PositiveCheck(number);
        }
    }

}
