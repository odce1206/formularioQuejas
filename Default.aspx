<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FormularioQuejasComentarios.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js" integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
    crossorigin="anonymous"></script>

    <link rel="stylesheet" type="text/css" href="style.css">

    <script>

        $(function () {
            $("#txtFecha").datepicker({
                inline : true,
                changeMonth: true,
                changeYear: true
            });
            $("#txtFecha").datepicker("option", "showAnim", "slide");
        });
    </script>
    <script>
        $(document).ready(function () {
            $('input[type=radio][name=yesno]').change(function () {
                if (this.value == 'si') {
                    //$("siCheck").prop('disabled', true);
                    $('#nombre:input').attr('disabled', 'disabled');
                    $('#telefono:input').attr('disabled', 'disabled');
                    $('#email:input').attr('disabled', 'disabled');
                    document.getElementById('nombre').value = "";
                    document.getElementById('telefono').value = "";
                    document.getElementById('email').value = "";
                    document.getElementById("nombre").value = "Anonimo";
                }
                else {
                    $('#nombre:input').removeAttr('disabled');
                    $('#telefono:input').removeAttr('disabled');
                    $('#email:input').removeAttr('disabled');

                    document.getElementById('nombre').value = "";
                    document.getElementById('telefono').value = "";
                    document.getElementById('email').value = "";
                }
            });
        });
    </script>
    <script>
        function isNumber(evt) {
            var charCode = (evt.which) ? evt.wich : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Desea que sea anonima?
                    </td>
                    <td>
                        <input type="radio" runat="server" name="yesno" value="si" id="siCheck">Si
                        <input type="radio" runat="server" name="yesno" value="no" id="no" checked>No
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="max-width: 200px;">
                        <i>Aun cuando elija dejar sus datos personales, toda la informacion proporcionada <b>sera confidencial</b></i>
                    </td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td>
                        <asp:TextBox ID="nombre" runat="server" CssClass="asuntoCSS"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Telefono</td>
                    <td>
                        <asp:TextBox runat="server" ID="telefono" CssClass="asuntoCSS" onkeypress='return event.charCode >= 48 && event.charCode <= 57'></asp:TextBox></td>
                </tr>
                <tr>
                    <td>E-Mail</td>
                    <td>
                        <asp:TextBox runat="server" ID="email" CssClass="asuntoCSS"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Sobre que empresa es el comentario?</td>
                    <td>
                        <%--<select runat="server" class="asuntoCSS" id="empresa">
                            <option value="na">Seleccionar...</option>
                            <option value="conduct">Conductores Monterrey</option>
                            <option value="cme">CME Wire and Cable</option>
                            <option value="viakon">Viakon Comercial</option>
                            <option value="magnekon">Magnekon</option>
                            <option value="multipak">Multipak</option>
                            <option value="viakable">Viakable</option>
                            <option value="cni">Conductores del Norte Internacional</option>
                        </select>--%>
                        <asp:DropDownList ID="empresa" runat="server" CssClass="asuntoCSS">
                            <asp:ListItem>Seleccionar...</asp:ListItem>
                            <asp:ListItem>Conductores</asp:ListItem>
                            <asp:ListItem>CME Wire and Cable</asp:ListItem>
                            <asp:ListItem>Viakon Comercial</asp:ListItem>
                            <asp:ListItem>Magnekon</asp:ListItem>
                            <asp:ListItem>Multipak</asp:ListItem>
                            <asp:ListItem>Viakable</asp:ListItem>
                            <asp:ListItem>Conductores del Norte Internacional</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>En que fecha aproximada sucedio?</td>
                    <td>
                            <asp:TextBox runat="server" ID="txtFecha" placeholder="Selecciona fecha... " ReadOnly="true" CssClass="asuntoCSS"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <center><b>Narracion de los hechos </b></center>
                    </td>
                </tr>
                <tr>
                    <td>Donde ocurrieron los hechos?
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="donde" CssClass="narracion" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Quienes intervinieron en los hechos?
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="who" CssClass="narracion" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Como ocurrieron los hechos?
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="how" CssClass="narracion" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Tiene testigos los hechos?
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="witness" CssClass="narracion" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Existen pruebas de los hechos?
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="proof" CssClass="narracion" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Comentarios o recomendaciones:
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="recs" CssClass="narracion" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Button ID="botonEnviar" runat="server" Text="Enviar Informacion" OnClick="botonEnviar_Click" />
                        <asp:Button ID="resetBut" runat="server" Text="Borrar" OnClick="resetBut_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>