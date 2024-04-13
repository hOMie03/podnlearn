using System;
using System.IO;
using System.Speech.Synthesis;
using iText.Kernel.Pdf;
using iText.Kernel.Pdf.Canvas.Parser;
using iText.Kernel.Pdf.Canvas.Parser.Listener;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Text;

namespace PodnLearn.LearnAI
{
    public partial class generateAI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                lblWelcome.Text = $"Welcome, {username}!";
            }
            else
            {
                // Redirect to login page if the username parameter is missing
                Response.Redirect("../login.aspx");
            }
        }

        protected async void generateTTS_Click(object sender, EventArgs e)
        {
            string pdfFilePath = Session["PDFFilePath"].ToString();
            if (!string.IsNullOrEmpty(pdfFilePath))
            {
                await Task.Run(() =>
                {
                    using (PdfReader reader = new PdfReader(pdfFilePath))
                    {
                        using (PdfDocument pdfDoc = new PdfDocument(reader))
                        {
                            string text = ExtractTextFromPdf(pdfDoc);
                            ConvertTextToSpeech(text);
                        }
                    }
                });
                Response.Write("Done generating");
            }
            Response.Redirect("Home.aspx");
        }


        private string ExtractTextFromPdf(PdfDocument pdfDoc)
        {
            StringBuilder textBuilder = new StringBuilder();

            for (int i = 0; i < pdfDoc.GetNumberOfPages(); i++)
            {
                var page = pdfDoc.GetPage(i + 1); // Page numbers are 1-based
                textBuilder.Append(PdfTextExtractor.GetTextFromPage(page));
            }

            return textBuilder.ToString();
        }

        private void ConvertTextToSpeech(string text)
        {
            SpeechSynthesizer synth = new SpeechSynthesizer();
            string AIVoice = Session["AIVoice"].ToString();
            if(AIVoice == "Male")
            {
                synth.SelectVoice("Microsoft David Desktop");
            }
            else
            {
                synth.SelectVoice("Microsoft Zira Desktop");
            }
            synth.SetOutputToWaveFile(Server.MapPath("~/LearnAI/EBooks/" + Session["bookName"].ToString() + "/") + Session["bookName"].ToString() + "-speech.wav");
            synth.Speak(text);
        }
    }
}