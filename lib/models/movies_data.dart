// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/models/top_rated_model.dart';
// import 'package:movie_app/network/api.dart';
//
// Api networkHelper = Api();
//
// class MoviesModel extends ChangeNotifier {
//   Map? mostpopular;
//   Future getMostPopular() async {
//     mostpopular = await networkHelper.mostPopularMoviesData();
//     notifyListeners();
//   }
//
//   Map? trending;
//   Future getTrending() async {
//     trending = await networkHelper.trendingMoviesData();
//     notifyListeners();
//   }
//
//   TopRatedModel? toprated;
//   Future getTopRated() async {
//     toprated = await networkHelper.topRatedData();
//     notifyListeners();
//   }
//
//   int get count {
//     print(mostpopular!.length);
//     return mostpopular!.length;
//   }
// }
