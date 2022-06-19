using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace TechnicalTest2
{
    public partial class _Default : Page
    {
        private string db = ConfigurationManager.ConnectionStrings["sekolah"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loaddata();
            }
        }

        protected void loaddata()
        {

            DataTable dt = new DataTable();
            MySqlConnection con = new MySqlConnection(db);
            MySqlCommand com = new MySqlCommand("", con);
            com.CommandText = "select * from siswa";
            MySqlDataAdapter mda = new MySqlDataAdapter(com);
            mda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TambahData.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.loaddata();
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeleteEventArgs e)
        {
            string kdcabang = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            MySqlConnection con = new MySqlConnection(db);
            MySqlCommand com = new MySqlCommand("", con);
            try
            {
                con.Open();
                com.CommandText = "delete from siswa where id_siswa=@id";
                com.Parameters.AddWithValue("@id", kdcabang);
                com.ExecuteNonQuery();
                con.Close();
                ShowMsgBox("Berhasil Menghapus Data");
                loaddata();
            }
            catch (Exception ex)
            {
                ShowMsgBox("Error Maasage:" + ex.Message);
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id_siswa = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            GridViewRow row = GridView1.Rows[e.RowIndex];
            try
            {
                string nama = (row.FindControl("txtnama") as TextBox).Text;
                string alamat = (row.FindControl("txtalamat") as TextBox).Text;
                string no_telp = (row.FindControl("txttelp") as TextBox).Text;
                string kelas = (row.FindControl("txtkelas") as TextBox).Text;
                RadioButtonList Jenis_klamin = (RadioButtonList)row.FindControl("rbklamin");
                MySqlConnection con = new MySqlConnection(db);
                MySqlCommand com = new MySqlCommand("", con);
                con.Open();
                //com.CommandText = "Update siswa set nama='" + nama + "',alamat='" + alamat + "',no_telp='" + no_telp + "',kelas='" + kelas + "',jenis_klamin='" + Jenis_klamin.SelectedValue + "' where id_siswa='" + id_siswa + "'";
                com.CommandText = "Update siswa set nama=@nama,alamat=@alamat,no_telp=@no,kelas=@kelas,jenis_klamin=@jk where id_siswa=@id";
                com.Parameters.AddWithValue("@nama", nama);
                com.Parameters.AddWithValue("@alamat", alamat);
                com.Parameters.AddWithValue("@no", no_telp);
                com.Parameters.AddWithValue("@kelas", kelas);
                com.Parameters.AddWithValue("@jk", Jenis_klamin.SelectedValue);
                com.Parameters.AddWithValue("@id", id_siswa);
                com.ExecuteNonQuery();
                ShowMsgBox("Berhasil Mengupdate  Data");
            }
            catch (Exception ex)
            {
                ShowMsgBox("Error Maasage:" + ex.Message);
            }
            GridView1.EditIndex = -1;
            this.loaddata();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            this.loaddata();
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