import 'dart:async';

mixin Validators {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if(email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError("Email inválido");
      }
    }
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if(password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError("Senha muito curta");
      }
    }
  );

  var phoneValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (phone, sink) {
      String patttern = r'(^\s*(\d{2}|\d{0})[-. ]?(\d{5}|\d{4})[-. ]?(\d{4})[-. ]?\s*$)';
      RegExp regExp = new RegExp(patttern);
      if (phone.length == 0) {
        sink.addError("Entre com um úmero");
      }
      else if (!regExp.hasMatch(phone)) {
        sink.addError("Numero inválido");
      } else {
        sink.add(phone);
      } 
    }
  );
}