import 'package:flutter/material.dart';
import 'package:flutter_peliculas/src/models/pelicula_model.dart';

class PeliculaDetallePage extends StatelessWidget {
  static const routeName = 'pelicula-detalle';
  
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10,),
                _posterTitulo(pelicula, context),
                _descripcion(pelicula),
              ]
            ),
          ),
          SliverFillRemaining(

          ),
        ],
      ),
    );
  }

  Widget _crearAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      pinned: true,
      floating: false,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(pelicula.title),
        centerTitle: true,
        background: FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif',
        ),
        image: NetworkImage(pelicula.getBackgroundImg()),
        fit: BoxFit.cover,
        fadeOutDuration: Duration(milliseconds: 150),
      ),
    ),
    );
  }

  Widget _posterTitulo(Pelicula pelicula, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                height: 150,
              ),
            ),
          ),
          SizedBox(width: 20,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pelicula.title, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis,),
                Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis,),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.subhead,)

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

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(pelicula.overview, textAlign: TextAlign.justify,)
    );
  }
}