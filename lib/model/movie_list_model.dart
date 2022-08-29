class MovieListModel {
  List<Movies>? movies;

  MovieListModel({this.movies});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    if (json["movies"] is List) {
      movies = json["movies"] == null
          ? null
          : (json["movies"] as List).map((e) => Movies.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (movies != null) {
      data["movies"] = movies!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  String? contentRating;
  String? duration;
  String? releaseDate;
  int? averageRating;
  String? originalTitle;
  String? storyline;
  List<String>? actors;
  String? imdbRating;
  String? posterurl;

  Movies(
      {this.id,
      this.title,
      this.year,
      this.genres,
      this.ratings,
      this.poster,
      this.contentRating,
      this.duration,
      this.releaseDate,
      this.averageRating,
      this.originalTitle,
      this.storyline,
      this.actors,
      this.imdbRating,
      this.posterurl});

  Movies.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["year"] is String) {
      year = json["year"];
    }
    if (json["genres"] is List) {
      genres =
          json["genres"] == null ? null : List<String>.from(json["genres"]);
    }
    if (json["ratings"] is List) {
      ratings =
          json["ratings"] == null ? null : List<int>.from(json["ratings"]);
    }
    if (json["poster"] is String) {
      poster = json["poster"];
    }
    if (json["contentRating"] is String) {
      contentRating = json["contentRating"];
    }
    if (json["duration"] is String) {
      duration = json["duration"];
    }
    if (json["releaseDate"] is String) {
      releaseDate = json["releaseDate"];
    }
    if (json["averageRating"] is int) {
      averageRating = json["averageRating"];
    }
    if (json["originalTitle"] is String) {
      originalTitle = json["originalTitle"];
    }
    if (json["storyline"] is String) {
      storyline = json["storyline"];
    }
    if (json["actors"] is List) {
      actors =
          json["actors"] == null ? null : List<String>.from(json["actors"]);
    }
    if (json["imdbRating"] is String) {
      imdbRating = json["imdbRating"];
    }
    if (json["posterurl"] is String) {
      posterurl = json["posterurl"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["year"] = year;
    if (genres != null) {
      data["genres"] = genres;
    }
    if (ratings != null) {
      data["ratings"] = ratings;
    }
    data["poster"] = poster;
    data["contentRating"] = contentRating;
    data["duration"] = duration;
    data["releaseDate"] = releaseDate;
    data["averageRating"] = averageRating;
    data["originalTitle"] = originalTitle;
    data["storyline"] = storyline;
    if (actors != null) {
      data["actors"] = actors;
    }
    data["imdbRating"] = imdbRating;
    data["posterurl"] = posterurl;
    return data;
  }
}
