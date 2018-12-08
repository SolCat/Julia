mutable struct ArbreMots
	terminal::Bool
	nb::Int64
	suite::Dict{Char,ArbreMots}
	function ArbreMots()
	    return new(false,0,Dict{Char,ArbreMots}())
    end
end

function segmenterTexte(texte)
    arbre = ArbreMots()
end

function ajouterMotsArbre(arbre, ligne)
end

# Fonction détectant si un mot est présent ou non
function verifierMot(mot, texte)
end

# Fonction calculant la longeur moyenne des mots du texte
function calculerLongMoyMot(texte)
end

texteCyrano = "./cyrano.txt"
textePetitPrince = "./le_petit_prince.txt"
texteOeuvres = "./oeuvres.txt"
