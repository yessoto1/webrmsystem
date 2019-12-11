using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Treatment
    {
        public int TREATMENT_ID { get; set; }
        public string TREATMENT_DESCRIPTION { get; set; }
        public int RISK_RESPONSE { get; set; }
        public string RISK_RESPONSE_DESCRIPTION { get; set; }
        public int RISK_ID { get; set; }
        public int CREATOR_USER_ID { get; set; }

        public DateTime CREATED_DATE { get; set; }
        public string CONTROL_NAME { get; set; }

        public int PERSON_IN_CHARGE { get; set; }
        public string PERSON_IN_CHARGE_NAME { get; set; }

        public DateTime DATE_IMPLEMENTATION { get; set; }

        //TREATMENT_ID	TREATMENT_DESCRIPTION	RISK_RESPONSE	RISK_ID	CREATOR_USER_ID	CREATED_DATE	CONTROL_NAME	PERSON_IN_CHARGE
    }
}
