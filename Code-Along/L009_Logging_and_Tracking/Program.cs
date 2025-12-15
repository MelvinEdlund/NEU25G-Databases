using L009_Logging_and_Tracking.Model;
using System.Data;

using var db = new DemoContext();

db.Database.EnsureDeleted();
db.Database.EnsureCreated();



