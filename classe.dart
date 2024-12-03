//ecrire une classe etudiant avec les proprietes suivantes : nom , prenom , age , adresse , telephone

class Etudiant {
  String nom;
  String prenom;
  int age;
  String adresse;
  String telephone;

  Etudiant(this.nom, this.prenom, this.age, this.adresse, this.telephone);
  void afficher() {
    print(
        "Nom : $nom \n Prenom : $prenom \n Age : $age \n Adresse : $adresse \n Telephone : $telephone");
  }

  //ecrire une fonction qui affiche la ou l'etudiant habite
  void habiter() {
    print(" J'habite a $adresse");
  }
}

//cree 4 etudiants et les affiches avec la fonction afficher

void main() {
  Etudiant etudiant1 = Etudiant("ALassane", "Kane", 20, "Bamako", "123456789");
  etudiant1.afficher();
  etudiant1.habiter();
}
