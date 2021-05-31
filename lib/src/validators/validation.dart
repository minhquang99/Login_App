
class Validations {
  static bool isValidUser(String user){
    return user != null && user.length > 6 && user.contains('@');

  }

  static bool isValidPassword(String pwd){
    return pwd != null && pwd.length > 6;
  }
}