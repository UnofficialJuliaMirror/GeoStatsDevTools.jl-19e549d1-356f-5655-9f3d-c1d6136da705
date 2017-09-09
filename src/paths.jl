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
    AbstractPath

A path on a spatial domain of type `D`.
"""
abstract type AbstractPath{D<:AbstractDomain} end

"""
    Base.start(path)

Return the start of the `path`.
"""
Base.start(::AbstractPath) = error("not implemented")

"""
    Base.next(path, state)

Advance in the `path` from current `state`.
"""
Base.next(::AbstractPath, state) = error("not implemented")

"""
    Base.done(path, state)

Return true if `state` is the end of the `path`.
"""
Base.done(::AbstractPath, state) = error("not implemented")

"""
    Base.length(path)

Return the length of a `path`.
"""
Base.length(p::AbstractPath) = npoints(p.domain)

#------------------
# IMPLEMENTATIONS
#------------------
include("paths/simple_path.jl")
include("paths/random_path.jl")
