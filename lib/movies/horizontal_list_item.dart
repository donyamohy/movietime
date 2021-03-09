import 'package:flutter/material.dart';
import '../models/movie_list.dart';
import 'movie_screen.dart';

class HorizontalListItem extends StatelessWidget {
  final int index;
  HorizontalListItem(this.index);

  @override
  Widget build(BuildContext context) {
    // final id = routeargs['id'];
    return Container(
        padding: const EdgeInsets.all(6),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(MovieDetails.routeName, arguments: {
                'id': movieList[index].id,
                'title': movieList[index].title,
                'imageUrl': movieList[index].imageUrl,
                'description': movieList[index].description,
                'rating': movieList[index].rate,
                'year': movieList[index].year,
                'duration': movieList[index].duration,
              });
            },
            child: Column(children: [
              Card(
                elevation: 15,
                child: Hero(
                  tag: movieList[index].id,
                  child: Container(
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.27,
                      width: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).padding.left) *
                          0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(movieList[index].imageUrl)))),
                ),
              ),
              SizedBox(height: 7),
              Text(
                movieList[index].title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[900]),
                textAlign: TextAlign.center,
              ),
              // Icon(Icons.favorite, color: Colors.red),
            ])));
  }
}
