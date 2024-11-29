using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TitanCashPDV.Domain.Entities;
using TitanCashPDV.Domain.Interfaces;

namespace TitanCashPDV.Application.UseCases
{
    public class LoginUseCase
    {
        private readonly IAuthenticationService _authenticationService;

        public LoginUseCase(IAuthenticationService authenticationService)
        {
            _authenticationService = authenticationService;
        }

        public bool Execute(string username, string password, out Funcionario funcionario)
        {
            return _authenticationService.ValidateCredentials(username, password, out funcionario);
        }
    }
}
