// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:js/js.dart';
import 'package:func/func.dart';

@JS()
@anonymous
class DartInterface {
  external set greeting(Func1<String,String> value);
  external Func1<String,String> get greeting;
  external set createPerson(Func1<JsPerson,String> value);
  external Func1<JsPerson,String> get createPerson;

  external factory DartInterface();
}

@JS()
external setupDartInterface(DartInterface interface);


void main() {
  querySelector('#output').text = 'Your Dart app is running.';
  DartInterface interface = new DartInterface();
  interface.greeting = allowInterop(greeting);
  interface.createPerson = allowInterop(createPerson);
  setupDartInterface(interface);
}

String greeting(String user) => "Hello $user (from the dart side of universe)";


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
  return "Hello, I'm ${me.firstName}";
}