using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TitanCashPDV.Domain.Entities;

namespace TitanCashPDV.Domain.Interfaces
{
    public interface IAuthenticationService
    {
        bool ValidateCredentials(string username, string password, out Funcionario funcionario);
    }
}
