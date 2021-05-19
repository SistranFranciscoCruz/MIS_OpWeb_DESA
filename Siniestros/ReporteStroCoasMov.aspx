<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="ReporteStroCoasMov.aspx.vb" Inherits="Siniestros_ReporteStroCoasMov" %>

<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" runat="Server">
    <script src="../Scripts/Siniestros/PagoInter.js"></script>
    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1|1|1|1|1|1|1|1|" />
<%------------------------------------------------------------------------------------------------------------------------------%>   
    <div style="overflow-x: hidden">
        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer" />
            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana0" class="expandir" />
            Reporte de Siniestros en Coaseguro Movimientos
        </div>
        <%------------------------------------------------------------------------------------------------------------------------------%>
        <div class="panel-contenido ventana0">
            <asp:UpdatePanel runat="server" ID="upFiltros">
                <ContentTemplate>
                    <asp:HiddenField runat="server" ID="HiddenField1" Value="0|1" />
                    <div class="padding10"></div>
                    <div class="row">
                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Tipo de Coaseguro</asp:Label>
                            <asp:DropDownList ID="cmbTipoCoas" runat="server" ClientIDMode="Static" CssClass="estandar-control  Centro"></asp:DropDownList>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Siniestro</asp:Label>
                            <asp:TextBox runat="server" ID="txt_Siniestro" CssClass="estandar-control Fecha Centro"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control" Width="25%">Subsiniestro</asp:Label>
                            <asp:DropDownList ID="cmbSubsiniestro" runat="server" ClientIDMode="Static" CssClass="estandar-control  Centro"></asp:DropDownList>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Llave Póliza (Sucursal-Producto-Póliza)</asp:Label>
                            <asp:TextBox runat="server" ID="txt_Poliza" CssClass="estandar-control Fecha Centro"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Sufijo</asp:Label>
                            <asp:DropDownList ID="cmbSufijo" runat="server" ClientIDMode="Static" CssClass="estandar-control  Centro"></asp:DropDownList>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Asegurado</asp:Label>
                            <asp:DropDownList ID="cmbAsegurado" runat="server" ClientIDMode="Static" CssClass="estandar-control  Centro"></asp:DropDownList>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Clave Ramo Contable</asp:Label>
                            <asp:DropDownList ID="cmbCodRamo" runat="server" ClientIDMode="Static" CssClass="estandar-control  Centro"></asp:DropDownList>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Ramo Contable </asp:Label>
                            <asp:DropDownList ID="cmbRamo" runat="server" ClientIDMode="Static" CssClass="estandar-control  Centro"></asp:DropDownList>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Evento Catastrófico</asp:Label>
                            <asp:DropDownList ID="cmbEventoCatas" runat="server" ClientIDMode="Static" CssClass="estandar-control  Centro"></asp:DropDownList>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Nombre Coasegurador</asp:Label>
                            <asp:TextBox runat="server" ID="TxtNomCoasegurador" CssClass="estandar-control Fecha Centro"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Tipo de Estimación</asp:Label>
                            <asp:DropDownList ID="cmbTipoEstim" runat="server" ClientIDMode="Static" CssClass="estandar-control  Centro"></asp:DropDownList>
                        </div>

                        <div class="form-group col-md-3">
                            <asp:Label runat="server" class="etiqueta-control">Tipo de Movimiento</asp:Label>
                            <asp:DropDownList ID="cmbTipoMov" runat="server" ClientIDMode="Static" CssClass="estandar-control  Centro"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="clear padding5"></div>
                    <div class="padding5"></div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
<%------------------------------------------------------------------------------------------------------------------------------%>
    <div style="width: 100%; text-align: right; border-top-style: inset; border-width: 1px; border-color: #003A5D">
        <div class="padding10">
            <asp:UpdatePanel runat="server" ID="upBusqueda">
                <ContentTemplate>
                    <asp:LinkButton ID="btn_Imprimir" runat="server" class="btn botones" BorderWidth="2" BorderColor="White" Width="120px" Visible="false">
                        <span>
                            <img class="btn-imprimir"/>
                            Imprimir
                        </span>
                    </asp:LinkButton>  

                    <asp:LinkButton ID="btnReporte" runat="server" class="btn botones" BorderWidth="2" BorderColor="White" Width="105px">
                        <span>
                            <img class="btn-buscar"/>&nbsp Buscar
                        </span>
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnLimpiar" runat="server" class="btn botones" BorderWidth="2" BorderColor="White" Width="130px">
                        <span>
                            <img class="btn-limpiar"/>&nbsp&nbsp Limpiar Filtros
                        </span>
                    </asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
<%------------------------------------------------------------------------------------------------------------------------------%>
    <div class="padding30"></div>
    <div class="row">
        <center>
            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional" Width="25%" >
                <ContentTemplate>
                    <asp:Panel runat="server" ID="pnlUsuario" Width="99%" Height="300" ScrollBars="Auto" >
                        <%--<asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" OnRowCommand="grd_RowCommand" DataKeyNames="nro_OP" CssClass="table-condensed table-hover" Font-Size="11px" GridLines="Vertical" HeaderStyle-CssClass="header" Height="35px" HorizontalAlign="Center" ShowHeaderWhenEmpty="True">--%>
                        <%--<asp:GridView ID="GridRptStroCoas" runat="server" AutoGenerateColumns="False" CssClass="table-condensed table-hover" Font-Size="11px" GridLines="Vertical" HeaderStyle-CssClass="header" Height="35px" HorizontalAlign="Center">--%>
                            <asp:GridView ID="GridRptStroCoas" runat="server" AutoGenerateColumns="false" CssClass="table grid-view " HeaderStyle-CssClass="header" AlternatingRowStyle-CssClass="altern" GridLines="Vertical" ShowHeaderWhenEmpty="true" ShowHeader="True" Width="95%" RowStyle-VerticalAlign="Middle">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>                                                           
                                <asp:BoundField DataField="Tipo_Coaseguro" HeaderText= "Tipo de Coaseguro"/>
                                <asp:BoundField DataField="Siniestro" HeaderText= "Siniestro"/>
                                <asp:BoundField DataField="Subsiniestro" HeaderText= "Subsiniestro"/>
                                <asp:BoundField DataField="Llave_póliza" HeaderText= "Llave póliza (Sucursal-Producto-Póliza)"/>
                                <asp:BoundField DataField="Sufijo" HeaderText= "Sufijo"/>
                                <asp:BoundField DataField="Endoso" HeaderText= "Endoso"/>
                                <asp:BoundField DataField="Asegurado" HeaderText= "Asegurado"/>
                                <asp:BoundField DataField="Vigencia_Desde" HeaderText= "Vigencia Desde"/>
                                <asp:BoundField DataField="Vigencia_Hasta" HeaderText= "Vigencia Hasta"/>
                                <asp:BoundField DataField="Cod_Ramo" HeaderText= "Clave Ramo Contable"/>
                                <asp:BoundField DataField="Ramo_Contable" HeaderText= "Ramo Contable"/>
                                <asp:BoundField DataField="Tipo_Alta_Stro" HeaderText= "Tipo de Alta Siniestro"/>
                                <asp:BoundField DataField="Fecha_Ocurrido" HeaderText= "Fecha de Ocurrido"/>
                                <asp:BoundField DataField="Fecha_Movimiento" HeaderText= "Fecha de Movimiento"/>
                                <asp:BoundField DataField="Cobertura" HeaderText= "Cobertura"/>
                                <asp:BoundField DataField="Evento_Catastrófico" HeaderText= "Evento Catastrófico"/>
                                <asp:BoundField DataField="Moneda" HeaderText= "Moneda"/>
                                <asp:BoundField DataField="ID_Coas" HeaderText= "ID Coasegurador"/>
                                <asp:BoundField DataField="RFC_Coas" HeaderText= "RFC Coaseguradora"/>
                                <asp:BoundField DataField="Nom_Coas" HeaderText= "Nombre Coasegurador"/>
                                <asp:BoundField DataField="Participación" HeaderText= "% Participación"/>
                                <asp:BoundField DataField="Nom_Ajustador" HeaderText= "Nombre Ajustador"/>
                                <asp:BoundField DataField="Tipo_Estimación" HeaderText= "Tipo de Estimación"/>
                                <asp:BoundField DataField="Movimiento" HeaderText= "Movimiento"/>
                                <asp:BoundField DataField="Tipo_Movimiento" HeaderText= "Tipo de Movimiento"/>
                                <asp:BoundField DataField="Solicitud_Pago" HeaderText= "Solicitud de Pago"/>
                                <asp:BoundField DataField="Monto_Stro_Original" HeaderText= "Monto Siniestro 100% Moneda Original"/>
                                <asp:BoundField DataField="Monto_Stro_GMX" HeaderText= "Monto Siniestro Participación GMX Moneda Original"/>
                                <asp:BoundField DataField="Monto_Stro_Coas_Original" HeaderText= "Monto Siniestro Participación Coasegurador Seguidor Moneda Original"/>
                                <asp:BoundField DataField="Tipo_Cambio" HeaderText= "Tipo de Cambio"/>
                                <asp:BoundField DataField="Monto_Stro_Consolidado" HeaderText= "Monto Siniestro 100% Consolidado"/>
                                <asp:BoundField DataField="Monto_Stro_GMX_Consolidado" HeaderText= "Monto Siniestro Participación GMX Consolidado"/>
                                <asp:BoundField DataField="Monto_Stro_Coas_Consolidado" HeaderText= "Monto Siniestro Participación Coasegurador Seguidor Consolidado"/>
                                <asp:BoundField DataField="Estatus_Stro" HeaderText= "Estatus del Siniestro"/>
                                <asp:BoundField DataField="Analista_Stro" HeaderText= "Analista de Siniestros"/>                                                                            
                            </Columns>

                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#003A5D" Font-Bold="False" ForeColor="White" />
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
                    <asp:AsyncPostBackTrigger ControlID="btnReporte" EventName="Click" />                           
                </Triggers>
            </asp:UpdatePanel> 
        </center>
    </div>
<%------------------------------------------------------------------------------------------------------------------------------%>

</asp:Content>

