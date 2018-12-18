include("./Arbre.jl")
include("./Tableau.jl")

texteCyrano = "./cyrano.txt" # 36 280 mots dont 5 482 différents
textePetitPrince = "./le_petit_prince.txt" # 15 426 mots dont 2 403 différents

using BenchmarkTools
# Segmentation du texte #
cyranotab = segmenterTexteTableau(texteCyrano) # Version Tableau
princetab = segmenterTexteTableau(textePetitPrince)
cyranoarb = segmenterTexteArbre(texteCyrano) # Version Arbre
princearb = segmenterTexteArbre(textePetitPrince)

println("Chargement des fichiers")
println("   Tableau :")
@btime cyranotab = segmenterTexteTableau(texteCyrano) # Version Tableau
@btime princetab = segmenterTexteTableau(textePetitPrince)

println("   Arbre :")
@btime cyranoarb = segmenterTexteArbre(texteCyrano) # Version Arbre
@btime princearb = segmenterTexteArbre(textePetitPrince)

# Détection de mot dans un texte #
println("Detection existence")
println("   Tableau :")
@btime verifierMotTableau("Jaloux", cyranotab) # Version Tableau
@btime verifierMotTableau("rose", princetab)

println("   Arbre :")
@btime verifierMotArbre("Jaloux", cyranoarb) # Version Arbre
@btime verifierMotArbre("rose", princearb)

# Calcul de la longueur moyenne d'un mot dans un texte
println("Calcul longueur moyenne des mots")
println("   Tableau :")
@btime calculerLongMoyMotTab(cyranotab) # Version Tableau
println("   Arbre :")
@btime calculerLongMoyMotArbre(cyranoarb) # Version Arbre

# Liste des mots commençant par une chaine de caractères donnée
println("Recherche préfixes")
println("   Tableau :")
@btime chercherMotsPrefixeTab(cyranotab, "am") # Version Tableau
@btime chercherMotsPrefixeTab(princetab, "ros")

println("   Arbre :")
@btime chercherMotsPrefixeArbre(cyranoarb, "am") # Version Arbre
@btime chercherMotsPrefixeArbre(princearb, "ros")

# Liste des mots terminant par une chaine de caractères donnée
println("Recherche suffixes")
println("   Tableau :")
@btime chercherMotsSuffixeTab(cyranotab, "acher") # Version Tableau
@btime chercherMotsSuffixeTab(princetab, "eur")

println("   Arbre :")
@btime chercherMotsSuffixeArbre(cyranoarb, "acher") # Version Tableau
@btime chercherMotsSuffixeArbre(princearb, "eur")
