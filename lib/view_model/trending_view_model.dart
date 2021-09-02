import 'package:get/get.dart';
import 'package:movie_app/model/trending_movies_model.dart';
import 'package:movie_app/network/api.dart';

Api api = Api();

class TrendingViewModel extends GetxController {
  // final trendingMovies = Result().obs;
  // var trendingMovies = <Result>[].obs;

  final trending = TrendingMoviesModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchTrendingData();
  }

  Future fetchTrendingData() async {
    trending.value = await api.trendingMoviesData();
  }
}
