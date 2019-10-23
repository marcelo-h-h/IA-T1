 % Regras

%Estados
% [[posicao_X, posicao_Y], Numero_extintores, Numero_fogos, Lista_Posicoes_fogo]

% replace(Lista1,Indice,Valor,Lista2).
% Substitui o valor Lista1[Indice] por Valor em Lista2, que é originalmente Lista2=Lista1
replace([_|T], 0, X, [X|T]) :- !.
replace([H|T], I, X, [H|R]):- I > 0, NI is I-1, replace(T, NI, X, R), !.

%Nossa meta
meta(Estado) :- 
nth0(0, Estado, [PosicaoX,PosicaoY]), foguinho(PosicaoX,PosicaoY),
nth0(2, Estado, Numero), Numero = 0.

tipo(bloquinho(X,Y,pedrinha)) :- pedrinha(X,Y).
tipo(bloquinho(X,Y,escada)) :- escada(X,Y).
tipo(bloquinho(X,Y,parede)) :- parede(X,Y).
tipo(bloquinho(X,Y,extintor)) :- extintor(X,Y).
tipo(bloquinho(X,Y,foguinho)) :- foguinho(X,Y).
tipo(bloquinho(X,Y,vazio)) :- not(pedrinha(X,Y);escada(X,Y);parede(X,Y);extintor(X,Y);foguinho(X,Y)).

objeto(X, Y) :- escada(X, Y).
objeto(X, Y) :- foguinho(X, Y).
objeto(X, Y) :- parede(X, Y).
objeto(X, Y) :- pedrinha(X, Y).

objeto(X,Y) :- not(tipo(bloquinho(X,Y,vazio))).

bloquinho_livre(X, Y) :- not(objeto(X,Y)).


%Andar para a esquerda
caminho(bloquinho(X1, Y, _), bloquinho(X2, Y, _)) :- X2 is (X1-1), X2 > 0, not(parede(X2,Y)), not(pedras(X2,Y)), not(fogo(X1,Y)), not(extintor(X2,Y)).

%Andar para a direita
caminho(bloquinho(X1, Y, _), bloquinho(X2, Y, _)) :- X2 is (X1+1), X2 < 11, not(parede(X2,Y)), not(pedras(X2,Y)), not(fogo(X1,Y)), not(extintor(X2,Y)).

%Pular as pedras para a esquerda
caminho(bloquinho(X1, Y, _), bloquinho(X3, Y, _)) :- X2 is (X1-1), X3 is (X1-2), X3>0, pedras(X2,Y), bloquinho_livre(X3,Y), not(fogo(X1,Y)).

%Pular as pedras para a direita
caminho(bloquinho(X1, Y, _), bloquinho(X3, Y, _)) :- X2 is (X1+1), X3 is (X1+2), X3<11, pedras(X2,Y), bloquinho_livre(X3,Y), not(fogo(X1,Y)).

%Subir as escadas
caminho(bloquinho(X, Y1, _), bloquinho(X, Y2, _)) :- escada(X,Y2), escada(X,Y1), Y2 is (Y1+1), Y2<6. 

%Descer as escadas
caminho(bloquinho(X, Y1, _), bloquinho(X, Y2, _)) :- escada(X,Y1), escada(X,Y2), Y2 is (Y1-1), Y2>0.



%Métodos para manipulação de listas (Aula Prolog)
pertence(Elem,[Elem|_ ]).
pertence(Elem,[ _| Cauda]) :- pertence(Elem,Cauda).

concatena([ ],L,L).
concatena([Cab|Cauda],L2,[Cab|Resultado]) :- concatena(Cauda,L2,Resultado).


%solucao por busca em profundidade (bp)
solucao_bp(Inicial,Solucao) :- bp([],Inicial,Solucao). 
%Se o primeiro estado da lista é meta, retorna a meta
bp(Caminho,Estado,[Estado|Caminho]) :- meta(Estado).
%se falha, coloca o novo caminho e continua a busca
bp(Caminho,Estado,Solucao) :- sucessor(Estado,Sucessor), not(pertence(Sucessor,[Estado|Caminho])),bp([Estado|Caminho],Sucessor,Solucao).

%Caminhar normalmente, de um bloquinho livre para outro, subindo uma escada ou pulando normalmente uma pedrinha
sucessor(Estado, Sucessor) :- 
nth0(0,Estado,[X1,Y1]),
caminho(bloquinho(X1,Y1,_),bloquinho(X2,Y2,_)),
replace(Sucessor, 0, [X2,Y2], Sucessor).

%Caminhar de um bloquinho livre ou de escada para a esquerda em um bloquinho de extintor
sucessor(Estado, Sucessor) :-
nth0(0, Estado, [X1,Y1]),
(bloquinho_livre(X1,Y1);escada(X1,Y1)),
X2 is (X1-1),
X2 > 0,
extintor(X2,Y1),
nth0(1,Estado,Num_Extint),
Num_Extint = 0,
nth0(4, Estado, List_Extint),
member([X2,Y1], List_Extint),
delete(List_Extint, [X2,Y1], Nova_List_Extint),
replace(Estado, 0, [X2,Y1], Temp1),
replace(Temp1, 1, 2, Temp2),
replace(Temp2, 4, Nova_List_Extint, Sucessor).


% Apangando fogo e saindo para esquerda
sucessor(Estado, Sucessor) :-
nth0(0,Estado,[X1,Y]),
nth0(1,Estado,Num_Extint),
nth0(2,Estado,Num_Fogos),
nth0(3,Estado,List_Fogos),
foguinho(X1,Y),
Num_Extint > 0,
Novo_Num_Extint is (Num_Extint-1),
X2 is (X1-1),
X2 > 0,
not(pedra(X2,Y)),
not(parede(X2,Y)),
Novo_Num_Fogos is (Num_Fogos-1),
delete(List_Fogos,[X1,Y],Nova_List_Fogos),
replace(Estado, 0, [X2,Y], Temp1),
replace(Temp1, 1, Novo_Num_Extint, Temp2),
replace(Temp2, 2, Novo_Num_Fogos, Temp3),
replace(Temp3, 3, Nova_List_Fogos, Sucessor).




%Estados
% [[posicao_X, posicao_Y], Numero_extintores, Numero_fogos, Lista_Posicoes_fogo, Lista_Posicoes_extintores]


