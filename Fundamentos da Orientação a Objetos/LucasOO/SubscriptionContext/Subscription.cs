using System;
using LucasOO.SharedContext;

namespace LucasOO.SubscriptionContext
{
    public class Subscription : Base
    {
        public Plan Plan { get; set; }

        //Regras de Negócio
        //EndDate estiver no passado o aluno não tem acesso.
        public DateTime? EndDate { get; set; }

        public bool IsInactive => EndDate <= DateTime.Now;
    }
}