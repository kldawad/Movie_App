import 'package:get/get.dart';
import 'package:movie_app/model/most_popular_movies_model.dart';
import 'package:movie_app/network/api.dart';

Api api = Api();

class MostPopularViewModel extends GetxController {
  final mostPopular = MostPopularMoviesModel().obs;

  Future fetchMostPopulatData() async {
    mostPopular.value = await api.mostPopularMoviesData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMostPopulatData();
  }
}
