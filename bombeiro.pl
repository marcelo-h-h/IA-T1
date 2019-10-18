% Fatos

% Regras

andar(bloquinho(X1, Y1, tipo1), bloquinho(X2, Y2, tipo2)) :- se estiver livre; com escada; com extintor; com fogo apenas se estiver com extintor; 
pular(bloquinho(X1, Y1, tipo1), bloquinho(X2, Y2, tipo2)) :- se o x2 = x1 + 2 ou x2 = x1 - 2; se ambos estiverem livres; Y1 = Y2; se o bloquinho entre os dois bloquinhos tiver uma pedra;
escada(bloquinho(X1, Y1, tipo1), bloquinho(X2, Y2, tipo2)) :- se tiver uma escada em ambos os bloquinhos; se X1 = X2; se Y1 = Y2 + 1 ou Y1 = Y2 - 1;
bloquinho_livre(bloquinho(X, Y, tipo)) :- se o tipo não contem nenhum objeto(escada, extintor, pedra, fogo, parede);
X)



apagar(bloquinho(X, Y, item)) :- se o bombeiro está com extintor >=1 restante
pegar_extintor(bloquinho(X, Y, item)) :- se ainda não está com o extintor na mão


objeto(X, Y) :- escada(X, Y).
objeto(X, Y) :- foguinho(X, Y).
objeto(X, Y) :- parede(X, Y).


