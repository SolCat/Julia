mutable struct TableauMots
    nbMots::Int64 # nombre total de mots
    nbMotsDistincts::Int64 # nombre de mots différents les uns des autres
    mots::Array{String}
    decompte::Array{Int64}
    function TableauMots()
        return new(0,0,Array{String,1}(),Array{Int64,1}())
    end
end

Base.show(io::IO, tab::TableauMots) = print(io, " $(tab.nbMots) words, $(tab.nbMotsDistincts) distincts words")

function segmenterTexteTableau(texte)
    tabMots = TableauMots()
    sep = [' ',',',';','.','-','_','\'','`','\"','/',')','(','{','}','[',']','=','+','@','!','?','%']
    flux = open(texte,"r")
    while ! eof(flux)
        ligne = readline(flux)
        spl = split(uppercase(ligne), sep)
        ajouterMotsTableau(tabMots, spl)
    end
    close(flux)
    return tabMots
end

# Fonction de remplissage du tableau
function ajouterMotsTableau(tableau, ligne)
    for mot in ligne
        if length(mot) > 0
            if !in(mot, tableau.mots)
                push!(tableau.mots, mot)
                tableau.nbMotsDistincts += 1
            end
            tableau.nbMots += 1
        end
    end
end

# Fonction détectant si un mot est présent ou non
function verifierMotTableau(mot, tableau)
	if in(uppercase(mot), tableau.mots)
	   return true
	else
	   return false
	end
end

# Fonction calculant la longeur moyenne des mots du texte
function calculerLongMoyMotTab(tableau)
	return floor(Int,sum([length(mot) for mot in tableau.mots])/length(tableau.mots))
end

# Fonction renvoyant la liste des mots commençant par une chaine de caractères donnée
function chercherMotsPrefixeTab(tableau, prefixe)
	return([mot for mot in tableau.mots if endswith(mot, uppercase(prefixe))])
end

# Fonction renvoyant la liste des mots terminant par une chaine de caractères donnée
function chercherMotsSuffixeTab(tableau, suffixe)
	return([mot for mot in tableau.mots if endswith(mot, uppercase(suffixe))])
end

# Fonction renvoyant le mot d'un texte de score maximal au Scrabble
function scoreMaxMotTab(tableau, mot)
	maxScore = 0
	scrabbleDico = Dict('A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1,
		  'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1, 'D' => 2, 'G' => 2, 'B' => 3,
		  'C' => 3, 'M' => 3, 'P' => 3, 'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4,
		  'Y' => 4, 'K' => 5, 'J' => 8, 'X' => 8, 'Q' => 10, 'Z' => 10)
	return(sum(get(scrabbleDico, mot, 0) for mot in tableau.mots))
	
end

