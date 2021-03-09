import 'package:flutter/material.dart';
//import 'package:quiver/strings.dart';
import '../screens/home_screen.dart';

class SignUpForm extends StatefulWidget {
  static const routesignup = '/sign-up';
  @override
  SignUpFormState createState() => new SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  String name = '';
  String email = '';
  String password = '';

  bool _termsChecked = true;

  void onPressedSubmit() {
    if (_formKey.currentState.validate() && _termsChecked) {
      _formKey.currentState.save();
      Navigator.of(context).pushNamed(HomeScreen.routehome);
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
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: new ListView(
          children: getFormWidget(), //list view of all the widgets
        ),
      ),
    );
  }
  //Widget choicebutton

  List<Widget> getFormWidget() {
    //creating list of widgets
    List<Widget> formWidget = new List();

    formWidget.add(Padding(
        padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
        child: new TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                labelText: 'Enter Your Name',
                hintText: "username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
            validator: (v) {
              if (v.isEmpty) {
                return ' you have to enter a username';
              }
            },
            onSaved: (value) {
              setState(() {
                name = value;
              });
            })));

    formWidget.add(Padding(
        padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
        child: new TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                labelText: 'Enter Email',
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
            validator: validateEmail,
            onSaved: (value) {
              setState(() {
                email = value;
              });
            })));

    formWidget.add(Padding(
        padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
        child: new TextFormField(
            key: _passKey,
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                labelText: 'Enter Password',
                hintText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
            // ignore: missing_return
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Password';
              }
              if (value.length < 8) {
                return 'Password should be more than 8 characters';
              }
            })));

    formWidget.add(Padding(
      padding: EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
      child: new TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              // padding: EdgeInsets.only(top: 25.0),
              hintText: 'Confirm Password',
              labelText: 'Enter Confirm Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
          // ignore: missing_return
          validator: (confirmPassword) {
            if (confirmPassword.isEmpty) return 'Enter confirm password';
            var password = _passKey.currentState.value;
            if (confirmPassword != password) {
              return 'Confirm Password invalid';
            }
          },
          onSaved: (value) {
            setState(() {
              password = value;
            });
          }),
    ));

    formWidget.add(CheckboxListTile(
      value: _termsChecked,
      onChanged: (value) {
        setState(() {
          _termsChecked = value;
        });
      },
      subtitle: !_termsChecked
          ? Text(
              'Required',
              style: TextStyle(color: Colors.red, fontSize: 12.0),
            )
          : null,
      title: new Text(
        'I agree to the terms and condition',
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ));

    formWidget.add(new RaisedButton(
        color: Colors.indigo,
        textColor: Colors.white,
        //  minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(5.0, 15.0, 10, 15.0),
        child: new Text(
          'Create Account',
          textAlign: TextAlign.center,
        ),
        onPressed: onPressedSubmit
        //  Navigator.of(context).pushNamed(HomeScreen.routehome)
        ));

    return formWidget;
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
  /* Widget ChoiceButton(context, title, onpress, color,Visibility){
    return Container(
      width:MediaQuery,of,
    )

  }*/

}
