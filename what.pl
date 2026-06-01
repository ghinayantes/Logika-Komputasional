pred1([],[]). 
pred1([X|Xs],[Z|Zs]) :- pred2(X,Xs,Ys,1,Z), pred1(Ys,Zs). 
 
pred2(X,[],[],1,X). 
pred2(X,[],[],N,[N,X]) :- N > 1. 
pred2(X,[Y|Ys],[Y|Ys],1,X) :- X \= Y. 
pred2(X,[Y|Ys],[Y|Ys],N,[N,X]) :- N > 1, X \= Y. 
pred2(X,[X|Xs],Ys,K,T) :- K1 is K + 1, pred2(X,Xs,Ys,K1,T). 