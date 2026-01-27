edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,f).
edge(d,g).
edge(e,g).
edge(f,g).

main_bfs(Start_node, Goal_node,Path) :-
    bfs([[Start_node]], Goal_node,Path).

bfs([[Goal_node|Preceding_nodes]|_], Goal_node, Path) :-
    reverse([Goal_node|Preceding_nodes], Path).

bfs([[Current_node|Preceding_nodes]|Path_queue], Goal_node, Path) :-
    findall([Next_node, Current_node|Preceding_nodes],
            (edge(Current_node, Next_node), \+member(Next_node, [Current_node|Preceding_nodes])),
            New_paths),
    append(Path_queue,New_paths,Updated_queue),
    bfs(Updated_queue,Goal_node,Path).