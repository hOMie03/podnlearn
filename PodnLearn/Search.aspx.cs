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
    public partial class Search : System.Web.UI.Page
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
                    Response.Redirect("login.aspx");
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = searchTxt.Text;

            // Perform the search query against your database
            List<Podcast> searchResults = SearchPodcasts(searchQuery);

            // Display search results on the page
            DisplaySearchResults(searchResults);
        }
        private List<Podcast> SearchPodcasts(string searchQuery)
        {
            List<Podcast> results = new List<Podcast>();

            // Your connection string
            string connStr = ConfigurationManager.ConnectionStrings["connStrPod"].ConnectionString;

            // SQL query to search for podcasts
            string query = @"SELECT PD.podcastName, PD.thumbnailPath, PI.podcastEPNo, PI.EPName
                            FROM PodcastDetails PD
                            INNER JOIN PodInfo PI ON PD.PodcastName = PI.PodcastName
                            WHERE PD.PodcastName LIKE @searchQuery";

            // Create connection and command objects
            using (SqlConnection connection = new SqlConnection(connStr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameter for search query
                    command.Parameters.AddWithValue("@searchQuery", "%" + searchQuery + "%");

                    // Open connection and execute query
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Read and process results
                    while (reader.Read())
                    {
                        // Create a new Podcast object for each result and add it to the list
                        Podcast podcast = new Podcast
                        {
                            PodcastName = reader["PodcastName"].ToString(),
                            ThumbnailPath = reader["thumbnailPath"].ToString(),
                            EpisodeNumber = reader["podcastEPNo"].ToString(),
                            EpisodeName = reader["EPName"].ToString()
                        };
                        results.Add(podcast);
                    }
                }
            }

            return results;
        }
        private void DisplaySearchResults(List<Podcast> searchResults)
        {
            // Clear any previous search results
            string htmlContent = "";

            // Iterate through the search results and display each podcast
            foreach (Podcast podcast in searchResults)
            {
                string episodeLink = $"player.aspx?episodeName={podcast.EpisodeName}";

                // Construct HTML to display the podcast information
                string podcastHtml = "<div class='podcast'>";
                podcastHtml += "<li><a runat = 'server' href = '" + episodeLink + "' class='podcast-card'><figure class='card-banner'>"
                                    + "<img src='" + podcast.ThumbnailPath + "' />"
                                    + "<div class='card-banner-icon'><ion-icon name = 'play' ></ion - icon ></div></figure>"
                                    + "<div class='card-content'><div class='card-meta'><p class='pod-epi'>Episode: "
                                    + "<span>" + podcast.EpisodeNumber + "</span></p></div>"
                                    + "<span class='h3 card-title'>" + podcast.PodcastName + "</span></div></a></li>";
                htmlContent += podcastHtml;

                // Add the HTML to the search results container
                litSearchResults.Text = htmlContent;
            }
        }
    }
}