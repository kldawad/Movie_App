import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movie_app/model/most_popular_movies_model.dart';
import 'package:movie_app/model/top_rated_movies_model.dart';
import 'package:movie_app/model/trending_movies_model.dart';
import 'package:movie_app/utils/constants.dart';

class Api {
  Future mostPopularMoviesData(int count) async {
    try {
      String url =
          '$kthemoviedbMostPopularUrl$apiKey&language=en-US&page=$count';
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);

      log("status code : ${json.decode(response.body)["code"]}  MostPopularMovies : ${response.body}");
      if (response.statusCode == 200) {
        MostPopularMoviesModel mostPopularMovieModel =
            MostPopularMoviesModel.fromJson(jsonDecode(response.body));
        return mostPopularMovieModel;
      } else {
        log("status code : ${response.statusCode}  MostPopularMovies : ${response.body}");
        MostPopularMoviesModel mostPopularMovieModel =
            MostPopularMoviesModel.fromJson(jsonDecode(response.body));
        return mostPopularMovieModel;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future trendingMoviesData() async {
    try {
      String url = '$kthemoviedbTrendingUrl$apiKey';
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      log("status code : ${json.decode(response.body)["code"]}  TrendingMovies : ${response.body}");
      if (response.statusCode == 200) {
        TrendingMoviesModel trendingMoviesModel =
            TrendingMoviesModel.fromJson(jsonDecode(response.body));
        return trendingMoviesModel;
      } else {
        log("status code : ${response.statusCode}  TrendingMovies : ${response.body}");
        TrendingMoviesModel trendingMoviesModel =
            TrendingMoviesModel.fromJson(jsonDecode(response.body));
        return trendingMoviesModel;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future topRatedData() async {
    try {
      String url = '$kthemoviedbTopRatedUrl$apiKey&language=en-US&page=1';
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      log("status code : ${response.statusCode}  TopRatedMovies : ${response.body}");
      if (response.statusCode == 200) {
        TopRatedMoviesModel topRatedMoviesModel =
            TopRatedMoviesModel.fromJson(jsonDecode(response.body));
        return topRatedMoviesModel;
      } else {
        log("status code : ${response.statusCode}  TopRatedMovies : ${response.body}");
        TopRatedMoviesModel topRatedMoviesModel =
            TopRatedMoviesModel.fromJson(jsonDecode(response.body));
        return topRatedMoviesModel;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
