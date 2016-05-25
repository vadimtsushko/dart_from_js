// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:js/js.dart';
import 'package:dart_from_js/js_interface.dart';


void main() {
  querySelector('#output').text = 'Your Dart app is running.';
  DartInterface interface = new DartInterface();
  interface.greeting = allowInterop(greeting);
  interface.createPerson = allowInterop(createPerson);
  setupDartInterface(interface);
  UserPrototype userPrototype = new UserPrototype();
  userPrototype.greeting = allowInteropCaptureThis(UserMethods.greeting);
  userPrototype.initialize = allowInteropCaptureThis(UserMethods.initialize);
  createClass(interface, 'User', userPrototype);
  querySelector('#testUserGreetingFromDart').onClick.listen(greetUsingUserClass);
}

String greeting(String user) => "Hello $user (from the dart side of universe)";

greetUsingUserClass(_) {
  User user = new User('Sofia');
  String greeting = user.greeting();
  querySelector('#output').text = greeting;

}

