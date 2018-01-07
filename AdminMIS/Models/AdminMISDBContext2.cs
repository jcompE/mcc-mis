using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using AdminMIS.Models.Academics;

namespace AdminMIS.Models
{
    public class AdminMISDBContext2: DbContext
    {
        public AdminMISDBContext2()
        {

        }

        public AdminMISDBContext2(DbContextOptions<AdminMISDBContext2> options): base(options)
        {

        }

        public DbSet<Department> Departments { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            
        }
    }
}