<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="opcion1.aspx.cs" Inherits="FormularioQuejasComentarios.opcion1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>Asunto</td>
                <td>
                    <asp:TextBox ID="asunto" runat="server" CssClass="asuntoCSS"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Comentarios
                </td>
                <td>
                    <asp:TextBox runat="server" ID="comments" CssClass="narracion" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                    <td></td>
                    <td align="right">
                        <asp:Button ID="botonEnviar" runat="server" Text="Enviar Informacion" OnClick="botonEnviar_Click" />
                    </td>
                </tr>
        </table>
    </div>
    </form>
</body>
</html>