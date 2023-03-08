// Bloc déroulable de la bibliographie
// Déclaration des variables
var coll = document.getElementsByClassName("biblio");
var i;

// Animation en cas de click sur le bloc
for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var contenu_biblio = this.nextElementSibling;
    if (contenu_biblio.style.display === "block") {
      contenu_biblio.style.display = "none";
    } else {
      contenu_biblio.style.display = "block";
    }
  });
}

//Bouton de retour en haut de la page
let mybutton = document.getElementById("bouton_retour");

// Quand l'utilisateur descend sur la page, activation de la fonction
window.onscroll = function () {
scrollFunction();
};

// Fonction pour l'affichage du bouton quand l'utilisateur descend à plus de 20 px du haut de la page
function scrollFunction() {
if (
document.body.scrollTop > 20 ||
document.documentElement.scrollTop > 20
) {
mybutton.style.display = "block";
} else {
mybutton.style.display = "none";
}
}

// Quand l'utilisateur clique sur le bouton, retour en haut
mybutton.addEventListener("click", backToTop);

function backToTop() {
document.body.scrollTop = 0;
document.documentElement.scrollTop = 0;
}
