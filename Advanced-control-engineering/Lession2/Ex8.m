% Ex 12.5 
numg = [1 4]; % Define numerator of G(s).
deng = poly([-1 -2 -5]); % Define denominator of G(s).
'G(s)' % Display label.
G = tf(numg,deng) % Create and display G(s).
[Ac,Bc,Cc,Dc] = tf2ss(numg,deng); % Transform G(s) to controller
% canonical form in state space.
Ao = Ac'; % Transform Ac to observer
% canonical form.
Bo = Cc'; % Transform Bc to observer
% canonical form.
Co = Bc'; % Transform Cc to observer
% canonical form.
Do = Dc; % Transform Dc to observer
% canonical form.
r = roots([1 2 5]) % Find the controller-compensated
% system poles.
poles = 10*[r' 10*real(r(1))] % Make observer poles 10x bigger.
lp = acker(Ao',Co',poles)' % Find the observer gains in
% observer canonical form.
pause