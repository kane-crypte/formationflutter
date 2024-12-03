void main() {
  // ecrire une fonction qui prend un nombre en parametres et retourne s'il est pair ou impaire

  estPairOuImpair(5);
  estPairOuImpair(6);
  estPairOuImpair(27644);
}

bool estPair(int n) {
  return n % 2 == 0;
}

bool estImpair(int n) {
  return !estPair(n);
}

void estPairOuImpair(int n) {
  if (estPair(n)) {
    print("Le nombre $n est pair");
  } else {
    print("Le nombre $n est impair");
  }
}
