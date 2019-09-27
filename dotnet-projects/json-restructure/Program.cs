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
            var json = "[{\"id\":\"1127889\"},{\"id\":\"1075442\"},{\"id\":\"1201544\"}]";
            var workingObject = JsonConvert.DeserializeObject<List<Entity>>(json);

            foreach(var t in workingObject)
            {
                Console.WriteLine(t.id);
            }

            var idList = new { id = (from c in workingObject select c.id).ToArray()};

            var outputString = JsonConvert.SerializeObject(idList);

            Console.WriteLine(outputString);
        }
    }
}
