% Exemplos de manipulação de listas em Prolog

% Toda lista é no formato: 
% [Cabeça | Cauda]
% Por exemplo, em: 

p([a, b, c, d]).

% Quando fazemos as consultas
% ?- P([Head | Tail])
% Temos:
% Head = a,
% Tail = [b, c, d].


% Adicionando itens à lista com o predicado append

append([],List,List).
append([Head|Tail],List2,[Head|Result]):- append(Tail,List2,Result).

% Retirar itens da lista com o predicado remove_itens

retirar_elemento(Elem,[Elem|Cauda],Cauda).
retirar_elemento(Elem,[Elem1|Cauda],[Elem1|Cauda1]) :- retirar_elemento(Elem,Cauda,Cauda1).

% Busca em profundidade

solucao_bp(Inicial,Solucao) :- bp([],Inicial,Solucao).

bp(Caminho,Estado,[Estado|Caminho]) :- meta(Estado).

bp(Caminho,Estado,Solucao) :- s(Estado,Sucessor), not(pertence(Sucessor,[Estado Caminho])), bp([Estado|Caminho],Sucessor,Solucao).

concatena([ ],L,L).
concatena([Cab|Cauda],L2,[Cab|Resultado]) :- concatena(Cauda,L2,Resultado).

pertence(Elem,[Elem|_ ]).
pertence(Elem,[ _| Cauda]) :- pertence(Elem,Cauda).

