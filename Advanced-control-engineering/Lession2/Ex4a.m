A = [0 1 0; 0 0 1; -3 -2 -5]
B = [0 ;0 ;10]
C = [1 0 0]
D = [0]

T = ss(A,B,C,D,1)
T1 = tf(T)

% num = [10]
% dem = [1 5 2 3]

% [Ac,Bc,Cc,Dc] = tf2ss(num, dem)