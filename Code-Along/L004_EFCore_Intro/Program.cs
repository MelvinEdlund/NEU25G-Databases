

using L004_EFCore_Intro.Model;
using Microsoft.EntityFrameworkCore;

EnsureDataBaseIsCreated();


static void EnsureDataBaseIsCreated()
{
    using var db = new BloggingContext();
    db.Database.EnsureCreated();
}
