using System;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Linq;

namespace xml_parsing
{
    class Program
    {
        static void Main(string[] args)
        {
            ProductsFilteredBySubCategory("test.xml");
        }

        public static void ProductsFilteredBySubCategory(string path)
        {
            XDocument document = XDocument.Load(path);
            //var elements = document.Descendants().Where(node => (string)node.Attribute("id") == "SUB1000");
            
            var elements = document.Descendants("subcategory")
                            .Where(i => (string)i.Attribute("id") == "SUB1000")
                            .Select(i => i.Parent.Parent);

            foreach(var element in elements)
            {
                Console.WriteLine(element);
            }

        }
    }
}
