using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TitanCashPDV.Domain.Entities;
using TitanCashPDV.Domain.Interfaces;

namespace TitanCashPDV.Infrastructure.Repositories
{
    public class FuncionarioRepository : IAuthenticationService
    {
        private readonly ComercioContext _context;

        public FuncionarioRepository(ComercioContext context)
        {
            _context = context;
        }

        public bool ValidateCredentials(string username, string password, out Funcionario funcionario)
        {
            funcionario = _context.Funcionarios.SingleOrDefault(f => f.NomeUsuario == username);
            return funcionario != null && funcionario.Senha == password;
        }
    }
}
