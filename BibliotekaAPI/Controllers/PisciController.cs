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
    [RoutePrefix("api/Pisci")]
    public class PisciController : ApiController
    {
        string connectionString;
        SqlConnection db;

        public PisciController()
        {
            connectionString = Connection.conStr;
            db = new SqlConnection(connectionString);
        }


        [Route("GET")]
        [HttpGet]
        public List<PisacModel> ListaPisaca()
        {
            DBPisci dBPisci = new DBPisci();
            var lista = dBPisci.Citanje();
            return lista;
        }

        [Route("GET/{idPisca}")]
        [HttpGet]
        public PisacModel GetPisacById(int idPisca)
        {
            DBPisci dBPisci = new DBPisci();
            var pisac = dBPisci.CitanjePojedinacno(idPisca);
            return pisac;
        }

        [Route("POST")]
        [HttpPost]
        public void NewPisac(PisacModel p)
        {
            DBPisci dBPisci = new DBPisci();
            dBPisci.Unos(p);
        }

        [Route("PUT")]
        [HttpPut]
        public void Update(PisacModel p)
        {
            DBPisci dBPisci = new DBPisci();
            dBPisci.Izmjena(p);
        }

        [Route("DELETE/{idPisca}")]
        [HttpDelete]
        public void Delete(int idPisca)
        {
            DBPisci dBPisci = new DBPisci();
            dBPisci.Brisanje(idPisca);
        }
    }
}