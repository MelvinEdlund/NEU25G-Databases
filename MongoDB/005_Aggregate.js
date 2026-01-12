
use ("sample_mflix");

db.movies.aggregate([
    { $match:

        {"year": {$lte: 2005}}
    },
    { $project: 
        {
            "_id": false,
            "year": true,
            "title": true,
            "test": "$plot",
            "nextYear": {$add: [ "$year", 1 ] },
            "titleWithYear": { $concat: [ "$title", " (",  {$toString: "$year"}, ")" ]}
        }
    }
]);

// select year, title, plot as 'test' from movies where year <= 1910;