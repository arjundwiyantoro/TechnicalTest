<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TechnicalTest2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div><h3>Data Siswa</h3></div>
                <div class="panel-heading">
                    <asp:Button ID="Button1" class="btn btn-info" runat="server" Text="Tambah Data" OnClick="Button1_Click" />
                    <%--<a href="CreateKategoriProduk" class="btn btn-info">Create</a>--%>
                </div>
    <div class="konten">
         <asp:GridView ID="GridView1" CssClass="table" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleted"
                 OnRowUpdating="GridView1_RowUpdating" DataKeyNames="id_siswa" OnRowCancelingEdit="GridView1_RowCancelingEdit" runat="server">
                <Columns>
                                <asp:TemplateField HeaderText="No">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nama">
                                    <ItemTemplate>
                                        <asp:Label ID="lblnama" runat="server" Text='<%#Eval("nama") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtnama" class="form-control" runat="server" Text='<%# Eval("nama") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="alamat">
                                    <ItemTemplate>
                                        <asp:Label ID="lblalamat" runat="server" Text='<%#Eval("alamat") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtalamat" class="form-control" runat="server" Text='<%# Eval("alamat") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No Telpon">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltelp" runat="server" Text='<%#Eval("no_telp") %>'></asp:Label>
                                    </ItemTemplate>
                                  <EditItemTemplate>
                                        <asp:TextBox ID="txttelp" class="form-control" runat="server" Text='<%# Eval("no_telp") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Kelas">
                                    <ItemTemplate>
                                        <asp:Label ID="lblkelas" runat="server" Text='<%#Eval("kelas") %>'></asp:Label>
                                    </ItemTemplate>
                                  <EditItemTemplate>
                                        <asp:TextBox ID="txtkelas" class="form-control" runat="server" Text='<%# Eval("kelas") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="jenis klamin">
                                    <ItemTemplate>
                                        <asp:Label ID="lbljk" runat="server" Text='<%#Eval("jenis_klamin") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
<%--                                    <asp:CheckBox ID="cbCanInsert2" runat="server" Text="Laki"  Checked='<%# Eval("jenis_klamin").ToString() == "L" ? True : False %>'  />
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Perempuan" Checked='<%# Eval("jenis_klamin").ToString() == "L" ? "True" : "False" %>'  />--%>
                                                    <asp:RadioButtonList ID="rbklamin" runat="server">
                                                            <asp:ListItem Text="Laki-Laki"  Value="L" />
                                                            <asp:ListItem Text="Perempuan"  Value="P" />
                                                    </asp:RadioButtonList>   <br />
                                  </EditItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Aksi">
                                <ItemTemplate>
                                    <asp:Button CommandName="Edit" CssClass="btn btn-success"   Text="Edit"   ID="btnEdit" Runat="server"></asp:Button>
                                    <asp:Button CommandName="Delete" OnClientClick="return confirm('apakah kamu ingin mendelete data ini?')" CssClass="btn btn-danger"  Text="Delete" ID="btnDel"  Runat="server"></asp:Button>
                                </ItemTemplate>
                                
                                <EditItemTemplate>
                                    <asp:Button CommandName="Update" Text="Update" ID="btnUpdate"  Runat="server"></asp:Button>
                                    <asp:Button CommandName="Cancel" Text="Cancel" ID="btnCancel"  Runat="server"></asp:Button>
                                </EditItemTemplate>
                                </asp:TemplateField>
                </Columns>
            </asp:GridView>
    </div>
</asp:Content>
