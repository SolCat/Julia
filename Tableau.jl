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
	return([mot for mot in tableau.mots if startswith(mot, prefixe)])
end

# Fonction renvoyant la liste des mots terminant par une chaine de caractères donnée
function chercherMotsSuffixeTab(tableau, suffixe)
	return([mot for mot in tableau.mots if endswith(mot, suffixe)])
end
