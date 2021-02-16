Imports Microsoft.VisualBasic
Imports System.Data
Public Class AnalistaSolicitante

    Dim _usuariosolicitante As String
    Dim _cod_origen_pago As String
    Dim _sn_activo As String


    Public Property UsuarioSolicitante As String
        Get
            Return _usuariosolicitante
        End Get
        Set(value As String)
            _usuariosolicitante = value
        End Set
    End Property

    Public Property Cod_origen_pago As String
        Get
            Return _cod_origen_pago
        End Get
        Set(value As String)
            _cod_origen_pago = value
        End Set
    End Property

    Public Property Sn_activo As String
        Get
            Return _sn_activo
        End Get
        Set(value As String)
            _sn_activo = value
        End Set
    End Property

    Public Function Save() As Integer
        Dim oDatos As DataSet
        Dim oTabla As DataTable
        Dim iClave As Integer
        Dim oParametros As New Dictionary(Of String, Object)
        Try

            oParametros.Add("UsuarioSolicitante", _usuariosolicitante)
            oParametros.Add("cod_origen_pago", _cod_origen_pago)
            oParametros.Add("sn_activo", _sn_activo)



            oDatos = Funciones.ObtenerDatos("sp_grabar_analista_solicitante", oParametros)


            Return iClave

        Catch ex As Exception
            'MuestraMensaje("Exception", "BuscarOP: " & ex.Message, TipoMsg.Falla)
            Return -1
        End Try
    End Function
End Class
