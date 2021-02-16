<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="AnulacionTranferencias.aspx.vb" Inherits="Siniestros_AnulacionTranferencias" %>


<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" runat="Server">
      <script src="../Scripts/Siniestros/DatosEnvioCheque.js"></script>
     <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1" />
        <div class="zona-principal" style="overflow-x: hidden; overflow-y: hidden">
            <div class="cuadro-titulo panel-encabezado" style="text-align: left; tab-size: 18px">
                           <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer" />
            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana0" class="expandir"/>
                   &nbsp&nbsp Anulacion contable de tranferencias.
            </div>
             <div class="padding10"></div>
            <asp:UpdatePanel runat="server" ID="upGenerales" UpdateMode="Conditional" >
            <ContentTemplate>

             <div class="row">
                        


                 
                               <div class="form-group-sm col-md-6">
                                    <asp:Label runat="server" class="etiqueta-control">Organismo Financiero</asp:Label>
                           
                                       <div class="input-group">
                                          <asp:TextBox   ID="txt_organismo" runat="server"  CssClass="estandar-control Tablero"></asp:TextBox>
                                           <asp:HiddenField ID="cod_organismo" runat="server" />
                                           <asp:HiddenField ID="id_banco" runat="server" />
                                          <div class="input-group-btn">
                                            <asp:LinkButton ID="btnConsulta" runat="server" class="btn btn-primary btn-xs pull-left Tablero" Style="background-color: #003A5D;">...</asp:LinkButton>
                                          </div>
                                        </div>
     
                                </div>
              


                                       


   
                             
                  
                 

             

             </div>
            <div class="row">

                                <div class="form-group-sm col-md-3">
                                    <asp:Label runat="server" class="etiqueta-control">Nro Orden Pago</asp:Label>
                           
                                       <div class="input-group">
                                          <asp:TextBox   ID="txt_orden_pago" runat="server"  CssClass="estandar-control Tablero"></asp:TextBox>
                                           
                                          <div class="input-group-btn">
                                            <asp:LinkButton ID="btnOrden" runat="server" class="btn btn-primary btn-xs pull-left Tablero" Style="background-color: #003A5D;">...</asp:LinkButton>
                                          </div>
                                        </div>
     
                                </div>

                
                                <div class="form-group col-md-3">
                                    <asp:Label runat="server" class="etiqueta-control">Fecha de Pago</asp:Label>
                                    <asp:TextBox  ID="txt_fecha" runat="server"  CssClass="estandar-control siniestro Tablero"  disabled></asp:TextBox>
                            
                                </div>

                                <div class="form-group col-md-3">
                                    <asp:Label runat="server" class="etiqueta-control">Importe</asp:Label>
                                    <asp:TextBox  ID="txt_importe" runat="server"  CssClass="estandar-control siniestro Tablero"  disabled></asp:TextBox>
                            
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label runat="server" class="etiqueta-control">Cuenta de Tranferencia</asp:Label>
                                    <asp:TextBox  ID="txt_cuenta" runat="server"  CssClass="estandar-control siniestro Tablero"  disabled></asp:TextBox>
                            
                                </div>

        
            </div>
            <div class="row">
                                <div class="form-group col-md-3">
                                    <asp:Label runat="server" class="etiqueta-control">Transaccion de Pago</asp:Label>
                                    <asp:TextBox  ID="txt_transaccion" runat="server"  CssClass="estandar-control siniestro Tablero"  disabled></asp:TextBox>
                            
                                </div>

                                <div class="form-group col-md-6">
                                    <asp:Label runat="server" class="etiqueta-control">Transferencia a nombre de </asp:Label>
                                    <asp:TextBox  ID="txt_tranferencia" runat="server"  CssClass="estandar-control siniestro Tablero"  disabled></asp:TextBox>
                            
                                </div>
            </div>

            <div class="row">

                                <div class="form-group col-md-6">
                                    <asp:Label runat="server" class="etiqueta-control">Concepto de Anulacion</asp:Label>
                                    <asp:DropDownList ID="ddl_concepto" runat="server" ClientIDMode="Static" CssClass="estandar-control Tablero">
                                    </asp:DropDownList>
                                </div>

                 <div class="form-group col-md-3">
                     <asp:LinkButton ID="btn_AnularOP" runat="server" class="btn botones pull-right" BorderWidth="2" BorderColor="White" >
                        <span>
                            Aceptar
                        </span>
                    </asp:LinkButton>
                 </div>
                <div class="form-group col-md-3">
                   <asp:LinkButton ID="btnLimpiar" runat="server" class="btn botones pull-left" BorderWidth="2" BorderColor="White" >
                        <span>
                         Cancelar
                        </span>
                    </asp:LinkButton>
                </div>

                    


            </div>
                      </ContentTemplate>
                    <Triggers>
                       <asp:AsyncPostBackTrigger ControlID="btn_Aceptar" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnOrden" EventName="Click" />
                   </Triggers>
                </asp:UpdatePanel>  
                <div style="width:100%; text-align:right; border-top-style:inset; border-width:1px; border-color:#003A5D"></div>
            <br />
           
          

        </div>



          <center>           
        <div id="Modal"  class="modal-catalogo fade" >
            <div class="cuadro-titulo-flotante">
                <button type="button" data-dismiss="modal" class="close">&times;</button>
                <div><label id="lbl_Catalogo">Organismo Financiero</label></div>
            </div>
            <div class="clear padding5"></div>

                    <div class="input-group">
              
                   <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional" >
                       <ContentTemplate>

                                       <asp:Panel runat="server" ID="pnlUsuario" Width="100%" Height="300" ScrollBars="Auto" >
                                         <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#003A5D" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="95%">
                                             <AlternatingRowStyle BackColor="#DCDCDC" />
                                             <Columns>
                                               <asp:TemplateField HeaderText="Seleccionar" ItemStyle-HorizontalAlign="Center" ShowHeader="False">
                                                 <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked="false" />
                                                        
                                                  </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                 <asp:BoundField DataField="id_bco" HeaderText="ID Banco" />
                                                 <asp:BoundField DataField="cod_org_financiero" HeaderText="Codigo" />
                                                 <asp:BoundField DataField="txt_nom_org_financiero" HeaderText="Organismo" />
                                                 <asp:BoundField DataField="txt_nombre" HeaderText="Banco" />
                                                 <asp:BoundField DataField="nro_cta" HeaderText="Numero Cuenta" />
                                                 <asp:BoundField DataField="cod_cta_cb" HeaderText="Cuenta Contable" />
                                         

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
                        <asp:AsyncPostBackTrigger ControlID="btnConsulta" EventName="Click" />
                       </Triggers>
                   </asp:UpdatePanel> 
                  

                    </div>
                    
                    <div style="width:100%; text-align:right;">
                    <asp:LinkButton ID="btn_Aceptar" runat="server" class="btn botones " BorderWidth="2" BorderColor="White" >
                        <span>
                            Aceptar
                        </span>
                    </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn botones " BorderWidth="2" BorderColor="White"  data-dismiss="modal" >
                        <span>
                            Cancelar
                        </span>
                    </asp:LinkButton>
                    </div>

        </div>

        <div id="ModalOp"  class="modal-catalogo fade" >
            <div class="cuadro-titulo-flotante">
                <button type="button" data-dismiss="modal" class="close">&times;</button>
                <div><label id="lbl_CatalogoS">Orden de Pago</label></div>
            </div>
            <div class="clear padding5"></div>

                    <div class="input-group">
              
                   <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional" >
                       <ContentTemplate>

                                       <asp:Panel runat="server" ID="Panel1" Width="100%" Height="300" ScrollBars="Auto" >
                                         <asp:GridView ID="grdOp" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#003A5D" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="95%">
                                             <AlternatingRowStyle BackColor="#DCDCDC" />
                                             <Columns>
                                               <asp:TemplateField HeaderText="Seleccionar" ItemStyle-HorizontalAlign="Center" ShowHeader="False">
                                                 <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked="false" />
                                                        
                                                  </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                 <asp:BoundField DataField="nro_op" HeaderText="Nro Op" />
                                                 <asp:BoundField DataField="fec_pago" HeaderText="Fecha Pago" />
                                                 <asp:BoundField DataField="imp_total" HeaderText="Importe" />
                                                 <asp:BoundField DataField="txt_cheque_a_nom" HeaderText="Cheque a nombre de..." />
                                                 <asp:BoundField DataField="nro_recibo_imputacion" HeaderText="Recibo Imputacion" />
                                                 <asp:BoundField DataField="nro_cuenta_transferencia" HeaderText="Recibo Imputacion" />
                                         

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
                        <asp:AsyncPostBackTrigger ControlID="btnOrden" EventName="Click" />
                       </Triggers>
                   </asp:UpdatePanel> 
                  

                    </div>
                    
                    <div style="width:100%; text-align:right;">
                    <asp:LinkButton ID="btnAceptarOp" runat="server" class="btn botones " BorderWidth="2" BorderColor="White" >
                        <span>
                            Aceptar
                        </span>
                    </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" runat="server" class="btn botones " BorderWidth="2" BorderColor="White"  data-dismiss="modal" >
                        <span>
                            Cancelar
                        </span>
                    </asp:LinkButton>
                    </div>

        </div>


              </center>     
 
</asp:Content>


