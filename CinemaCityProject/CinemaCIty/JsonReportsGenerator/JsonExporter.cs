using CinemaCity.Model.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JsonReportsGenerator
{
    public static class JsonExporter
    {
        public static void Export()
        {
            var db = new CinemaCityEntities();

            var projections = db.ProjectionMovies
                         .Select(pm => new
                         {
                             id = pm.Id,
                             name = pm.Movy.Title,
                             start = pm.Projection.Start,
                             cinema = pm.Projection.ProjectionRoom.Cinema.Name,
                             price = pm.Projection.Price,
                             rating = pm.Movy.Rating,
                             genre = pm.Movy.Type,
                             minutes = pm.Movy.Minutes
                         });

            foreach (var proj in projections)
            {
                var jsonObject = JsonConvert.SerializeObject(proj, Newtonsoft.Json.Formatting.Indented);
                var address = "../../../ExportedJson/" + proj.id + ".json";
                File.WriteAllText(address, jsonObject);
            }

        }


    }
}
