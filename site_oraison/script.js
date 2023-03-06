// Bloc déroulable de la bibliographie
var coll = document.getElementsByClassName("biblio");
var i;

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

window.onscroll = function () {
scrollFunction();
};

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

mybutton.addEventListener("click", backToTop);

function backToTop() {
document.body.scrollTop = 0;
document.documentElement.scrollTop = 0;
}
