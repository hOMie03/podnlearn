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
    public partial class uploadPodcast : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["connStrPod"].ConnectionString;
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
            string podName = Session["podcastName"].ToString();
            podcastName.Text = podName;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                string selectQuery = "SELECT podcastID FROM PodcastDetails WHERE podcastName = @podName";
                using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                {
                    cmd.Parameters.AddWithValue("@podName", podName);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Populate labels with user details
                            podcastID.Text = reader["podcastID"].ToString();
                        }
                        else
                        {
                            errorText.Text = "ERROR! CAN'T FIND ID FOR PODCAST";
                        }
                    }
                }
            }
            
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            

            if (fileUploadAudio.HasFile && episodeName != null && podcastName != null)
            {
                string podID = podcastID.Text;
                string podName = podcastName.Text;
                string epName = episodeName.Text;
                string epNo = podEPNo.Text;
                string audioFilename = Path.GetFileName(fileUploadAudio.FileName);
                string audioFilepath = Server.MapPath("~/Podcasts/" + podName + "/") + audioFilename;
                Session["epFilepath"] = audioFilepath + "/" + audioFilename;
                fileUploadAudio.SaveAs(audioFilepath);


                // Save audioFilename and thumbnailFilename to database or perform any other necessary operations
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    

                    con.Open();
                    string insertQuery = "INSERT INTO PodInfo (podcastID, podcastName, EPName, podcastEPNo,  authorName, epFilepath) VALUES (@podID, @podName, @epName, @epNo, @author, @epPath)";
                    string epFilepath = "Podcasts/" + podName + "/" + audioFilename;
                    string authorName = Session["Username"].ToString();
                    

                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@podID", podID);
                        cmd.Parameters.AddWithValue("@podName", podName);
                        cmd.Parameters.AddWithValue("@EPName", epName);
                        cmd.Parameters.AddWithValue("@epNo", epNo);
                        cmd.Parameters.AddWithValue("@author", authorName);
                        cmd.Parameters.AddWithValue("@epPath", epFilepath);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Redirect("Default.aspx");
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