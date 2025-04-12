

class ValidationStandards {
  // Basic Email Standard
  static bool isEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{1,}))$';
    RegExp regex =  RegExp(pattern as String);
    return (!regex.hasMatch(email));
  }

  //Basic Password Standard
  static bool isPassword(String password){
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
    return (!regex.hasMatch(password));
  }

  //Basic Name Standard
  // static bool isName(String name){
  //   RegExp regex = RegExp(r"A-Za-z0-9_");
  //   return (!regex.hasMatch(name));
  // }
}