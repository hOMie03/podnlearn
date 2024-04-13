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
    public partial class Home : System.Web.UI.Page
    {
        string ebName, ebPages, ebImg;
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

                string connStr = ConfigurationManager.ConnectionStrings["connStrEBook"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    string selectQuery = "SELECT ebookName, totalPages FROM EBookInfo WHERE username = @user";
                    using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@user", Session["Username"].ToString());
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // Populate labels with user details
                                ebName = reader["ebookName"].ToString();
                                ebPages = reader["totalPages"].ToString();
                                ebImg = "../images/Podcast-Covers/ebook-cover.png";

                                // Replace this with the actual episode name
                                string ebookName = ebName;
                                // Set the URL of the episodeLink anchor tag
                                string ebookLink = $"ebookPlayer.aspx?ebookName={Server.UrlEncode(ebookName)}";

                                podCard.Text += "<li><a runat = 'server' href = '" + ebookLink + "' class='podcast-card'><figure class='card-banner'>"
                                    + "<img src='" + ebImg + "' />"
                                    + "<div class='card-banner-icon'><ion-icon name = 'play' ></ion - icon ></div></figure>"
                                    + "<div class='card-content'><div class='card-meta'><p class='pod-epi'>Episode: "
                                    + "<span>" + ebPages + "</span></p></div>"
                                    + "<span class='h3 card-title'>" + ebName + "</span></div></a></li>";
                            }
                        }
                    }

                }
            }
        }
    }
}