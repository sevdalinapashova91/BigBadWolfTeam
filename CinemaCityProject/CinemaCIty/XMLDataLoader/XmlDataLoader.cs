using CinemaCity.Model.Data;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;
using static System.Net.Mime.MediaTypeNames;

namespace XMLDataLoader
{
    public class XmlDataLoader
    {
        private const string XMLFileName = "TicketsByCinemaReport.xml";
        public string XMLFilePath { get; private set; }
        public XmlDataLoader(string xmlPath)
        {
            this.XMLFilePath = Path.Combine(File.Exists(xmlPath) ?
                 xmlPath : AppDomain.CurrentDomain.BaseDirectory, XMLFileName);
        }
        public void WriteSQLDataToXML()
        {
            Encoding encoding = Encoding.GetEncoding("windows-1251");
            var groups = this.GetAllReportData();
            using (XmlTextWriter writer = new XmlTextWriter(this.XMLFilePath, encoding))
            {
                writer.Formatting = Formatting.Indented;
                writer.IndentChar = '\t';
                writer.Indentation = 1;

                writer.WriteStartDocument();
                writer.WriteStartElement("tickets");

                foreach (var group in groups)
                {
                    writer.WriteStartElement("ticket");
                    writer.WriteAttributeString("cinema", group.Select(x => x.CinemaName).FirstOrDefault());
                    foreach (var item in group)
                    {
                        WriteProjection(writer, item.CinemaName, item.ProjectionDate, item.SeatsTaken, item.ProjectionPrice);
                    }
                    writer.WriteEndElement();
                }
                writer.WriteEndDocument();
            }

        }


        private static void WriteProjection(XmlWriter writer, string cinemaName, DateTime timeOfProjection, int seatsTaken, decimal price)
        {

            writer.WriteStartElement("projection");
            writer.WriteAttributeString("date", timeOfProjection.ToString());
            writer.WriteAttributeString("total-seats-price", (seatsTaken * price).ToString());
            writer.WriteEndElement();

        }


        private ICollection<IOrderedEnumerable<XmlReportData>> GetAllReportData()
        {

            using (CinemaCityEntities entities = new CinemaCityEntities())
            {
                var elements = entities.Cinemas.Join(entities.ProjectionRooms,
                     (cinema => cinema.ID),
                     (projectionRoom => projectionRoom.CinemaId),
                     (cinema, projectionRoom) => new
                     {
                         cinema,
                         projectionRoom
                     })
                     .Join(entities.Projections,
                        (type => type.projectionRoom.ID),
                        (projection => projection.ProjectionRoomID),
                        (type, projection) => new XmlReportData
                        {
                            CinemaName = type.cinema.Name,
                            SeatsTaken = type.projectionRoom.Seats,
                            ProjectionPrice = projection.Price * type.projectionRoom.Seats,
                            ProjectionDate = projection.Start
                        })
                        .GroupBy(x => x.CinemaName)
                        .Select(x=>x.OrderByDescending(group => group.ProjectionDate))           
                        .ToList();
                        
                return elements;
            }
        }

    }
}

