import 'package:flutter/material.dart';
import 'package:flutter_peliculas/src/models/game_model.dart';

class GamesDetailPage extends StatelessWidget {
  static const routeName = 'game-detail';
  
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
                  SizedBox(height: 20,),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[Text('Género', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20) , )],
                          
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[Text('Plataforma', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20) , )],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                    
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,


                    children: <Widget>[

                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _genres(game),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _platforms(game),

                        ),
                      )
                    ],
                  ),

                 
                 
                
                
                  SizedBox(height: 20,),
                  
                
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                    child:Row(
                    children: _screenShots(game, context),
                  ),
                ),
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

  List<Widget> _platforms(Game game) {
  final List<Widget> platforms = [];
  for (var plat in game.platforms) {
      final widgetTemp = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(4.0),
          
          child: Text(
            plat.platform.name,
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,

            
          ),
          // color: weak.color.withOpacity(0.8),
        ),
      );
      platforms..add(widgetTemp)
      ..add(SizedBox(width: 20));
  }
  return platforms;
}

List<Widget> _genres(Game game) {
  final List<Widget> genres = [];
  for (var gen in game.genres) {
      final widgetTemp = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Text(
            gen.name,
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // color: weak.color.withOpacity(0.8),
        ),
      );
      genres..add(widgetTemp)
            ..add(SizedBox(width: 20));
  }
  return genres;
}

List<Widget> _screenShots(Game game, context) {
  final List<Widget> screenShots = [];
  for (var shots in game.shortScreenshots) {
      final widgetTemp = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: 

        BoxDecoration(
          border: Border.all(width: 10),
          ),
          
          padding: EdgeInsets.all(4.0),
          child: Image.network(
            shots.image,
            fit: BoxFit.cover,
          )
          // color: weak.color.withOpacity(0.8),
        ),
      );
      screenShots..add(widgetTemp)
            ..add(SizedBox(width: 20));
  }
  return screenShots;
}
  }