from heapq import heappush, heappop
from collections import defaultdict
import math

class Graph:
    def __init__(self):
        self.edges = defaultdict(list)
        self.weights = {}
    
    def add_edge(self, from_node, to_node, weight):
        self.edges[from_node].append(to_node)
        self.weights[(from_node, to_node)] = weight

def dijkstra(graph, initial):
    """
    Implementation of Dijkstra's algorithm
    Returns shortest distances and paths from initial node to all other nodes
    """
    distances = {initial: 0}
    pq = [(0, initial)]
    paths = {initial: [initial]}
    visited = set()

    while pq:
        current_distance, current = heappop(pq)
        
        if current in visited:
            continue
            
        visited.add(current)
        
        for neighbor in graph.edges[current]:
            if neighbor in visited:
                continue
                
            weight = graph.weights[(current, neighbor)]
            distance = current_distance + weight
            
            if neighbor not in distances or distance < distances[neighbor]:
                distances[neighbor] = distance
                paths[neighbor] = paths[current] + [neighbor]
                heappush(pq, (distance, neighbor))
    
    return distances, paths

def greedy_best_first_search(graph, start, goal, heuristic):
    """
    Implementation of Greedy Best-First Search
    Uses only heuristic to guide search
    """
    visited = set()
    pq = [(heuristic(start, goal), start)]
    paths = {start: [start]}
    
    while pq:
        _, current = heappop(pq)
        
        if current == goal:
            return paths[current]
            
        if current in visited:
            continue
            
        visited.add(current)
        
        for neighbor in graph.edges[current]:
            if neighbor in visited:
                continue
                
            if neighbor not in paths:
                paths[neighbor] = paths[current] + [neighbor]
                heappush(pq, (heuristic(neighbor, goal), neighbor))
    
    return None

def a_star(graph, start, goal, heuristic):
    """
    Implementation of A* Search
    Combines actual path cost with heuristic estimate
    """
    visited = set()
    pq = [(0 + heuristic(start, goal), 0, start)]
    paths = {start: [start]}
    g_scores = {start: 0}
    
    while pq:
        f_score, g_score, current = heappop(pq)
        
        if current == goal:
            return paths[current]
            
        if current in visited:
            continue
            
        visited.add(current)
        
        for neighbor in graph.edges[current]:
            if neighbor in visited:
                continue
                
            tentative_g = g_score + graph.weights[(current, neighbor)]
            
            if neighbor not in g_scores or tentative_g < g_scores[neighbor]:
                g_scores[neighbor] = tentative_g
                f_score = tentative_g + heuristic(neighbor, goal)
                paths[neighbor] = paths[current] + [neighbor]
                heappush(pq, (f_score, tentative_g, neighbor))
    
    return None

# Example heuristic function (Manhattan distance)
def manhattan_distance(node1, node2):
    x1, y1 = node1
    x2, y2 = node2
    return abs(x2 - x1) + abs(y2 - y1)

# Example usage:
if __name__ == "__main__":
    # Create a sample graph
    g = Graph()
    g.add_edge((0,0), (0,1), 1)
    g.add_edge((0,1), (1,1), 1)
    g.add_edge((1,1), (1,2), 1)
    
    # Run algorithms
    start = (0,0)
    goal = (1,2)
    
    # Dijkstra
    distances, paths = dijkstra(g, start)
    
    # Greedy Best-First Search
    path_greedy = greedy_best_first_search(g, start, goal, manhattan_distance)
    
    # A*
    path_astar = a_star(g, start, goal, manhattan_distance)