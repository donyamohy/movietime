import 'package:flutter/material.dart';
import 'package:movietime/services/auth.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  String name = '';
  String email = '';
  String password = '';

  bool _termsChecked = true;

  void onPressedSubmit() {
    if (_formKey.currentState.validate() && _termsChecked) {
      _formKey.currentState.save();
      //   Navigator.of(context).pushNamed(HomeScreen.routehome);
      print("Name " + name);
      print("Email " + email);
      print("Password " + password);
      print("Termschecked " + _termsChecked.toString());
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Form Submitted')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: GestureDetector(
      child: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0x665ac18e),
                Color(0x995ac18e),
                Color(0xcc5ac18e),
                Color(0xff5ac18e),
              ])),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
            child: Column(children: [
              Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),

              //EmailField
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'E-mail',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: (MediaQuery.of(context).size.width -
                            MediaQuery.of(context).padding.left) *
                        0.95,
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top) *
                        0.08,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 7,
                              offset: Offset(0, 2))
                        ]),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12),
                          prefixIcon: Icon(Icons.mail_outline),
                          labelText: "Email",
                        ),
                        validator: validateEmail,
                        onSaved: (value) {
                          setState(() {
                            email = value;
                          });
                        }),
                  ),
                ],
              ),

//Passwwordfiled
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                      width: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).padding.left) *
                          0.9,
                      height: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top) *
                          0.08,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 7,
                                offset: Offset(0, 2))
                          ]),
                      child: TextFormField(
                          key: _passKey,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Password';
                            }
                            if (value.length < 8) {
                              return 'Password should be more than 8 characters';
                            }
                          })),
                ],
              ),

//LoginButton

              SizedBox(height: 25),
              Container(
                width: (MediaQuery.of(context).size.width -
                        MediaQuery.of(context).padding.left) *
                    0.6,
                child: RaisedButton(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    },
                    color: Colors.white,
                    child: Text('LOGIN',
                        style: TextStyle(
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: Color(0xff5ac18e)))),
              ),

              SizedBox(height: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                      child: Row(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Don\'t have an account?',
                              style: TextStyle(
                                  fontSize: 17,
                                  // fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: Colors.white)),
                          TextSpan(
                              text: '  Sign up Here',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: Colors.white))
                        ]),
                      ),
                    ],
                  )),
                ],
              )
            ]),
          ),
        ),
      ]),
    ));
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
