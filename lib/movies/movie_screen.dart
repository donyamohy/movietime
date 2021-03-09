import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  static const routeName = '/movie-details';
  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeargs['id'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Center(
              child: Card(
                elevation: 5,
                child: Hero(
                  tag: id,
                  child: Container(
                    //padding: EdgeInsets.all(20),
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.8,
                    width: (MediaQuery.of(context).size.width -
                            MediaQuery.of(context).padding.left) *
                        1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(routeargs['imageUrl']))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(routeargs['title'],
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    child: Column(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 35,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(height: 15),
                        Text(
                          routeargs['duration'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    child: Column(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 35,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(height: 15),
                        Text(
                          routeargs['year'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    child: Column(
                      children: [
                        Icon(
                          Icons.star,
                          size: 35,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(height: 15),
                        Text(
                          routeargs['rating'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              routeargs['description'],
              style: TextStyle(fontSize: 20, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border),
                  Container(
                    height: (MediaQuery.of(context).size.height) * 0.04,
                    width: (MediaQuery.of(context).size.width) * 0.4,
                    //height: 5, width: 5
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Add to favorites',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              onPressed: () {},
              color: Colors.red[900],
              textColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.comment),
                    Container(
                        height: (MediaQuery.of(context).size.height) * 0.04,
                        width: (MediaQuery.of(context).size.width -
                                MediaQuery.of(context).padding.left) *
                            0.4,
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Add Comment',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
