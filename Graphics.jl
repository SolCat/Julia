include("./Arbre.jl")
include("./Tableau.jl")
texteCyrano = "./cyrano.txt"

Pkg.add("Vega")

#using Plots
#plotly()
#plt = plot(@elapsed segmenterTexteTableau(texteCyrano), linewidth=2)

using Compat
using Vega
