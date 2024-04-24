my_graph = {
    'A': [('B', 3), ('D', 1)],
    'B': [('A', 3), ('C', 4)],
    'C': [('B', 4), ('D', 7)],
    'D': [('A', 1), ('C', 7)]
}

my_graph = {
    'A': [('B', 5), ('C', 3), ('E', 11)],
    'B': [('A', 5), ('C', 1), ('F', 2)],
    'C': [('A', 3), ('B', 1), ('D', 1), ('E', 5)],
    'D': [('C', 1), ('E', 9), ('F', 3)],
    'E': [('A', 11), ('C', 5), ('D', 9)],
    'F': [('B', 2), ('D', 3)]
}

# Algorithm explanation:
# https://www.freecodecamp.org/news/dijkstras-shortest-path-algorithm-visual-introduction/
# https://www.freecodecamp.org/news/dijkstras-algorithm-explained-with-a-pseudocode-example/

def shortest_path(graph, start, target=''):
    # List of unvisited nodes. We will remove the nodes that have been visited.
    unvisited = list(graph)
    # Dictionary to keep track of the distances between start node and other nodes.
    distances = {node: 0 if node == start else float('inf') for node in graph}
    # Dictionary to keep track of the shortest distance path from start node
    paths = {node: [] for node in graph}
    # Path from source to source
    paths[start].append(start)
    
    # Loop through the unvisited nodes
    while unvisited:
        # select node to visit based on the distances
        current = min(unvisited, key=distances.get)
        for node, distance in graph[current]:
            if distance + distances[current] < distances[node]:
                distances[node] = distance + distances[current]
                if paths[node] and paths[node][-1] == node:
                    paths[node] = paths[current][:]
                else:
                    paths[node].extend(paths[current])
                paths[node].append(node)
        unvisited.remove(current)
    
    print(f'Unvisited: {unvisited}\nDistances: {distances}\nPaths: {paths}')
    
    targets_to_print = [target] if target else graph
    for node in targets_to_print:
        if node == start:
            continue
        print(f'\n{start}-{node} distance: {distances[node]}\nPath: {" -> ".join(paths[node])}')
    return distances, paths

shortest_path(my_graph, 'A')
