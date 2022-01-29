using System.Collections.Generic;
using LucasOO.SharedContext;

namespace LucasOO.ContentContext
{
    public class Module : Base // Módulos de um curso
    {
        public Module()
        {
            Lectures = new List<Lecture>();
        }
        public int Order { get; set; }
        public string Title { get; set; }
        public IList<Lecture> Lectures { get; set; } // Cada módulo tem várias aulas. 
    }

}