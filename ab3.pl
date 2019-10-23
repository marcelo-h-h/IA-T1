%Regras e fatos (ambiente completo 3)
	
%inicio(X,Y)
inicio(1,1).

%escada(X,Y), onde Y é a base da escada, que permite subir um andar.
escada(5,1).
escada(5,2).
escada(9,2).
escada(9,3).
escada(1,2).
escada(1,3).
escada(8,2).
escada(8,3).
escada(4,3).
escada(4,4).
escada(10,3).
escada(10,4).
escada(3,4).
escada(3,5).
escada(9,4).
escada(9,5).

%pedrinha(X,Y), onde é permitido pular para o outro lado de X, contanto que esta posição não contenha outro objeto.
pedrinha(3,1).
pedrinha(3,2).
pedrinha(6,2).
pedrinha(7,2).
pedrinha(6,4).
pedrinha(6,5).

%extintor(X,Y).
extintor(6,3).
extintor(1,4).

%parede(X,Y).
parede(6,1).
parede(5,3).

%foguinho(X,Y).
foguinho(10,1).
foguinho(2,5).
foguinho(8,5).
foguinho(10,5).

