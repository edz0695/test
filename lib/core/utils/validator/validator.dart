
import 'package:payapp/core/utils/validator/validationstandards.dart';
class FormValidator{
  //validate Email
  static String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter email";
    }
    else if (ValidationStandards.isEmail(text)) {
      return "Please enter valid email";
    }
    else{
      return null;
    }
  }

  //validate Password
  static String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Field Can't be Empty.";
    }
    if (ValidationStandards.isPassword(text)) {
      //return "Minimum 1 Upper case. Minimum 1 lowercase. Minimum 1 Numeric Number. Minimum 1 Special Character. Minimum 8 Characters";
    }

    return null;
  }

  // validate Mobile
  static String? validateMobile(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter Phone";
    }
    else if (text.length<10) {
      return "Please enter valid Mobile Number";
    }else{
     return null;
    }


  }

  // validate Name
  static String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return "Field Can't be Empty.";
    }
    else if (text.length<3) {
      return "*";
    }else{
      return null;
      // validPhone = true;
    }
  }
}