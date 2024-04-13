using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PodnLearn
{
    public partial class login : System.Web.UI.Page
    {
        public string emailID, pswd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    string username = uname.Text;
                    string password = myInput.Text;

                    string selectQuery = "SELECT * FROM ProfileInfo WHERE Username = @Username AND Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                        DataSet dataSet = new DataSet();
                        dataAdapter.Fill(dataSet);

                        if (dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
                        {
                            // Login successful
                            errorText.Text = "Login successful!";
                            errorText.ForeColor = System.Drawing.Color.Green;
                            // Store username in a session variable
                            Session["Username"] = username;
                            // Redirect to Home Page
                            Response.Redirect("Default.aspx");
                        }
                        else
                        {
                            // Login failed
                            errorText.Text = "Invalid username or password. Please try again.";
                            errorText.ForeColor = System.Drawing.Color.Red;
                        }

                        errorText.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions (e.g., display or log the error)
                errorText.Text = $"Error during login: {ex.Message}";
                errorText.ForeColor = System.Drawing.Color.Red;
                errorText.Visible = true;
            }
        }
    }
}