import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_data.dart';
import 'package:provider/provider.dart';

class MostPopularMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesModel>(
      builder: (context, mostPopularData, child) {
        final mostPopularMovies = mostPopularData.mostpopular!;
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mostPopularMovies.length,
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
                                    'https://image.tmdb.org/t/p/original/${mostPopularMovies['results'][index]['backdrop_path']}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 140,
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Text(
                              mostPopularMovies['results'][index]['title'],
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
              )
            ],
          ),
        );
      },
    );
  }
}
