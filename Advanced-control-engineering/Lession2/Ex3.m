num = [8 10];
den = [1 5 1 5 13];

% Canonical form
[Ac,Bc,Cc,Dc] = tf2ss(num,den)

%Observe canonical form
Aoc=transpose(Ac);
Boc=transpose(Cc);
Coc=transpose(Bc);

% Phase variable form
P=[0 0 1; 0 1 0; 1 0 0];  %nxn
Ap=inv(P)*A*P;
Bp=inv(P)*B;
Cp=C*P;
Dp=Dc;