using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Exam_HoTen.Models;

namespace Exam_HoTen
{
    public partial class QTTour : System.Web.UI.Page
    {
        TourDAO dao = new TourDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            GridView1.DataSource = dao.getTheoTen(txtTen.Text); 
            GridView1.DataBind();
        }

        public void btTraCuu_Click(object sender, EventArgs e)
        {
            string tuKhoa = txtTen.Text.Trim();
            List<Tour> dsKetQua = dao.getTheoTen(tuKhoa);

            GridView1.DataSource = dsKetQua;
            GridView1.PageIndex = 0; 
            GridView1.DataBind();

            if (dsKetQua.Count == 0)
            {
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int maTour = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());

            string gia = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string ngay = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            Tour t = new Tour { MaTour = maTour, Dongia = int.Parse(gia), SoNgay = int.Parse(ngay) };
            dao.Update(t); 

            GridView1.EditIndex = -1;
            LoadData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int maTour = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            dao.Delete(new Tour { MaTour = maTour }); 
            LoadData();
        }
    }
}
