mutable struct ArbreMots
	terminal::Bool
	nb::Int64
	suite::Dict{Char,ArbreMots}
	function ArbreMots()
	    return new(false,0,Dict{Char,ArbreMots}())
    end
end

Base.show(io::IO, a::ArbreMots) = print(io, " $(a.nb) words, $(calculerNbMotsDisctinctsArbre(a)) distincts words")

function segmenterTexteArbre(texte)
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
function verifierMotArbre(mot, arbre)
	if mot == ""
		return arbre.terminal
	else
		first = uppercase(mot[1])
		if(!(first in keys(arbre.suite)))
			return false
		end
		return verifierMotArbre(mot[nextind(mot, 1):end], arbre.suite[first])
	end
end

# Fonction calculant la longeur moyenne des mots du texte
function calculerLongMoyMotArbre(arbre)
	return floor(Int,(arbre.nb/calculerNbMotsDisctinctsArbre(arbre)))
end

# Fonction calculant le nombre de mots distincts du texte
function calculerNbMotsDisctinctsArbre(arbre)
	count = arbre.terminal
	for (k,fils) in arbre.suite
		count += calculerNbMotsDisctinctsArbre(fils)
	end
	return count
end

texteCyrano = "./cyrano.txt"
textePetitPrince = "./le_petit_prince.txt"
texteOeuvres = "./oeuvres.txt"
