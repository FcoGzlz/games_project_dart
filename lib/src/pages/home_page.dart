import 'package:flutter/material.dart';
import 'package:flutter_peliculas/src/providers/games_provider.dart';
import 'package:flutter_peliculas/src/providers/peliculas_provider.dart';
import 'package:flutter_peliculas/src/widgets/card_swiper_widget.dart';
import 'package:flutter_peliculas/src/widgets/swiper_games_widget.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  final peliculasProvider = PeliculasProvider();
  final gamesProvider = GamesProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // _swiperTarjetas(),
          _swiperGames(),
        ],
      ),

    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future:peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot <List>snapshot) {
        if(snapshot.hasData){
          return CardSwiper(peliculas: snapshot.data,);
        }else{
          return Container(
            height: 400,
            child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  Widget _swiperGames() {
    return FutureBuilder(
      future:gamesProvider.getMasEsperados(),
      builder: (BuildContext context, AsyncSnapshot <List>snapshot) {
        if(snapshot.hasData){
          print(snapshot.data);
          return GamesSwiper(games: snapshot.data,);
        }else{
          return Container(
            height: 400,
            child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}