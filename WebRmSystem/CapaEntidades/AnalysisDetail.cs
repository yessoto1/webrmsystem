using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class AnalysisDetail
    {
        public int ANALYSIS_DETAIL_ID { get; set; }
        public int IMPACT { get; set; }
        public string IMPACT_DESCRIPTION { get; set; }
        public int PROBABILITY { get; set; }
        public string PROBABILITY_DESCRIPTION { get; set; }
        public bool IS_SIGNIFICANT { get; set; }
        public DateTime EVALUATION_DATE { get; set; }
        public int RISK_ID { get; set; }
        public string SEVERIDAD { get; set; }
    }
}
