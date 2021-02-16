<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="CatalogodeDependencias.aspx.vb" Inherits="Siniestros_CatalogodeDependencias" %>

<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" runat="Server">
      <script src="../Scripts/Siniestros/DatosEnvioCheque.js"></script>
     <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1" />
        <div class="zona-principal" style="overflow-x: hidden; overflow-y: hidden">
            <div class="cuadro-titulo panel-encabezado" style="text-align: left; tab-size: 18px">
                           <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer" />
            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana0" class="expandir"/>
                   &nbsp&nbsp Catalogo de dependencias
            </div>
             <div class="padding10"></div>
            <asp:UpdatePanel runat="server" ID="upGenerales" UpdateMode="Conditional" >
            <ContentTemplate>

             <div class="row">
                        <div class="form-group col-md-2">
                            <asp:Label runat="server" class="etiqueta-control">Pagar a</asp:Label>
                            <asp:DropDownList ID="cmbTipoUsuario" runat="server" ClientIDMode="Static" CssClass="estandar-control tipoUsuario Tablero" >
                                <asp:ListItem Value="7">ASEGURADO</asp:ListItem> <%--A--%>
                                <asp:ListItem Value="8">TERCERO</asp:ListItem>   <%--T--%>
                               
                            </asp:DropDownList>
                        </div>
                 


                 
                               <div class="form-group-sm col-md-2">
                                    <asp:Label runat="server" class="etiqueta-control">Codigo de Usuario</asp:Label>
                           
                                       <div class="input-group">
                                          <asp:TextBox   ID="txtCodigoUsuario" runat="server"  CssClass="estandar-control Tablero" placeholder="Codigo Usuario"></asp:TextBox>
                                          <div class="input-group-btn">
                                            <asp:LinkButton ID="btnConsulta" runat="server" class="btn btn-primary btn-xs pull-left Tablero" Style="background-color: #003A5D;">...</asp:LinkButton>
                                          </div>
                                        </div>
     
                                </div>
              

                                <div class="form-group col-md-2">
                                    <asp:Label runat="server" class="etiqueta-control">Beneficiario</asp:Label>
                                    <asp:TextBox AutoPostBack="True"  ID="txtNombre" runat="server"  CssClass="estandar-control siniestro Tablero" placeholder="Beneficiario" disabled></asp:TextBox>
                            
                                </div>

                                       


   
                                <div class="form-group col-md-2">
                                    <asp:Label runat="server" class="etiqueta-control">Banco</asp:Label>
                                    <asp:DropDownList ID="ddl_banco" runat="server" ClientIDMode="Static" CssClass="estandar-control Tablero">
                                    </asp:DropDownList>
                                </div>
                  
                                <div class="form-group-sm col-md-2">
                                    <asp:Label runat="server" class="etiqueta-control">Sucursal</asp:Label>
                                    <asp:TextBox   ID="txt_sucursal" runat="server"  CssClass="estandar-control Tablero" placeholder="Sucursal"></asp:TextBox>
     
                                </div>

                             <div class="form-group col-md-2">
                            <asp:Label runat="server" class="etiqueta-control">Estatus</asp:Label>
                            <asp:DropDownList ID="ddl_estatus" runat="server" ClientIDMode="Static" CssClass="estandar-control tipoUsuario Tablero" >
                                <asp:ListItem Value="-1">Activo</asp:ListItem> <%--A--%>
                                <asp:ListItem Value="0">InActivo</asp:ListItem>   <%--T--%>
                               
                            </asp:DropDownList>
                        </div>

             </div>
            <div class="row">



                                <div class="form-group-sm col-md-2">
                                    <asp:Label runat="server" class="etiqueta-control">Plaza</asp:Label>
                                    <asp:TextBox   ID="txt_planza" runat="server"  CssClass="estandar-control Tablero" placeholder="Plaza"></asp:TextBox>
     
                                </div>
                                <div class="form-group-sm col-md-2">
                                    <asp:Label runat="server" class="etiqueta-control">Clabe</asp:Label>
                                    <asp:TextBox   ID="txt_clabe" runat="server"  CssClass="estandar-control Tablero" placeholder="Clabe" MaxLength="18"></asp:TextBox>
     
                                </div>

                                <div class="form-group-sm col-md-2">
                                    <asp:Label runat="server" class="etiqueta-control">Dependencia</asp:Label>
                                    <asp:TextBox   ID="txt_dependencia" runat="server"  CssClass="estandar-control Tablero" placeholder="Dependencia"></asp:TextBox>
     
                                </div>

                                 <div class="form-group-sm col-md-2">
                                    <asp:Label runat="server" class="etiqueta-control">Clave de referencia</asp:Label>
                                    <asp:TextBox   ID="txt_clave_referencia" runat="server"  CssClass="estandar-control Tablero" placeholder="Clave de Referencia"></asp:TextBox>
     
                                </div>

                                 <div class="form-group-sm col-md-2">
                                    <asp:Label runat="server" class="etiqueta-control">Clave de dependencia</asp:Label>
                                    <asp:TextBox   ID="txt_clave_dependencia" runat="server"  CssClass="estandar-control Tablero" placeholder="Clave de dependencia"></asp:TextBox>
     
                                </div>

                                          <div class="form-group col-md-2">
                             <br />
                                <asp:LinkButton ID="btnAgregar" runat="server" class="btn btn-primary btn-xs pull-right Tablero" Style="background-color: #003A5D;">Guardar</asp:LinkButton>
                           </div>
            </div>
                      </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
                   </Triggers>
                </asp:UpdatePanel>  
                <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D"></div>
            <br />
              <div class="row">
                  <center>
                   <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional" >
                       <ContentTemplate>

                                       <asp:Panel runat="server" ID="pnlUsuario" Width="100%" Height="300" ScrollBars="Auto" >
                                         <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#003A5D" BorderStyle="None" BorderWidth="1px" CellPadding="15" GridLines="Vertical" Width="95%">
                                             <AlternatingRowStyle BackColor="#DCDCDC" />
                                             <Columns>
                                                 
                                                 <asp:BoundField DataField="PagarA" HeaderText="Asegurado ó Tercero" />
                                                 <asp:BoundField DataField="codigo" HeaderText="Código" />
                                                 <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                 <asp:BoundField DataField="sucursal" HeaderText="Sucursal" />
                                                 <asp:BoundField DataField="plaza" HeaderText="Plaza" />
                                                 <asp:BoundField DataField="clabe" HeaderText="Clabe" />
                                                 <asp:BoundField DataField="dependencia" HeaderText="Dependencia" />
                                                 <asp:BoundField DataField="clave_referencia" HeaderText="Clave de Referencia" />
                                                 <asp:BoundField DataField="clave_dependencia" HeaderText="Clave de Dependencia" />
                                                 
                                         
                                                  <asp:TemplateField HeaderText="Activo" ItemStyle-HorizontalAlign="Center" ShowHeader="False">
                                                 <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("status") %>' Enabled="false" />
                                                        
                                                  </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                             </Columns>
                                             <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                             <HeaderStyle BackColor="#003A5D" Font-Bold="True" ForeColor="White" />
                                             <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                             <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                             <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                             <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                             <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                             <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                             <SortedDescendingHeaderStyle BackColor="#000065" />
                                         </asp:GridView>
                                           </asp:Panel>

                       </ContentTemplate>
                       <Triggers>
                           <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" /> 
                            
                       </Triggers>
                   </asp:UpdatePanel> 
                      </center>
            </div>
           
          

        </div>
 
</asp:Content>


