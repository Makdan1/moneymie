import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneymietest/core/model/movie_model.dart';
import 'package:moneymietest/ui/screens/movies_list/movies_view_model.dart';
import 'package:moneymietest/ui/widget/Movieswidget/movieItem.dart';
import 'package:provider_architecture/provider_architecture.dart';

class Movies extends StatefulWidget {
  @override
  MoviesState createState() => new MoviesState();
}

class MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MoviesViewModel>.withConsumer(
        viewModelBuilder: () => MoviesViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.black54,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Movies',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Text('')
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<Results>>(
                        future: model.fetchMovies(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView(
                                //scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: snapshot.data
                                    .map((feed) => MovieItem(movieModel: feed))
                                    .toList());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                              "Error Fetching movies",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ));
                          }
                          return Center(
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator()));
                        }),
                  ),
                ]),
          );
        });
  }
}
