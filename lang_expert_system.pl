notice:-
write('Explore about which language you should learn'),nl.



%hypothesises

find(Lang,hTML):-

						prop(Lang," to be used in website"),
						prop(Lang, "is to be used front end development").

find(Lang,mysql):-

						prop(Lang," to be used for database purpose").
find(Lang,asp_net):-

						prop(Lang,"to be used in website"),
						prop(Lang," is to be used back end development").
                                                prop(Lang," is to be backed by microsoft").
find(Lang,pHP):-

						prop(Lang,"to be used in website"),
						prop(Lang," is to be used back end development").

find(Lang,c):-
						prop(Lang, "is used for conventional programming"),
                                                prop(Lang," close to machine level"),
                                                prop(Lang, "provide ease of learning").




find(Lang,android):-
						prop(Lang, " to be used in app development"),
						prop(Lang, " to be used on android phones").

find(Lang,c_sahrp):-
						prop(Lang, " to be used in app development"),
						prop(Lang, " to be used on windows phones").

find(Lang,swift):-
						prop(Lang, " to be used in app development"),
						prop(Lang, " to be used on apple devices").


find(Lang,cpp):-
						prop(Lang,"is used for conventional programming"),
						prop(Lang, "should support OOP"),
                                                prop(Lang,"provide ease of learning").

find(Lang,python):-
						prop(Lang," provide ease of learning"),
						prop(Lang, "shuld be good for small project"),
						prop(Lang," can be used as scripting language"),
						prop(Lang, "should have rich library").


find(Lang,pHP):-

						prop(Lang,"to be used in website"),
						prop(Lang," is to be used back end development").

find(Lang,java):-
						prop(Lang," support OOPS"),
						prop(Lang, "learn but tough to lean"),
						prop(Lang," good for big project").


find(Lang,mATLAB):-
						prop(Lang, "is good for Graphical editing"),
						prop(Lang, "support OOPS"),
						prop(Lang,"mathematical manipulation").


find(Lang,javascript):-
						prop(Lang,"is best language when it comes to popularity"),
						prop(Lang, "provide ease of learning"),
                        prop(Lang," is a scripting language").


find(Lang,lISP):-
						prop(Lang," is a functional programming"),
						prop(Lang," provide ease of learning").



/*Ask rules*/

prop(P, Val):-ask('Does the Lang ',Val).
ask(Obj, Val):-known(Obj, Val, true),!.
ask(Obj, Val):-known(Obj, Val, false),!, fail.
ask(Obj, Val):-nl,write(Obj),write(' '),
			write( Val) , write('?(y/n)'), read(Ans), !,
			((Ans=y, assert(known(Obj, Val, true)));(assert(known(Obj, Val, false)),fail)).

diagnose:-nl,write('Finding proper language..........'),nl,find(prop,Find) ,!,nl,
			write('That lang find could be '), write(Find).
diagnose:- nl, write('Sorry, couldn’t find!!').

start:-notice,repeat, abolish(known/3),dynamic(known/3), retractall(known/3), diagnose,nl,nl, write('Try again ? (y/n)'),read(Resp),\+ Resp=y,
		nl,write('Bye ! Thanks for using this system'),abolish(known,3) .





