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
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                lblUsername.Text = $"{username}";
            }
            else
            {
                // Redirect to login page if the username parameter is missing
                Response.Redirect("login.aspx");
            }

            string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT Username FROM ProfileInfo WHERE Username = @Username";

                using (SqlCommand command = new SqlCommand(query, conn))
                {
                    command.Parameters.AddWithValue("@Username", lblUsername.Text);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtUName.Text = reader["Username"].ToString();
                        }
                    }
                }
            }


        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            string uname = txtUName.Text;
            string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "UPDATE ProfileInfo SET Name = @Name, Email = @Email, DOB = @DOB WHERE Username = @Username";

                using (SqlCommand command = new SqlCommand(query, conn))
                {
                    command.Parameters.AddWithValue("@Username", uname);
                    command.Parameters.AddWithValue("@Name", txtName.Text);
                    command.Parameters.AddWithValue("@Email", txtEmail.Text);
                    command.Parameters.AddWithValue("@DOB", txtDOB.Text);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        errorTxt.Text = "Changes done successfully!";
                        errorTxt.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        errorTxt.Text = "Couldn't done changes. Try again";
                        errorTxt.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}