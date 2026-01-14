
using MongoDB.Driver;
using System.Reflection.Metadata;

var connectionString = "mongodb+srv://edlund:Password123!@cluster0.rw26fnz.mongodb.net/";

var client = new MongoClient(connectionString);

Console.WriteLine($"Databases: {string.Join(", ", client.ListDatabaseNames().ToList())}");

var database = client.GetDatabase("sample_mflix");

Console.WriteLine($"\nCollections in database sample_mflix: {string.Join(", ", database.ListCollectionNames().ToList())}");

var collection = database.GetCollection<Movie>("movies");

//var filter = Builders<Movie>.Filter.Empty;
//var result = collection.Find(filter).Limit(10).ToList();

//var filter = Builders<Movie>.Filter.Eq("title", "Titanic");
//var filter = Builders<Movie>.Filter.Gte("imdb.rating", 9);
//var filter = Builders<Movie>.Filter.Regex("title", "Matrix");

//var movies = collection.Find(filter).ToList();

//foreach (var movie in movies)
//{
//    Console.WriteLine($"{movie.Title} ({movie.Year})");
//}

var myUser = new User() { FirstName = "Melvin", LastName = "Edlund" };

var userCollection = client.GetDatabase("iths").GetCollection<User>("users");

//userCollection.InsertOne(myUser);

var userFilter = Builders<User>.Filter.Eq("FirstName", "Melvin");
var userUpdate = Builders<User>.Update.Set("LastName", "Edluu");

//userCollection.UpdateMany(userFilter, userUpdate);

userCollection.DeleteMany(userFilter);

class User
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
}