import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/view_model/trending_view_model.dart';

import '../description.dart';

TrendingViewModel viewModel = Get.put(TrendingViewModel());

class TrendingMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Movies',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: GetX<TrendingViewModel>(
              init: TrendingViewModel(),
              builder: (controller) {
                return viewModel.trending.value.results == null
                    ? Container()
                    : ListView.builder(
                        itemCount: viewModel.trending.value.results!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 140,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/original${viewModel.trending.value.results![index].posterPath}'),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.white,
                                    ),
                                    height: 200,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Description(
                                          title: viewModel.trending.value
                                                  .results![index].title ??
                                              viewModel.trending.value
                                                  .results![index].name,
                                          releaseDate: viewModel.trending.value
                                              .results![index].releaseDate,
                                          backDrop: viewModel.trending.value
                                              .results![index].backdropPath,
                                          rate: viewModel.trending.value
                                              .results![index].voteAverage,
                                          poster: viewModel.trending.value
                                              .results![index].posterPath,
                                          overview: viewModel.trending.value
                                              .results![index].overview,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    '${viewModel.trending.value.results![index].title ?? viewModel.trending.value.results![index].name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
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

// trendingMovies['results'][index]['title'] ??
// trendingMovies['results'][index]['name'],
