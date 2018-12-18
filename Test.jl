include("./Arbre.jl")
include("./Tableau.jl")

texteCyrano = "./cyrano.txt" # 36 280 mots dont 5 482 différents
textePetitPrince = "./le_petit_prince.txt" # 15 426 mots dont 2 403 différents

scrabbleDico = Dict('A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1,
      'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1, 'D' => 2, 'G' => 2, 'B' => 3,
      'C' => 3, 'M' => 3, 'P' => 3, 'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4,
      'Y' => 4, 'K' => 5, 'J' => 8, 'X' => 8, 'Q' => 10, 'Z' => 10)

# Segmentation du texte #
cyranotab = segmenterTexteTableau(texteCyrano) # Version Tableau
princetab = segmenterTexteTableau(textePetitPrince)

cyranoarb = segmenterTexteArbre(texteCyrano) # Version Arbre
princearb = segmenterTexteArbre(textePetitPrince)

# println(calculerLongMoyMotDistinctsArbre(cyranoarb))
# println(calculerLongMoyMotDistinctsArbre(princearb))
# println(calculerLongMoyMotArbre(cyranoarb))
# println(calculerLongMoyMotArbre(princearb))

# # Liste des mots commençant par une chaine de caractères donnée
# println(chercherMotsPrefixeTab(cyranotab, "am")) # Version Tableau
# println(chercherMotsPrefixeTab(princetab, "ros"))
# println(chercherMotsPrefixeArbre(cyranoarb, "am")) # Version Arbre
# println(chercherMotsPrefixeArbre(princearb, "ros"))
#
# # Liste des mots terminant par une chaine de caractères donnée
# println(chercherMotsSuffixeTab(cyranotab, "acher")) # Version Tableau
# println(chercherMotsSuffixeTab(princetab, "eur"))
# println(chercherMotsSuffixeArbre(cyranoarb, "acher")) # Version Tableau
# println(chercherMotsSuffixeArbre(princearb, "eur"))
# println(chercherMotsSuffixeArbre(princearb, "a"))

# Nouveau tableau de mots privés d'un caractère donné
# println(motConversionTab(cyranotab, "t")) # Version Tableau

# Mot d'un texte de score maximal au Scrabble
# println(scoreMaxMotTab(cyranotab, scrabbleDico)) # Version Tableau
# println(scoreMaxMotArbre(cyranoarb, scrabbleDico))
#
# println(scoreMaxMotTab(princetab, scrabbleDico)) # Version Tableau
# println(scoreMaxMotArbre(princearb, scrabbleDico))

println(chercherMots(cyranoarb)[1:20])
println(motsSansLettre(cyranoarb, 'e')[1:20])
