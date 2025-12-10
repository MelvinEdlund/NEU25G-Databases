using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace L007_Relationships.Model;

internal class RelationshipDemoContext : DbContext
{
    public DbSet<Student> Students { get; set; }
    public DbSet<Course> Courses { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var connectionString = new SqlConnectionStringBuilder()
        {
            DataSource = "localhost,1433",
            InitialCatalog = "RelationshipDemoDb",
            TrustServerCertificate = true,
            IntegratedSecurity = false,
            UserID = "sa",
            Password = "Password123!"
        }.ToString();

        optionsBuilder.UseSqlServer(connectionString);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        var courseData = new[]
        {
            new Course() { Id = 1, Name = "C# Programmering" },
            new Course() { Id = 2, Name = "Databaser" }
        };

        modelBuilder.Entity<Course>().HasData(courseData);

        var studentData = new[]
        {
            new Student() { Id = 1, FirstName = "Melly", LastName = "Wooo", CourseId = 1 },
            new Student() { Id = 2, FirstName = "Sebb", LastName = "Break", CourseId = 1 },
            new Student() { Id = 3, FirstName = "Hugo", LastName = "Kind", CourseId = 1 },
            new Student() { Id = 4, FirstName = "Vendy", LastName = "Cat", CourseId = 2 },
            new Student() { Id = 5, FirstName = "Lars", LastName = "Larsson", CourseId = 1 },

        };

        modelBuilder.Entity<Student>().HasData(studentData);

    }
}

public class Student
{
    public int Id { get; set; }

    public required string? FirstName { get; set; }

    public required string? LastName { get; set; }

    public DateOnly DateOfBirth { get; set; }

    public int CourseId { get; set; }

    public Course Course { get; set; }
}

public class Course
{
    public int Id { get; set; }

    public string Name { get; set; }

    public List<Student> Students { get; set; }
}
