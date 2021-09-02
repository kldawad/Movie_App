import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/view_model/most_popular_view_model.dart';

MostPopularViewModel viewModel = Get.put(MostPopularViewModel());

class MostPopularMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular TV Shows',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: GetX<MostPopularViewModel>(
              init: MostPopularViewModel(),
              builder: (controller) {
                return viewModel.mostPopular.value.results == null
                    ? Container()
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.mostPopular.value.results!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(5),
                            width: 250,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/original/${viewModel.mostPopular.value.results![index].posterPath}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 140,
                                ),
                                SizedBox(height: 5),
                                Container(
                                  child: Text(
                                    '${viewModel.mostPopular.value.results![index].title}',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
