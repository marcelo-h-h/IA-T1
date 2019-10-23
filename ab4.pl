%Regras e fatos (ambiente completo 4)

%inicio(X,Y)
inicio(1,1).

%escada(X,Y), onde Y é a base da escada, que permite subir um andar.
escada(4,1).
escada(9,1).
escada(1,2).
escada(7,2).
escada(4,3).
escada(10,3).
escada(3,4).
escada(9,4).

%pedrinha(X,Y), onde é permitido pular para o outro lado de X, contanto que esta posição não contenha outro objeto.
pedrinha(2,1).
pedrinha(3,2).
pedrinha(10,2).
pedrinha(6,4).
pedrinha(2,5).
pedrinha(6,5).

%extintor(X,Y).
extintor(7,1).
extintor(6,3).

%parede(X,Y).
parede(6,1).
parede(5,3).

%foguinho(X,Y).
foguinho(5,1).
foguinho(2,3).
foguinho(8,5).


