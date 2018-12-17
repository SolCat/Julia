include("./Arbre.jl")
include("./Tableau.jl")

texteCyrano = "./cyrano.txt" # 36 280 mots dont 5 482 différents
textePetitPrince = "./le_petit_prince.txt" # 15 426 mots dont 2 403 différents

# Segmentation du texte #
# Version Tableau
@time cyranotab = segmenterTexteTableau(texteCyrano)
@time princetab = segmenterTexteTableau(textePetitPrince)
# Version Arbre
@time cyranoarb = segmenterTexteArbre(texteCyrano)
@time princearb = segmenterTexteArbre(textePetitPrince)

# Détection de mot dans un texte #
# Version Tableau
@time verifierMotTableau("Jaloux", cyranotab)
@time verifierMotTableau("rose", princetab)
# Version Arbre
@time verifierMotArbre("Jaloux", cyranoarb)
@time verifierMotArbre("rose", princearb)

# Calcul de la longueur moyenne d'un mot dans un texte
@time calculerLongMoyMotTab(cyranotab)
@time calculerLongMoyMotArbre(cyranoarb)
