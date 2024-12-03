void main() {
  String fistname = "ALassane";

  String lastname = "kane";

  String fonction = "Etudiant";

  String Niveau = "Licence 3";

  String specialiter = "Informatique";

  print(
      "Bonjour je me presente \n Prenom : $fistname \n Nom : $lastname \n Fonction : $fonction \n Niveau : $Niveau \n Specialiter :$specialiter");

  //les maniere de nommer les variable

  // snake_case  : les mots sont separer par les soulignement (_)
  var nombre_de_menbres = 34;
  if (nombre_de_menbres > 0) {
    print("le nombre est positif");
  }
  // camelCase : le nom commence par minuscule ensuit la premier lettre de chaque mot qui suit en majuscule
  var nombreDeMembres = -34;
  if (nombreDeMembres < 0) print("le nombre est negatif");
  //pascal Case est similaire au Camel case mais le premier lettre du premier et du deuxieme sont en majuscule
  var NombreDeMembres = 0;
  if (NombreDeMembres == 0) print("le nombre est null");
}
