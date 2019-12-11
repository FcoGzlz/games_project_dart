import 'package:flutter/material.dart';
import 'package:flutter_peliculas/src/models/game_model.dart';

class GamesDetailPage extends StatelessWidget {
  static const routeName = 'pelicula-detalle';
  
  @override
  Widget build(BuildContext context) {
    final Game game = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(game),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10,),
                _posterTitulo(game, context),
                // _descripcion(pelicula),
              ]
            ),
          ),
          SliverFillRemaining(

          ),
        ],
      ),
    );
  }
 Widget _crearAppbar(Game game) {
    return SliverAppBar(
      elevation: 2.0,
      pinned: true,
      floating: false,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(game.name),
        centerTitle: true,
        background: FadeInImage(
          placeholder: NetworkImage(game.backgroundImage,
        ),
        image: NetworkImage(game.backgroundImage),
        fit: BoxFit.cover,
        fadeOutDuration: Duration(milliseconds: 150),
      ),
    ),
    );
  }

   Widget _posterTitulo(Game game, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(game.name, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis,),
                // Text(game.originalTitle, style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis,),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(game.rating.toString(), style: Theme.of(context).textTheme.subhead,)

                  ],
                ),
              ],
            ),
          ),

          // ),
        ],
      ),
    );
  }
  }