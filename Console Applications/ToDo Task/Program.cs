using System;
using System.Collections.Generic;

class Program
{
    static List<Task> tasks = new List<Task>();

    static void Main(string[] args)
    {
        bool running = true;

        while (running)
        {
            Console.Clear();
            Console.WriteLine("=== To-Do List Application ===");
            Console.WriteLine("1. Add Task");
            Console.WriteLine("2. View Tasks");
            Console.WriteLine("3. Mark Task as Completed");
            Console.WriteLine("4. Delete Task");
            Console.WriteLine("5. Exit");
            Console.Write("Choose an option: ");

            string choice = Console.ReadLine();

            switch (choice)
            {
                case "1":
                    AddTask();
                    break;
                case "2":
                    ViewTasks();
                    break;
                case "3":
                    MarkTaskAsCompleted();
                    break;
                case "4":
                    DeleteTask();
                    break;
                case "5":
                    running = false;
                    break;
                default:
                    Console.WriteLine("Invalid choice. Please try again.");
                    Console.ReadKey();
                    break;
            }
        }

        Console.WriteLine("Thank you for using the To-Do List Application!");
    }

    static void AddTask()
    {
        Console.Clear();
        Console.WriteLine("=== Add Task ===");
        Console.Write("Enter task description: ");
        string description = Console.ReadLine();

        if (!string.IsNullOrEmpty(description))
        {
            tasks.Add(new Task { Description = description, IsCompleted = false });
            Console.WriteLine("Task added successfully!");
        }
        else
        {
            Console.WriteLine("Task description cannot be empty.");
        }

        Console.ReadKey();
    }

    static void ViewTasks()
    {
        Console.Clear();
        Console.WriteLine("=== View Tasks ===");

        if (tasks.Count == 0)
        {
            Console.WriteLine("No tasks available.");
        }
        else
        {
            for (int i = 0; i < tasks.Count; i++)
            {
                string status = tasks[i].IsCompleted ? "[Completed]" : "[Pending]";
                Console.WriteLine($"{i + 1}. {tasks[i].Description} {status}");
            }
        }

        Console.ReadKey();
    }

    static void MarkTaskAsCompleted()
    {
        Console.Clear();
        Console.WriteLine("=== Mark Task as Completed ===");

        if (tasks.Count == 0)
        {
            Console.WriteLine("No tasks available.");
        }
        else
        {
            ViewTasks();
            Console.Write("Enter the task number to mark as completed: ");
            if (int.TryParse(Console.ReadLine(), out int taskNumber) && taskNumber > 0 && taskNumber <= tasks.Count)
            {
                tasks[taskNumber - 1].IsCompleted = true;
                Console.WriteLine("Task marked as completed!");
            }
            else
            {
                Console.WriteLine("Invalid task number.");
            }
        }

        Console.ReadKey();
    }

    static void DeleteTask()
    {
        Console.Clear();
        Console.WriteLine("=== Delete Task ===");

        if (tasks.Count == 0)
        {
            Console.WriteLine("No tasks available.");
        }
        else
        {
            ViewTasks();
            Console.Write("Enter the task number to delete: ");
            if (int.TryParse(Console.ReadLine(), out int taskNumber) && taskNumber > 0 && taskNumber <= tasks.Count)
            {
                tasks.RemoveAt(taskNumber - 1);
                Console.WriteLine("Task deleted successfully!");
            }
            else
            {
                Console.WriteLine("Invalid task number.");
            }
        }

        Console.ReadKey();
    }
}

class Task
{
    public string Description { get; set; }
    public bool IsCompleted { get; set; }
}
