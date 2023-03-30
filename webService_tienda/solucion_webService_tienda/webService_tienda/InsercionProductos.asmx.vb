Imports System.ComponentModel
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports Newtonsoft.Json.Linq

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")>
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<ToolboxItem(False)>
Public Class InsercionProductos
    Inherits System.Web.Services.WebService

    Public Function Get_ConectionString() As String
        Dim SQLServer_Conection_String = "Data Source=LAPTOP-I0DKJOIN\ERICKSQLEXPRESS; Initial Catalog=tienda; User ID= sa; Password=1706Erick"
        Return SQLServer_Conection_String
    End Function


    <WebMethod()>
    Public Function InsertarProducto(idpro As Integer, pro As String, preven As Double, precom As Double, cadu As String, sto As Integer, disp As Boolean, idcat As Integer) As String
        Try
            Dim sql As String
            Dim mycmd As New SqlCommand
            Dim reader As SqlDataReader
            Dim conexion As New SqlConnection(Get_ConectionString())
            conexion.Open()
            sql = "INSERT INTO [dbo].[Productos] ([idProducto], [producto], [precioVenta], [precioCompra], [fechaCaducidad], [stock], [disponibilidad], [idCategoria]) VALUES(" + idpro.ToString() + ",'" + pro + "'," + preven.ToString() + "," + precom.ToString() + ",'" + cadu + "'," + sto.ToString() + "," + If(disp, "1", "0") + "," + idcat.ToString() + " )"
            With mycmd
                .CommandText = sql
                .Connection = conexion
            End With
            reader = mycmd.ExecuteReader
            conexion.Close()
            Return "Registro Insertado con Exito "
        Catch ex As Exception
            Return ex.ToString
        End Try
    End Function
    <WebMethod()>
    Public Function modificarProducto(idpro As Integer, pro As String, preven As Double, precom As Double, cadu As String, sto As Integer, disp As Boolean, idcat As Integer) As String
        Try
            Dim sql As String
            Dim mycmd As New SqlCommand
            Dim reader As SqlDataReader
            Dim conexion As New SqlConnection(Get_ConectionString())
            conexion.Open()
            sql = "UPDATE [dbo].[Productos] SET [producto] = '" + pro + "', [precioVenta] = " + preven.ToString() + ", [precioCompra] = " + precom.ToString() + ", [fechaCaducidad] = '" + cadu + "', [stock] = " + sto.ToString() + ", [disponibilidad] = " + If(disp, "1", "0") + ", [idCategoria] = " + idcat.ToString() + " WHERE [idProducto] = " + idpro.ToString()
            With mycmd
                .CommandText = sql
                .Connection = conexion
            End With
            reader = mycmd.ExecuteReader
            conexion.Close()
            Return "Registro Modificado con Exito "
        Catch ex As Exception
            Return ex.ToString
        End Try
    End Function




End Class