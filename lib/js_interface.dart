@JS()
library JsInterface;

import 'dart:html';
import 'package:js/js.dart';
import 'package:func/func.dart';

@JS()
@anonymous
class DartInterface {
  external set greeting(Func1<String,String> value);
  external Func1<String,String> get greeting;
  external set createPerson(Func1<String,JsPerson> value);
  external Func1<String,JsPerson> get createPerson;

  external factory DartInterface();
}

@JS()
external setupDartInterface(DartInterface interface);

@JS()
@anonymous
class JsPerson {
  external set firstName(String value);
  external String get firstName;
  external set greeting(Func0<String> value);
  external Func0<String> get greeting;
  external factory JsPerson();
}

@JS('Person')
JsPerson createPerson(String firstName) {
  JsPerson result = new JsPerson();
  result.firstName = firstName;
  result.greeting = allowInteropCaptureThis(personGreeting);
  return result;
}

String personGreeting(JsPerson me) {
  return "Hello, I'm ${me.firstName} from Person class";
}



@JS()
@anonymous
class UserData {
  external set name(String value);
  external String get name;
  external factory UserData();
}


@JS()
@anonymous
class UserPrototype {
  external set greeting(Func0<String> value);
  external Func0<String> get greeting;
  external set initialize(VoidFunc1<String> value);
  external VoidFunc1<String> get initialize;
  external factory UserPrototype();
}

class UserMethods {
  static void initialize(UserData me, String name) {
    me.name = name;
  }
  static String greeting(UserData me) {
    return "Hello, I'm ${me.name} from User class";
  }
}

@JS()
external createClass(nameSpace, String className, var ptototype);


@JS('dartInterface.User')
class User {
  external String greeting();
  external factory User(String name);
}
