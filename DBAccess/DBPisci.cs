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
    public class DBPisci
    {
        string connectionString;
        SqlConnection db;

        public DBPisci()
        {
            connectionString = DBConnection.conStr;
            db = new SqlConnection(connectionString);
        }
        
        public List<PisacModel> Citanje()
        {
            SqlCommand command = new SqlCommand("getAllFromPisci", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            List<PisacModel> pList = new List<PisacModel>();

            try
            {
                db.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    PisacModel pisac = new PisacModel();
                    pisac.PKPisacID = Convert.ToInt32(reader[0]);
                    pisac.Ime = Convert.ToString(reader[1]);
                    pisac.Prezime = Convert.ToString(reader[2]);
                    pisac.GodRodjenja = Convert.ToInt32(reader[3]);

                    pList.Add(pisac);
                }

                reader.Close();
                db.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return pList;
        }
        
        public PisacModel CitanjePojedinacno(int idPisca)
        {
           SqlCommand command = new SqlCommand("getPisacById", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            command.Parameters.Add("@PisacId", SqlDbType.Int).Value = idPisca;

            PisacModel pisac = new PisacModel();

            try
            {
                db.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    pisac.PKPisacID = Convert.ToInt32(reader[0]);
                    pisac.Ime = Convert.ToString(reader[1]);
                    pisac.Prezime = Convert.ToString(reader[2]);
                    pisac.GodRodjenja = Convert.ToInt32(reader[3]);

                }

                reader.Close();
                db.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return pisac;
        }
        
        public void Unos(PisacModel p)
        {
            SqlCommand command = new SqlCommand("postPisci", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            command.Parameters.Add("@Ime", SqlDbType.VarChar).Value = p.Ime;
            command.Parameters.Add("@Prezime", SqlDbType.VarChar).Value = p.Prezime;
            command.Parameters.Add("@Godina", SqlDbType.Int).Value = p.GodRodjenja;


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
        
        public void Izmjena(PisacModel p)
        {
            SqlCommand command = new SqlCommand("updatePisci", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            command.Parameters.Add("@Ime", SqlDbType.VarChar).Value = p.Ime;
            command.Parameters.Add("@Prezime", SqlDbType.VarChar).Value = p.Prezime;
            command.Parameters.Add("@Godina", SqlDbType.Int).Value = p.GodRodjenja;
            command.Parameters.Add("@PisacId", SqlDbType.Int).Value = p.PKPisacID;


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

        public void Brisanje(int idPisca)
        {
            SqlCommand command = new SqlCommand("deletePisci", db)
            {
                CommandType = CommandType.StoredProcedure
            };

            command.Parameters.Add("@IdPisca", SqlDbType.Int).Value = idPisca;

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

