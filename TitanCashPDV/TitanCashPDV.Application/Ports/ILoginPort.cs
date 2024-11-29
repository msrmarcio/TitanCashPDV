using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TitanCashPDV.Application.Ports
{
    public interface ILoginPort
    {
        bool Login(string username, string password);
    }
}
