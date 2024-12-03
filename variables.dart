import 'dart:async';

void main(List<String> args) {
  terrainDeJeuVariables();
  variableNonTypees();
  interpolationDeType();
}

void terrainDeJeuVariables() {
  typesDeBase();
}

void typesDeBase() {
  int quatre = 4;
  double pi = 3.14;
  num unNombre = 1.42e4;
  bool oui = true;
  bool non = false;
  int? nothing; //variable non initialisee, valeur par defaut
  print(quatre);
  print(pi);
  print(unNombre);
  print(oui);
  print(non);
  print("$nothing \n");
}

void variableNonTypees() {
  dynamic cameleon = "Yahoo!!";
  print(cameleon.runtimeType);

  cameleon = 3.14;
  print(cameleon.runtimeType);

  cameleon = [1, 2, 3];
  print(cameleon.runtimeType);
  print("\n");
}

void interpolationDeType() {
  var anInteger = 15;
  var aDouble = 27.6;
  var aBoolean = false;

  print(anInteger.runtimeType);
  print(anInteger);

  print(aDouble.runtimeType);
  print(aDouble);

  print(aBoolean.runtimeType);
  print(aBoolean);
}
