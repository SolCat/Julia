import Unicode

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

function chercherMots(arbre)
	mots = []
	if(arbre.terminal)
		push!(mots, "")
	end
	for (k,fils) in arbre.suite
		append!(mots, [string(k)*mot for mot in chercherMots(fils)])
	end
	return mots
end

function chercherMotsPrefixeArbre(arbre, prefixe)
	if(prefixe=="")
		mots = []
		if(arbre.terminal)
			push!(mots, "")
		end
		for (k,fils) in arbre.suite
			append!(mots, [string(k)*mot for mot in chercherMotsPrefixeArbre(fils, "")])
		end
		return mots
	else
		first = uppercase(prefixe[1])
		if(!(first in keys(arbre.suite)))
			return []
		end
		return [string(first)*mot for mot in chercherMotsPrefixeArbre(arbre.suite[first], prefixe[nextind(prefixe, 1):end])]
	end
end

function chercherMotsSuffixeArbre(arbre, suffixe)

end


# Fonction renvoyant le mot d'un texte de score maximal au Scrabble
function scoreMaxMotArbre(arbre, dico)
	(scoremax, motmax) = (0, "")
	if(arbre.terminal)
		return (scoremax, motmax)
	end
	for (k,fils) in arbre.suite
		if(all(isletter, string(k)))
			score, mot = scoreMaxMotArbre(fils, dico)
			println(k)
			kscore = dico[Unicode.normalize(string(k), stripmark=true)[1]]
			if((score+kscore)>scoremax)
				(scoremax, motmax) = (score+kscore, k*mot)
			end
		end
	end
	return (scoremax, motmax)
end
