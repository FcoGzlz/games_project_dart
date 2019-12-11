import 'package:flutter/material.dart';
import 'package:flutter_peliculas/src/models/game_model.dart';
import 'package:flutter_peliculas/src/pages/pelicula_detalle_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GamesSwiper extends StatelessWidget {

  List<Game> games;
  GamesSwiper({this.games});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
        itemBuilder: (context, index){
          games[index].uniqueId= '${games[index].id}-tarjeta';
          return Hero(
            tag: games[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, PeliculaDetallePage.routeName, arguments: games[index]);
                },
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(games[index].backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemHeight: screenSize.height*0.5,
        itemWidth: screenSize.width*0.7,
      ),
    );
  }
}