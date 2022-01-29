using System.Collections.Generic;

namespace LucasOO.ContentContext
{
    public class Career : Content //Uma carreira é estruturada com uma ordem de apresentação de cursos.
    {
        public Career(string title, string url)
            : base (title, url)
        {
            Items = new List<CareerItem>();
        }
        public IList<CareerItem> Items { get; set; }

        //
        // public int TotalCourses { 
        //     get
        //     {
        //         return Items.Count; 
        //         //Não faz sentido ter um método set para essa propriedade, apenas um get.
        //     }
        // } 
        // 
        // Quando tivermos apenas uma linha dentro do get e com ausência de um set,         
        // podemos utilizar o Expression body
        public int TotalCourser => Items.Count;
    }
}