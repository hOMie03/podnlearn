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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string emailaddr = email.Text;
            // Check if email contains an asterisk
            if (emailaddr.Contains("*") || emailaddr.Contains("#") || emailaddr.Contains("/") || emailaddr.Contains("&") || emailaddr.Contains("%") || emailaddr.Contains("!") || emailaddr.Contains("?"))
            {
                // Set error message and return without inserting to the database
                errorText.Text = "Email address cannot contain any special characters like *, #. Please enter a valid email address.";
                errorText.ForeColor = System.Drawing.Color.Red;
                errorText.Visible = true;
                return; // Stop the execution of further code
            }

            string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string username = uname.Text;
                string emailID = email.Text;
                string password = myInput.Text;
                string nameofperson = name.Text;
                string dateofbirth = dob.Text;
                string insertQuery = "INSERT INTO ProfileInfo (Username, Email, Password, Name, DOB) VALUES (@UserName, @Email, @Password, @Name, @DOB)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@UserName", username);
                    cmd.Parameters.AddWithValue("@Email", emailID);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Name", nameofperson);
                    cmd.Parameters.AddWithValue("@DOB", dateofbirth);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        errorText.Text = "Sign up successful! <a href='login.aspx'>Click here to Login</a>";
                        errorText.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        errorText.Text = "Sign up failed. Please try again.";
                        errorText.ForeColor = System.Drawing.Color.Red;
                    }

                    errorText.Visible = true;
                }
            }
        }
    }
}