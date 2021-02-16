<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="Calendario.aspx.vb" Inherits="Siniestros_Calendario" %>
<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" runat="Server">
    <script src="../Scripts/Siniestros/Calendario.js"></script>
    <div class="zona-principal" style="overflow-x: hidden; overflow-y: hidden">

        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer" />
            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana0" class="expandir" />
            Dias feriados
        </div>

        <div class="panel-contenido ventana0">
            
                    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1" />
                    <div class="padding10"></div>
                    <div class="row">
            
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always" Width="25%">
                           <ContentTemplate>
                                <div class="col-md-5">
                            
                                    <asp:Label runat="server" class="col-md-4 etiqueta-control">Descripcion</asp:Label>
                                    <asp:TextBox runat="server" ID="txt_descripcion" CssClass="col-md-6 estandar-control"  PlaceHolder="Dia feriado"></asp:TextBox>
                            
                            
                                </div>

                                <div class="col-md-5">
                            
                                    <asp:Label runat="server" class="col-md-4 etiqueta-control" >Fecha</asp:Label>
                                    <asp:TextBox ID="txt_fecha_ini"   runat="server" CssClass="col-md-6 estandar-control fechadepago  Fecha Centro" autocomplete="off" placeholder="DD/MM/YYYY"></asp:TextBox>
                            
                            
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="col-md-2">
                                    <asp:LinkButton ID="btn_Agregar" runat="server" class="btn botones" BorderWidth="2" BorderColor="White" Width="105px">
                                        <span>
                                            <img class="btn-añadir"/>&nbsp Agregar
                                        </span>
                                    </asp:LinkButton>
                    

                        </div>
                        
                    </div>
                   
            <br />
            <div style="width: 100%; text-align: right; border-top-style: inset; border-width: 1px; border-color: #003A5D">
                </div>
     
            <br />
            <asp:UpdatePanel runat="server" ID="updGrd" UpdateMode="Conditional" Width="25%">
            <ContentTemplate>
                <asp:Panel runat="server" ID="pnlUsuario" Width="99%" Height="300" ScrollBars="Auto" >
        
                    <asp:GridView  ID="grd" runat="server" AutoGenerateColumns="False" CssClass="table grid-view center"  HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern" GridLines="Vertical" ShowHeaderWhenEmpty="True" Width="80%" RowStyle-VerticalAlign="Middle" >
                        <AlternatingRowStyle CssClass="altern" />
                        <Columns>

                            <asp:BoundField DataField="Dia" HeaderText="Dia"  />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />                            
                            <asp:TemplateField HeaderText="Fecha">
                                
                                <ItemTemplate>
                                    <asp:Label ID="fecha" runat="server" Text='<%# Bind("fecha") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ImageUrl="~/Images/delete_rojo.png" CommandName="Delete" runat="server" CssClass="btn Delete" Height="25" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>

                        <HeaderStyle CssClass="header" />
                        <RowStyle VerticalAlign="Middle" />

                    </asp:GridView>
        
                    <div style="width: 100%; text-align: right;" class="padding10"></div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btn_Agregar" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
       

            <div class="col-md-11">

                 <asp:Button Text="Exportar" CssClass="btn botones pull-right" ID="btn_Revisar" runat="server" />
            </div>
                    
            
        </div>
    </div>

    








   
    <br />
    <br />
    <br />
    <br />



</asp:Content>

