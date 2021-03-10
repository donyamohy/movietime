import 'package:flutter/material.dart';
import 'package:movietime/screens/settings.dart';
import '../models/movie_list.dart';
import '../movies/horizontal_list_item.dart';
import '../movies/vertical_list_item.dart';
import '../screens/editprofile.dart';
import 'package:provider/provider.dart';
import 'package:movietime/providers/auth.dart';
import  '../screens/maps.dart';

class HomeScreen extends StatelessWidget {
  static const routehome = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.search), onPressed: () {})
              ],
            )
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                  trailing: new Icon(
                    Icons.supervised_user_circle,
                  ),
                  title: new FlatButton(
                    child: Text(
                      'Your Profile',
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(EditProfilePage.routeEditProfile);
                    },
                  )),
              new ListTile(
                  trailing: new Icon(Icons.movie),
                  title: new FlatButton(
                    child: Text(
                      'Choose Category',
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushNamed(Gerens.routec);
                    },
                  )),
              new ListTile(
                  trailing: new Icon(
                    Icons.favorite,
                    color: Colors.red[900],
                  ),
                  title: new FlatButton(
                    child: Text(
                      'Favorites',
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushNamed(Gerens.routec);
                    },
                  )),
              new ListTile(
                  trailing:
                      new Icon(Icons.notifications, color: Colors.yellow[900]),
                  title: new FlatButton(
                    child: Text(
                      'Notifications', //remove
                    ),
                    onPressed: () {
                      //Navigator.of(context).pushNamed(Gerens.routec);
                    },
                  )),
              new ListTile(
                  trailing: new Icon(Icons.settings, color: Colors.grey[800]),
                  title: new FlatButton(
                    child: Text(
                      'Settings',
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Settings.routesettings);
                    },
                  )),
                  new ListTile(
                  trailing: new Icon(Icons.location_on, color: Colors.grey[800]),
                  title: new FlatButton(
                    child: Text(
                      'locations',
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(GoogleMaps.routename);
                    },
                  )),
              new ListTile(
                  trailing: new Icon(Icons.logout, color: Colors.grey[800]),
                  title: new FlatButton(
                    child: Text(
                      'Log out',
                    ),
                    onPressed: () {
                      context.read<AuthenticationService>().Signout();
                    },
                  )),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            alignment: Alignment.topLeft,
            // child: IconButton(
            //   icon: Icon(Icons.menu),
            // iconSize: 43,
            //color: Colors.indigo,
            //onPressed: null),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('New Releases',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.teal)),
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(8),
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (ctx, i) => HorizontalListItem(i),
                // scrollDirection: Axis.horizontal,
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Top rated ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.teal)),
                ),
              ],
            ),
          ),
          Container(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.65,
              width: (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).padding.left) *
                  0.9,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: topRatedlist.length,
                itemBuilder: (ctx, i) => VerticalListItem(i),
              ))
        ])));
  }
}
