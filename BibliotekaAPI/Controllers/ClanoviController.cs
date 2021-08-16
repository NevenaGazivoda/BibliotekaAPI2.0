using Common.Clan;
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
    [RoutePrefix("api/Clanovi")]
    public class ClanoviController : ApiController
    {
        string connectionString;
        SqlConnection db;

        public ClanoviController()
        {
            connectionString = Connection.conStr;
            db = new SqlConnection(connectionString);
        }


        [Route("GET")]
        [HttpGet]
        public List<ClanModel> GetClanovi()
        {
            DBClanovi dBCLanovi = new DBClanovi();
            var listaClanova = dBCLanovi.Citanje();
            return listaClanova;
        }

        [Route("GET/{idClana}")]
        [HttpGet]
        public HttpResponseMessage Citanje(int idClana)
        {
            DBClanovi dBClanovi = new DBClanovi();
            var clan= dBClanovi.Citanje(idClana);
            if (clan == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, idClana);
            }
            return Request.CreateResponse(HttpStatusCode.OK, clan);


        }

        [Route("POST")]
        [HttpPost]
        public void NewClan(ClanModel c)
        {
            DBClanovi dBClanovi = new DBClanovi();
            dBClanovi.Upis(c);
        }


        [Route("DELETE/{idClana}")]
        [HttpDelete]
        public void DeleteClan(int idClana)
        {
            DBClanovi dBClanovi = new DBClanovi();
            dBClanovi.Brisanje(idClana);
        }
    }
}