using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System;
using System.Collections.Generic;
using System.Text;

namespace L004_EFCore_Intro.Model;

internal class BloggingContext : DbContext
{
    public DbSet<Blog> Blogs { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        //var connectionString = "Data Source=localhost,1433; Database=everyloop; Integrated Security=True; TrustServerCertificate=True;";

        var connectionString = new SqlConnectionStringBuilder()
        {
            DataSource = "localhost,1433",
            InitialCatalog = "BlogDB",
            TrustServerCertificate = true,
            IntegratedSecurity = false,
            UserID = "sa",
            Password = "Password123!"
        }.ToString();

        optionsBuilder.UseSqlServer(connectionString);
    }
}

public class Blog
{
    public int Id { get; set; }
    public string Url { get; set; }
    public int Rating { get; set; }
}


