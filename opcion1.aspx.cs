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
using System.Net;
using System.Net.Mail;

namespace FormularioQuejasComentarios
{

    public partial class opcion1 : System.Web.UI.Page
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

        private void enviarResultados()
        {
            P = new clsParamconexion();
            P.vstrServer = ConfigurationManager.AppSettings["Server"];
            P.vstrBaseDatos = ConfigurationManager.AppSettings["BD"];
            P.vstrUsuario = ConfigurationManager.AppSettings["usr"];
            P.vstrPassword = ConfigurationManager.AppSettings["pwd"];
            result = clsBDSQL.consulta(P, "opcion1", "*", "1 = 1");
            string varAsunto = asunto.Text;
            string varComentario = comments.Text;
            result = clsBDSQL.insertar(P, "opcion1", "asunto, comentario", "'" + varAsunto + "','" + varComentario + "'");
            if (result.viIdError == 1)
            {
                foreach (DataRow r in result.vdtTabla.Rows)
                {

                }
            }
            Consulta.Consulta c = new Consulta.Consulta();

            string tmp = ConfigurationManager.AppSettings["opcion1"];
            string[] s = tmp.Split();
            List<string> lista = new List<string>();

            foreach(string str in s)
            {
                switch (str)
                {
                    case "varAsunto":
                        lista.Add(varAsunto);
                        break;
                    case "varComentario":
                        lista.Add(varComentario);
                        break;
                    default:
                        lista.Add(str);
                        break;
                }
            }

            string stringLista = string.Join(" ", lista);

            DateTime dt = DateTime.Today;

            string dateString = dt.ToString("MM/dd/yy");

            string ss  = c.InsertaInet("PUB.timail_mstr", "timail_asunto, timail_cuerpo, timail_para, timail_fecha_creacion, timail_idsistema", "'Comite de Etica','" + stringLista + "', 'pee.ti3@viakable.com','" + dateString + "', '999'");

            //var mailMessage = new System.Net.Mail.MailMessage();
            //mailMessage.From = new System.Net.Mail.MailAddress("ocuevastesting@gmail.com");
            //mailMessage.To.Add("pee.ti3@viakable.com");
            //mailMessage.Subject = "Testing";
            //mailMessage.Body = stringLista;
            //mailMessage.IsBodyHtml = true;

            //var smtpServer = new System.Net.Mail.SmtpClient("smtp.gmail.com");
            //smtpServer.Port = 587;
            //smtpServer.Credentials = new System.Net.NetworkCredential("ocuevastesting@gmail.com", "Orlando96");
            //smtpServer.EnableSsl = true;
            //smtpServer.Send(mailMessage);

            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}