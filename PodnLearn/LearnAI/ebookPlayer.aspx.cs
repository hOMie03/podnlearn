using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PodnLearn.LearnAI
{
    public partial class ebookPlayer : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connStrEBook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the username parameter is present in the query string
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();
                }
                else
                {
                    // Redirect to login page if the username parameter is missing
                    Response.Redirect("../login.aspx");
                }

                if (!string.IsNullOrEmpty(Request.QueryString["ebookName"]))
                {
                    string episodeName = Request.QueryString["ebookName"];
                    Session["EBookName"] = episodeName;
                    audioText.Text = episodeName;
                }
                else
                {
                    audioText.Text = "No Podcast Selected.";
                }

                string eboName = audioText.Text;
                string selectQuery = "SELECT ebookName, ebookFilepath, ebookAudiopath FROM EBookInfo WHERE ebookName = @ebName";
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@ebName", Request.QueryString["ebookName"]);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Populate labels with user details
                                audioText.Text = reader["ebookName"].ToString();
                                audioURL.Text = reader["ebookAudiopath"].ToString();
                                ebookPath.Text = reader["ebookFilepath"].ToString();
                            }
                            else
                            {
                                audioText.Text = "ERROR! CAN'T DETAILS ABOUT THE PODCAST!";
                            }
                        }
                    }
                }
            }
        }
    }
}