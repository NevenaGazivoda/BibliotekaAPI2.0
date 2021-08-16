using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Model
{
    public class KnjigaModel
    {
        public int PKKnjigaID { get; set; }
        public string Naziv { get; set; }
        public int GodIzdanja { get; set; }
        public int FKPisacID { get; set; }

        public string ImePisca { get; set; }
        public string PrezimePisca { get; set; }
    }

}
