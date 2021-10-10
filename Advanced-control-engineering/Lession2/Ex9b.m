% Ex 12.5 
numg = [1 6]; % Define numerator of G(s).
deng = poly([-7 -8 -9]); % Define denominator of G(s).

G = tf(numg,deng) % Create and display G(s).
[Ac,Bc,Cc,Dc] = tf2ss(numg,deng); % Transform G(s) to controller
% canonical form in state space.
Ao = Ac' % Transform Ac to observer
% canonical form.
Bo = Cc'; % Transform Bc to observer
% canonical form.
Co = Bc'; % Transform Cc to observer
% canonical form.
Do = Dc; % Transform Dc to observer
% canonical form.

pos = 20
Ts = 2

z=(log(pos/100))/(sqrt(pi^2 + log(pos/100)^2));
wn=4/(z*Ts);

r = roots([1,2*z*wn, wn^2]) % Find the controller-compensated
% system poles.
poles = 10*[r' 10*real(r(1))] % Make observer poles 10x bigger.
lp = acker(Ao',Co',poles)' % Find the observer gains in
% observer canonical form.
pause