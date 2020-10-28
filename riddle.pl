right(X,Y, [X,Y|_]). 
right(X, Y, [_|T]) :-right(X, Y, T).
left(X, Y, L) :- right(Y, X, L).
in_order(X, Y, Z, Lst) :-
append(_, [X|T1], Lst),
append(_, [Y|T2], T1),
append(_, [Z|_], T2).
%e= (shirt , name, cryptocoin, amount, password , sold )
%shirt= green,black,white,yellow, blue
%name = Chales, Eugene, Oliver, Russell, Leslie
%cryptocoin= braincoin, IQcoin, coinzilla, sudocoin, logicoin.
%Amount= 200,300,100,500,400.
%Password= brainzilla, qwert, hastag,rex, 1234,
%sold= bike,car, boat, jewelry, computer
crypto(L):- 
length(L,5),%Hint1- There are five friends
%Hint 2:Charles, the guy at the first position, is wearing his black shirt. He sold his bike to buy cryptocoins
L=[ e( black, charles,_,_,_,bike),_,_,_,_],
%Hint3:In the middle is the man that has 100 coins and uses the password hashtag.
L=[_,_, e(_,_,_, 100,hastag,_),_,_],
%Hint4:The man wearing the Yellow shirt is at the fourth position.
L=[_,_,_,e(yellow,_,_,_,_,_),_],
%5:At the fifth position is someone whose password is 1234.
L=[_,_,_,_, e(_,_,_,_,1234,_)],
%6:At one of the ends is the man who sold his Computer.NOTSURE
(L=[_,_,_,_, e(_,_,_,_,_, computer)];
L=[ e( 5,_,_,_,_,_, computer),_,_,_,_]),
%7:The one that uses brainzilla as his password is at one of the ends.NOTSURE%%%
(L=[ e(_,_,_,_, brainzilla,_),_,_,_,_];
L=[ _,_,_,_,e(_,_,_,_, brainzilla,_)]),%didsomechanges
%8:Russell is exactly to the right of the man who sold the Boat to buy cryptocoins.
right(e(_,_,_,_,_,boat), e(_,russell,_,_,_,_), L),
%9:Russel is exactly to the left of the guy who owns 400 cryptocoins.
right(e(_,russell,_,_,_,_),e(_,_,_, 400,_,_),L),
%10:Leslie is exactly to the right of the man who sold his family Jewelry.
right(e(_,_,_,_,_, jewelry),e(_,leslie,_,_,_,_),L),
%11:The man who sold his family Jewelry to buy cryptocoins is exactly to the right of the man who has Coinzillas.
right(e(_,_,coinzilla,_,_,_),e(_,_,_,_,_,jewelry),L),
%12:Oliver is exactly to the left of the enthusiast that has SudoCoins.
right(e(_,oliver,_,_,_,_),e(_,_, sudocoin,_,_,_),L),
%13:The enthusiast that sold his family Jewelry is next to the enthusiast wearing the White shirt.
nextto(e(white,_,_,_,_,_),e(_,_,_,_,_,jewelry),L),
%14:The enthusiast that has 500 coins is next to the enthusiast that sold his Computer to buy cryptocoins.
nextto(e(_,_,_,500,_,_),e(_,_,_,_,_,computer),L),
%15: Eugene is wearing the Green shirt.
member( e( green, eugene,_,_,_,_),L),
%16: Someone has precisely 300 IQCoins.
member( e(_,_, iqCoins, 300,_,_),L),
%18:The person who sold his car uses the password qwert.
member( e(_,_,_,_,qwert, car ),L),
%19:The person in the blue shirt owns Logicoins.
member( e( blue,_, logicoins,_,_ ,_),L),
%20:The man wearing the Green shirt is somewhere between the man who has Brain- Coins and the man who sold his Computer, in that order.
in_order(e(_,_, braincoins,_,_ ,_),e( green,_,_,_,_ ,_),e(_,_,_,_,_ , computer),L),
%21:The man wearing the White shirt is somewhere to the left of the man whose password is rex.
not(nextto(e(_,_,_,_, rex ,_),e(white,_,_,_,_ ,_),L)),
%17:Someone has precisely 200 Braincoins.
member( e(_,_, braincoins, 200,_,_),L).