using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore.Diagnostics;

namespace L009_Logging_and_Tracking.Model;

internal class DemoContext : DbContext
{
    public DbSet<Country> Countries { get; set; }
    public DbSet<City> Cities { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var connectionString = new SqlConnectionStringBuilder()
        {
            ServerSPN = "localhost,1433",
            InitialCatalog = "CityDB",
            TrustServerCertificate = true,
            IntegratedSecurity = false,
            UserID = "sa",
            Password = "Password123!"
        }.ToString();

        optionsBuilder
            .UseSqlServer(connectionString)
            .LogTo(
                message => MyLogger(message),
                //new[] {DbLoggerCategory.Database.Transaction.Name, DbLoggerCategory.Database.Command.Name },
                new[] {DbLoggerCategory.Database.Name },
                LogLevel.Information,
                DbContextLoggerOptions.Level | DbContextLoggerOptions.LocalTime
            );
    }

    private void MyLogger(string message)
    {
        var lines = message.Split('\n');
        
        Console.WriteLine();

        for (int i = 0; i < lines.Length; i++)
        {
            if (i == 0) Console.ForegroundColor = ConsoleColor.Blue;
            if (i == 1) Console.ForegroundColor = ConsoleColor.DarkGray;
            if (i == 2) Console.ForegroundColor = ConsoleColor.White;

            Console.WriteLine(lines[i]);
        }

        Console.ResetColor();
        Console.WriteLine();
    }
}
