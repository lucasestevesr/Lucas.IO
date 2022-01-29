using System;
using LucasOO.NotificationContext;

namespace LucasOO.SharedContext
{
    public abstract class Base : Notifiable 
    // A classe Base serve como base para as padronizações de notificações. 
    {
        public Base()
        {
             Id = Guid.NewGuid(); // SPOF (PONTO ÚNICO DE FALHA)
        }

        public Guid Id { get; set; } //Gera uma hash automática para o Id.
    }
}