import 'package:flutter/material.dart';
import 'package:moneymietest/core/model/movie_model.dart';

class MovieItem extends StatelessWidget {
  final Results movieModel;

  MovieItem({this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Row(children: [
            Container(
              height: 80,
              width: 80,
              child: Image.network(Uri.https(
                      "image.tmdb.org", "/t/p/w500${movieModel.backdropPath}")
                  .toString()),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text(
                  movieModel.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  movieModel.releaseDate,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                Row(children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    movieModel.voteAverage.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  )
                ]),
              ],
            ))
          ]),
          Divider(
            color: Colors.grey,
          ),
        ]));
  }
}
