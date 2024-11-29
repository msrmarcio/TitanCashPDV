using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TitanCashPDV.Domain.Entities;

namespace TitanCashPDV.Infrastructure.Repositories
{
    public class ComandaRepository : IComandaRepository
    {
        private readonly DatabaseContext _context;

        public ComandaRepository(DatabaseContext context)
        {
            _context = context;
        }

        public void Save(Comanda comanda)
        {
            // Código para persistir a comanda no banco de dados.
        }
    }
}
