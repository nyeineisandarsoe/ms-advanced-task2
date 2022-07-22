namespace TaskProcessor.Model
{
    public class TaskModel
    {
        public int ID { get; set; }

        public string Description { get; set; }

        public string Priority { get; set; }

        public Status Status { get; set; }

    }
    public enum Status
    {
        STARTED,
        IN_PROGRESS,
        COMPLETED,
        FAILED
    }
}
