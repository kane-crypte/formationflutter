void main() {
  int a = 10;
  int b = 5;
  int sum = a + b;
  int sou = a - b;
  int mult = a * b;
  double div = a / b;
  int modulo = a % b;
  print("Somme : $a + $b = $sum");
  print("soustration : $a - $b = $sou");
  print("Multiplication : $a * $b = $mult");
  print("Division : $a / $b = $div");
  print("Modulo: $a % $b = $modulo");

  //les boucles
  int age = 11;
  if (age >= 18) {
    print("vous etes majeur");
  } else {
    print("vous etes Mineur");
  }

  switch (age) {
    case 18:
      print("vous etes majeur");
      break;
    case 17:
      print("vous etes Mineur");
      break;
    default:
      print("vous etes Mineur");
  }
}
