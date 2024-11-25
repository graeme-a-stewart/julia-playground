#! /usr/bin/env julia

using Chairmarks

# Define a type hierarchy for collections of numbers
abstract type NumberCollection end

# These are the concrete types, which are parametrised 
struct MyPair{T <: Number} <: NumberCollection 
    a::T
    b::T
end

struct MyTriple{T <: Number} <: NumberCollection
    a::T
    b::T
    c::T
end

# Now define a struct that takes one of these types
struct MyCompoundCollection{T <: NumberCollection}
    index::Int
    collection::Vector{T}
end

# Now define a very specific type, no paramaterisation
struct MyFixedType
    a::Float64
    b::Float64
end

struct MyFixedCollection
    index::Int
    collection::Vector{MyFixedType}
end

# Now define a non-parametrised type, which is also in NumberCollection
struct MyNonParametrised <: NumberCollection
    a::Number
    b::Number
end

# Create some data
const size = 1000
pairs = [MyPair(rand(), rand()) for _ in 1:size]
i_pairs = [MyPair(rand(1:100), rand(1:100)) for _ in 1:size]
triples = [MyTriple(rand(), rand(), rand()) for _ in 1:size]

f_pairs = [MyFixedType(rand(), rand()) for _ in 1:size]

mixed_number() = rand() > 0.5 ? rand(1:100) : rand()
mixed_pairs = [MyNonParametrised(mixed_number(), mixed_number()) for _ in 1:size]

# Create a compound collection
c_pairs = MyCompoundCollection(1, pairs)
ci_pairs = MyCompoundCollection(1, i_pairs)
c_triples = MyCompoundCollection(2, triples)

cf_pairs = MyFixedCollection(1, f_pairs)

mixed_collection = MyCompoundCollection(3, mixed_pairs)

# Benchmarker
function sum(collection::MyCompoundCollection; verbose = false)
    if verbose
        println("Using the generic method")
    end
    total = 0
    for c in collection.collection
        if c isa MyPair || c isa MyNonParametrised
            total += c.a + c.b
        elseif c isa MyTriple
            total += c.a + c.b + c.c
        end
    end
    total
end

function sum(collection::MyCompoundCollection{MyPair{I}}; verbose = false) where I <: Integer
    if verbose
        println("Using the specialised Integer method for MyPair")
    end
    total = zero(I)
    for c in collection.collection
        total += c.a + c.b
    end
    total
end

function sum(collection::MyCompoundCollection{MyPair{Float64}}; verbose = false)
    if verbose
        println("Using the specialised Float64 method for MyPair")
    end
    # println("Using the specialised method for MyPair")
    total = 0.0
    for c in collection.collection
        total += c.a + c.b
    end
    total
end

function sum(collection::MyFixedCollection; verbose = false)
    if verbose
        println("Using the fixed type method")
    end
    total = 0.0
    for c in collection.collection
        total += c.a + c.b
    end
    total
end

@b sum(c_pairs)
@b sum(ci_pairs)
@b sum(c_triples)
@b sum(cf_pairs)
@b sum(mixed_collection)
