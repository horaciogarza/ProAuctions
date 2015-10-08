using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ExamenDAL
{
    [Serializable]
    public class HistorialData
    {
        private string _UserName;
        private decimal? _montoOferta;
        private DateTime _fechaOferta;

        public string userName
        {
            get { return _UserName; }
            set { _UserName = value; }
        }

        public decimal? MontoOferta
        {
            get { return _montoOferta; }
            set { _montoOferta = value; }
        }

        public DateTime FechaOferta
        {
            get { return _fechaOferta; }
            set { _fechaOferta = value; }
        }
    }
}
