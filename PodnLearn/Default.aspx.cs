using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;

namespace PodnLearn
{
    public partial class Default : System.Web.UI.Page
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
                    lblWelcome.Text = $"Welcome, {username}!";
                }
                else
                {
                    // Redirect to login page if the username parameter is missing
                    Response.Redirect("login.aspx");
                }

                string connStr = ConfigurationManager.ConnectionStrings["connStrPod"].ConnectionString;
                string GetThumbnailPath(string podName)
                {
                    string thumbnailPath = "";
                    string selectQuery = "SELECT thumbnailPath FROM PodcastDetails where podcastName = @podName";

                    using (SqlConnection con = new SqlConnection(connStr))
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

                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();


                    string selectQuery2 = "SELECT podcastName, EPName, podcastEPNo FROM PodInfo";
                    using (SqlCommand cmd = new SqlCommand(selectQuery2, con))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // Populate labels with user details
                                epName = reader["EPName"].ToString();
                                epNo = reader["podcastEPNo"].ToString();
                                podName = reader["podcastName"].ToString();
                                epImg = GetThumbnailPath(podName);

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


        //Newsletter
        protected void SubscribeButton_Click(object sender, EventArgs e)
        {
            string userEmail = email4newsletter.Text.Trim();

            if (IsEmailValid(userEmail))
            {
                if (!IsAlreadySubscribed(userEmail))
                {
                    AddToSubscriptionList(userEmail);
                    SendWelcomeEmail(userEmail);
                    successTxt.Text = "Subscription successful!";
                }
                else
                {
                    successTxt.Text = "Already subscribed";
                }
            }
            else
            {
                successTxt.Text = "Invalid email address";
            }
        }
        private bool IsEmailValid(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        string connStr4NL = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
        private bool IsAlreadySubscribed(string email)
        {
            bool isSubscribed = false;
            string query = "SELECT COUNT(*) FROM NewsLetter WHERE emailID = @Email";

            using (SqlConnection connection = new SqlConnection(connStr4NL))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    isSubscribed = (count > 0);
                }
            }

            return isSubscribed;
        }
        private void AddToSubscriptionList(string email)
        {
            string query = "INSERT INTO NewsLetter (emailID) VALUES (@Email)";

            using (SqlConnection connection = new SqlConnection(connStr4NL))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void SendWelcomeEmail(string emailAddress)
        {
            // Configure SMTP client
            SmtpClient smtpClient = new SmtpClient("smtp-mail.outlook.com", 587); // Change the host and port as per your SMTP server
            smtpClient.EnableSsl = true; // Enable SSL if required
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("podnlearn@hotmail.com", "ggOmi@3123"); // Change the username and password

            // Create email message
            MailMessage message = new MailMessage();
            message.From = new MailAddress("podnlearn@hotmail.com"); // Change the sender email address
            message.To.Add(emailAddress);
            message.Subject = "Welcome to Our Newsletter!";
            message.Body = "Thank you for subscribing to our newsletter. We will keep you updated with the latest podcast updates, what's new, and news related to your favorite podcasters!" 
                + "\n" + "We're excited to have you on board!" 
                + "\n\n" + "Regards, PodnLearn.";

            // Send email
            try
            {
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
                // Handle any exceptions or logging here
                // You can display an error message to the user if the email fails to send
            }
        }

    }
}