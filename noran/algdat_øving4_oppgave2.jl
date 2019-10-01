

function countingsortlength(A)
    pushfirst!(A,"")
    B = deepcopy(A)
    C = []
    counter = 0
    for i in range(1,stop=1000)
        push!(C,0)
    end
    for j in range(1,stop=length(A))
        if(length(A[j]) == 0)
            A[j] = "a"
            C[length(A[j])] = C[length(A[j])]+1
            counter = counter+1
    else
        C[length(A[j])] = C[length(A[j])]+1
    end
    end
    for i in range(2,stop=1000)
        C[i] = C[i] + C[i-1]
    end
    for i in range(0,stop=length(A))
        v = length(A)-i
        if(C[length(A[v])] == 1)
            break
        else
        B[C[length(A[v])]] = A[v]
        C[length(A[v])] = C[length(A[v])]-1
    end
    end
    for i in range(2,stop=counter)
        B[i] = ""
    end
    popfirst!(B)
return B
end






printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test countingsortlength(["ccc", "bb", "a"]) == ["a", "bb", "ccc"]
    @test countingsortlength(["aaa", "bb", "c"]) == ["c", "bb", "aaa"]
    @test countingsortlength(["bb", "a", ""]) == ["", "a", "bb"] # Testen her sjekker om du kan sortere også med emtpy string
    @test countingsortlength(["bbbb", "aa", "aaaa", "ccc"]) == ["aa", "ccc", "bbbb", "aaaa"] # Fra oppgaven
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")
