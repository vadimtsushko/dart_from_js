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
  external factory DartInterface();
}

@JS()
external setupDartInterface(DartInterface interface);


void main() {
  querySelector('#output').text = 'Your Dart app is running.';
  DartInterface interface = new DartInterface();
  interface.greeting = allowInterop(greeting);
  setupDartInterface(interface);
}

String greeting(String user) => "Hello $user (from the dart side of universe)";

