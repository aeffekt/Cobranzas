using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cobranzas
{
    public partial class GestorClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
        protected void btnAlta_Click(object sender, EventArgs e)
        {
            if (tbClienteNuevoNombre.Text != "" && tbClienteNuevoApellido.Text != "")
            {
                int result = SqlClientes.Insert();
                if (result != 0)
                {
                    LabelAlta.Text = "Se agregó el registro: " + tbClienteNuevoNombre.Text + " " + tbClienteNuevoApellido.Text;
                    tbClienteNuevoNombre.Text = "";
                    tbClienteNuevoApellido.Text = "";
                }
                else
                {
                    LabelAlta.Text = "No se pudo agregar el registro";
                }
            }
            else
            {
                LabelAlta.Text = "Debe ingresar NOMBRE y APELLIDO.";
            }

        }

        
    }
}