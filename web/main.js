/**
 * Created by vts on 23.04.2016.
 */

var dartInterface;
function setupDartInterface(_dartInterace) {
  dartInterface = _dartInterace;
  console.log('setupDartInterface', _dartInterace);

}

function helloFromJs(user) {
  var greeting = dartInterface.greeting(user);
  document.getElementById('output').innerHTML = greeting;
}

