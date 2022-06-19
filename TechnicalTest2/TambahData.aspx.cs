using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace TechnicalTest2
{
    public partial class TambahData : System.Web.UI.Page
    {
        private string db = ConfigurationManager.ConnectionStrings["sekolah"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtnama.Text == "" || txtalamat.Text == "" || txtno.Text == "" || txtkelas.Text == "")
            {
                ShowMsgBox("Error Maasage:Data Tidak Boleh Kosong ");
                return;
            }


            MySqlConnection con = new MySqlConnection(db);
            MySqlCommand com = new MySqlCommand("", con);
            try
            {
                con.Open();
                com.CommandText = "insert into siswa(nama,alamat,no_telp,kelas,jenis_klamin) values(@nama,@alamat,@no,@kelas,@jk)";
                com.Parameters.AddWithValue("@nama", txtnama.Text);
                com.Parameters.AddWithValue("@alamat", txtalamat.Text);
                com.Parameters.AddWithValue("@no", txtno.Text);
                com.Parameters.AddWithValue("@kelas", txtkelas.Text);
                com.Parameters.AddWithValue("@jk", rbklamin.SelectedValue);
                com.ExecuteNonQuery();
                con.Close();
                ShowMsgBox("Data Berhasil Di simpan", "Default.aspx");
            }
            catch (Exception ex)
            {
                ShowMsgBox("Error Maasage:" + ex.Message);
            }

        }



        public void ShowMsgBox(string Smsg, string url = "")
        {
            Page curPage = HttpContext.Current.Handler as Page;

            if (curPage != null)
            {
                ClientScriptManager script = curPage.ClientScript;

                if (!script.IsStartupScriptRegistered(this.GetType(), "Alert"))
                {
                    string urlredirect = "";
                    if (url != "")
                        urlredirect = "window.location.href='" + url + "';";
                    Smsg = Smsg.Replace(@"\", @"\\").Replace("'", @"\'");
                    Smsg = Smsg.Replace(@"\\n", @"\n");
                    script.RegisterStartupScript(this.GetType(), "Alert", "<script type=text/javascript>alert('" + Smsg + "');" + urlredirect + "</script>");
                }
            }
        }
    }
}