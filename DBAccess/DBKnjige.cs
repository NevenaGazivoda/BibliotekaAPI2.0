using Common.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBAccess
{
    public class DBKnjige
    {
        string connectionString;
        SqlConnection db;

        public DBKnjige()
        {
            connectionString = DBConnection.conStr;
            db = new SqlConnection(connectionString);
        }
                
        public List<KnjigaModel> ListaKnjiga()
        {
            SqlCommand command = new SqlCommand("getAllFromKnjige", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            List<KnjigaModel> kList = new List<KnjigaModel>();

            try
            {
                db.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    KnjigaModel knjiga = new KnjigaModel();

                    knjiga.PKKnjigaID = Convert.ToInt32(reader[0]);
                    knjiga.Naziv = Convert.ToString(reader[1]);

                    knjiga.ImePisca = Convert.ToString(reader[2]);
                    knjiga.PrezimePisca = Convert.ToString(reader[3]);

                    kList.Add(knjiga);
                }


                reader.Close();
                db.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return kList;
        }
        
        public void Upis(KnjigaModel k)
        {
            SqlCommand command = new SqlCommand("postKnjige", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            command.Parameters.Add("@Naziv", SqlDbType.VarChar).Value = k.Naziv;
            command.Parameters.Add("@Godina", SqlDbType.Int).Value = k.GodIzdanja;
            command.Parameters.Add("@FKPisca", SqlDbType.Int).Value = k.FKPisacID;


            try
            {
                db.Open();
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            db.Close();
        }
    }
}

