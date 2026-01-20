% facts
human(ram).
human(shyam).

male(ram).
female(shyam).

student(ram).

% AND
man(X) :-
    human(X),
    male(X).

% OR
person(X) :-
    male(X);
    female(X).

% AND + OR
eligible(X) :-
    human(X),
    ( student(X)
    ; male(X)
    ).

% NOT
non_student(X) :-
    human(X),
    \+ student(X).
