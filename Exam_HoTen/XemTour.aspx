<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemTour.aspx.cs" Inherits="Exam_HoTen.XemTour" %>


<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>Trang xem tour</h2>
    <div class="container mt-4">
        <h2 class="text-center text-uppercase">Danh sách Tour Du Lịch</h2>
        <hr />

        <div class="form-inline justify-content-center mb-4">
            Chọn địa điểm: &nbsp;
            <asp:DropDownList ID="ddlDiadiem" runat="server" CssClass="form-control"
                AutoPostBack="True" DataSourceID="dsDiaDiem"
                DataTextField="TenDiaDiem" DataValueField="MDD">
            </asp:DropDownList>
        </div>


        <div class="row" style="margin-top: 10px">
            <asp:Repeater ID="rptTour" runat="server" DataSourceID="dsTour">
                <ItemTemplate>
                    <div class="col-md-4 text-center">
                        <div class="card h-100 shadow-sm text-center">
                            <img src='<%# "Hinh_Tour/" + Eval("Hinh") %>' class="card-img-top" style="height: 200px; object-fit: cover;" alt="...">
                            <br />
                            <h5 class="card-title text-primary"><%# Eval("TenTour") %></h5>
                            <p class="card-text">
                                Giá: <b class="text-danger"><%# Eval("Dongia", "{0:N0}") %> VNĐ</b><br />
                                Thời gian: <%# Eval("Songay") %> ngày <%# Convert.ToInt32(Eval("Songay")) - 1 %> đêm
                            </p>
                            <a href="DatTour.aspx?MaTour=<%# Eval("MaTour") %>" class="btn btn-primary">Đặt tour</a>
                            <a href="ChiTietTour.aspx?MaTour=<%# Eval("MaTour") %>" class="btn btn-success">Xem chi tiết</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <asp:SqlDataSource ID="dsDiaDiem" runat="server"
            ConnectionString="<%$ ConnectionStrings:dsTour %>"
            SelectCommand="SELECT * FROM [DiaDiem]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dsTour" runat="server"
            ConnectionString="<%$ ConnectionStrings:dsTour %>"
            SelectCommand="SELECT * FROM [Tour] WHERE ([MDD] = @MDD)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDiadiem" Name="MDD" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
