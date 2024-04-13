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
    public partial class profile : System.Web.UI.Page
    {

        string epName, epImg, epNo, podName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the username parameter is present in the query string
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();
                    lblUsername.Text = $"Welcome, {username}!";
                    lblUname.Text = $"{username}";
                }
                else
                {
                    // Redirect to login page if the username parameter is missing
                    Response.Redirect("login.aspx");
                }


                string connStr1 = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr1))
                {
                    conn.Open();
                    string query = "SELECT Name, Username, Email, DOB FROM ProfileInfo WHERE Username = @Username";

                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@Username", lblUname.Text);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Populate labels with user details
                                lblName.Text = reader["Name"].ToString();
                                lblUsername.Text = reader["Username"].ToString();
                                lblEmail.Text = reader["Email"].ToString();
                                lblDOB.Text = Convert.ToDateTime(reader["DOB"]).ToShortDateString();
                            }
                        }
                    }
                }
                
                string connStr2 = ConfigurationManager.ConnectionStrings["connStrPod"].ConnectionString;
                //string podName = Session["podcastName"].ToString();
                string GetThumbnailPath(string authorName, string podName)
                {
                    string thumbnailPath = "";
                    string selectQuery = "SELECT thumbnailPath FROM PodcastDetails WHERE authorName = @author AND podcastName = @podName";

                    using (SqlConnection con = new SqlConnection(connStr2))
                    {
                        using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                        {
                            cmd.Parameters.AddWithValue("@author", authorName);
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
                    

                    string selectQuery2 = "SELECT podcastName, EPName, podcastEPNo FROM PodInfo WHERE authorName = @author";
                    using (SqlCommand cmd = new SqlCommand(selectQuery2, con))
                    {
                        cmd.Parameters.AddWithValue("@author", Session["Username"].ToString());
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // Populate labels with user details
                                epName = reader["EPName"].ToString();
                                epNo = reader["podcastEPNo"].ToString();
                                podName = reader["podcastName"].ToString();
                                epImg = GetThumbnailPath(Session["Username"].ToString(), podName);

                                // Replace this with the actual episode name
                                string episodeName = epName;
                                // Set the URL of the episodeLink anchor tag
                                string episodeLink = $"player.aspx?episodeName={Server.UrlEncode(episodeName)}";

                                podCard.Text += "<li><a runat = 'server' href = '" + episodeLink + "' class='podcast-card'><figure class='card-banner'>"
                                    + "<img src='" + epImg + "' />"
                                    + "<div class='card-banner-icon'><ion-icon name = 'play' ></ion - icon ></div></figure>"
                                    + "<div class='card-content'><div class='card-meta'><p class='pod-epi'>Episode: "
                                    + "<span>" + epNo + "</span></p></div>"
                                    + "<span class='h3 card-title'>" + epName + "</span></div></a></li>";
                            }
                        }
                    }
                    
                } 


            }
        }
        

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session.Clear(); // This will clear all session variables or, to specifically remove the username session variable:
            // Session["Username"] = null;
            
            Response.Redirect("redirecting.aspx");
        }
    }
}