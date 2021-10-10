numg=100*[1 10]; 
deng=poly ([0 -3 -12]);

G=tf (numg, deng)

pos=input('Type desired %OS '); % Input desired percent overshoot.
Ts=input('Type desired settling time '); % Input desired settling time.

z=(-log(pos/100))/(sqrt(pi^2+log(pos/100)^2));
% Calculate required damping ratio.
wn=4/ (z*Ts); % Calculate required natural
% frequency.
[num,den]=ord2 (wn, z); % Produce a second-order system
% that meets the transient response
% requirements.
r=roots(den); % Use denominator to specify
% dominant poles.
poles=[r(1) r(2) -5.1]; % Specify pole placement for all
% poles.
characteristiceqdesired=poly(poles)
% Form desired characteristic
% polynomial for display.
[Ac Bc Cc Dc]=tf2ss(numg,deng); % Find controller canonical form
% of state-space representation
% of G(s).
P=[0 0 1; 0 1 0; 1 0 0]; % Transformation matrix for
% controller canonical to phase-
% variable form.
Ap=inv(P)*Ac*P; % Transform Ac to phase-variable
% form.
Bp=inv(P)*Bc; % Transform Bc to phase-variable
% form.
Cp=Cc*P; % Transform Cc to phase-variable
% form.
Dp=Dc; % Transform Dc to phase-variable
% form.
Kp=acker(Ap,Bp,poles) % Calculate controller gains in
% phase-variable form.
Apnew=Ap-Bp*Kp; % Form compensated A matrix.
Bpnew=Bp; % Form compensated B matrix.
Cpnew=Cp; % Form compensated C matrix.
Dpnew=Dp; % Form compensated D matrix.
[numt,dent]=ss2tf(Apnew,Bpnew,Cpnew,Dpnew);
% Form T(s) numerator and
% denominator.
'T(s)' % Display label.
T=tf (numt, dent) % Create and display T(s).
poles=roots (dent) % Display poles of T(s).
Tss=ss (Apnew, Bpnew,Cpnew,Dpnew) % Create and display Tss, an LTI
% state-space object.
step (Tss) % Produce compensated step
% response.
title('Compensated Step Response')
% Add title to compensated step
% response.
pause

