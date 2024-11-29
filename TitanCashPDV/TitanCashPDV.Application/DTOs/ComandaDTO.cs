using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TitanCashPDV.Application.DTOs
{
    public class ComandaDTO
    {
        public int Id { get; set; }
        public int FuncionarioId { get; set; }
        public DateTime DataAbertura { get; set; }
    }
}
