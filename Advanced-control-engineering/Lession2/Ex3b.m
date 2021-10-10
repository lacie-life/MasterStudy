num = [1 2 12 7 6];
den = [1 9 13 8 0 0];

G = tf(num, den);
rg = order(G);

% Canonical form
[Ac,Bc,Cc,Dc] = tf2ss(num,den)

%Observe canonical form
Aoc=transpose(Ac);
Boc=transpose(Cc);
Coc=transpose(Bc);

% Phase variable form
% P=[0 1 0 0; 0 0 1 0; 0 0 0 1];  %nxn
V = fliplr(eye(rg))
Ap=inv(V)*Ac*V;
Bp=inv(V)*Bc;
Cp=Cc*V;
Dp=Dc;