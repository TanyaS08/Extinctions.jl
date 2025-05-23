global anyerrors = false

tests = ["mock test" => "00_allgood.jl", 
        "Cascading extinctions" => "01_cascade.jl",
        "Numeric extinctions" => "02_numeric.jl"]

for test in tests
    try
        include(joinpath("units", test.second))
        println("\033[1m\033[32m✓\033[0m\t$(test.first)")
    catch e
        global anyerrors = true
        println("\033[1m\033[31m×\033[0m\t$(test.first)")
        println("\033[1m\033[38m→\033[0m\ttest/$(test.second)")
        showerror(stdout, e, backtrace())
        println()
        break
    end
end

if anyerrors
    throw("Tests failed")
end
