using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class Effect
    {
        public int EFFECT_ID { get; set; }
        public string DESCRIPTION { get; set; }
        public int EFFECT_TYPE_ID { get; set; }
        public string EFFECT_TYPE_NAME { get; set; }
        public int CAUSE_ID { get; set; }

    }
}
