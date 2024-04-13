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
    public partial class deleteAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                txtUName.Text = $"{username}";
            }
            else
            {
                // Redirect to login page if the username parameter is missing
                Response.Redirect("login.aspx");
            }
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connStr))
            {
                connection.Open();
                string query = "DELETE FROM ProfileInfo WHERE Username = @Username AND Password = @Password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", txtUName.Text);
                    command.Parameters.AddWithValue("@Password", myInput.Text);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Redirect to a page indicating successful account deletion or log out the user
                        errorText.Text = "Profile Deleted Successfully. <br /> <a href='login.aspx'>Click here</a> to go to login page.";
                        errorText.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        errorText.Text = "Wrong password. Enter the correct one.";
                        errorText.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}