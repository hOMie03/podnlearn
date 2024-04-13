using System;
using System.IO;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PodnLearn.LearnAI
{
    public partial class uploadEBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
            }
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            string bookName = ebookName.Text;
            Session["bookName"] = bookName;
            string EBookFilename = Path.GetFileName(fileUploadEbook.FileName);
            string ogEbookFilename = Path.GetFileNameWithoutExtension(fileUploadEbook.FileName);
            Session["ebookFilename"] = ogEbookFilename;
            if (!string.IsNullOrEmpty(bookName))
            {
                string folderPath = Server.MapPath("~/LearnAI/EBooks/") + bookName;
                Session["EBookFilepath"] = folderPath;

                try
                {
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                        Response.Write("E-book uploaded successfully!");
                    }
                    else
                    {
                        Response.Write("Folder with the same name already exists!");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error creating folder: " + ex.Message);
                }
            }
            string ebookFilepath = Server.MapPath("~/LearnAI/EBooks/" + bookName + "/") + EBookFilename;
            fileUploadEbook.SaveAs(ebookFilepath);

            Response.Redirect("filterEBook.aspx");
        }

    }
}