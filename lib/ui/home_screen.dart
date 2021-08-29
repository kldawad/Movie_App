import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/top_rated.dart';
import 'package:movie_app/ui/widgets/most_popular.dart';
import 'package:movie_app/ui/widgets/trending.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/models/movies_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final provider = Provider.of<MoviesModel>(context);
  late final providerData = Provider.of<MoviesModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    providerData.getMostPopular();
    providerData.getTrending();
    providerData.getTopRated();
  }

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
      body: provider.mostpopular == null ||
              provider.trending == null ||
              provider.toprated == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                MostPopularMovies(),
                TrendingMovies(),
                TopRated(),
              ],
            ),
    );
  }
}
