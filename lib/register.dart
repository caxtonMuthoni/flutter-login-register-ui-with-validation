import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  home: RegisterPage(),
));

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey2 = GlobalKey<FormState>();
 var passKey = GlobalKey<FormFieldState>();
  String _password;
  String _confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Registration"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Form(
          key: _formKey2,
          child: ListView(
            children: <Widget>[
              TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return "FirstName is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.verified_user,
                    color: Colors.pinkAccent,
                  ),
                  hintText: " eg. John",
                  labelText: "FirstName",
                  labelStyle: TextStyle(
                    color: Colors.pinkAccent,
                    fontFamily: 'IndieFlower',
                    fontSize: 15,
                  )
                ),
              ),
              TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return "LastName is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.pinkAccent,
                    ),
                    hintText: " eg. Doe",
                    labelText: "LastName",
                    labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: 'IndieFlower',
                      fontSize: 15,
                    )
                ),
              ),
              TextFormField(
                validator: (value){
                  if(value.isEmpty){
                    return "Email is required";
                  }
                  if(EmailValidator.validate(value)==false){
                    return "Invalid email";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.pinkAccent,
                    ),
                    hintText: " johndoe@gmail.com",
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: 'IndieFlower',
                      fontSize: 15,
                    )
                ),
              ),
              TextFormField(
                key: passKey,
                validator: (value){
                  if(value.isEmpty){
                    return "Password is required";
                  }
                  if(value.length<6){
                    return "Password must be atleast 6 characters";
                  }
                  return null;
                },
                onSaved: (value){
                  _password = value;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.verified_user,
                      color: Colors.pinkAccent,
                    ),
                    hintText: " eg. fhdiurki",
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: 'IndieFlower',
                      fontSize: 15,
                    )
                ),
              ),
              TextFormField(
                validator: (value){
                  var password = passKey.currentState.value;
                  if(value.isEmpty){
                    return "You must Confirm Password";
                  }
                  if (value != password) {
                    return "Password mismatch";

                  }

                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.verified_user,
                      color: Colors.pinkAccent,
                    ),
                    hintText: " eg. fhdiurki",
                    labelText: "ConfirmPassword",
                    labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: 'IndieFlower',
                      fontSize: 15,
                    )
                ),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton.icon(
                      color: Colors.white,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        side: BorderSide(
                          color: Colors.pinkAccent,
                        )
                      ),
                        onPressed: (){
                          if(_formKey2.currentState.validate()){
                            //
                          }
                        },
                        icon: Icon(
                          Icons.add_box,
                          color: Colors.pinkAccent,
                        ),
                        label: Text("Register",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontFamily: 'IndieFlower'
                        ),)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
