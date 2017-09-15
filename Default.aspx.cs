using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using LibViakable;
using System.Data;

namespace FormularioQuejasComentarios
{
    public partial class Default : System.Web.UI.Page
    {
        LibViakable.clsParamconexion P;
        LibViakable.clsResultado result;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void botonEnviar_Click(object sender, EventArgs e)
        {
            enviarResultados();
        }

        protected void resetBut_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        private void enviarResultados()
        {
            P = new clsParamconexion();
            P.vstrServer = ConfigurationManager.AppSettings["Server"];
            P.vstrBaseDatos = ConfigurationManager.AppSettings["BD"];
            P.vstrUsuario = ConfigurationManager.AppSettings["usr"];
            P.vstrPassword = ConfigurationManager.AppSettings["pwd"];
            result = clsBDSQL.consulta(P, "opcion2", "*", "1 = 1");
            string varNombre = nombre.Text;
            // Verificar si es anonimo:
            string varIntTelefono = telefono.Text;
            string varTelefono = varIntTelefono.ToString();
            string varEmail = email.Text;
            if (varNombre == "")
            {
                varNombre = "Anonimo";
                varTelefono = "-";
                varEmail = "";
            }
            string varEmpresa = empresa.SelectedItem.Text;
            //string varFecha = txtFecha.Text;
            string varFecha = Request.Form["txtFecha"];
            string varWhere = donde.Text;
            string varWho = who.Text;
            string varHow = how.Text;
            string varWitness = witness.Text;
            string varProof = proof.Text;
            string varComments = recs.Text;
            result = clsBDSQL.insertar(P, "opcion2", "nombre, telefono, email, empresa, fechaSucedido, lugar, perInvolucradas, descripcion, testigos, pruebas, comentarios", "'" + varNombre + "','" + varTelefono + "','" + varEmail + "','" + varEmpresa + "','" + varFecha + "','" + varWhere + "','" + varWho + "','" + varHow + "','" + varWitness + "','" + varProof + "','" + varComments + "'");
            if (result.viIdError == 1)
            {
                foreach (DataRow r in result.vdtTabla.Rows)
                {

                }
            }

            Consulta.Consulta c = new Consulta.Consulta();

            string htmlBody = ConfigurationManager.AppSettings["opcion2"];
            string[] s = htmlBody.Split();
            List<string> lista = new List<string>();

            foreach (string str in s)
            {
                switch (str)
                {
                    case "varNombre":
                        lista.Add(varNombre);
                        break;
                    case "varTelefono":
                        lista.Add(varTelefono);
                        break;
                    case "varEmail":
                        lista.Add(varEmail);
                        break;
                    case "varEmpresa":
                        lista.Add(varEmpresa);
                        break;
                    case "varFecha":
                        lista.Add(varFecha);
                        break;
                    case "varWhere":
                        lista.Add(varWhere);
                        break;
                    case "varWho":
                        lista.Add(varWho);
                        break;
                    case "varHow":
                        lista.Add(varHow);
                        break;
                    case "varWitness":
                        lista.Add(varWitness);
                        break;
                    case "varProof":
                        lista.Add(varProof);
                        break;
                    case "varComments":
                        lista.Add(varComments);
                        break;
                    default:
                        lista.Add(str);
                        break;
                }
            }

            string stringLista = string.Join(" ", lista);

            DateTime dt = DateTime.Today;

            string dateString = dt.ToString("MM/dd/yy");

            string ss = c.InsertaInet("PUB.timail_mstr", "timail_asunto, timail_cuerpo, timail_para, timail_fecha_creacion, timail_idsistema", "'Comite de Etica','" + stringLista + "', 'pee.ti3@viakable.com','" + dateString + "', '999'");

            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
     
}