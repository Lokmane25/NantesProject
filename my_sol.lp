
%Generer combinaisons de n elements (n protéines)

n{selprot(V):pert(E,V,S,C)}n .

% Generer tous les sousensembles d'experiences possibles 

1{affi(E):pert(E,V,S,C)}.

% Generer les vecteurs de perturbations correspondantes

{aff(E,V,S,C)} :- selprot(V), affi(E), pert(E,V,S,C).

%Eliminer les affs qui ne contienent pas l'ensemble de protéines qui m'interesse

:- aff(E,V,S,C), not selprot(V).

%Compter le nombre de aff i,e perturbations a choisir et imposer que soit n

compteraffs(E,M) :- M={aff(E,_,_,_)},affi(E).

:- compteraffs(E,T),T!=n.

%Calculer les differences entre affs d'une meme classe

diff(I,J,V) :- aff(I,V,S1,C1), aff(J,V,S2,C2), C1==C2, S1!=S2, I!=J.


%Calculer les égalités entre affs de diffèrentes classe

egale(I,J,V) :- aff(I,V,S1,C1), aff(J,V,S2,C2), C1!=C2, S1==S2, I!=J.

%Compter le nombre de egales entre 2 experiences de 2 classes differents

countegale(I,J,M) :- M={egale(I,J,_)},I!=J,affi(I),affi(J),aff(I,_,_,C1),aff(J,_,_,C2),C1!=C2.

%Generer un prédicat affinite lorsque le nombre de coutnegale est egale à n pour des classes differentes

affinite(I,J) :- countegale(I,J,n),I!=J,affi(I),affi(J),aff(I,_,_,C1),aff(J,_,_,C2),C1!=C2.

%Compter le nombre de difference entre une meme classe

countdiff(I,J,M) :- M={diff(I,J,_)},I!=J,affi(I),affi(J),aff(I,_,_,C1),aff(J,_,_,C2),C1==C2.
countdiff(I,J,0) :- affi(I),affi(J),aff(I,_,_,C1),aff(J,_,_,C2),C1!=C2.

%Interdire qu'il existe un predicat countdiff de taille 0 pour la meme classe. Il suffit de le faire par proteine

:- countdiff(I,J,0), affi(I),affi(J),aff(I,_,_,C1),aff(J,_,_,C2),C1==C2.

%compter les affinites par experience

countaffinite(I,M) :- M={affinite(I,_)},affi(I).

%Interdire le cas ou une experience aie 0 affinites

:- countaffinite(I,0), affi(I).


%Generer les affs ou il a les 2 classes

%tmp :- aff(_,_,_,C1),aff(_,_,_,C2), C1!=C2.

%:- not tmp.

%le nombre maximale de aff

%#maximize { aff(E,V,S,C) : exp(E) : node(V):sign(S):class(C) @ 1 }.
#maximize { affi(E) : exp(E) @ 1 }.

%#hide.
#show compteraffs/2.
#show selprot/1.
%#show pert/4.
#show affi/1.
#show aff/4.
#show diff/3.
#show countdiff/3.
%#show countegale/3.
%#show affinite/2.
%#show countaffinite/2.
