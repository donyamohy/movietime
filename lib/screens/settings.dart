import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'editprofile.dart';

class Settings extends StatelessWidget {
  static const routesettings = '/Settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('Settings', style: TextStyle(color: Colors.teal))),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.all(12),
                      color: Colors.teal[400],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://www.google.com/search?q=boy&sxsrf=ALeKk03CQ1zNUEXsYtJodngvxnw6wwelYw:1611331765486&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjpw_zL9q_uAhUCSxUIHVCGAKsQ_AUoAXoECB8QAw&biw=995&bih=912#imgrc=D2xKzVoIMDEumM'),
                                  ))),
                          Text(
                            "Donya Mohamed",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(EditProfilePage.routeEditProfile);
                            },
                          ),
                        ],
                      )),

                  SizedBox(height: 5),
                  Card(
                      elevation: 8,
                      margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          ListTile(
                              leading: Icon(Icons.language, color: Colors.teal),
                              title: Text(
                                "Change Language",
                                style: TextStyle(fontSize: 16),
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {}),
                          ListTile(
                              leading: Icon(Icons.flag, color: Colors.teal),
                              title: Text(
                                "Change Country",
                                style: TextStyle(fontSize: 16),
                                //textAlign: TextAlign.center,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {}),
                          ListTile(
                              leading:
                                  Icon(Icons.location_on, color: Colors.teal),
                              title: Text(
                                "Change Location",
                                style: TextStyle(fontSize: 16),
                                //textAlign: TextAlign.center,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {}),
                        ],
                      )),
                  SizedBox(height: 20),
                  Text(
                    "Notification Settings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                  ),
                  // SizedBox(height: 10),
                  SwitchListTile(
                      //dense: true,
                      activeColor: Colors.teal,
                      contentPadding: EdgeInsets.all(18),
                      value: true,
                      title: Text("Push Notifications"),
                      onChanged: (val) {}),
                  SwitchListTile(
                      activeColor: Colors.teal,
                      contentPadding: EdgeInsets.all(18),
                      value: false,
                      title: Text("Recevied Newsletter"),
                      onChanged: null),
                  SwitchListTile(
                      activeColor: Colors.teal,
                      contentPadding: EdgeInsets.all(18),
                      value: true,
                      title: Text("Recevied offer Notifications"),
                      onChanged: (val) {}),
                  SwitchListTile(
                      activeColor: Colors.teal,
                      contentPadding: EdgeInsets.all(18),
                      value: false,
                      title: Text("Recevied App Updates"),
                      onChanged: null),
                ],
              )),
          SizedBox(height: 10),
          Positioned(
              bottom: -20,
              left: -20,
              child: Container(
                width: 70,
                height: 70,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  color: Colors.teal[400],
                  shape: BoxShape.circle,
                ),
              )),
          Positioned(
              bottom: 00,
              left: 00,
              child: IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {}))
        ],
      ),
    );
  }
}
