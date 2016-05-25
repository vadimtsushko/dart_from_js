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

function sayHello(classToUse, strParam) {
    var instance = new classToUse(strParam);
    var greeting = instance.greeting();
    document.getElementById('output').innerHTML = greeting;
}


var __Class = function(methods) {
  var klass = function() {
      console.log('In User initialize');
    this.initialize.apply(this, arguments);
      console.log('After User initialize');
  };

  for (var property in methods) {
    klass.prototype[property] = methods[property];
  }

  if (!klass.prototype.initialize) klass.prototype.initialize = function(){};

  return klass;
};

function createClass(namespace, className, methods)
{
  namespace[className] = new __Class(methods)
}