using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TitanCashPDV.Domain.Entities;

namespace TitanCashPDV.Domain.Interfaces
{
    public interface IFuncionarioRepository
    {
        Funcionario GetById(int id);
        void Save(Funcionario funcionario);
        void Update(Funcionario funcionario);
    }
}
