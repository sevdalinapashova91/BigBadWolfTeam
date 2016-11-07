using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XMLDataLoader
{
    public class XmlReportData
    {
        public decimal ProjectionPrice { get; set; }
        public string CinemaName { get; set; }
        public int SeatsTaken { get; set; }
        public DateTime ProjectionDate { get; set; }
    }
}
