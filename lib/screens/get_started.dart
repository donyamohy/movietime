import 'package:flutter/material.dart';
import '../Registeration/log_in.dart';
import '../Slider/Slide.dart';
//import 'package:movie_time_app/Slider/slide.dart';
import '../Slider/slide_item.dart';
//import 'package:movie_time_app/Registeration/login.dart';
import '../Registeration/signup.dart';
import 'dart:async';
//import 'Registeration/log_in.dart';
//import 'package:movie_time_app/login_screen.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentpage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentpage < 2) {
        _currentpage++;
      } else {
        _currentpage = 0; //to start again
      }
      _pageController.animateToPage(_currentpage,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Expanded(
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: slidelist.length,
                        itemBuilder: (ctx, i) => SlideItem(i))),
                // SizedBox(
                //  height: 20,
                // ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUpForm.routesignup);
                  },
                  child: Text('Get Started',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(20),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        //textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20)),
                    FlatButton(
                        onPressed: () {
                          //  Navigator.of(context).pushNamed(SignIn.routelogin);
                        },
                        child: Text('Login', style: TextStyle(fontSize: 18)))
                  ],
                ),
              ]),
            )));
  }
}
