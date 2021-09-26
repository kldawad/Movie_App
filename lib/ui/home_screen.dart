import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/most_popular.dart';
import 'package:movie_app/ui/widgets/top_rated.dart';
import 'package:movie_app/ui/widgets/trending.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Flutter Movie App',
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          MostPopularMovies(),
          TrendingMovies(),
          TopRated(),
        ],
      ),
    );
  }
}
