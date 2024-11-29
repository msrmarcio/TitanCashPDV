using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TitanCashPDV.Domain.Entities
{
    public class Funcionario
    {
        public int FuncionarioID { get; private set; }
        public string Nome { get; private set; }
        public string NomeUsuario { get; private set; }
        public string Senha { get; private set; }
        public DateTime DataCadastro { get; private set; }

        public Funcionario(string nome, string nomeUsuario, string senha)
        {
            Nome = nome;
            NomeUsuario = nomeUsuario;
            Senha = HashSenha(senha);
            DataCadastro = DateTime.UtcNow;
        }

        private string HashSenha(string senha)
        {
            // Implementação de hashing.
            throw new NotImplementedException();
        }
    }
}
