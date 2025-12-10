using L006_ModelConfiguration.Model;

using var db = new ConfigDemoContext();

db.Database.EnsureDeleted();
db.Database.EnsureCreated();

var studentA = new Student()
{
    SocialSecurityNumber = "010409-7894",
    FirstName = "Melly",
    LastName = "Wooo",
    DateOfBirth = new DateOnly(2001, 04, 09)
};

var studentB = new Student()
{
    SocialSecurityNumber = "010728-1073",
    FirstName = "Sebbe",
    LastName = "Break",
    DateOfBirth = new DateOnly(2001, 07, 28)
};


db.Students.Add(studentA);
db.Students.Add(studentB);

db.SaveChanges();