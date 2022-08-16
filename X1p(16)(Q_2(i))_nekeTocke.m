//pronalazimo neke točke na X1^p(16)(Q_2(i))

_<x>:=PolynomialRing(Rationals());

Q2 := pAdicField(2, 60);
Q2_i<t> := ext<Q2 | x^2 + 2*x + 2>;

i := t + 1;
cntFail := 0;

//slutnja da -i + 2 daje točku nad Q2_i kad je p == 3 mod 16, čak nije ni prost nužno
for p1 in [2..1000] do
    if p1 mod 16 eq 3 then
        x0 := -i + 2;
        RHS := x0 * (x0^2 + p1^2) * (x0^2 + 2*p1*x0 - p1^2);
        b, y := IsSquare(Q2_i!RHS);
        if b eq false then
            "FAIL AT", p1;
            cntFail := cntFail + 1;
        end if;
    end if;
end for;

//slutnja da -3*i + 6 daje točku nad Q2_i kad je p == 11 mod 16, čak nije ni prost nužno
for p1 in [2..1000] do
    if p1 mod 16 eq 11 then
        x0 := -3*i + 6;
        RHS := x0 * (x0^2 + p1^2) * (x0^2 + 2*p1*x0 - p1^2);
        b, y := IsSquare(Q2_i!RHS);
        if b eq false then
            "FAIL AT", p1;
            cntFail := cntFail + 1;
        end if;
    end if;
end for;

assert cntFail eq 0;
"Number of fails:", cntFail;
