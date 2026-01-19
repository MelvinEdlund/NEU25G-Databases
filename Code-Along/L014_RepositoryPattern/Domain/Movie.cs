using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace L014_RepositoryPattern.Domain;

internal class Movie : IHasId<ObjectId>
{
    public required ObjectId Id { get; set; }
    public required string Title { get; set; }
    public int Year { get; set; }
    public int? Length { get; set; }
    public string? Plot { get; set; }
    public required ImdbInfo Imdb { get; set; }
}
