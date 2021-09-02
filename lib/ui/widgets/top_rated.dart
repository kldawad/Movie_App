import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/view_model/top_rated_view_model.dart';

TopRatedViewModel viewModel = Get.put(TopRatedViewModel());

class TopRated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Rated Movies',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: GetX<TopRatedViewModel>(
              init: TopRatedViewModel(),
              builder: (controller) {
                return viewModel.topRated.value.results == null
                    ? Container()
                    : ListView.builder(
                        itemCount: viewModel.topRated.value.results!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 140,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/original/${viewModel.topRated.value.results![index].posterPath}'),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.white,
                                  ),
                                  height: 200,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    '${viewModel.topRated.value.results![index].title}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
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
