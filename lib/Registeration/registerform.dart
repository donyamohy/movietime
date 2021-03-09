//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movietime/Registeration/log_in.dart';
import 'package:movietime/services/auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static const routeregister = '/register';
  @override
  SignUpState createState() => SignUpState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

class SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  String _email;
  String _password;

  bool validateandsave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void onPressedSubmit() async {
    if (validateandsave()) {
      try {
        context.read<AuthenticationService>().signup(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        //  name: nameController.text.trim(),
        //number: phoneController.text.trim());
        print('signed up');
      } catch (e) {
        print('Error:$e');
      }
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
            child: Form(
              key: _formKey,
              child: Column(children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),

                //Namefiled
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UserName',
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
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12),
                          prefixIcon:
                              Icon(Icons.supervised_user_circle_outlined),
                          // labelText: "Email",
                        ),
                        validator: (value) =>
                            value.isEmpty ? 'please enter a valid name' : null,
                        onSaved: (value) => _email = value,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone number',
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
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12),
                          prefixIcon: Icon(Icons.phone_android_outlined),
                          // labelText: "Email",
                        ),
                        validator: (value) => value.isEmpty
                            ? 'please enter a valid number'
                            : null,
                        onSaved: (value) => _email = value,
                      ),
                    ),
                  ],
                ),
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
                          // labelText: "Email",
                        ),
                        validator: (value) => value.isEmpty
                            ? 'please enter a valid e-mail'
                            : null,
                        onSaved: (value) => _email = value,
                      ),
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
                            //  labelText: "Password",
                          ),
                          validator: (value) => value.isEmpty
                              ? 'please enter a valid password'
                              : null,
                          onSaved: (value) => _password = value,
                        ))
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
                      onPressed: onPressedSubmit,
                      /*  */
                      //   onPressedSubmit();

                      color: Colors.white,
                      child: Text('SIGNUP',
                          style: TextStyle(
                              fontSize: 18,
                              //fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Color(0xff5ac18e)))),
                ),
                SizedBox(height: 35),
                Container(
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left) *
                      0.9,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account?',
                                    style: TextStyle(
                                        fontSize: 17,
                                        // fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        color: Colors.white)),
                                FlatButton(
                                  child: Text(
                                    'Sign in ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    // Navigator.of(context)
                                    //    .pushNamed(SignIn.routesigin);
                                  },
                                )
                              ]),
                        )
                      ]),
                ),
              ]),
            ),
          )),
    ])));
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
