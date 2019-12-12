import 'package:flutter/material.dart';
import 'package:flutter_peliculas/src/pages/game_detail_page.dart';
import 'package:flutter_peliculas/src/pages/home_page.dart';
import 'package:flutter_peliculas/src/pages/pelicula_detalle_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (context) => HomePage(),
        PeliculaDetallePage.routeName : (context) => PeliculaDetallePage(),
        GamesDetailPage.routeName : (context) => GamesDetailPage(),

      },
    );
  }
}