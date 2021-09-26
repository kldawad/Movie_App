import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/view_model/most_popular_view_model.dart';

MostPopularViewModel viewModel = Get.put(MostPopularViewModel());

class MostPopularMovies extends StatefulWidget {
  @override
  _MostPopularMoviesState createState() => _MostPopularMoviesState();
}

class _MostPopularMoviesState extends State<MostPopularMovies> {
  @override
  Widget build(BuildContext context) {
    return GetX<MostPopularViewModel>(
      init: MostPopularViewModel(),
      builder: (controller) {
        return Stack(
          children: [
            Container(
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
                    child: ListView.builder(
                      controller: viewModel.scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.movieTitle.length,
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
                                        'https://image.tmdb.org/t/p/original/${controller.moviePoster[index]}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 140,
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: Text(
                                  '${viewModel.movieTitle[index]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            controller.loading.value
                ? Positioned(
                    right: 10,
                    bottom: 100,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
