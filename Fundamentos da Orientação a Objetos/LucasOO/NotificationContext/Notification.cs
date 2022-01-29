namespace LucasOO.NotificationContext
{
    public sealed class Notification 
    //O modificador Sealed impede que essa clase seja estendida. 
    //Não posso criar variações dessa classes. 
    {
        public Notification()
        {
            
        }

        public Notification(string property, string message)
        {
            Property = property;
            Message = message;
        }

        public string Property { get; set; }
        public string Message { get; set; }


    }
}