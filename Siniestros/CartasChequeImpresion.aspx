<%@ Page Title="" Language="VB" MasterPageFile="~/Pages/SiteMaster.master" AutoEventWireup="false" CodeFile="CartasChequeImpresion.aspx.vb" Inherits="Siniestros_CartasChequeImpresion" %>

<%@ MasterType VirtualPath="~/Pages/SiteMaster.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_principal" runat="Server">
    <script src="../Scripts/Siniestros/CartasChequeImpresion.js"></script>


    <div class="zona-principal" style="overflow-x: hidden; overflow-y: hidden">

        <div class="cuadro-titulo panel-encabezado">
            <input type="image" src="../Images/contraer_mini_inv.png" id="coVentana0" class="contraer" />
            <input type="image" src="../Images/expander_mini_inv.png" id="exVentana0" class="expandir" />
            Filtros - Impresión de Cartas Cheque 
        </div>

        <div class="panel-contenido ventana0">
            <asp:UpdatePanel runat="server" ID="upFiltros">
                <ContentTemplate>
                    <asp:HiddenField runat="server" ID="hid_Ventanas" Value="0|1" />
                    <div class="padding10"></div>

                    <div class="row">
                        <div class="col-md-6">

                            <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="20%">Folio Carta</asp:Label>
                            <asp:TextBox runat="server" ID="txt_folio_desde" CssClass="col-md-1 estandar-control" Width="36%" onkeypress="return soloNumeros(event)" PlaceHolder="Ej: 10"></asp:TextBox>

                            <asp:Label runat="server" class="col-md-1 etiqueta-control">A</asp:Label>
                            <asp:TextBox runat="server" ID="txt_folio_hasta" CssClass="col-md-1 estandar-control" Width="35.5%" onkeypress="return soloNumeros(event)" PlaceHolder="Folio hasta"></asp:TextBox>

                        </div>

                        <div class="col-md-6">
                        </div>
                    </div>

                    <div class="clear padding5"></div>

                    <div class="row">
                        <div class="col-md-6">

                            <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="20%">Num Cheque</asp:Label>
                            <asp:TextBox runat="server" ID="txt_nro_ch_desde" CssClass="col-md-1 estandar-control" Width="36%" onkeypress="return soloNumeros(event)" PlaceHolder="Núm cheque desde"></asp:TextBox>

                            <asp:Label runat="server" class="col-md-1 etiqueta-control">A</asp:Label>
                            <asp:TextBox runat="server" ID="txt_nro_ch_hasta" CssClass="col-md-1 estandar-control" Width="35.5%" onkeypress="return soloNumeros(event)" PlaceHolder="Núm cheque hasta"></asp:TextBox>
                        </div>

                        <div class="col-md-6">

                            <asp:Label runat="server" class="col-md-1 etiqueta-control" Width="25%">Fecha Genera</asp:Label>
                            <asp:TextBox runat="server" ID="txt_fec_gen_desde" CssClass="col-md-1 estandar-control Fecha Centro" Width="33.2%"></asp:TextBox>

                            <asp:Label runat="server" class="col-md-1 etiqueta-control">A</asp:Label>
                            <asp:TextBox runat="server" ID="txt_fec_gen_hasta" CssClass="estandar-control Fecha Centro" Width="33.2%"></asp:TextBox>
                        </div>
                    </div>

                    <div class="clear padding5"></div>

                    <div class="row">
                        <div class="col-md-6">

                            <asp:Label runat="server" class="col-md-2 etiqueta-control" Width="20%">Siniestro</asp:Label>
                            <asp:TextBox runat="server" ID="txt_nro_stro" CssClass="col-md-1 estandar-control" PlaceHolder="Ej: 201308131" Width="80%" onkeypress="return soloNumeros(event)"></asp:TextBox>
                        </div>

                        <div class="col-md-6">

                            <asp:Label runat="server" class="col-md-1 etiqueta-control " Width="25%">Beneficiario</asp:Label>
                            <asp:TextBox runat="server" ID="txt_cheque_a_nom" CssClass="col-md-1 estandar-control" Width="75%" PlaceHolder="Ej: banco" OnFocusOut="convMayusculas('txt_cheque_a_nom')"></asp:TextBox>
                        </div>
                    </div>

                    <div class="clear padding20"></div>

                    <div class="row cuadro-subtitulo" style="text-align: center">
                        <div class="col-md-3"></div>
                        <div class="col-md-6" style="text-align: center">
                            <table style="width: 100%; text-align: center">
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Label runat="server" class="etiqueta-control">Estatus:</asp:Label>
                                    </td>

                                    <td>
                                        <asp:RadioButton runat="server" ID="chk_Ninguno" Text="&nbspTodas" CssClass="etiqueta-control" Width="100px" AutoPostBack="true" OnCheckedChanged="chk_Ninguno_CheckedChanged" />
                                    </td>

                                    <td>
                                        <asp:RadioButton runat="server" ID="chk_Pendientes" Text="&nbspPendientes de Entregar" CssClass="etiqueta-control" Width="160px" AutoPostBack="true" OnCheckedChanged="chk_Pendientes_CheckedChanged" />
                                    </td>

                                    <td>
                                        <asp:RadioButton runat="server" ID="chk_Entregadas" Text="&nbspEntregadas" CssClass="etiqueta-control" Width="100px" AutoPostBack="true" OnCheckedChanged="chk_Entregadas_CheckedChanged" />
                                    </td>

                                    <%--FJCP 10267 - CC - OPs Web_Cartas_Cheque--%>
                                    <td>
                                        <asp:RadioButton runat="server" ID="chk_Rechazadas" Text="&nbspRechazadas" CssClass="etiqueta-control" Width="100px" AutoPostBack="true" OnCheckedChanged="chk_Rechazadas_CheckedChanged" />
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div class="col-md-3"></div>
                    </div>
                    <div class="padding5"></div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div style="width: 100%; text-align: right;">
        <div class="padding10">
            <asp:UpdatePanel runat="server" ID="upBusqueda">
                <ContentTemplate>

                    <asp:LinkButton ID="btnBuscar" runat="server" class="btn botones" BorderWidth="2" BorderColor="White" Width="105px">
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


    <div class="padding5">
        <asp:UpdatePanel runat="server" ID="updGrd" UpdateMode="Conditional" Width="25%">
            <ContentTemplate>
                <asp:Panel runat="server" ID="pnlUsuario" Width="99%" Height="280" ScrollBars="Auto">
                    <div style="width: 99%; text-align: right;" class="padding10">
                        <asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" CssClass="table grid-view table-condensed" Font-Size="11px" GridLines="Vertical" HeaderStyle-CssClass="header" Height="35px" HorizontalAlign="Center" ShowHeaderWhenEmpty="True" AlternatingRowStyle-CssClass="altern">
                            <Columns>

                                <%-- <asp:BoundField DataField="folio_carta" HeaderText="FOLIO" ItemStyle-Width="0px" HeaderStyle-Width="0px">
                                <ControlStyle Font-Size="0px" />
                                <FooterStyle Font-Size="0px" />
                                <HeaderStyle Font-Size="0px" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="0px" />
                                </asp:BoundField>--%>

                                <asp:TemplateField HeaderText="IMPRIMIR" ItemStyle-HorizontalAlign="Center" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chk_Print" runat="server" Checked="False" />
                                    </ItemTemplate>
                                    <HeaderStyle Font-Size="12px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:BoundField DataField="folio_carta_gmx" HeaderText="FOLIO CARTA">
                                    <HeaderStyle Font-Size="12px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>

                                <asp:BoundField DataField="imp_total" DataFormatString="{0:N2}" HeaderStyle-HorizontalAlign="Center" HeaderText="MONTO TOTAL">
                                    <HeaderStyle Font-Size="12px" />
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                </asp:BoundField>

                                <asp:BoundField DataField="fecha_creacion" DataFormatString="{0:dd/MM/yyyy}" HeaderText="FECHA GENERADA">
                                    <HeaderStyle Font-Size="12px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>

                                <asp:BoundField DataField="txt_status" HeaderText="ESTADO">
                                    <HeaderStyle Font-Size="12px" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="MARCAR ENTREGADO" ItemStyle-HorizontalAlign="Center" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Chk_Entregado" runat="server" Checked="False" Enabled='<%# Eval("chk") %>' OnCheckedChanged="Chk_Entregado_CheckedChanged" AutoPostBack="true" />
                                    </ItemTemplate>
                                    <%--FJCP 10267 - CC - OPs Web_Cartas_Cheque ini--%>
                                    <HeaderStyle Font-Size="12px" CssClass="hidden" />
                                    <ItemStyle HorizontalAlign="Center" CssClass=" hidden" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="ACCION">
                                    <ItemTemplate>
                                        <asp:DropDownList runat="server" ID="dropEstado" AutoPostBack="true" OnSelectedIndexChanged="dropEstado_SelectedIndexChanged" Enabled='<%# Eval("chk") %>'>
                                            <asp:ListItem Text="...." Value="-1" Selected="true" />
                                            <asp:ListItem Text="Entregar" Value="4" />
                                            <asp:ListItem Text="Rechazar" Value="3" />
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Font-Size="12px" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="FECHA DE ENTREGA O RECHAZO">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_fec_entrega" runat="server" CssClass="col-md-1 estandar-control Fecha Centro" Height="20px" Width="100%" Text='<%# Eval("fecha_entrega_ch") %>' Enabled='false'></asp:TextBox>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Size="12px" Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="MOTIVO RECHAZO">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txt_mot_rech" runat="server" CssClass="col-md-1 estandar-control  Centro" Height="20px" Text='<%# Eval("motivo_rechazo") %>' Width="100%" Enabled='false'></asp:TextBox>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Size="12px" Width="20%" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <%--FJCP 10267 - CC - OPs Web_Cartas_Cheque fin--%>
                            </Columns>
                            <HeaderStyle CssClass="header" />
                            <RowStyle BorderStyle="Solid" BorderWidth="1px" Height="28px" />
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btn_Todas" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btn_Ninguna" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />

            </Triggers>
        </asp:UpdatePanel>
    </div>


    <div class="padding10">
        <asp:UpdatePanel runat="server" ID="upPanelGenCartas" Width="99%" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel runat="server" ID="PanelGenCartas" HorizontalAlign="Right">
                    <div class="row" style="width: 100%">
                        <%--<div class="col-md-1"></div>--%>
                        <div class="col-md-6">
                            <div style="width: 100%; text-align: left">
                                <asp:LinkButton ID="btn_Imprimir" runat="server" class="btn botones" BorderWidth="2" BorderColor="White" Width="105px" Visible="false">
                                <span>
                                    <img class="btn-imprimir"/>
                                    Imprimir
                                </span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btn_Todas" runat="server" class="btn botones Centrado" BorderWidth="2" BorderColor="White" Width="110px" Visible="false">
                                    <span>
                                        <img class="btn-todos"/>&nbsp Todas Imp.
                                    </span>
                                </asp:LinkButton>

                                <asp:LinkButton ID="btn_Ninguna" runat="server" class="btn botones Centrado" BorderWidth="2" BorderColor="White" Width="120px" Visible="false">
                                    <span>
                                        <img class="btn-ninguno"/>&nbsp Ninguna Imp.
                                    </span>
                                </asp:LinkButton>

                            </div>
                        </div>

                        <div class="col-md-6">
                            <div style="text-align: right">
                                <asp:LinkButton ID="btnGuardar" runat="server" class="btn botones Centrado" BorderWidth="2" BorderColor="White" Width="110px" Visible="false">
                                    <span>
                                        <img class="btn-guardar"/>&nbsp Guardar
									</span>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="padding10" />
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                <%--<asp:AsyncPostBackTrigger ControlID="btnSi" EventName="Click" />--%>
            </Triggers>
        </asp:UpdatePanel>
    </div>

    <div class="padding53"></div>

    <div id="ModConfirmar" class="modal-catalogo">
        <div class="cuadro-titulo-flotante">
            <div class="padding5"></div>
            <button type="button" data-dismiss="modal" class="close" hidden="hidden">&times;</button>
            <div>
                <label id="lbl_conf">Guardar</label>
            </div>
            <div class="padding5"></div>
        </div>
        <div class="padding5"></div>
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
            <ContentTemplate>
                <div class="input-group">
                    <br />
                    <div class="padding10"></div>
                    <asp:Label runat="server" class="col-md-12 etiqueta-control" Font-Size="13px">Desea guardar los cambios realizados?
                    </asp:Label>
                    <div class="padding30"></div>
                    <br />
                    <br />
                </div>
                <div style="width: 100%; text-align: right;">
                    <asp:Button runat="server" ID="btnSi" class="btn botones" Text="SI" />
                    <asp:Button runat="server" ID="btnNo" class="btn botones" data-dismiss="modal" Text="NO" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

