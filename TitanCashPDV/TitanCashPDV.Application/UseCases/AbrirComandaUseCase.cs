using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TitanCashPDV.Domain.Entities;

namespace TitanCashPDV.Application.UseCases
{
    public class AbrirComandaUseCase
    {
        private readonly IComandaRepository _comandaRepository;

        public AbrirComandaUseCase(IComandaRepository comandaRepository)
        {
            _comandaRepository = comandaRepository;
        }

        public void Execute(int funcionarioId)
        {
            var comanda = new Comanda(funcionarioId);
            _comandaRepository.Save(comanda);
        }
    }   
}
