include("./Arbre.jl")
include("./Tableau.jl")

texteCyrano = "./cyrano.txt" # 36 280 mots dont 5 482 différents
textePetitPrince = "./le_petit_prince.txt" # 15 424 mots dont 2 401 différents

scrabbleDico = Dict('A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1,
      'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1, 'D' => 2, 'G' => 2, 'B' => 3,
      'C' => 3, 'M' => 3, 'P' => 3, 'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4,
      'Y' => 4, 'K' => 5, 'J' => 8, 'X' => 8, 'Q' => 10, 'Z' => 10)

## TESTS ##

## Segmentation du texte
cyranotab = segmenterTexteTableau(texteCyrano) # Version Tableau
princetab = segmenterTexteTableau(textePetitPrince)

cyranoarb = segmenterTexteArbre(texteCyrano) # Version Arbre
princearb = segmenterTexteArbre(textePetitPrince)

println(cyranotab.nbMots)
println(cyranotab.nbMotsDistincts)

println(princetab.nbMots)
println(princetab.nbMotsDistincts)

## Détection d'un mot dans un texte
#println(verifierMotTableau("jaloux", cyranotab)) # Version Tableau
#println(verifierMotTableau("soleil", princetab))

#println(verifierMotArbre("jaloux", cyranoarb)) # Version Arbre
#println(verifierMotArbre("soleil", princearb))

## Calcul de la longueur moyenne des mots d'un texte
println(calculerLongMoyMotTab(cyranotab)) # Version Tableau
println(calculerLongMoyMotTab(princetab))

#println(calculerLongMoyMotArbre(cyranoarb)) # Version Arbre
#println(calculerLongMoyMotArbre(princearb))

## Mots débutant par une chaîne de caractères donnée (préfixe)
#println(chercherMotsPrefixeTab(cyranotab, "am")) # Version Tableau
#println(chercherMotsPrefixeTab(princetab, "ros"))

#println(chercherMotsPrefixeArbre(cyranoarb, "am")) # Version Arbre
#println(chercherMotsPrefixeArbre(princearb, "ros"))

## Mots terminant par une chaîne de caractères donnée (suffixe)
#println(chercherMotsSuffixeTab(cyranotab, "acher")) # Version Tableau
#println(chercherMotsSuffixeTab(princetab, "eur"))

#println(chercherMotsSuffixeArbre(cyranoarb, "acher")) # Version Arbre
#println(chercherMotsSuffixeArbre(princearb, "eur"))

## Liste des nouveaux mots après suppression d'un caractère
#println(convertirMotTab(cyranotab, "p")) # Version Tableau
#println(convertirMotTab(princetab, "p"))

#println(motsSansLettre(cyranoarb, "p")) # Version Arbre
#println(motsSansLettre(princearb, "p"))

## Calcul du mot de score maximal au Scrabble d'un texte
#println(scoreMaxMotTab(cyranotab, scrabbleDico)) # Version Tableau
#println(scoreMaxMotTab(princetab, scrabbleDico))

#println(scoreMaxMotArbre(cyranoarb, scrabbleDico)) # Version Arbre
#println(scoreMaxMotArbre(princearb, scrabbleDico))
