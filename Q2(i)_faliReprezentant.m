_<x>:=PolynomialRing(Rationals());

p := 43;

Q2 := pAdicField(2, 60);
Q2_i<t> := ext<Q2 | x^2 + 2*x + 2>;

i := t + 1;

//izbacivanje i - 2 iz niza rezultira ispisima "FALI REPREZENTANT!!!";
arr_i := {i, 1+i, p, i - 2};
generated_i := {@@};

for S in Subsets(arr_i) do
    prod := Q2_i!1;

    for el in S do
        prod := prod * Q2_i!el;
    end for;

    Include(~generated_i, prod);
end for;

for el in generated_i do
    IsSquare(Q2_i!el);
end for;

for a in [-10..10] do
    for b in [-10..10] do
        found := false;
    
        for el in generated_i do
            found := found or IsSquare(el*(Q2_i!(a+b*i)));
        end for;

        if found eq false then
            a+b*i, "FALI REPREZENTANT!!!";
        end if;
    end for;
end for;