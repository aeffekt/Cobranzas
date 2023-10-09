using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cobranzas
{
    public partial class GestorCobranzas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                // fechas por defecto
                setFechas();
            }            
        }
            
        protected void setFechas()
        {
            // fecha inicio fija ya que tira error para fechas menores al 1700 dc
            fecha1.SelectedDate = new DateTime(1900, 1, 1);
            // fecha tope por defecto = hoy+1.. asi incluye al dia de hoy
            fecha2.SelectedDate = DateTime.Now.AddDays(1);
        }

        protected void fileLog(string s)
        {
            DateTime fechaHoraActual = DateTime.Now;
            StreamWriter sw = new StreamWriter($"{Server.MapPath(".")}_exceptions.log", true);
            sw.WriteLine(fechaHoraActual.ToString()+" - "+s);            
            sw.Close();
        }

        protected void SqlCobranzas_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {                
                fileLog(e.Exception.ToString());
                e.ExceptionHandled = true;
            }
        }

        protected void btnCobro_Click(object sender, EventArgs e)
        {
            if (tbMonto.Text != "")
            {
                int result = SqlCobranzas.Insert();
                if (result != 0)
                {   
                    LabelAlta.Text = "Se agregó el registro de cobro.";
                    tbMonto.Text = "";
                    // Actualiza la tabla con los totales
                    GridCobranzas.DataBind();                    
                }
                else
                {
                    LabelAlta.Text = "No se pudo agregar el registro";
                    fileLog("Error al insertar un cobro.");
                }
            }
            else
            {
                LabelAlta.Text = "Debe ingresar un MONTO para realizar un cobro.";
            }
        }


        protected void GridCobranzas_DataBound(object sender, EventArgs e)
        {
            GridCobranzaTotal.DataBind();
        }

        
        protected void noFiltro_Click(object sender, EventArgs e)
        {            
            // Resetea el filtro de fechas
            setFechas();
            // EN UN COMIENZO HABIA UTILIZADO LOS FilterExpression
            // PERO QUEDA MAS FLUÍDO MODIFICANDO EL "SELECT" QUE INCLUYE LAS FECHAS
        }       
    }
}