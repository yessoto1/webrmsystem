using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class User
    {
        public int USER_ID { get; set; }
        public string FIRST_NAME { get; set; }
        public string LAST_NAME { get; set; }
        public string FULL_NAME { get; set; }
        public string EMAIL { get; set; }
        public string PASSWORD { get; set; }
        public bool ACTIVE { get; set; }
        public bool IS_ADMIN { get; set; }
    }
}
