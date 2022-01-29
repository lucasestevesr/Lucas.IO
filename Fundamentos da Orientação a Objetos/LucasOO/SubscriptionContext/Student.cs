using System;
using System.Collections.Generic;
using System.Linq;
using LucasOO.NotificationContext;
using LucasOO.SharedContext;

namespace LucasOO.SubscriptionContext
{
    public class Student : Base //Nem sempre um usuário vai ser um aluno.
    {
        public Student()
        {
            Subscriptions = new List<Subscription>();
        }
        public User User { get; set; }

        public string Name { get; set; }

        public string Email { get; set; }

        public IList<Subscription> Subscriptions { get; set; } 

        //Regras de Negócio
        //EndDate estiver no passado o aluno não tem acesso.
        public bool IsPremium => Subscriptions.Any(x=> !x.IsInactive);
     
        public void CreateSubscription(Subscription subscription)
        {
            if(IsPremium)
            {
                AddNotification(new Notification("Premium", "O Aluno já tem assinatura Premiu."));
                return;
            }
            Subscriptions.Add(subscription);
        }        
    }
}