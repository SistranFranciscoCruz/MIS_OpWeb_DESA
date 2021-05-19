Imports System.Data
Imports System.Net.Mail
Imports Mensaje
Partial Class Siniestros_ReporteStroCoasMov
    Inherits System.Web.UI.Page

    Protected Sub btnReporte_Click(sender As Object, e As EventArgs) Handles btnReporte.Click
        Try
            Dim oDatos As DataSet
            Dim oTabla As DataTable
            Dim oParametros As New Dictionary(Of String, Object)

            oParametros.Add("Tipo_Coaseguro", cmbTipoCoas.SelectedValue)
            oParametros.Add("Siniestro", txt_Siniestro.Text)
            oParametros.Add("Subsiniestro", cmbSubsiniestro.SelectedValue)
            oParametros.Add("Poliza", txt_Poliza.Text)
            oParametros.Add("Sufijo", cmbSufijo.SelectedValue)
            oParametros.Add("Asegurado", cmbAsegurado.SelectedValue)
            oParametros.Add("Cod_Ramo_Contable", cmbCodRamo.SelectedValue)
            oParametros.Add("Ramo_Contable", cmbRamo.SelectedValue)
            oParametros.Add("Evento_Catastrofico", cmbEventoCatas.SelectedValue)
            oParametros.Add("Nombre_Coasegurador", TxtNomCoasegurador.Text)
            oParametros.Add("Tipo_Estimacion", cmbTipoEstim.SelectedValue)
            oParametros.Add("Tipo_Movimiento", cmbTipoMov.SelectedValue)

            oDatos = Funciones.ObtenerDatos("usp_rpt_stro_coas_mov_web", oParametros)

            oTabla = oDatos.Tables(0)

            If oTabla.Rows.Count > 0 Then
                btn_Imprimir.Visible = True
            Else
                btn_Imprimir.Visible = False
            End If

            GridRptStroCoas.DataSource = oTabla
            GridRptStroCoas.DataBind()

        Catch ex As Exception
            MuestraMensaje("Exception", "Buscar Movimientos de coaseguro " & ex.Message, TipoMsg.Falla)
        End Try
    End Sub

    Private Sub btnLimpiar_Click(sender As Object, e As EventArgs) Handles btnLimpiar.Click

        cmbTipoCoas.SelectedValue = ""
        txt_Siniestro.Text = ""
        cmbSubsiniestro.SelectedValue = ""
        txt_Poliza.Text = ""
        cmbSufijo.SelectedValue = ""
        cmbAsegurado.SelectedValue = ""
        cmbCodRamo.SelectedValue = ""
        cmbRamo.SelectedValue = ""
        cmbEventoCatas.SelectedValue = ""
        TxtNomCoasegurador.Text = ""
        cmbTipoEstim.SelectedValue = ""
        cmbTipoMov.SelectedValue = ""

        btn_Imprimir.Visible = False
    End Sub

End Class
