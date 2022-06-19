<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TambahData.aspx.cs" Inherits="TechnicalTest2.TambahData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">Tambah Data Siswa</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">

            </div>
            <div class="panel-body">
                <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Nama</label>
                                <asp:TextBox ID="txtnama" ValidationGroup="grup1" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <%--<asp:RequiredFieldValidator ValidationGroup="grup1" CssClass="error" runat="server" id="reqName" controltovalidate="txtkd_prdk" errormessage="Kolom Wajib Di Isi" />--%>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Alamat</label>
                                <asp:TextBox ID="txtalamat" ValidationGroup="grup1" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                   </div>
                   <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>No Handphone</label>
                                <asp:TextBox ID="txtno" ValidationGroup="grup1" CssClass="form-control" runat="server"></asp:TextBox><br />
                                <%--<asp:RequiredFieldValidator ValidationGroup="grup1" CssClass="error" runat="server" id="reqName" controltovalidate="txtkd_prdk" errormessage="Kolom Wajib Di Isi" />--%>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Kelas</label>
                                <asp:TextBox ID="txtkelas" ValidationGroup="grup1" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                   </div>
                   <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Jenis Klamin:</label>
                                 <asp:RadioButtonList ID="rbklamin" runat="server">
                                        <asp:ListItem Text="Laki-Laki" Value="L" Selected="True" />
                                        <asp:ListItem Text="Perempuan" Value="P" />
                                </asp:RadioButtonList>   <br />
                            </div>
                        </div>
                   </div>
                   <div class="row">
                       <div class="col-md-3">
                            <div class="form-group">
                                <label></label>
                                <asp:Button ID="Button1" runat="server" CssClass="form-control btn-primary" Text="Simpan" OnClick="Button1_Click" />
                            </div>
                        </div>
                   </div>
            </div>
        </div>
    </div>
            

            
</asp:Content>
