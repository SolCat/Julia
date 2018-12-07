mutable struct ArbreMots
	terminal::Bool
	nb::Int64
	suite::Dict{Char,ArbreMots}
	function ArbreMots()
	    return new(false,0,Dict{Char,ArbreMots}())
    end
end
