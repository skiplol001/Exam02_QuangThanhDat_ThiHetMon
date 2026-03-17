<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QTTour.aspx.cs" Inherits="Exam_HoTen.QTTour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>Trang quản trị tour</h2>
    <hr />    
    <div class="row">
         <div class="col-md-6">
              <div class="form-inline">
                   Tên tour <asp:TextBox ID="txtTen" runat="server" CssClass="form-control" Width="300"></asp:TextBox>
                  <asp:Button ID="btTraCuu" runat="server" Text="Tra cứu" CssClass="btn btn-primary" OnClick="btTraCuu_Click" />
              </div>
         </div>
        <div class="col-md-6 text-right">
             <a href="ThemTour.aspx" class="btn btn-success">Thêm tour mới</a>
        </div>
    </div>

    <div style="margin-top:20px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  
            DataKeyNames="MaTour" AllowPaging="True" PageSize="5"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowEditing="GridView1_RowEditing"
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowUpdating="GridView1_RowUpdating"
            OnRowDeleting="GridView1_RowDeleting"
            CssClass="table table-bordered table-hover" CellPadding="4" ForeColor="#333333" GridLines="None">
            
            <Columns>
                <asp:BoundField DataField="MaTour" HeaderText="Mã" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="TenTour" HeaderText="Tên Tour" ReadOnly="True" />
                
                <asp:ImageField DataImageUrlField="Hinh" DataImageUrlFormatString="~/Hinh_Tour/{0}" HeaderText="Hình Ảnh" ReadOnly="True">
                    <ControlStyle Width="100px" />
                </asp:ImageField>

                <asp:BoundField DataField="Dongia" HeaderText="Đơn giá" DataFormatString="{0:N0} VNĐ" HtmlEncode="false" />
                <asp:BoundField DataField="Songay" HeaderText="Số ngày" />
                
                <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Sửa" UpdateText="Update" CancelText="Cancle" />
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Xóa"  
                            OnClientClick="return confirm('Bạn có chắc chắn muốn xóa tour này?');" CssClass="btn btn-danger btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <EmptyDataTemplate>
                <div class="alert alert-warning mt-3">Không có tour nào thỏa mãn điều kiện tìm kiếm.</div>
            </EmptyDataTemplate>
            
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:GridView>
    </div>
    <asp:Label ID="lblThongBao" runat="server" Text="Label"></asp:Label>
</asp:Content>