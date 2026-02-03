edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(f, h).

heuristic(a, 10).
heuristic(b, 8).
heuristic(c, 7).
heuristic(d, 6).
heuristic(e, 5).
heuristic(f, 3).
heuristic(g, 4).
heuristic(h, 0).

best_first(Start, Goal, Path) :-
    heuristic(Start, H),
    bfs_search([H-[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

bfs_search([_-[Goal | Path] | _], Goal, [Goal | Path]).

bfs_search([BestPath | Rest], Goal, FinalPath) :-
    expand_bfs(BestPath, Successors),
    append(Rest, Successors, NewOpenList),
    keysort(NewOpenList, SortedOpenList),
    bfs_search(SortedOpenList, Goal, FinalPath).

expand_bfs(_-[Node | Path], Successors) :-
    findall(H-[Next, Node | Path],
        (edge(Node, Next),
        \+ member(Next, Path), 
        heuristic(Next, H)),
        Successors).