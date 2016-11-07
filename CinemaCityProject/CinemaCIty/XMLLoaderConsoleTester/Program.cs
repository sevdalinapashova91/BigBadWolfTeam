using JsonReportsGenerator;

namespace XMLLoaderConsoleTester
{
    class Program
    {
        static void Main(string[] args)
        {
            var test = new XMLDataLoader.XmlDataLoader("");
            //test.WriteSQLDataToXML();

            //json export
           JsonExporter.Export();
        }
    }
}
