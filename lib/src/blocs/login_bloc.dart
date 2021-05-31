

import 'dart:async';

import 'package:login/src/validators/validation.dart';

class LoginBloc {
  //Stream
  //gom 2 phan: sink (du lieu vao) ||  stream (du lieu ra)
  //khai bao controller
  StreamController _userController = new StreamController();
  StreamController _pwdController = new StreamController();

  //tao ham de get stream cho UI truy xuat
  Stream get userStream => _userController.stream;
  Stream get pwdStream => _pwdController.stream;

  bool isValidInfor(String user, String pwd){
    if(!Validations.isValidUser(user)){
      _userController.sink.addError('Invalid username');
      return false;
    }
    _userController.sink.add('OK');

    if(!Validations.isValidPassword(pwd)){
      _pwdController.sink.addError('Password incorrect!');
      return false;
    }
    _pwdController.sink.add('OK');

    return true;
  }

  //huy Stream khi khong dung toi
  void dispose(){
    _userController.close();
    _pwdController.close();
  }

}