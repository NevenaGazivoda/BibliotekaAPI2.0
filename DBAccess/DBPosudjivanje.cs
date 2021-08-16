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
    public class DBPosudjivanje
    {
        string connectionString;
        SqlConnection db;

        public DBPosudjivanje()
        {
            connectionString = DBConnection.conStr;
            db = new SqlConnection(connectionString);
        }

        
        public List<PosudjivanjeModel> Citanje()
        {
            SqlCommand command = new SqlCommand("getAllFromPosudjivanje", db)
            {
                CommandType = CommandType.StoredProcedure
            };


            List<PosudjivanjeModel> posList = new List<PosudjivanjeModel>();
            try
            {
                db.Open();
                SqlDataReader reader = command.ExecuteReader();


                while (reader.Read())
                {
                    PosudjivanjeModel posudjivanje = new PosudjivanjeModel();

                    posudjivanje.ImeClana = Convert.ToString(reader[0]);
                    posudjivanje.PrezimeClana = Convert.ToString(reader[1]);
                    posudjivanje.NazivKnjige = Convert.ToString(reader[2]);
                    posudjivanje.DatumUzimanja = Convert.ToDateTime(reader[3]);

                    if (reader[4] == DBNull.Value)
                    {
                        posudjivanje.DatumVracanja = null;
                    }
                    else
                    {
                        posudjivanje.DatumVracanja = Convert.ToDateTime(reader[4]);
                    }

                    posList.Add(posudjivanje);
                }

                reader.Close();
                db.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return posList;
        }
        
        public void Unos(PosudjivanjeModel pos)
        {
            SqlCommand command = new SqlCommand("postPosudjivanje", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            command.Parameters.Add("@FKClana", SqlDbType.Int).Value = pos.FKClanID;
            command.Parameters.Add("@FKKnjige", SqlDbType.Int).Value = pos.FKKnjigaID;
            command.Parameters.Add("@Datum", SqlDbType.Date).Value = DateTime.Now;


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

