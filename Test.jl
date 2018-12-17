include("./Arbre.jl")
include("./Tableau.jl")

texteCyrano = "./cyrano.txt" # 36 280 mots dont 5 482 différents
textePetitPrince = "./le_petit_prince.txt" # 15 426 mots dont 2 403 différents

# Segmentation du texte #
@time cyranotab = segmenterTexteTableau(texteCyrano) # Version Tableau
@time princetab = segmenterTexteTableau(textePetitPrince)

@time cyranoarb = segmenterTexteArbre(texteCyrano) # Version Arbre
@time princearb = segmenterTexteArbre(textePetitPrince)

# Liste des mots commençant par une chaine de caractères donnée
println(chercherMotsPrefixeTab(cyranotab, "am")) # Version Tableau
println(chercherMotsPrefixeTab(princetab, "ros"))
println(chercherMotsPrefixeArbre(cyranoarb, "am")) # Version Arbre
println(chercherMotsPrefixeArbre(princearb, "ros"))

# Liste des mots terminant par une chaine de caractères donnée
chercherMotsSuffixeTab(cyranotab, "acher") # Version Tableau
chercherMotsSuffixeTab(princetab, "eur")