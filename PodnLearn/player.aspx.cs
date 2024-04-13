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
    public partial class player : System.Web.UI.Page
    {
        protected string PodcastFilePath { get; set; }
        protected string ThumbPath { get; set; }
        string connStr2 = ConfigurationManager.ConnectionStrings["connStrPod"].ConnectionString;
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
                    Response.Redirect("login.aspx");
                }


                // Retrieve the podcast file path from the database
                PodcastFilePath = GetPodcastFilePath();
                if (!string.IsNullOrEmpty(Request.QueryString["episodeName"]))
                {
                    string episodeName = Request.QueryString["episodeName"];
                    Session["EpisodeName"] = episodeName;
                    epName.Text = episodeName;
                }
                else
                {
                    epName.Text = "No Podcast Selected.";
                    epNameAgain.Text = "No Podcast Selected.";
                }

                string selectQuery4 = "SELECT EPName FROM Favorites WHERE Username = @user AND EPName = @epName";
                using (SqlConnection con = new SqlConnection(connStr2))
                {
                    using (SqlCommand cmd = new SqlCommand(selectQuery4, con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@user", Session["Username"].ToString());
                        cmd.Parameters.AddWithValue("@epName", epName.Text);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                if (epName.Text == reader["epName"].ToString())
                                {
                                    addLabel.Text = "In Favorites";
                                    addLabel.ForeColor = System.Drawing.Color.LightBlue;
                                    toggleFavoriteButton.Text = "❤️";
                                }
                                else
                                {
                                    addLabel.Text = "Removed from Favorites";
                                    toggleFavoriteButton.Text = "🤍";
                                }
                            }
                        }

                    }
                }
            }
        }
        private string GetPodcastFilePath()
        {
            string filepath;
            string epiName = epName.Text;
            string selectQuery = "SELECT podcastName, EPName, epFilepath FROM PodInfo WHERE EPName = @epname";
            using (SqlConnection con = new SqlConnection(connStr2))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                {
                    cmd.Parameters.AddWithValue("@epname", Request.QueryString["episodeName"]);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Populate labels with user details
                            podName.Text = reader["podcastName"].ToString();
                            podNameAgain.Text = reader["podcastName"].ToString();
                            epName.Text = reader["EPName"].ToString();
                            epNameAgain.Text = reader["EPName"].ToString();
                            filepath = reader["epFilepath"].ToString();
                        }
                        else
                        {
                            epName.Text = "ERROR! CAN'T DETAILS ABOUT THE PODCAST!";
                            filepath = "lol";
                        }
                    }
                }
            }
            string selectQuery2 = "SELECT podcastID, thumbnailPath, authorName FROM PodcastDetails WHERE podcastName = @podName";
            using (SqlConnection con = new SqlConnection(connStr2))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(selectQuery2, con))
                {
                    cmd.Parameters.AddWithValue("@podName", podName.Text);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Populate labels with user details
                            ThumbPath = reader["thumbnailPath"].ToString();
                            Session["podcastID"] = reader["podcastID"].ToString();
                            Session["authorName"] = reader["authorName"].ToString();
                        }
                        else
                        {
                            epName.Text = "ERROR! CAN'T FIND THUMBNAIL FOR THE PODCAST!";
                        }
                    }
                }
            }
            return filepath;
        }


        //Favorite Episodes
        protected void toggleFavoriteButton_Click(object sender, EventArgs e)
        {
            // Call the backend method to toggle favorite
            toggleFavorite();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void toggleFavorite()
        {
            string username = Session["Username"].ToString(); // Retrieve username
            string podcastID = Session["podcastID"].ToString(); // Retrieve podcast ID
            string episodeName = epName.Text;
            string authorName = Session["authorName"].ToString();// Retrieve author name

            if (IsEpisodeInFavorites(username, podcastID))
            {
                // Episode is in favorites, so remove it
                RemoveFromFavorites(username, podcastID);

            }
            else
            {
                // Episode is not in favorites, so add it
                AddToFavorites(username, podcastID, episodeName, authorName);
            }
        }
        protected bool IsEpisodeInFavorites(string username, string podcastID)
        {
            string selectQuery = "SELECT Count(*) FROM Favorites WHERE Username = @user AND podcastID = @podID";
            using (SqlConnection con = new SqlConnection(connStr2))
            {
                using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                {
                    cmd.Parameters.AddWithValue("@user", username);
                    cmd.Parameters.AddWithValue("@podID", podcastID);

                    con.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }
        protected void AddToFavorites(string username, string podcastID, string episodeName, string authorName)
        {
            // Check if the episode is already in favorites
            if (!IsEpisodeInFavorites(username, podcastID))
            {
                string insertQuery = "INSERT INTO Favorites (podcastId, podcastName, EPName, authorName, Username) VALUES (@podID, @podName, @epName, @author, @user)";

                using (SqlConnection con = new SqlConnection(connStr2))
                {
                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@podID", podcastID);
                        cmd.Parameters.AddWithValue("@podName", podName.Text);
                        cmd.Parameters.AddWithValue("@epName", episodeName);
                        cmd.Parameters.AddWithValue("@author", authorName);
                        cmd.Parameters.AddWithValue("@user", username);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            else
            {
                // The episode is already in favorites
                // You may handle this case according to your application's logic
                // For example, you could display a message to the user
                // Or you could choose to ignore the duplicate addition
            }
        }
        protected void RemoveFromFavorites(string username, string podcastID)
        {
            string deleteQuery = "DELETE FROM Favorites WHERE Username = @user AND podcastID = @podID";

            using (SqlConnection con = new SqlConnection(connStr2))
            {
                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@user", username);
                    cmd.Parameters.AddWithValue("@podID", podcastID);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}