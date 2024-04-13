using System;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace PodnLearn.LearnAI
{
    public partial class filterEBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the username parameter is present in the query string
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
            book.Text = "Name of the book: " + Session["bookName"].ToString();
        }

        // Method to extract pages from a PDF
        private void ExtractPagesFromPdf(string sourcePdfPath, string destinationPdfPath, int startPage, int endPage)
        {
            using (PdfReader reader = new PdfReader(sourcePdfPath))
            {
                using (Document document = new Document())
                {
                    using (FileStream fs = new FileStream(destinationPdfPath, FileMode.Create))
                    {
                        using (PdfCopy copy = new PdfCopy(document, fs))
                        {
                            document.Open();
                            if (pages.SelectedValue == "Selected")
                            {
                                for (int i = startPage; i <= endPage; i++)
                                {
                                    copy.AddPage(copy.GetImportedPage(reader, i));
                                }
                            }
                            else if (pages.SelectedValue == "0")
                            {
                                for (int i = 1; i <= reader.NumberOfPages; i++)
                                {
                                    copy.AddPage(copy.GetImportedPage(reader, i));
                                }
                            }

                            document.Close();
                            Response.Write("E-book uploaded successfully!");
                        }
                    }
                }
            }
        }
        protected void pages_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (pages.SelectedValue == "Selected")
            {
                numberOfPages.Visible = true;
            }
            else
            {
                numberOfPages.Visible = false;
            }
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["connStrEBook"].ConnectionString;

            string bookName = Session["bookName"].ToString();
            string ebookFilename = Session["ebookFilename"].ToString();
            string ebookFilepath = Server.MapPath("~/LearnAI/EBooks/" + bookName + "/") + ebookFilename + ".pdf";

            // Extract pages from the PDF and save as a new PDF
            int from = Convert.ToInt32(pgFrom.Text);
            int to = Convert.ToInt32(pgTo.Text);
            string extractedPagesFilepath = Server.MapPath("~/LearnAI/EBooks/" + bookName + "/") + ebookFilename + "-main.pdf";
            Session["PDFFilePath"] = extractedPagesFilepath;
            Session["AIVoice"] = AIvoice.SelectedValue;
            ExtractPagesFromPdf(ebookFilepath, extractedPagesFilepath, from, to);

            

            // Save audioFilename and thumbnailFilename to database or perform any other necessary operations


            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                string insertQuery = "INSERT INTO EBookInfo (ebookID, ebookName, username, voiceType, ebookFilepath, totalPages, ebookAudiopath) VALUES (@ebID, @ebName, @user, @voice, @ebPath, @total, @audioPath)";
                string EBPath = "EBooks/" + bookName + "/" + ebookFilename + "-main.pdf";
                string ebAudiopath = "EBooks/" + bookName + "/" + bookName + "-speech.wav";
                string totalPg;
                string username = Session["Username"].ToString();
                string voicetype = AIvoice.SelectedValue;
                var ebookID = Guid.NewGuid();
                if(numberOfPages.Visible == true)
                {
                    totalPg = "From Page " + from + " To " + to;
                }
                else
                {
                    totalPg = "All Pages";
                }

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@ebID", ebookID);
                    cmd.Parameters.AddWithValue("@ebName", bookName);
                    cmd.Parameters.AddWithValue("@user", username);
                    cmd.Parameters.AddWithValue("@voice", voicetype);
                    cmd.Parameters.AddWithValue("@ebPath", EBPath);
                    cmd.Parameters.AddWithValue("@total", totalPg);
                    cmd.Parameters.AddWithValue("@audioPath", ebAudiopath);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Redirect("generateAI.aspx");
                    }
                    else
                    {
                        errorText.Text = "failed";
                        errorText.ForeColor = System.Drawing.Color.Red;
                    }

                }
            }

        }

        
    }
}