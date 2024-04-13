using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PodnLearn
{
    public partial class forgotpswd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString; ; // Replace with your SQL Server connection string

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string email = txtEmail.Text;

                    string selectQuery = "SELECT Password FROM ProfileInfo WHERE Email = @Email";

                    using (SqlCommand command = new SqlCommand(selectQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);

                        SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                        DataSet dataSet = new DataSet();
                        dataAdapter.Fill(dataSet);

                        if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
                        {
                            // Email exists in the database
                            string password = dataSet.Tables[0].Rows[0]["Password"].ToString();

                            // Send the password to the user via email
                            SendEmail(email, password);

                            // Display success message
                            lblMessage.Text = "Your password has been sent to your email.";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            // Email does not exist in the database
                            lblMessage.Text = "Email not found. Please enter a valid email address.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }

                        lblMessage.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions (e.g., display or log the error)
                lblMessage.Text = $"Error: {ex.Message}";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }
        }

        private void SendEmail(string email, string password)
        {
            string smtpServer = "smtp-mail.outlook.com";
            int port = 587; // Update the port if needed
            string smtpUsername = "podnlearn@hotmail.com";
            string smtpPassword = "ggOmi@3123";

            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("podnlearn@hotmail.com"); // Update with your email address
            mailMessage.To.Add(email);
            mailMessage.Subject = "Your Password Recovery";
            mailMessage.Body = $"Your password is: {password}" + "\n\n" + "Regards, PodnLearn.";

            SmtpClient smtpClient = new SmtpClient(smtpServer, port);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
            smtpClient.EnableSsl = true; // Enable SSL if required by your SMTP server

            smtpClient.Send(mailMessage);
        }
    }
}