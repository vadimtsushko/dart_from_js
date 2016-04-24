/**
 * Created by vts on 23.04.2016.
 */

var dartInterface;
var Person;
function setupDartInterface(_dartInterace) {
  dartInterface = _dartInterace;
  Person = _dartInterace.createPerson;
}

function helloFromJs(user) {
  var greeting = dartInterface.greeting(user);
  document.getElementById('output').innerHTML = greeting;
}

function personClassHello(user) {
  var person = new Person(user);
  var greeting = person.greeting();
  document.getElementById('output').innerHTML = greeting;
}

