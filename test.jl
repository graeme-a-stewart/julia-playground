#! /usr/bin/env julia

# This is a silly test file for testing the debugger in VS Code

function main()
    a = 10
    b = 20
    
    c = a*b
    
    println("$a × $b = $c")
    
    begin
        x = Int(0)
        for i in 1:5
            x += i
        end
        println("I counted to $x")
    end

    println("Oh, I have $(length(ARGS)) arguments")
    for (narg, arg) in enumerate(ARGS)
        println("Argument $narg is $arg")
    end
end

# The issue is that running through the debugger in VS Code actually has
# ARGS[0] = "/some/path/.vscode/extensions/julialang.language-julia-1.47.2/scripts/debugger/run_debugger.jl",
# so then the program does nothing at all if it only tests for abspath(PROGRAM_FILE) == @__FILE__
if (abspath(PROGRAM_FILE) == @__FILE__) || (basename(PROGRAM_FILE) == "run_debugger.jl")
	main()
end
