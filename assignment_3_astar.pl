edge(a, b, 2).
edge(a, c, 5).
edge(b, c, 2).
edge(b, d, 4).
edge(c, d, 5).
edge(d, g, 1).

heuristic(a, 6).
heuristic(b, 4).
heuristic(c, 4).
heuristic(d, 1).
heuristic(g, 0).

a_star(Start, Goal, Path, TotalCost) :-
    heuristic(Start, H),
    search([H-[0, Start]], Goal, ReversePath, TotalCost),
    reverse(ReversePath, Path).

search([_-[G, Goal | Path] | _], Goal, [Goal | Path], G).

search([BestPath | Rest], Goal, FinalPath, TotalCost) :-
    expand(BestPath, Successors),
    append(Rest, Successors, NewQueue),
    keysort(NewQueue, SortedQueue), 
    search(SortedQueue, Goal, FinalPath, TotalCost).

expand(_-[G, Node | Path], Successors) :-
    findall(F-[NewG, Next, Node | Path],
        (edge(Node, Next, StepCost),
        \+ member(Next, Path),
        NewG is G + StepCost,
        heuristic(Next, H),
        F is NewG + H),
        Successors).