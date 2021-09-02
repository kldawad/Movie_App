import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String? title, backDrop, poster, overview;
  final double? rate;
  final DateTime? releaseDate;
  Description(
      {required this.title,
      required this.releaseDate,
      required this.backDrop,
      required this.rate,
      required this.poster,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original$backDrop',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      '⭐ Average Rating - ${rate.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                title!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Releasing On - $releaseDate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 75,
            ),
            Row(
              children: [
                Container(
                  height: 300,
                  width: 150,
                  child: Image.network(
                      'https://image.tmdb.org/t/p/original$poster'),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      overview!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
