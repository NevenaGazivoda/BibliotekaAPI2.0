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
    [RoutePrefix("api/Posudjivanje")]
    public class PosudjivanjeController : ApiController
    {
        string connectionString;
        SqlConnection db;

        public PosudjivanjeController()
        {
            connectionString = Connection.conStr;
            db = new SqlConnection(connectionString);
        }


        [Route("GET")]
        [HttpGet]
        public List<PosudjivanjeModel> ListaPosudjivanja()
        {
            DBPosudjivanje dBPosudjivanje = new DBPosudjivanje();
            var lista = dBPosudjivanje.Citanje();
            return lista;
        }
        
        [Route("POST")]
        [HttpPost]
        public void NewPosudjivanje(PosudjivanjeModel pos)
        {
            DBPosudjivanje dBPosudjivanje = new DBPosudjivanje();
            dBPosudjivanje.Unos(pos);
        }
    }
}