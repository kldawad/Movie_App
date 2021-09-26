import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/most_popular_movies_model.dart';
import 'package:movie_app/network/api.dart';

Api api = Api();

class MostPopularViewModel extends GetxController {
  final mostPopular = MostPopularMoviesModel().obs;
  RxInt count = 1.obs;
  ScrollController scrollController = ScrollController();
  final movieTitle = <dynamic>[].obs;
  final moviePoster = <dynamic>[].obs;
  final adding = 0.obs;
  RxBool loading = false.obs;

  Future fetchMostPopularData() async {
    mostPopular.value = await api.mostPopularMoviesData(count.value);
    addingData();
  }

  void addingData() {
    for (int i = 0; i < 19; i++) {
      movieTitle.add(mostPopular.value.results![i].title);
      moviePoster.add(mostPopular.value.results![i].posterPath);
    }
    print(movieTitle);
    loading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMostPopularData();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        loading.value = true;
        count++;
        fetchMostPopularData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }
}
