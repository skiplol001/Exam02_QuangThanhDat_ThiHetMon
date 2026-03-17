<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemTour.aspx.cs" Inherits="Exam_HoTen.ThemTour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>Trang thêm tour</h2>
    <hr />
      
    <div class="form-group">
        <label>Địa điểm</label> 
        <asp:DropDownList ID="ddlDiadiem" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>

    <div class="form-group">
        <label>Tên tour</label> 
        <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTen" runat="server" ErrorMessage="Chưa nhập tên tour" Text="(*)" ControlToValidate="txtTen" ForeColor="#CC3300" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <label>Chương trình</label> 
        <asp:TextBox ID="txtChuongTrinh" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
    </div>

    <div class="form-inline">
        <label>Số ngày</label> &nbsp;
        <asp:TextBox ID="txtSoNgay" runat="server" CssClass="form-control" Width="100px"></asp:TextBox>
        <asp:CompareValidator ID="cvSoNgay" runat="server" ErrorMessage="Số ngày không hợp lệ" ControlToValidate="txtSoNgay" ForeColor="#CC3300" Operator="GreaterThan" Type="Integer" ValueToCompare="0" Display="Dynamic">(*)</asp:CompareValidator>
        
        &nbsp;&nbsp; <label>Đơn giá</label> &nbsp;
        <asp:TextBox ID="txtDongia" runat="server" CssClass="form-control" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGia" runat="server" ControlToValidate="txtDongia" ErrorMessage="Chưa nhập đơn giá" ForeColor="#CC3300" Display="Dynamic">(*)</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvGia" runat="server" ControlToValidate="txtDongia" Operator="GreaterThanEqual" ValueToCompare="0" Type="Integer" ErrorMessage="Giá phải >= 0" ForeColor="#CC3300" Display="Dynamic">(*)</asp:CompareValidator>
    </div>
     
    <div class="form-group mt-3">
        <label>Hình ảnh đại diện</label> 
        <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control" />
    </div>
    <asp:Button ID="btXuLy" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btXuLy_Click" /> <br />

    <asp:Label ID="lbThongBao" runat="server" Text="" ForeColor="#cc3300" CssClass="mt-2 d-block"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" HeaderText="Vui lòng sửa các lỗi sau:" />
</asp:Content>