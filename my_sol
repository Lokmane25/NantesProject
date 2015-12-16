
%Generer combinaisons de n elements (n protéines)

n{sol(V):pert(E,V,S,C)}n .

%Generer un aff qui sont les sousensembles de pertrubations qui fixent une proteine

aff(E,V1,S,C) :- sol(V1), pert(E,V2,S,C), V1==V2.

%Calculer les differences entre aff d'une meme classe

diff(I,J,V) :- aff(I,V,S1,C1), aff(J,V,S2,C2), C1==C2, S1!=S2, I!=J.

cdiff(I,J) :- diff(I,J,_).

%Compter le nombre de difference entre une meme classe

%countdiff(I,J,M) :- M={diff(I,J,_)},I!=J,exp(I),exp(J).

%Interdire qu'il existe un predicat countdiff de taille 0

% ca ne marche pas à cause de cas ou un prédicat diff() ne se genere pas
%:- countdiff(I,J,0).

%countdiff(I,J,M):-M={diff(I,J,_):exp(I):exp(J)}.

:- not cdiff(I,J), aff(I,_,_,C1), aff(J,_,_,C2), C1==C2.

#hide.
#show sol/1.
%#show pert/4.
#show aff/4.
#show diff/3.
#show countdiff/3.
