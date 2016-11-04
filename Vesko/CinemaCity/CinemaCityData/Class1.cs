using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CinemaCityData
{
    public class Class1
    {
        public void Test()
        {
            var db = new CinemaCityEntities();

            //var cinemas = db.Cinemas.Select(x => new
            //{
            //    Id = x.ID,
            //    Name = x.Name,
            //    Addres = db.Addresses.Where(a => a.ID == x.AddressesID).Select(ad => ad.AddressText).FirstOrDefault()
            //}).ToList();

            //foreach (var item in cinemas)
            //{
            //    Console.WriteLine(item.ToString());
            //}

            var filmCinema = db.Films.Select(film => new
            {
                Title = film.Title,
                Rating = film.Rating,
                Type = film.Type,
                Langluage = film.Language,
                Minute = film.Minutes,
                ProjectionsFilm = db.ProjectionMovies.Where(prMovie => prMovie.FilmID == film.ID).Select(proMovieProject => new
                {
                    Start = db.Projections
                              .Where(projections => projections.ID == proMovieProject.ProjectionID)
                              .Select(proj => proj.Start)
                              .FirstOrDefault(),

                    Price = db.Projections
                              .Where(projection => projection.ID == proMovieProject.ProjectionID)
                              .Select(proj => proj.Price)
                              .FirstOrDefault(),

                    Cinema = db.Projections
                               .Where(projection => projection.ID == proMovieProject.ProjectionID)
                               .Select(proj => new
                               {
                                   CinemaType = db.ProjectionRooms
                                                   .Where(prRoom => proj.ProjectionRoomID == prRoom.ID)
                                                   .Select(cinem => new
                                                   {
                                                       Name = db.Cinemas
                                                                .Where(cinemName => cinem.CinemaID == cinemName.ID)
                                                                .Select(x => x.Name)
                                                                .FirstOrDefault(),

                                                       Address = db.Cinemas
                                                                .Where(cinemName => cinem.CinemaID == cinemName.ID)
                                                                .Select(address => new
                                                                {
                                                                    AddressText = db.Addresses
                                                                    .Where(addressText => address.AddressesID == addressText.ID)
                                                                    .Select(text => text.AddressText)
                                                                    .FirstOrDefault()
                                                                })
                                                                .FirstOrDefault()
                                                   }).FirstOrDefault(),

                                   ProjectRoom = new
                                   {
                                       Number = db.ProjectionRooms
                                                   .Where(prRoom => proj.ProjectionRoomID == prRoom.ID)
                                                   .Select(room => room.Number)
                                                   .FirstOrDefault(),

                                       Seats = db.ProjectionRooms
                                                   .Where(prRoom => proj.ProjectionRoomID == prRoom.ID)
                                                   .Select(room => room.Seats)
                                                   .FirstOrDefault(),

                                       Type = db.ProjectionRooms
                                                   .Where(prRoom => proj.ProjectionRoomID == prRoom.ID)
                                                   .Select(room => room.Type)
                                                   .FirstOrDefault(),
                                   }

                               }).FirstOrDefault(),
                })
                .ToList()

            }).ToList();


            foreach (var item in filmCinema)
            {
                var json = JsonConvert.SerializeObject(item, Formatting.Indented);

                var path = string.Format("../../Jsons/json{0}.json", item.Title);

                File.WriteAllText(path, json);

                Console.WriteLine(json);
            }

            //foreach (var item in filmCinema)
            //{
            //    Console.WriteLine(item.ProjectionFilm.Cinema.ProjectRoom.Number.ToString());
            //}
        }
    }
}
