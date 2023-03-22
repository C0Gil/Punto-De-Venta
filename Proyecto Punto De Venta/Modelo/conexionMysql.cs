using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Proyecto_Punto_De_Venta.Modelo
{
    internal class conexionMysql : conexion
    {
        private MySqlConnection connection;
        private string cadenaConexion;
        public conexionMysql()
        {
            cadenaConexion = "Database=" + database +
                "; DataSource=" + server +
                "; User Id= " + user +
                "; Password=" + password;

            connection = new MySqlConnection(cadenaConexion);
        }
        public MySqlConnection GetConnection()
        {
            try
            {
                if (connection.State != System.Data.ConnectionState.Open)
                {
                    connection.Open();
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
                throw;
            }
            return connection;
        }
    }
}
