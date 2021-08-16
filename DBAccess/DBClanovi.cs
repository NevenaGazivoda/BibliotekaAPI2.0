using Common.Clan;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBAccess
{
    public class DBClanovi
    {
        string connectionString;
        SqlConnection db;

        public DBClanovi()
        {
            connectionString = DBConnection.conStr;
            db = new SqlConnection(connectionString);
        }

        public List<ClanModel> Citanje()
        {
            List<ClanModel> cList = new List<ClanModel>();

            SqlCommand command = new SqlCommand("getAllFromClanovi", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            try
            {
                db.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    ClanModel clan = new ClanModel();
                    clan.PKClanID = Convert.ToInt32(reader[0]);
                    clan.Ime = Convert.ToString(reader[1]);
                    clan.Prezime = Convert.ToString(reader[2]);
                    clan.GodRodjenja = Convert.ToInt32(reader[3]);

                    cList.Add(clan);
                }
                reader.Close();
                db.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return cList;
        }

        
        public void Upis(ClanModel c)
        {
            SqlCommand command = new SqlCommand("postClanovi", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            command.Parameters.Add("@Ime", SqlDbType.VarChar).Value = c.Ime;
            command.Parameters.Add("@Prezime", SqlDbType.VarChar).Value = c.Prezime;
            command.Parameters.Add("@Godina", SqlDbType.Int).Value = c.GodRodjenja;


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

        public void Brisanje(int idClana)
        {
            SqlCommand command = new SqlCommand("deleteClanovi", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            command.Parameters.Add("@IdClana", SqlDbType.Int).Value = idClana;

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
