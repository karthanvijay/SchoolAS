using System;
using System.Globalization;
using System.IO;
using System.Web;
using DataLib;
using PdfSharp.Drawing;
using PdfSharp.Pdf;

namespace SchoolManagement.Helpers
{
    public class PdfHelpers : System.Web.UI.Page
    {
        private readonly string[] _ones = { "","One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};
        private readonly string[] _betweenTenAndTwenty = { "Ten", "Eleven", "Twelve", "Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen" }; 
        private readonly string[] _tens = {"" ,"Ten", "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };
        private const string Hundred = "Hundred";
        private const  string Thousand = "Thousand";
        private string _amountInWords = string.Empty;
        private readonly int[] _digits=new int[10];
        public string CreatePdf(TransactionDetail transactionDetail)
        {
            var document = new PdfDocument();
            PdfPage page = document.AddPage();
            XGraphics gfx = XGraphics.FromPdfPage(page);
           
            _amountInWords = string.Empty;
            var pen = new XPen(XColors.Black, 0.1);
            gfx.DrawRectangle(pen, 10, 10, 575, 800);
            var amount = ConvertAmountInWords(transactionDetail.AmountPaid, _digits,0);
            var isDigitOtherThanZeroFound = false;
            for (int index = 9; index >= 0; --index)
            {
                if (amount[index] != 0)
                {
                    isDigitOtherThanZeroFound = true;
                }
                if (!isDigitOtherThanZeroFound)
                    continue;
                if (index+1  == 5)
                {
                    _amountInWords = _tens[amount[index]]+" ";
                }
                else if (index+1  == 4)
                {
                    if (amount[index] != 0)
                    {
                        _amountInWords = _amountInWords + _ones[amount[index]] +" "+ Thousand+ " " ;
                    }
                    else
                    {
                        _amountInWords = _amountInWords + Thousand;
                    }

                }
                else if (index+1  == 3)
                {
                    if (amount[index] != 0)
                    {
                        _amountInWords = _amountInWords + _ones[amount[index]] + " " + Hundred+ " " ;
                    }
                    else
                    {
                        _amountInWords = _amountInWords + Hundred;
                    }

                }
                else if (index+1  == 2)
                {

                    if (amount[index] != 0 && amount[index]!=1)
                    {
                        _amountInWords = _amountInWords + _tens[amount[index]] + " ";
                    }
                    if(amount[index]==1)
                    {
                        _amountInWords =_amountInWords+ _betweenTenAndTwenty[amount[0]];
                        break;
                    }

                }
                else if (index+1 == 1)
                {

                    if (amount[index] != 0)
                    {
                        _amountInWords = _amountInWords + _ones[amount[index]];
                    }

                }

            }
            DrawReciept(0, _amountInWords, gfx,transactionDetail);
            DrawReciept(250, _amountInWords, gfx, transactionDetail);

            string filename =  transactionDetail.TransactionDetailsId + "_"
                              + transactionDetail.Student.Class1.ClassName + "_" +
                              transactionDetail.Student.Section.SectionName + "_" +
                              transactionDetail.Student.StudentName + ".pdf";

            if (!Directory.Exists(Server.MapPath(Constants.AccounStudentFeePdf)))
            {
                Directory.CreateDirectory(Server.MapPath(Constants.AccounStudentFeePdf));
            }
            document.Save(Server.MapPath(Constants.AccounStudentFeePdf) + filename);
            return filename;
        }
        private int[] ConvertAmountInWords(int amount,int[] digit,int index)
        {
            if (amount/10>=1)
            {
                digit[index] = amount%10;
               
                ConvertAmountInWords(amount / 10, digit, ++index);
            }
            else
            {
                digit[index] = amount;
            }
         
     
            return digit;
        }
        private void DrawReciept(int position, string amountInWords, XGraphics gfx,TransactionDetail transactionDetail)
        {
            var fontReciept = new XFont("Times New Roman", 14, XFontStyle.Bold);
            var fontSchoolName = new XFont("Calisto MT", 18, XFontStyle.Bold);
            var font = new XFont("Times New Roman", 10, XFontStyle.Regular);
            var fontItalic = new XFont("Times New Roman", 10, XFontStyle.Italic);
            gfx.DrawString("Reciept", fontReciept, XBrushes.Black,
                          new XRect(170, position + 50, 270, position + 50), XStringFormat.Center);
            var fontSchoolAddress = new XFont("Times New Roman", 7, XFontStyle.Regular);
            gfx.DrawString("Reciept", fontReciept, XBrushes.Black,
                          new XRect(170, position + 50, 270, position + 50), XStringFormat.Center);
            gfx.DrawString(position>0?"Accounts copy":"Student copy", fontSchoolAddress, XBrushes.Black,
                         new XRect(170, position + 60, 270, position + 60), XStringFormat.Center);

            gfx.DrawString(Constants.SchoolName, fontSchoolName, XBrushes.Black,
                         new XRect(330, position + 20, 270, position + 20), XStringFormat.Center);
            gfx.DrawString(Constants.SchoolAddress, fontSchoolAddress, XBrushes.Black,
                        new XRect(330, position + 30, 270, position + 30), XStringFormat.Center);
            gfx.DrawString(Constants.SchoolContactNumbers, fontSchoolAddress, XBrushes.Black,
                       new XRect(330, position + 40, 270, position + 40), XStringFormat.Center);

            gfx.DrawString("Reciept", fontReciept, XBrushes.Black,
                           new XRect(170, position + 50, 270, position + 50), XStringFormat.Center);
            gfx.DrawString("Date:", font, XBrushes.Black,
                         new XRect(60, position + 20, 10, position + 20), XStringFormat.Center);

            gfx.DrawString(DateTime.Now.Date.ToString("D"), font, XBrushes.Black,
                       new XRect(70, position + 20, 110, position + 20), XStringFormat.Center);
            gfx.DrawString("Reciept Number:", font, XBrushes.Black,
                      new XRect(80, position + 30, 10, position + 30), XStringFormat.Center);
            gfx.DrawString(transactionDetail.TransactionDetailsId.ToString(CultureInfo.InvariantCulture), font, XBrushes.Black,
                  new XRect(140, position + 30, 10, position + 30), XStringFormat.Center);

            gfx.DrawString("Student Name:", font, XBrushes.Black,
                        new XRect(80, position + 80, 10, position + 80), XStringFormat.Center);
            gfx.DrawString(transactionDetail.Student.StudentName, fontItalic, XBrushes.Black,
                        new XRect(180, position + 80, 10, position + 80), XStringFormat.Center);

            gfx.DrawString("Mother's Name:", font, XBrushes.Black,
                       new XRect(80, position + 90, 10, position + 90), XStringFormat.Center);
            gfx.DrawString(transactionDetail.Student.MotherName, fontItalic, XBrushes.Black,
                     new XRect(180, position + 90, 10, position + 90), XStringFormat.Center);

            gfx.DrawString("Father's Name:", font, XBrushes.Black,
                       new XRect(80, position + 100, 10, position + 100), XStringFormat.Center);
            gfx.DrawString(transactionDetail.Student.FatherName, fontItalic, XBrushes.Black,
                       new XRect(180, position + 100, 10, position + 100), XStringFormat.Center);


            gfx.DrawString("Class Name:", font, XBrushes.Black,
                           new XRect(80, position + 110, 10, position + 110), XStringFormat.Center);
            gfx.DrawString(transactionDetail.Student.Class1.ClassName, fontItalic, XBrushes.Black,
                        new XRect(180, position + 110, 10, position + 110), XStringFormat.Center);

            gfx.DrawString("Section Name:", font, XBrushes.Black,
                        new XRect(80, position + 120, 10, position + 120), XStringFormat.Center);
            gfx.DrawString(transactionDetail.Student.Section.SectionName, fontItalic, XBrushes.Black,
                   new XRect(180, position + 120, 10, position + 120), XStringFormat.Center);


            gfx.DrawString("Student Address:", font, XBrushes.Black,
                      new XRect(170, position + 80, 270, position + 80), XStringFormat.Center);
            gfx.DrawString(transactionDetail.Student.Address.AdrressLineOne, fontItalic, XBrushes.Black,
                     new XRect(310, position + 80, 270, position + 80), XStringFormat.Center);
            gfx.DrawString(transactionDetail.Student.Address.Village + ".", fontItalic, XBrushes.Black,
                   new XRect(310, position + 90, 270, position + 90), XStringFormat.Center);

            gfx.DrawString(transactionDetail.Student.Address.District + " " + transactionDetail.Student.Address.Pincode, fontItalic, XBrushes.Black,
                new XRect(310, position + 100, 270, position + 100), XStringFormat.Center);

            gfx.DrawString("Amount:", font, XBrushes.Black,
                    new XRect(60, position + 150, 60, position + 150), XStringFormat.Center);

            gfx.DrawString("In words:", font, XBrushes.Black,
                 new XRect(180,  position+150, 120, position+150), XStringFormat.Center);

            gfx.DrawString(amountInWords + " Rupees Only", fontItalic, XBrushes.Black, new XRect(320, position + 150, 200,position+ 150), XStringFormat.Center);
            gfx.DrawString("paid on " + Convert.ToDateTime(transactionDetail.DatePaid).ToString("D"), font, XBrushes.Black,
             new XRect(60, position + 160, 120, position + 160), XStringFormat.Center);

            gfx.DrawString(transactionDetail.AmountPaid.ToString(CultureInfo.InvariantCulture), fontItalic, XBrushes.Black,
                new XRect(90, position + 150, 90, position + 150), XStringFormat.Center);

            gfx.DrawString("Note: This is an auto generated reciept.", font, XBrushes.Black,
               new XRect(180, position + 180, 180, position + 180), XStringFormat.Center);
            gfx.DrawString("Signature:", font, XBrushes.Black,
             new XRect(280, position + 180, 280, position + 180), XStringFormat.Center);
            var pen = new XPen(XColors.Black, 0.1);
            var penBorderLine1 = new XPen(XColors.Black, 0.1);
            var penBorderLine2 = new XPen(XColors.Black, 0.1);
            penBorderLine1.DashStyle = XDashStyle.Dash;
            //gfx.DrawLine(pen, 120, position + 150 - 25, 240, position + 150 - 25);
            //gfx.DrawLine(pen, 120, position + 165 - 25, 240, position + 165 - 25);
            //gfx.DrawLine(pen, 120, position + 180 - 25, 240, position + 180 - 25);
            //gfx.DrawLine(pen, 120, position + 195 - 25, 240, position + 195 - 25);
            //gfx.DrawLine(pen, 120, position + 210 - 25, 240, position + 210 - 25);
            if (position < 0)
            {
                gfx.DrawLine(pen, 120, 255 - 25, 200,255 - 25);
                gfx.DrawLine(pen,290, 255 - 25, 550,255 - 25);
                gfx.DrawLine(penBorderLine1, 0, 250, 650, 250);
            }
          
           gfx.DrawLine(penBorderLine1, 0, 300, 650, 300);
           gfx.DrawLine(penBorderLine2, 0, 300 + 350, 650, 300 + 350);
           penBorderLine2.DashStyle = XDashStyle.Dash;
         
         
        }
    }
}