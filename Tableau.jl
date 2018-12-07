mutable struct TableauMots
    nbMots::Int64 # nombre total de mots
    nbMotsDistincts::Int64 # nombre de mots différents les uns des autres
    mots::Array{String}
    decompte::Array{Int64}
    function TableauMots()
        return new(0,0,Array{String,1}(),Array{Int64,1}())
    end
end

function segmenterTexte(texte)
    tabMots = TableauMots()
    sep = [' ',',',';','.','-','_','\'','`','\"','/',')','(','{','}','[',']','=','+','@','!','?','%'] 
    flux = open(texte,"r")
    while ! eof(flux)
        ligne = readline(flux)
        spl = split(lowercase(ligne), sep) 
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
function verifierMot(mot, texte)
	tableau = segmenterTexte(texte)
	if in(lowercase(mot), tableau.mots)
	   return true 	
	else
	   return false
	end
end

# Fonction calculant la longeur moyenne des mots du texte
function calculerLongMoyMot(texte)
	tableau = segmenterTexte(texte)
	return floor(Int,sum([length(mot) for mot in tableau.mots])/length(tableau.mots))
end

texteCyrano = "./cyrano.txt"
textePetitPrince = "./le_petit_prince.txt"
texteOeuvres = "./oeuvres.txt"


# Tests : segmentation de textes
# segmenterTexte(texteCyrano) # 36 280 mots dont 5 482 différents
# segmenterTexte(textePetitPrince) # 15 426 mots dont 2 403 différents

# Tests : détection de mot dans un texte
# println(verifierMot("Rostand", texteCyrano)) # true
# println(verifierMot("Cyrano", textePetitPrince)) # false

#Test : calcul de la longueur moyenne d'un mot dans un texte
# println(calculerLongMoyMot(texteCyrano)) # 6
# println(calculerLongMoyMot(textePetitPrince)) # 6
