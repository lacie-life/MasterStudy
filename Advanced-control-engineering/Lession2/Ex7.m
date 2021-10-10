% a
Aa = [-1]
Ba = [1]
Ca = [2]
Da = [0]

Cm = ctrb(Aa, Ba)
Om = obsv(Aa, Ca)

if rank(Cm) == size(Aa,1)
    'It is controllable'
else 
    'It is not controllabel'
end

if rank(Cm) == size(Aa, 1)
    'It is observable'
else
    'It is not observable'
end

% b
Ab = [0 1; 1 1]
Bb = [1; 0]
Cb = [2 -2]
Db = [0]

Cm = ctrb(Ab, Bb)
Om = obsv(Ab, Cb)

if rank(Cm) == size(Ab,1)
    'It is controllable'
else 
    'It is not controllabel'
end

if rank(Cm) == size(Ab, 1)
    'It is observable'
else
    'It is not observable'
end

% c
Ac = [-3 1; -2 0]
Bc = [2; 4]
Cc = [1 0]
Dc = [0]

Cm = ctrb(Ac, Bc)
Om = obsv(Ac, Cc)

if rank(Cm) == size(Ac,1)
    'It is controllable'
else 
    'It is not controllabel'
end

if rank(Cm) == size(Ac, 1)
    'It is observable'
else
    'It is not observable'
end

% d
Ad = [-3 1 0; -2 0 0; 1 0 0]
Bd = [2; 4; 1]
Cd = [1 0 0]
Dd = [0]

Cm = ctrb(Ad, Bd)
Om = obsv(Ad, Cd)

if rank(Cm) == size(Ad,1)
    'It is controllable'
else 
    'It is not controllabel'
end

if rank(Cm) == size(Ad, 1)
    'It is observable'
else
    'It is not observable'
end


