using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection.Metadata;
using System.Text;


namespace L006_ModelConfiguration.Model;

internal class ConfigDemoContext : DbContext
{
    public DbSet<Student> Students { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var connectionString = new SqlConnectionStringBuilder()
        {
            DataSource = "localhost,1433",
            InitialCatalog = "ConfigDemoDB",
            TrustServerCertificate = true,
            IntegratedSecurity = false,
            UserID = "sa",
            Password = "Password123!"
        }.ToString();

        optionsBuilder.UseSqlServer(connectionString);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Student>()
            .ToTable("Elever", "ITHS")
            .HasKey(s => s.SocialSecurityNumber);

        //modelBuilder.Entity<Student>().Ignore(s => s.FirstName);

        modelBuilder.Entity<Student>().Property(s => s.LastName)
            .HasColumnName("Efternamn")
            .HasColumnType("varchar(200)");

    }
}

[Table("Studenter", Schema ="ITHS")]
public class Student
{
    [Key]
    public required string SocialSecurityNumber { get; set; }

    [Column("Förnamn", TypeName = "varchar(200)")]
    public string? FirstName { get; set; }

    public string LastName { get; set; }

    [NotMapped]
    public DateOnly DateOfBirth { get; set; }
}