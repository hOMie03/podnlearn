using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace PodnLearn
{
    
    public partial class publishPodcast1 : System.Web.UI.Page
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
            txtUName.Text = Session["Username"].ToString();
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["connStrPod"].ConnectionString;
            

            if (podcastName != null && fileUploadThumbnail.HasFile)
            {
                string podName = podcastName.Text;
                Session["podcastName"] = podName;
                string thumbnailFilename = Path.GetFileName(fileUploadThumbnail.FileName);
                if (!string.IsNullOrEmpty(podName))
                {
                    string folderPath = Server.MapPath("~/Podcasts/") + podName;
                    Session["thumbnailPath"] = folderPath + "/Thumbnail/" + thumbnailFilename;

                    try
                    {
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                            Directory.CreateDirectory(folderPath + "/Thumbnail");
                            Response.Write("Podcast published successfully!");
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
                string thumbnailFilepath = Server.MapPath("~/Podcasts/" + podName +"/Thumbnail/") + thumbnailFilename;
                fileUploadThumbnail.SaveAs(thumbnailFilepath);
                
                // Save audioFilename and thumbnailFilename to database or perform any other necessary operations
                
                
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();
                    string insertQuery = "INSERT INTO PodcastDetails (podcastID, podcastName, thumbnailPath, authorName) VALUES (@podID, @podName, @thumbPath, @author)";
                    string thumbnailPath = "Podcasts/" + podName + "/Thumbnail/" + thumbnailFilename;
                    string authorName = Session["Username"].ToString();
                    var podcastID = Guid.NewGuid();

                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@podID", podcastID);
                        cmd.Parameters.AddWithValue("@podName", podName);
                        cmd.Parameters.AddWithValue("@thumbPath", thumbnailPath);
                        cmd.Parameters.AddWithValue("@author", authorName);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Redirect("uploadPodcastEpisodes.aspx");
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
}