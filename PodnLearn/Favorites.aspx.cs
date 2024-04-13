using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PodnLearn
{
    public partial class Favorites : System.Web.UI.Page
    {

        string epName, epImg, epNo, podName;
        string connStr2 = ConfigurationManager.ConnectionStrings["connStrPod"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the username parameter is present in the query string
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                lblUsername.Text = $"Welcome, {username}!";
            }
            else
            {
                // Redirect to login page if the username parameter is missing
                Response.Redirect("login.aspx");
            }

            string GetThumbnailPath(string authorName, string podName)
            {
                string thumbnailPath = "";
                string selectQuery = "SELECT thumbnailPath FROM PodcastDetails WHERE podcastName = @podName";

                using (SqlConnection con = new SqlConnection(connStr2))
                {
                    using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@podName", podName);

                        con.Open();
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            thumbnailPath = result.ToString();
                        }
                    }
                }
                return thumbnailPath;
            }
            using (SqlConnection con = new SqlConnection(connStr2))
            {
                con.Open();
                string selectQuery = "SELECT podcastName, EPName FROM Favorites WHERE username = @user";
                using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                {
                    cmd.Parameters.AddWithValue("@user", Session["Username"].ToString());
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Populate labels with user details
                            epName = reader["EPName"].ToString();
                            podName = reader["podcastName"].ToString();
                            epImg = GetThumbnailPath(Session["Username"].ToString(), podName);

                            // Replace this with the actual episode name
                            string episodeName = epName;
                            // Set the URL of the episodeLink anchor tag
                            string episodeLink = $"player.aspx?episodeName={Server.UrlEncode(episodeName)}";

                            podCard.Text += "<li><a runat = 'server' href = '" + episodeLink + "' class='podcast-card'><figure class='card-banner'>"
                                + "<img src='" + epImg + "' />"
                                + "<div class='card-banner-icon'><ion-icon name = 'play' ></ion - icon ></div></figure>"
                                + "<div class='card-content'><div class='card-meta'><p class='pod-epi'>"
                                + "<span>" + podName + "</span></p></div>"
                                + "<span class='h3 card-title'>" + epName + "</span></div></a></li>";
                        }
                    }
                }
            }
            }
    }
}