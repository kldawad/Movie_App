import 'package:get/get.dart';
import 'package:movie_app/model/top_rated_movies_model.dart';
import 'package:movie_app/network/api.dart';

Api api = Api();

class TopRatedViewModel extends GetxController {
  final topRated = TopRatedMoviesModel().obs;

  Future fetchTopRatedData() async {
    topRated.value = await api.topRatedData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchTopRatedData();
  }
}
