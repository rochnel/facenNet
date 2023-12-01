

bool checkisEmailValid(String email) {
  return _emailRegExp.hasMatch(email);
}

bool checkisFieldIsnotEmpty(String field) {
  return field.length > 0 ? true : false ;
}

String? checkisFieldIsnotEmptyS(String field) {
  return field.length > 0 ? "" : "Please ensure the Field is not empty" ;
}

String? checkisPhoneValidS(bool valid) {
  return valid ? "" : 'Please ensure the phone number entered is valid' ;
}

String? checkisEmailValidS(String field) {
  return _emailRegExp.hasMatch(field) ?  "" : "Please enter valid email" ;
}

String? checkisPasswordValidS(String field) {
  return field.length > 4 ? "" : "Password must be at least 4 characters and contain at least one letter and number" ;
}


bool checkisPasswordValid(String password) {
  return _passwordRegExp.hasMatch(password);
}

final RegExp _emailRegExp = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
final RegExp _passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',);
