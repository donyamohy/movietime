import 'package:flutter/material.dart';
import 'package:movietime/screens/settings.dart';
import '../screens/home_screen.dart';

class EditProfilePage extends StatefulWidget {
  static const routeEditProfile = '/EditProfile';
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Profile",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.teal,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 2,
          actions: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.teal),
              onPressed: () {
                Navigator.of(context).pushNamed(Settings.routesettings);
              },
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10),
                                ),
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  // fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    width: 4),
                                color: Colors.teal,
                              ),
                              child: Icon(Icons.edit, color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  buildTextField("Username", "Donya Mohy", false),
                  buildTextField("E-mail", "DonyaMohy@gmail.com", false),
               //   buildTextField("Password", " 123456789", false),
                  buildTextField("Phone number", "01289265555", false),
                  buildTextField("Location", "Cairo , Egypt", false),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlineButton(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(HomeScreen.routehome);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2.2,
                              color: Colors.black),
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(HomeScreen.routehome);
                        },
                        color: Colors.teal,
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2.2,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }

  Widget buildTextField(
      String labelText, String placholder, bool isPasswordField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.teal,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placholder,
            hintStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  }
}
