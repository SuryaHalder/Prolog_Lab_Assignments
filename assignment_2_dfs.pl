edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).
edge(c,f).
edge(e,g).
edge(f,g).

main_dfs(Source_node,Goal_node,Path):-
    dfs(Source_node,Goal_node,[Source_node],Path).

dfs(Goal_node,Goal_node,Visited_list,Path):-
    reverse(Visited_list,Path).

dfs(Current_node,Goal_node,Visited_list,Path):-
    edge(Current_node,Neighbour_node),
    \+ member(Neighbour_node,Visited_list),
    dfs(Neighbour_node,Goal_node,[Neighbour_node|Visited_list],Path).