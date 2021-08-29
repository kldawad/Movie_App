import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/utils/constants.dart';

class NetworkHelper {
  Future mostPopularMoviesData() async {
    try {
      String url = '$kthemoviedbMostPopularUrl$apiKey&language=en-US&page=1';
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future trendingMoviesData() async {
    try {
      String url = '$kthemoviedbTrendingUrl$apiKey';
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future topRatedData() async {
    try {
      String url = '$kthemoviedbTopRatedUrl$apiKey&language=en-US&page=1';
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
