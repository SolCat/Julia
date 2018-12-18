import Unicode

mutable struct TableauMots
    nbMots::Int64 # nombre total de mots
    nbMotsDistincts::Int64 # nombre de mots différents les uns des autres
    mots::Array{String}
    decompte::Array{Int64}
    function TableauMots()
        return new(0,0,Array{String,1}(),Array{Int64,1}())
    end
end

#Base.show(io::IO, tab::TableauMots) = print(io, " $(tab.nbMots) words, $(tab.nbMotsDistincts) distincts words")

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
		push!(tableau.decompte, 1)
	    else
		index = findfirst(x -> x == mot, tableau.mots)
		tableau.decompte[index] += 1
            end
            tableau.nbMots += 1
        end
    end
end

# Fonction détectant si un mot est présent ou non
function verifierMotTableau(mot, tableau)
	return in(uppercase(mot), tableau.mots)
end

# Fonction calculant la longeur moyenne des mots du texte
function calculerLongMoyMotTab(tableau)
	return round(100*(sum([length(mot)*tableau.decompte[i] for (i, mot) in enumerate(tableau.mots)]))/tableau.nbMots)/100
end

# Fonction renvoyant la liste des mots commençant par une chaine de caractères donnée
function chercherMotsPrefixeTab(tableau, prefixe)
	return([mot for mot in tableau.mots if startswith(mot, uppercase(prefixe))])
end

# Fonction renvoyant la liste des mots terminant par une chaine de caractères donnée
function chercherMotsSuffixeTab(tableau, suffixe)
	return([mot for mot in tableau.mots if endswith(mot, uppercase(suffixe))])
end

### Fonctions supplémentaires ###

# Fonction renvoyant un nouveau tableau de mots privés d'un caractère donné
function convertirMotTab(tableau, caractere1) 
	return [if occursin(uppercase(caractere1), mot) replace(mot, uppercase(caractere1) => "") else mot end for mot in tableau.mots]
end

# Fonction renvoyant le mot d'un texte de score maximal au Scrabble
function scoreMaxMotTab(tableau, scrabbleDico)
	scoreMot = findmax([(sum(get(scrabbleDico, c, 0) for c in uppercase(Unicode.normalize(mot, stripmark=true)))) for mot in tableau.mots])
	return (tableau.mots[scoreMot[2]], scoreMot[1])	
end
