% Regras

tipo(bloquinho(X,Y,pedrinha)) :- pedrinha(X,Y).
tipo(bloquinho(X,Y,escada)) :- escada(X,Y).
tipo(bloquinho(X,Y,parede)) :- parede(X,Y).
tipo(bloquinho(X,Y,extintor)) :- extintor(X,Y).
tipo(bloquinho(X,Y,foguinho)) :- foguinho(X,Y).
tipo(bloquinho(X,Y,vazio)) :- not(pedrinha(X,Y);escada(X,Y);parede(X,Y);extintor(X,Y);foguinho(X,Y)).

objeto(X,Y) :- not(tipo(bloquinho(X,Y,vazio))).

bloquinho_livre(X, Y) :- not(objeto(X,Y)).

%Andar para a esquerda
caminho(bloquinho(X1, Y, tipo1), bloquinho(X2, Y, tipo2), Caminho) :- X2 is (X1-1), X2 > 0, not(parede(X2,Y)), not(pedras(X2,Y))

%Andar para a direita
caminho(bloquinho(X1, Y, tipo1), bloquinho(X2, Y, tipo2), Caminho) :- X2 is (X1+1), X2 < 11, not(parede(X2,Y)), not(pedras(X2,Y))

%Pular as pedras para a esquerda
caminho(bloquinho(X1, Y, tipo1), bloquinho(X3, Y, tipo2), Caminho) :- X2 is (X1-1), X3 is (X1-2), X3>0, pedras(X2,Y), bloquinho_livre(X3,Y)

%Pular as pedras para a direita
caminho(bloquinho(X1, Y, tipo1), bloquinho(X3, Y, tipo2), Caminho) :- X2 is (X1+1), X3 is (X1+2), X3<11, pedras(X2,Y), bloquinho_livre(X3,Y)

%Subir as escadas
caminho(bloquinho(X, Y1, tipo1), bloquinho(X, Y2, tipo2), Caminho) :- escada(X,Y1), Y2 is (Y1+1), Y2<6, 

%Descer as escadas
caminho(bloquinho(X, Y1, tipo1), bloquinho(X, Y2, tipo2), Caminho) :- escada(X,Y2), Y2 is (Y1-1), Y2>0


apagar(bloquinho(X, Y, item)) :- se o bombeiro está com extintor >=1 restante
pegar_extintor(bloquinho(X, Y, item)) :- se ainda não está com o extintor na mão


objeto(X, Y) :- escada(X, Y).
objeto(X, Y) :- foguinho(X, Y).
objeto(X, Y) :- parede(X, Y).
objeto(X, Y) :- pedras(X, Y).








