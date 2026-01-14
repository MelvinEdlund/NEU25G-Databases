
using MongoDB.Bson;
using MongoDB.Bson.IO;

var doc = new BsonDocument{
    { "FirstName", "Melvin" },
    { "LastName", "Edlund" },
    { "Contacts", new BsonDocument { 
        { "Phone", "0767859010"}, 
        { "Email", "medlund01@gmail.com" } 
    } },
    { "List", new BsonArray { 1, 4, 8, "Hello", new BsonDocument { { "Key", "Value" } } } }
};

doc.Add("Color", "Blue");

doc.Set("FirstName", "Seb");

doc.Remove("LastName");

doc["FirstName"] = "Karl";

var jsonSettings = new JsonWriterSettings() { Indent = true };

Console.WriteLine(doc.ToJson(jsonSettings));