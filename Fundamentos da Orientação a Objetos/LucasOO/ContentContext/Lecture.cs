using System.Collections.Generic;
using LucasOO.ContentContext.Enums;
using LucasOO.SharedContext;

namespace LucasOO.ContentContext
{
    public class Lecture : Base // Aulas de um Módulo
    {
        public int Ordem { get; set; }
        public string Title { get; set; }
        public int DurationInMinutes { get; set; }
        public EContentLevel Level { get; set; }
    }
}