using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data.SqlClient;

namespace GeneratePDFReports
{
    class Program
    {
        static void Main()
        {

            Console.WriteLine("start the creation!");

            GenerateFile();

            Console.WriteLine("end of creation!");
        }

        public static void GenerateFile()
        {
            Document doc = new Document(iTextSharp.text.PageSize.LETTER, 10, 10, 42, 35);
            PdfWriter wri = PdfWriter.GetInstance(doc, new FileStream("PochtiGotovo.pdf", FileMode.Create));
            doc.Open();

            //Suzdavame tablicata s broq koloni v neq
            PdfPTable table = new PdfPTable(6);


            PdfPCell TopHeaderCell = new PdfPCell(new Phrase("Movie Information Table", new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD)));
            TopHeaderCell.Colspan = 6;
            TopHeaderCell.HorizontalAlignment = 1;
            TopHeaderCell.Padding = 10;
            table.AddCell(TopHeaderCell);

            string HeaderDate = "Date: " + DateTime.Now.Date.ToString();
            PdfPCell HeaderDateCell = new PdfPCell(new Phrase(HeaderDate));
            HeaderDateCell.BackgroundColor= new iTextSharp.text.BaseColor(169, 169, 169);
            HeaderDateCell.Colspan = 6;
            HeaderDateCell.HorizontalAlignment = 0;
            table.AddCell(HeaderDateCell);
            

            PdfPCell CategoryCell = new PdfPCell(new Phrase("Movie Title", new Font(Font.FontFamily.HELVETICA, 12f, Font.BOLD)));
            CategoryCell.BackgroundColor = new BaseColor(169, 169, 169);
            table.AddCell(CategoryCell);

            PdfPCell CategoryCellTwo = new PdfPCell(new Phrase("Cinema Name", new Font(Font.FontFamily.HELVETICA, 12f, Font.BOLD)));
            CategoryCellTwo.BackgroundColor = new BaseColor(169, 169, 169);
            table.AddCell(CategoryCellTwo);

            PdfPCell CategoryCellThree = new PdfPCell(new Phrase("Projection Room", new Font(Font.FontFamily.HELVETICA, 12f, Font.BOLD)));
            CategoryCellThree.BackgroundColor = new BaseColor(169, 169, 169);
            table.AddCell(CategoryCellThree);

            PdfPCell CategoryCellFour = new PdfPCell(new Phrase("Starting Time", new Font(Font.FontFamily.HELVETICA, 12f, Font.BOLD)));
            CategoryCellFour.BackgroundColor = new BaseColor(169, 169, 169);
            table.AddCell(CategoryCellFour);

            PdfPCell CategoryCellFive = new PdfPCell(new Phrase("Length", new Font(Font.FontFamily.HELVETICA, 12f, Font.BOLD)));
            CategoryCellFive.BackgroundColor = new BaseColor(169, 169, 169);
            table.AddCell(CategoryCellFive);

            PdfPCell CategoryCellSix = new PdfPCell(new Phrase("Price", new Font(Font.FontFamily.HELVETICA, 12f, Font.BOLD)));
            CategoryCellSix.BackgroundColor = new BaseColor(169, 169, 169);
            table.AddCell(CategoryCellSix);


            //Vseki 6 reda ot koda table.AddCell() predstavlqvat dobaveni koloni za pulnata informaciq za daden film ime,cinema,price t.n.

            SqlConnection dbCon = new SqlConnection("Server=.;Database=DB_A12680_Cinema;Integrated Security=true");
            dbCon.Open();
            using (dbCon)
            {
                SqlCommand comm = new SqlCommand("SELECT Title FROM Movies", dbCon);

                SqlDataReader reader = comm.ExecuteReader();
                using (reader)
                {
                    while (reader.Read())
                    {
                        string MovieTitle = (string)reader["Title"];
                        table.AddCell(MovieTitle);
                    }
                }


            }

            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");


            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");
            table.AddCell("Nqkwa informaciq");



            doc.Add(table);
            doc.Close();
        }
    }
}
