Imports System.Data

Partial Class Siniestros_ContaElectronica
    Inherits System.Web.UI.Page

    Private Sub btn_Reporte_Click(sender As Object, e As EventArgs) Handles btn_Reporte.Click
        Dim ws As New ws_Generales.GeneralesClient
        Dim server As String = ws.ObtieneParametro(3)
        Try


            If txtFecGeneraDe.Text <> vbNullString Then
                If txtFecGeneraA.Text <> vbNullString Then

                    Dim RptFilters As String
                    RptFilters = "&FechaIni=" & CDate(txtFecGeneraDe.Text).ToString("yyyyMMdd")
                    RptFilters = RptFilters & "&Fechafin=" & CDate(txtFecGeneraA.Text).ToString("yyyyMMdd")

                    server = Replace(Replace(server, "@Reporte", "ContaElect"), "@Formato", "EXCEL")
                    server = Replace(server, "ReportesGMX_DESA", "ReportesOPSiniestros_DESA")
                    server = server & RptFilters
                    Funciones.EjecutaFuncion("window.open('" & server & "');")
                Else
                    Mensaje.MuestraMensaje("Reporte Contabilidad Electronica", "Debe seleccionar la fecha final", Mensaje.TipoMsg.Advertencia)

                End If
            Else
                Mensaje.MuestraMensaje("Reporte Contabilidad Electronica", "Debe seleccionar una fecha inicial", Mensaje.TipoMsg.Advertencia)
            End If




        Catch ex As Exception

        End Try
    End Sub
End Class
