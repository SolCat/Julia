mutable struct ArbreMots
	terminal::Bool
	nb::Int64
	suite::Dict{Char,ArbreMots}
	function ArbreMots()
	    return new(false,0,Dict{Char,ArbreMots}())
    end
end

function segmenterTexte(texte)
	arbreMots = ArbreMots()
    sep = [' ',',',';','.','-','_','\'','`','\"','/',')','(','{','}','[',']','=','+','@','!','?','%']
    flux = open(texte,"r")
    while ! eof(flux)
        ligne = readline(flux)
        spl = split(uppercase(ligne), sep)
		for mot in spl
			println(mot)
			if length(mot) > 0
        		ajouterMotArbre(arbreMots, mot)
			end
		end
    end
    close(flux)
    return arbreMots
end

function ajouterMotArbre(arbre, mot)
	if mot == ""
		arbre.terminal = true
	else
		first = mot[1]
		if(!(first in keys(mot)))
			arbre.suite[first] = ArbreMots()
		end
		println(first)
		ajouterMotArbre(arbre.suite[first], mot[nextind(mot, 1):end])
		arbre.terminal = false
		arbre.nb += 1
	end
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

cyrano = segmenterTexte(texteCyrano) # 36 280 mots dont 5 482 différents
println(texteCyrano, cyrano)
prince = segmenterTexte(textePetitPrince) # 15 426 mots dont 2 403 différents
println(textePetitPrince, prince)
