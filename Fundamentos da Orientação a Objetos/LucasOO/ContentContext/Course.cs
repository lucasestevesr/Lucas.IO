using System.Collections.Generic;
using LucasOO.ContentContext.Enums;

namespace LucasOO.ContentContext
{
    public class Course : Content //Herda da classe abstrata as propriedades de um conteúdo
    {
        public Course(string title, string url)
            : base (title, url)
        {
            Modules = new List<Module>(); //Inicialização no método construtor para evitar erros de objetos Null Reference
        }
        public string Tag { get; set; }
        public IList<Module> Modules { get; set; }  // Cada Curso tem vários módulos.  

        public int DurationInMinutes { get; set; }

        public EContentLevel Level { get; set; } //Utilizando o conceito de Enumeradores.
    }
}