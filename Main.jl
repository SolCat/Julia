using BenchmarkTools
include("./Arbre.jl")
include("./Tableau.jl")

texteCyrano = "./cyrano.txt" # 36 280 mots dont 5 482 différents
textePetitPrince = "./le_petit_prince.txt" # 15 426 mots dont 2 403 différents

# Segmentation du texte #
cyranotab = segmenterTexteTableau(texteCyrano) # Version Tableau
princetab = segmenterTexteTableau(textePetitPrince)
cyranoarb = segmenterTexteArbre(texteCyrano) # Version Arbre
princearb = segmenterTexteArbre(textePetitPrince)

scrabbleDico = Dict('A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1,
      'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1, 'D' => 2, 'G' => 2, 'B' => 3,
      'C' => 3, 'M' => 3, 'P' => 3, 'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4,
      'Y' => 4, 'K' => 5, 'J' => 8, 'X' => 8, 'Q' => 10, 'Z' => 10)

println("Chargement et segmentation des fichiers")
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
@btime calculerLongMoyMotTab(princetab)

println("   Arbre :")
@btime calculerLongMoyMotArbre(cyranoarb) # Version Arbre
@btime calculerLongMoyMotArbre(princearb)

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
@btime chercherMotsSuffixeArbre(cyranoarb, "acher") # Version Arbre
@btime chercherMotsSuffixeArbre(princearb, "eur")


println("Recherche du mot de score maximal au Scrabble")
println("   Tableau :")
@btime scoreMaxMotTab(cyranotab, scrabbleDico) # Version Tableau
@btime scoreMaxMotTab(princetab, scrabbleDico)

println("   Arbre :")
@btime scoreMaxMotArbre(cyranoarb, scrabbleDico) # Version Arbre
@btime scoreMaxMotArbre(princearb, scrabbleDico)

println("Mots du tableau avec suppression d'un caractère")
println("   Tableau :")
@btime convertirMotTab(cyranotab, 'e')
@btime convertirMotTab(princetab, 'e')

println("   Arbre :")
@btime motsSansLettre(cyranoarb, 'e')
@btime motsSansLettre(princearb, 'e')
