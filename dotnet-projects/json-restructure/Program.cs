using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;

namespace json_restructure
{
    class Entity
    {
        [JsonProperty("id")]
        public string id;
    }
    class Program
    {
        static void Main(string[] args)
        {
            string[] data = new string[] {"01-001-A-02", "01-001-A-01", "01-001-B-01", "01-002-A-01", "01-003-A-01"};

            var sorted = data.OrderBy(x => x).ThenBy(x=> x.Split('-')[3]);

            foreach (var x in sorted)
            {
                Console.WriteLine(x);
            }
        }
    }
}
