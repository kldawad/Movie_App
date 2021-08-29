import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/models/movies_data.dart';

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
            child: Consumer<MoviesModel>(
              builder: (context, topratedData, child) {
                final topRatedMovies = topratedData.toprated!;
                return ListView.builder(
                  itemCount: topRatedMovies.length,
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
                                    'https://image.tmdb.org/t/p/original/${topRatedMovies['results'][index]['poster_path']}'),
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
                              topRatedMovies['results'][index]['title'],
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
