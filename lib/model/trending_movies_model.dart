// To parse this JSON data, do
//
//     final trendingMoviesModel = trendingMoviesModelFromJson(jsonString);

import 'dart:convert';

TrendingMoviesModel trendingMoviesModelFromJson(String str) =>
    TrendingMoviesModel.fromJson(json.decode(str));

String trendingMoviesModelToJson(TrendingMoviesModel data) =>
    json.encode(data.toJson());

class TrendingMoviesModel {
  TrendingMoviesModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory TrendingMoviesModel.fromJson(Map<String, dynamic> json) =>
      TrendingMoviesModel(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.genreIds,
    this.originalLanguage,
    this.id,
    this.posterPath,
    this.video,
    this.voteAverage,
    this.overview,
    this.releaseDate,
    this.voteCount,
    this.title,
    this.adult,
    this.backdropPath,
    this.originalTitle,
    this.popularity,
    this.mediaType,
    this.originalName,
    this.originCountry,
    this.name,
    this.firstAirDate,
  });

  List<int>? genreIds;
  OriginalLanguage? originalLanguage;
  int? id;
  String? posterPath;
  bool? video;
  double? voteAverage;
  String? overview;
  DateTime? releaseDate;
  int? voteCount;
  String? title;
  bool? adult;
  String? backdropPath;
  String? originalTitle;
  double? popularity;
  MediaType? mediaType;
  String? originalName;
  List<String>? originCountry;
  String? name;
  DateTime? firstAirDate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        id: json["id"],
        posterPath: json["poster_path"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        voteCount: json["vote_count"],
        title: json["title"] == null ? null : json["title"],
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        popularity: json["popularity"].toDouble(),
        mediaType: mediaTypeValues.map[json["media_type"]],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        name: json["name"] == null ? null : json["name"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
      );

  Map<String, dynamic> toJson() => {
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "id": id,
        "poster_path": posterPath,
        "video": video == null ? null : video,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "vote_count": voteCount,
        "title": title == null ? null : title,
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath,
        "original_title": originalTitle == null ? null : originalTitle,
        "popularity": popularity,
        "media_type": mediaTypeValues.reverse[mediaType],
        "original_name": originalName == null ? null : originalName,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "name": name == null ? null : name,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
      };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, ES }

final originalLanguageValues =
    EnumValues({"en": OriginalLanguage.EN, "es": OriginalLanguage.ES});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
