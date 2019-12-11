using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Cause
    {
        public int CAUSE_ID { get; set; }
        public string CAUSE_DESCRIPTION { get; set; }
        public int CAUSE_PERCENT { get; set; }
        public int CAUSE_TYPE_ID { get; set; }
        public string CAUSE_TYPE_NAME { get; set; }
        public int RISK_ID { get; set; }
    }
}
