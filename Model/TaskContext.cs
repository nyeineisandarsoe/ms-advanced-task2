using Microsoft.EntityFrameworkCore;

namespace TaskProcessor.Model
{
    public class TaskContext : DbContext
    {
        public TaskContext(DbContextOptions<TaskContext> options) : base(options) { }
        public DbSet<TaskModel> Tasks { get; set; } = null!;
    }
}
