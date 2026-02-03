edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).

heuristic(a, 10).
heuristic(b, 8).
heuristic(c, 9).
heuristic(d, 5).
heuristic(e, 11).
heuristic(f, 12).
heuristic(g, 0).

hill_climbing(Start, Path) :-
    hc_search(Start, [Start], Path).

hc_search(Node, Visited, Path) :-
    heuristic(Node, 0),
    reverse(Visited, Path).

hc_search(Current, Visited, Path) :-
    findall(H-Next,
        (edge(Current, Next), \+ member(Next, Visited), heuristic(Next, H)),
        Neighbors),
    
    keysort(Neighbors, [BestH-BestNext | _]),

    heuristic(Current, CurrentH),
    BestH < CurrentH,

    hc_search(BestNext, [BestNext | Visited], Path).