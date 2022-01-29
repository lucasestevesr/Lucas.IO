using System;
using LucasOO.SharedContext;

namespace LucasOO.ContentContext
{
    public abstract class Content : Base 
    //abstrata pois não deve poder ser instanciada.
    //Herda de Base para que base seja a classe que padronize as notificações para todas as demais que herdam de Content.
    {
        public Content(string title, string url) //método construtor
        {
            Title = title;
            Url = url;
        }
        
        public string Title { get; set; }
        public string Url { get; set; }
    }
}