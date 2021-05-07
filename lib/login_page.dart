import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_2/home_page.dart';
import 'package:login_2/regi_page.dart';

import 'btn_widget.dart';
import 'herder_container.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;

  TextEditingController Email= new TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate(context){
    if(formkey.currentState.validate()){
      Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));

      print("Validated");
    }else{
      print("Not validate");
    }
  }
  String validatepass(value){
    if(value.isEmpty){
      return "Validate";
    }else{
      return null;
    }
  }
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
      child: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    TextFormField(
                     controller: Email,
                     validator: (String value){
                       if(value.isEmpty)
                         {
                           return "Please enter email";
                         }
                       if(!RegExp("^[a-zA-Z0-9+-.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                         {
                           return "Please enter valid email";
                         }
                       return null;
                     },
                        onSaved: (String email){
                       _email=email;
                    },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                    labelText: "Email",
                )
                 ),
                    SizedBox(height: 20,),
                    TextFormField(
                    controller: password,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.remove_red_eye),
    labelText: "password",),
                      validator: validatepass,
    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          onClick: () {
                            validate(context);
                          },
                          btnText: "LOGIN",
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Register",
                            style: TextStyle(color: Colors.purple),
                          recognizer: TapGestureRecognizer()..onTap =(){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => RegPage()));
                          },),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon,validator}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}