import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../description.dart';
import 'package:movie_app/models/movies_data.dart';

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
            child: Consumer<MoviesModel>(
              builder: (context, trendingData, child) {
                final trendingMovies = trendingData.trending!;
                return ListView.builder(
                  itemCount: trendingMovies.length,
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
                                      'https://image.tmdb.org/t/p/original/${trendingMovies['results'][index]['poster_path']}'),
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
                                    title: trendingMovies['results'][index]
                                        ['title'],
                                    releaseDate: trendingMovies['results']
                                        [index]['release_date'],
                                    backDrop: trendingMovies['results'][index]
                                        ['backdrop_path'],
                                    rate: trendingMovies['results'][index]
                                        ['vote_average'],
                                    poster: trendingMovies['results'][index]
                                        ['poster_path'],
                                    overview: trendingMovies['results'][index]
                                        ['overview'],
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
                              trendingMovies['results'][index]['title'] ??
                                  trendingMovies['results'][index]['name'],
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
