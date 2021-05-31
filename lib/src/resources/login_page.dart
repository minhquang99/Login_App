import 'package:flutter/material.dart';
import 'package:login/src/blocs/login_bloc.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {

  LoginBloc bloc = new LoginBloc();

  bool _onShow = false;
  //controller cho textfield
  TextEditingController _userController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30, 120, 30, 0),
        //color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start, //ben trai Column
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Image.asset('assets/login.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Text(
                'Hello\nWelcome Back',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: Colors.black),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: StreamBuilder(
                stream: bloc.userStream,
                builder: (context, snapshot) => TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _userController,
                  decoration: InputDecoration(
                      labelText: 'USERNAME',
                      errorText: snapshot.hasError ? snapshot.error.toString() : null,
                      labelStyle: TextStyle(fontSize: 15, color: Colors.black)
                ),
              ),)
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd, //dua SHOW xuong cuoi
                children: <Widget> [
                  StreamBuilder(
                    stream: bloc.pwdStream,
                    builder: (context, snapshot) => TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      controller: _pwdController,
                      obscureText: !_onShow,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                          labelStyle: TextStyle(fontSize: 15, color: Colors.black)
                    ),
                  ),),
                  GestureDetector(
                    onTap: onShowPass,
                    child: Text(
                      _onShow ? 'HIDE' : 'SHOW',
                      style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox( //vi RaisedButton ko xet width, height dc nen nho SizedBox
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: onClickSignIn,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),

                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Text(
                    'NEW USER? SIGN UP!',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    'FORGOT PASSWORD',
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onClickSignIn(){
    if(bloc.isValidInfor(_userController.text, _pwdController.text)){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void onShowPass(){
    setState(() {
      _onShow = !_onShow;
    });
  }
}