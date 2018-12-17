include("./Arbre.jl")
include("./Tableau.jl")

texteCyrano = "./cyrano.txt" # 36 280 mots dont 5 482 différents
textePetitPrince = "./le_petit_prince.txt" # 15 426 mots dont 2 403 différents

# Segmentation du texte #
# Version Tableau
@time segmenterTexteTableau(texteCyrano)
@time segmenterTexteTableau(textePetitPrince)
# Version Arbre
@time segmenterTexteArbre(texteCyrano)
@time segmenterTexteArbre(textePetitPrince)

# Détection de mot dans un texte #
# Version Tableau
@time verifierMotTableau("Jaloux", segmenterTexteTableau(texteCyrano))
@time verifierMotTableau("rose", segmenterTexteTableau(textePetitPrince))
# Version Arbre

# Calcul de la longueur moyenne d'un mot dans un texte
@time calculerLongMoyMotTab(segmenterTexteTableau(texteCyrano))
