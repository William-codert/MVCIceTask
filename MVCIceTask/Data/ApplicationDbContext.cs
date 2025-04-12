using Microsoft.EntityFrameworkCore;
using MVCIceTask.Models;

namespace MVCIceTask.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        public DbSet<Product> Products { get; set; }
    }
}

