using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Risk
    {
        public int RISK_ID { get; set; }
        public string RISK_NAME { get; set; }
        public int RISK_TYPE { get; set; }
        public string RISK_TYPE_NAME { get; set; }
        public int PROCESS_ID { get; set; }

        public bool STATUS { get; set; }
        public string STATUS_DESCRIPTION { get; set; }
    }
}
