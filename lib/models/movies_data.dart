import 'package:flutter/foundation.dart';
import 'package:movie_app/network/api.dart';
import 'package:flutter/material.dart';

NetworkHelper networkHelper = NetworkHelper();

class MoviesModel extends ChangeNotifier {
  Map? mostpopular;
  Future getMostPopular() async {
    mostpopular = await networkHelper.mostPopularMoviesData();
    notifyListeners();
  }

  Map? trending;
  Future getTrending() async {
    trending = await networkHelper.trendingMoviesData();
    notifyListeners();
  }

  Map? toprated;
  Future getTopRated() async {
    toprated = await networkHelper.topRatedData();
    notifyListeners();
  }

  int get count {
    print(mostpopular!.length);
    return mostpopular!.length;
  }
}
