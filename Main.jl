include("./Arbre.jl")
include("./Tableau.jl")

texteCyrano = "./cyrano.txt" # 36 280 mots dont 5 482 différents
textePetitPrince = "./le_petit_prince.txt" # 15 426 mots dont 2 403 différents

# Segmentation du texte #
@time cyranotab = segmenterTexteTableau(texteCyrano) # Version Tableau
@time princetab = segmenterTexteTableau(textePetitPrince)

@time cyranoarb = segmenterTexteArbre(texteCyrano) # Version Arbre
@time princearb = segmenterTexteArbre(textePetitPrince)

# Détection de mot dans un texte #
@time verifierMotTableau("Jaloux", cyranotab) # Version Tableau
@time verifierMotTableau("rose", princetab)

@time verifierMotArbre("Jaloux", cyranoarb) # Version Arbre
@time verifierMotArbre("rose", princearb)

# Calcul de la longueur moyenne d'un mot dans un texte
@time calculerLongMoyMotTab(cyranotab) # Version Tableau
@time calculerLongMoyMotArbre(cyranoarb) # Version Arbre

# Liste des mots commençant par une chaine de caractères donnée
@time chercherMotsPrefixeTab(cyranotab, "am") # Version Tableau
@time chercherMotsPrefixeTab(princetab, "ros")
@time chercherMotsPrefixeArbre(cyranoarb, "am") # Version Arbre
@time chercherMotsPrefixeArbre(princearb, "ros")

# Liste des mots terminant par une chaine de caractères donnée
@time chercherMotsSuffixeTab(cyranotab, "acher") # Version Tableau
@time chercherMotsSuffixeTab(princetab, "eur")
