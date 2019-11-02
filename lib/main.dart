import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/register.dart';
import 'MainPage.dart';

void main()=>runApp(MaterialApp(
  home:LoginForm() ,
));


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
 final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Login"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Form(
        key: _formKey,
          child: ListView(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('images/caxton.jpg'),
                    radius: 40,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"eg. John",
                  labelText: "Enter your user name",
                  labelStyle: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'IndieFlower'
                  ),
                  icon: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.pinkAccent,
                  )
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                validator: (value){
                  if (value.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;

                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText:"Enter Password",
                  labelStyle: TextStyle(fontFamily: "IndieFlower",
                  color: Colors.pinkAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
                  icon: Icon(Icons.lock,
                  color: Colors.pinkAccent,),
                  hintText:"eg. tfytfrt",
                ),
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                validator: (value){
                  if (value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),

              Divider(height: 100,
              color: Colors.pink[100],),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)
                      ),
                      elevation: 10,
                      color: Colors.pinkAccent,
                        onPressed: (){
                          if (_formKey.currentState.validate()) {
                            navigateToMainpage(context);
                            /*Scaffold.of(context)
                                .showSnackBar(SnackBar(content: Text("Processing data"),));*/

                          }
                        },
                        icon:Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Login",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'IndieFlower'
                          ),
                        )),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton.icon(
                      color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          side: BorderSide(color: Colors.pinkAccent)
                        ),
                        elevation: 0,
                        onPressed: (){
                          navigateToRegister(context);
                        },
                        icon:Icon(
                          Icons.note_add,
                          color: Colors.pinkAccent,
                        ),
                        label: Text(
                          "Register",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.pinkAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IndieFlower'
                          ),
                        )),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

Future navigateToMainpage(context) async {
  Navigator.push(context,MaterialPageRoute(builder: (context)=>MainHome()));
}

Future navigateToRegister(context) async{
  Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterPage()));
}
