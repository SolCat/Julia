mutable struct ArbreMots
	terminal::Bool
	nb::Int64
	suite::Dict{Char,ArbreMots}
	function ArbreMots()
	    return new(false,0,Dict{Char,ArbreMots}())
    end
end

Base.show(io::IO, a::ArbreMots) = print(io, " $(a.nb) words, $(calculerNbMotsDisctincts(a)) distincts words")

function segmenterTexte(texte)
	arbreMots = ArbreMots()
    sep = [' ',',',';','.','-','_','\'','`','\"','/',')','(','{','}','[',']','=','+','@','!','?','%']
    flux = open(texte,"r")
    while ! eof(flux)
        ligne = readline(flux)
        spl = split(uppercase(ligne), sep)
		for mot in spl
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
		if(!(first in keys(arbre.suite)))
			arbre.suite[first] = ArbreMots()
		end
		ajouterMotArbre(arbre.suite[first], mot[nextind(mot, 1):end])
		arbre.nb += 1
	end
end

# Fonction détectant si un mot est présent ou non
function verifierMot(mot, arbre)
	if mot == ""
		return arbre.terminal
	else
		first = uppercase(mot[1])
		if(!(first in keys(arbre.suite)))
			return false
		end
		return verifierMot(mot[nextind(mot, 1):end], arbre.suite[first])
	end
end

# Fonction calculant la longeur moyenne des mots du texte
function calculerLongMoyMot(arbre)
	return floor(Int,(arbre.nb/calculerNbMotsDisctincts(arbre)))
end

# Fonction calculant le nombre de mots distincts du texte
function calculerNbMotsDisctincts(arbre)
	count = arbre.terminal
	for (k,fils) in arbre.suite
		count += calculerNbMotsDisctincts(fils)
	end
	return count
end

texteCyrano = "./cyrano.txt"
textePetitPrince = "./le_petit_prince.txt"
texteOeuvres = "./oeuvres.txt"

# Tests : segmentation de textes
cyrano = segmenterTexte(texteCyrano) # 36 280 mots dont 5 482 différents
println(texteCyrano, cyrano)
prince = segmenterTexte(textePetitPrince) # 15 426 mots dont 2 403 différents
println(textePetitPrince, prince)

# Tests : détection de mot dans un texte
println(verifierMot("Rostand", cyrano)) # true
println(verifierMot("Cyrano", prince)) # false

#Test : calcul de la longueur moyenne d'un mot dans un texte
println(calculerLongMoyMot(cyrano)) # 6
println(calculerLongMoyMot(prince)) # 6
