using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Exam_HoTen.Models;


namespace Exam_HoTen
{
    public partial class ThemTour : System.Web.UI.Page
    {
        DiaDiemDAO ddDao = new DiaDiemDAO();
        TourDAO tourDao = new TourDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDiaDiem();
            }
        }

        private void LoadDiaDiem()
        {
            ddlDiadiem.DataSource = ddDao.getAll();
            ddlDiadiem.DataTextField = "TenDiaDiem";
            ddlDiadiem.DataValueField = "MDD";
            ddlDiadiem.DataBind();
        }

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string hinhAnh = "no_image.jpg";
                    if (FHinh.HasFile)
                    {
                        hinhAnh = FHinh.FileName;
                        FHinh.SaveAs(Server.MapPath("~/Hinh_Tour/") + hinhAnh);
                    }

                    Tour tourMoi = new Tour
                    {
                        TenTour = txtTen.Text.Trim(),
                        ChuongTrinh = txtChuongTrinh.Text.Trim(),
                        SoNgay = int.Parse(txtSoNgay.Text),
                        Dongia = int.Parse(txtDongia.Text),
                        MDD = int.Parse(ddlDiadiem.SelectedValue),
                        Hinh = hinhAnh
                    };

                    if (tourDao.Insert(tourMoi) > 0)
                    {
                        lbThongBao.Text = "Thêm tour mới thành công!";
                        lbThongBao.ForeColor = System.Drawing.Color.Blue;
                        XoaTrangForm();
                    }
                    else
                    {
                        lbThongBao.Text = "Thêm mới thất bại. Vui lòng kiểm tra lại dữ liệu.";
                        lbThongBao.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lbThongBao.Text = "Lỗi hệ thống: " + ex.Message;
                }
            }
        }

        private void XoaTrangForm()
        {
            txtTen.Text = "";
            txtChuongTrinh.Text = "";
            txtSoNgay.Text = "";
            txtDongia.Text = "";
            ddlDiadiem.SelectedIndex = 0;
        }
    }
}