import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_2/home_page.dart';

import 'btn_widget.dart';
import 'herder_container.dart';
import 'login_page.dart';


class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  TextEditingController Email= new TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate(context){
    if(formkey.currentState.validate()){

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
  TextEditingController Fullname= new TextEditingController();
  TextEditingController Phonenumber= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
        key: formkey,

            child: Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: <Widget>[
                  HeaderContainer("Register"),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          TextFormField(
                              controller: Fullname,
                              validator: validatepass,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                labelText: "Fullname",
                              )
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                              controller: Phonenumber,
                              validator: validatepass,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.call),
                                border: OutlineInputBorder(),
                                labelText: "Phonenumber",
                              )
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                              controller: Email,
                              validator: validatepass,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                                labelText: "Email",
                              )
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                              controller: password,
                              validator: validatepass,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.remove_red_eye),
                                border: OutlineInputBorder(),
                                labelText: "password",
                              )
                          ),
                          SizedBox(height: 10,),
                          Expanded(
                            child: Center(
                              child: ButtonWidget(
                                btnText: "REGISTER",
                                onClick: (){
                                  validate(context);
                                },
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Already a member ? ",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                text: "Login",
                                style: TextStyle(color: Colors.purple),
                                recognizer: TapGestureRecognizer()..onTap =(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
                                },
                              ),

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


  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
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