first([F|_], F).

last([F|R], L) :-
    last(R, L).
last([F], F).

middle([F], F).
middle([F|R], M) :-
	middle([F], R, M).
middle([F|Cl], [C|B], M) :-
    length([F|Cl], L),
    length(B, L),
    M is C.
middle([F|Cl], [C|B], M) :-
    length([F|Cl], L),
    length([C|B], L),
    M is C.
middle([F|Cl], [C|B], M) :-
    append([F|C1], [C], FC),
    middle(FC, B, M).

is_member(E, [E|R]).
is_member(E, [_|L]) :-
    is_member(E, L).

append([], L, L).
append([H|C], N, [H|R]) :-
    append(C, N, R).

reverse_append([], []).
reverse_append([O], [O]).
reverse_append([H|T], R) :-
    reverse(T, F),
	append(F, [H], R).

reverse(L, R) :-
    reverse(L, [], R).
reverse([], P, P).
reverse([O], P, [O|P]).
reverse([H|T], P, R) :-
    reverse(T, [H|P], R).

del_from(E, [], []).
del_from(E, [E], []).
del_from(E, [O], [O]).
del_from(E, [E|T], T).
del_from(E, [O|T], [O|P]) :-
    del_from(E, T, P).

del_all_from(E, [], []).
del_all_from(E, [E], []).
del_all_from(E, [O], [O]).
del_all_from(E, [E|T], P) :-
    del_all_from(E, T, P).
del_all_from(E, [O|T], [O|P]) :-
    del_all_from(E, T, P).

subs_all(E, N, [], []).
subs_all(E, N, [E], [N]).
subs_all(E, N, [O], [O]).
subs_all(E, N, [E|T], [N|T]).
subs_all(E, N, [O|T], [O|P]) :-
    subs_all(E, N, T, P).

sublist([], []).
sublist([E], L) :-
    is_member(E, L).
sublist([H|T], [H|L]) :-
    match(T, L).
sublist([H|T], [O|L]) :-
    sublist([H|T], L).
match([], _).
match([E], [E|_]).
match([H|T], [H|R]) :-
    match(T, R).

sieve(E, I) :-
	I < E.
sieve(E, [], []).
sieve(E, [I], []) :-
	sieve(E, I).
sieve(E, [I], [I]) :-
    not(sieve(E, I)).
sieve(E, [H|T], L) :-
    sieve(E, H),
    sieve(E, T, L).
sieve(E, [H|T], [H|L]) :-
    not(sieve(E, H)),
    sieve(E, T, L).

