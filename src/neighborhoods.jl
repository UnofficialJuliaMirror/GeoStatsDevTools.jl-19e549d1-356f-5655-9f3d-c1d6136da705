## Copyright (c) 2017, Júlio Hoffimann Mendes <juliohm@stanford.edu>
##
## Permission to use, copy, modify, and/or distribute this software for any
## purpose with or without fee is hereby granted, provided that the above
## copyright notice and this permission notice appear in all copies.
##
## THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
## WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
## MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
## ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
## WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
## ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
## OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

"""
    AbstractNeighborhood

A neighborhood on a spatial domain of type `D`.
"""
abstract type AbstractNeighborhood{D<:AbstractDomain} end

# Neighborhoods are functor objects that can be evaluated
# at a given location:
#
# julia> neighborhood(location)
#
# The operator () returns the neighbors (as integers) and
# is implemented differently depending on the domain type.

#------------------
# IMPLEMENTATIONS
#------------------
include("neighborhoods/cube_neighborhood.jl")
include("neighborhoods/ball_neighborhood.jl")
