
Imports System.Data
Imports System.Net.Mail
Imports Mensaje

Partial Class Siniestros_EnviosPagosInternacionales
    Inherits System.Web.UI.Page
    Sub Page_Load(ByVal Sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Not IsPostBack Then


        End If

    End Sub

    Protected Sub btn_BuscarOP_Click(sender As Object, e As EventArgs) Handles btn_BuscarOP.Click




        Try

            Dim oDatos As DataSet
            Dim oTabla As DataTable
            Dim oParametros As New Dictionary(Of String, Object)
            Dim Num_Lote As String
            Dim Fondos As String


            oParametros.Add("Accion", 1)
            'If txt_nro_op.Text.Length <> 0 Then
            '    oParametros.Add("nro_op", txt_nro_op.Text)
            'End If
            If txt_nro_op_ini.Text.Length <> 0 Then
                oParametros.Add("nro_op_desde", txt_nro_op_ini.Text)
            End If
            If txt_nro_op_fin.Text.Length <> 0 Then
                oParametros.Add("nro_op_hasta", txt_nro_op_fin.Text)
            End If

            If txt_siniestro.Text.Length <> 0 Then
                oParametros.Add("nro_stro", txt_siniestro.Text)
            End If
            If txt_beneficiario.Text.Length <> 0 Then
                oParametros.Add("beneficiario", txt_beneficiario.Text)
            End If

            oDatos = Funciones.ObtenerDatos("sp_consulta_para_envio_pago_internacional", oParametros)




            oTabla = oDatos.Tables(0)

            grd.DataSource = oTabla

            grd.DataBind()


            Return

        Catch ex As Exception
            MuestraMensaje("Exception", "BuscarOP: " & ex.Message, TipoMsg.Falla)
            Return
        End Try



    End Sub




    Protected Sub grd_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grd.RowCommand
        'Dim bflag As Boolean
        'If bflag Then
        '    bflag.ToString()
        'End If

        If e.CommandName = "comVer" Then
            Dim index As Integer
            Dim nroOP As Integer

            e.CommandArgument.ToString()

            index = CInt(e.CommandArgument.ToString())
            nroOP = CInt(grd.DataKeys(index).Value.ToString())

            generaReporte(nroOP)

            'bflag = True
            Exit Sub
        End If


        If e.CommandName = "comEnviar" Then
            Dim indice As Integer
            Dim nroOP As Integer

            e.CommandArgument.ToString()

            indice = CInt(e.CommandArgument.ToString())
            nroOP = CInt(grd.DataKeys(indice).Value.ToString())

            If hidOPmail.Value = "" Then
                hidOPmail.Value = nroOP
            End If
            Funciones.AbrirModal("#mailPI")


            'bflag = True
            Exit Sub
            End If

    End Sub


    Private Function enviarMail(nroOP As Integer, destinatarios As String, copias As String, asunto As String) As Boolean
        'Dim oDatos As DataSet
        'Dim oTabla As DataTable
        Dim oParametros As New Dictionary(Of String, Object)
        Try
            oParametros.Add("nroOP", nroOP)
            oParametros.Add("para", destinatarios)
            oParametros.Add("cc", copias)
            oParametros.Add("asunto", asunto)

            Funciones.ObtenerDatos("usp_envio_mail_pago_inter", oParametros)
            'oDatos = Funciones.ObtenerDatos("usp_solicitud_aut_mail", oParametros)
            'oTabla = oDatos.Tables(0)

            Return True

        Catch ex As Exception
            MuestraMensaje("Exception", "No fue posible enviar el correo electrónico. Error: " & ex.Message, TipoMsg.Falla)
            Return False
        End Try

    End Function

    Private Sub generaReporte(nroOP As Integer)
        Dim ws As New ws_Generales.GeneralesClient
        Dim server As String = ws.ObtieneParametro(3)
        Dim RptFilters As String
        RptFilters = "&nroOP=" & nroOP.ToString()
        server = Replace(Replace(server, "@Reporte", "OP_PagoInternacional"), "@Formato", "PDF")
        server = Replace(server, "ReportesGMX_DESA", "ReportesOPSiniestros_DESA")
        server = server & RptFilters
        Funciones.EjecutaFuncion("window.open('" & server & "');")

    End Sub

    Private Sub btnCancEmail_Click(sender As Object, e As EventArgs) Handles btnCancEmail.Click
        limpCtrlCerrarModal()
    End Sub

    Private Sub btnAcepmEmail_Click(sender As Object, e As EventArgs) Handles btnAcepmEmail.Click
        If txtPara.Text.Trim() <> "" Then
            If txtAsunto.Text.Trim() <> "" Then
                If enviarMail(hidOPmail.Value, txtPara.Text.Trim(), txtCC.Text.Trim(), txtAsunto.Text.Trim()) Then
                    limpCtrlCerrarModal()
                    MuestraMensaje("Correo Electrónico", "El correo ha sido enviado", TipoMsg.Advertencia)
                End If
            Else
                MuestraMensaje("Validación", "El campo ""Asunto"" no puede estar vacío", TipoMsg.Advertencia)
            End If
        Else
            MuestraMensaje("Validación", "El campo ""Para"" no puede estar vacío", TipoMsg.Advertencia)
        End If
    End Sub

    'Public Sub EnviaEmailUsuarios(UserEmail As String, NumeroReporte As String, TipoFormato As String)
    '    Dim message As MailMessage
    '    message = New MailMessage()
    '    Dim mBody As String = ""
    'End Sub

    Public Sub limpCtrlCerrarModal()
        txtPara.Text = ""
        txtCC.Text = ""
        txtAsunto.Text = ""
        Funciones.CerrarModal("#mailPI")
    End Sub


End Class

