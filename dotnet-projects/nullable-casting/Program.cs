using System;

namespace stack_overflow
{
    public enum Car
    {
        Fast = 1,
        Slow = 2,
    }
    class Program
    {
        static void Main(string[] args)
        {
            Car? car = null;

            int? num1 = CarToInt(car);  // A
            int? num2 = (int)car;      // B

            Console.WriteLine($"{num1} {num2}");
        }

        public static int? CarToInt(Car? car)
        {
            if (car == null)
                return null;

            return (int)car.Value;
        }
    }
}
