using Common.Model;
using DBAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BibliotekaAPI.Controllers
{
    [RoutePrefix("api/Knjige")]
    public class KnjigeController : ApiController
    {
        string connectionString;
        SqlConnection db;

        public KnjigeController()
        {
            connectionString = Connection.conStr;
            db = new SqlConnection(connectionString);
        }


        [Route("GET")]
        [HttpGet]
        public List<KnjigaModel> GetAll()
        {
            DBKnjige dBKnjige = new DBKnjige();
            var listaKnjiga = dBKnjige.ListaKnjiga();
            return listaKnjiga;
        }

        [Route("POST")]
        [HttpPost]
        public void Upis(KnjigaModel k)
        {
            DBKnjige dBKnjige = new DBKnjige();
            dBKnjige.Upis(k);
        }
    }
}