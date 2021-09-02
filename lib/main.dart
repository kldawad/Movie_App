import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/movies_data.dart';
import 'ui/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoviesModel>(
      create: (context) => MoviesModel(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
