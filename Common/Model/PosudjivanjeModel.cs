using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Model
{
    public class PosudjivanjeModel
    {
        public int FKClanID { get; set; }
        public int FKKnjigaID { get; set; }
        public DateTime DatumUzimanja { get; set; }
        public DateTime? DatumVracanja { get; set; }

        public string ImeClana { get; set; }
        public string PrezimeClana { get; set; }
        public string NazivKnjige { get; set; }
    }
}
