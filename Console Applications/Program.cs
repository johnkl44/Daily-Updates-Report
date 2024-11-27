using System;

delegate int Calculate(int x, int y);

class Program
{
    static void Main(string[] args)
    {
        bool Running = true;

        while (Running)
        {
            Console.WriteLine("Welcome to the Calculator!");
            Console.WriteLine("1. Addition");
            Console.WriteLine("2. Subtraction");
            Console.WriteLine("3. Multiplication");
            Console.WriteLine("4. Division");
            Console.WriteLine("5. Exit");

            Console.Write("Select an option (1-5): ");
            string choice = Console.ReadLine();

            if (choice == "5")
            {
                Console.WriteLine("Exiting the program. Goodbye!");
                Running = false;
                break;
            }

            Console.Write("Enter the first number: ");
            if (!int.TryParse(Console.ReadLine(), out int num1))
            {
                Console.WriteLine("Invalid input. Please enter a valid number.");
                continue;
            }

            Console.Write("Enter the second number: ");
            if (!int.TryParse(Console.ReadLine(), out int num2))
            {
                Console.WriteLine("Invalid input. Please enter a valid number.");
                continue;
            }

            Calculate calc = null;

            switch (choice)
            {
                case "1":
                    calc = Add;
                    Console.WriteLine($"Result: {calc(num1, num2)}"); //interpolation method of printing
                    break;

                case "2":
                    calc = Subtract;
                    Console.WriteLine($"Result: {calc(num1, num2)}");
                    break;

                case "3":
                    calc = Multiply;
                    Console.WriteLine($"Result: {calc(num1, num2)}");
                    break;

                case "4":
                    if (num2 == 0)
                    {
                        Console.WriteLine("Error: Division by zero is not allowed.");
                    }
                    else
                    {
                        calc = Divide;
                        Console.WriteLine($"Result: {calc(num1, num2)}");
                    }
                    break;

                default:
                    Console.WriteLine("Invalid choice. Please select a valid option.");
                    break;
            }

            Console.WriteLine("\nPress any key to return to the menu...");
            Console.ReadKey();
            Console.Clear(); // clear the screen
        }
    }

    static int Add(int x, int y) { return x + y; }

    static int Subtract(int x, int y) { return x-y; }

    static int Multiply(int x, int y) { return x * y;  }

    static int Divide(int x, int y) { return x / y; }
}
