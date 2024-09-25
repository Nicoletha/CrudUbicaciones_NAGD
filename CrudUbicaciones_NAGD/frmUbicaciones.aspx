<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUbicaciones.aspx.cs" Inherits="CrudUbicaciones_NAGD.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyDqTDKfWQPS67DYvZbZxbIQDtAPtS4kBiM'></script>
    
    <script src="js/locationpicker.jquery.js"></script>
    <title>Control de ubicaciones</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="for-group">
                        <label for="exampleInputEmail">Ubicacion</label>
                        <asp:PlaceHolder ID="txtID" runat="server" />
                        <asp:TextBox ID="txtUbicacion" CssClass="from-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="for-group">
                        <div id="ModalMapPreview" style="width: 100%; height: 300px;"></div>
                    </div>
                    <!--Latitud y longitud-->
                    <div class="for-group">
                        <label for="ExampleInputPassword1">Lat.:</label>
                        <asp:TextBox ID="txtLat" Text="27.371872886250113" CssClass="form-control" runat="server"></asp:TextBox>
                        <label for="ExampleInputPassword1">Lat.:</label>
                        <asp:TextBox ID="txtLong" Text="-109.93098791787901" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <!--Controles de altas, bajas y cambios-->
                    <div class="for-group">
                        <asp:Button ID="btnAgregar" CssClass="btn btn-success" runat="server" Text="Agregar" UseSubmitBehavior="false" />
                        <asp:Button ID="btnModificar" CssClass="btn btn-warning" runat="server" Text="Modificar" UseSubmitBehavior="false" Enabled="false"/>
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" Enabled="false" />
                        <asp:Button ID="btnLimpiar" CssClass="btn btn-default" runat="server" Text="Limpiar" UseSubmitBehavior="false" />
                    </div>
                </div>
                <div class="col-md-8">
                    <br />
                    <h1>Ubicaciones</h1>
                </div>
            </div>
        </div>
    </form>
    <script>
        $('#ModalMapPreview').locationpicker({
            radius: 0,
            location: {
                latitude: $('#<%=txtLat.ClientID%>').val(),
                longitude: $('#<%=txtLong.ClientID%>').val()
            },
            inputBinding: {
                latitudeInput: $('#<%=txtLat.ClientID%>'),
                longitudeInput: $('#<%=txtLong.ClientID%>'),
                locationNameInput: $('#<%=txtUbicacion.ClientID%>')
            },
            enableAutocomplete: true
        });
    </script>
</body>
</html>
