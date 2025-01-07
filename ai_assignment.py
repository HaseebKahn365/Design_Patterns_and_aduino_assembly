import numpy as np
import matplotlib.pyplot as plt
from heapq import heappush, heappop
import tkinter as tk
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import time
import networkx as nx

class Node:
    def __init__(self, position, g=float('inf'), h=0):
        self.position = position
        self.g = g
        self.h = h
        self.f = g + h
        self.parent = None
    
    def __lt__(self, other):
        return self.f < other.f

class RoadNetwork:
    def __init__(self, grid_size=20):
        self.grid_size = grid_size
        self.graph = nx.grid_2d_graph(grid_size, grid_size)
        self.roads = set()
        self.intersections = set()
        
    def generate_road_network(self):
        # Clear existing roads
        self.roads.clear()
        self.intersections.clear()
        
        # Create main roads
        for i in range(self.grid_size):
            if i % 4 == 0:  # Horizontal main roads
                for j in range(self.grid_size-1):
                    self.roads.add(((i, j), (i, j+1)))
                    self.roads.add(((i, j+1), (i, j)))
            if i % 4 == 0:  # Vertical main roads
                for j in range(self.grid_size-1):
                    self.roads.add(((j, i), (j+1, i)))
                    self.roads.add(((j+1, i), (j, i)))
        
        # Add some connecting roads
        for i in range(0, self.grid_size, 4):
            for j in range(0, self.grid_size, 4):
                if i+4 < self.grid_size and j+4 < self.grid_size:
                    # Add random connecting roads
                    if np.random.random() < 0.7:
                        mid_i = i + 2
                        mid_j = j + 2
                        # Vertical connection
                        for k in range(i, i+4):
                            self.roads.add(((k, mid_j), (k+1, mid_j)))
                            self.roads.add(((k+1, mid_j), (k, mid_j)))
                        # Horizontal connection
                        for k in range(j, j+4):
                            self.roads.add(((mid_i, k), (mid_i, k+1)))
                            self.roads.add(((mid_i, k+1), (mid_i, k)))
        
        # Create intersections set
        self.intersections = set(pos for road in self.roads for pos in road)
        
        # Update graph
        self.graph = nx.Graph()
        self.graph.add_edges_from(self.roads)
    
    def get_neighbors(self, pos):
        return [n for n in self.graph.neighbors(pos)]
    
    def manhattan_distance(self, pos1, pos2):
        return abs(pos1[0] - pos2[0]) + abs(pos1[1] - pos2[1])

class PathFinder:
    def __init__(self, grid_size=20):
        self.network = RoadNetwork(grid_size)
        self.grid_size = grid_size
        
    def generate_new_network(self):
        self.network.generate_road_network()
    
    def dijkstra(self, start, goal):
        nodes = {start: Node(start, g=0)}
        open_set = [(0, start)]
        closed_set = set()
        expanded_nodes = []
        
        while open_set:
            current_cost, current_pos = heappop(open_set)
            if current_pos == goal:
                return self.reconstruct_path(nodes[current_pos]), expanded_nodes
            
            if current_pos in closed_set:
                continue
            
            closed_set.add(current_pos)
            expanded_nodes.append(current_pos)
            
            for neighbor_pos in self.network.get_neighbors(current_pos):
                if neighbor_pos in closed_set:
                    continue
                
                new_g = nodes[current_pos].g + 1
                
                if neighbor_pos not in nodes or new_g < nodes[neighbor_pos].g:
                    nodes[neighbor_pos] = Node(neighbor_pos, g=new_g)
                    nodes[neighbor_pos].parent = nodes[current_pos]
                    heappush(open_set, (new_g, neighbor_pos))
        
        return None, expanded_nodes
    
    def a_star(self, start, goal):
        nodes = {start: Node(start, g=0, h=self.network.manhattan_distance(start, goal))}
        open_set = [(nodes[start].f, start)]
        closed_set = set()
        expanded_nodes = []
        
        while open_set:
            current_f, current_pos = heappop(open_set)
            if current_pos == goal:
                return self.reconstruct_path(nodes[current_pos]), expanded_nodes
            
            if current_pos in closed_set:
                continue
            
            closed_set.add(current_pos)
            expanded_nodes.append(current_pos)
            
            for neighbor_pos in self.network.get_neighbors(current_pos):
                if neighbor_pos in closed_set:
                    continue
                
                new_g = nodes[current_pos].g + 1
                h = self.network.manhattan_distance(neighbor_pos, goal)
                
                if neighbor_pos not in nodes or new_g < nodes[neighbor_pos].g:
                    nodes[neighbor_pos] = Node(neighbor_pos, g=new_g, h=h)
                    nodes[neighbor_pos].parent = nodes[current_pos]
                    heappush(open_set, (nodes[neighbor_pos].f, neighbor_pos))
        
        return None, expanded_nodes
    
    def greedy_best_first(self, start, goal):
        nodes = {start: Node(start, g=0, h=self.network.manhattan_distance(start, goal))}
        open_set = [(nodes[start].h, start)]
        closed_set = set()
        expanded_nodes = []
        
        while open_set:
            current_h, current_pos = heappop(open_set)
            if current_pos == goal:
                return self.reconstruct_path(nodes[current_pos]), expanded_nodes
            
            if current_pos in closed_set:
                continue
            
            closed_set.add(current_pos)
            expanded_nodes.append(current_pos)
            
            for neighbor_pos in self.network.get_neighbors(current_pos):
                if neighbor_pos in closed_set:
                    continue
                
                h = self.network.manhattan_distance(neighbor_pos, goal)
                
                if neighbor_pos not in nodes:
                    nodes[neighbor_pos] = Node(neighbor_pos, g=nodes[current_pos].g + 1, h=h)
                    nodes[neighbor_pos].parent = nodes[current_pos]
                    heappush(open_set, (h, neighbor_pos))
        
        return None, expanded_nodes
    
    def reconstruct_path(self, node):
        path = []
        current = node
        while current:
            path.append(current.position)
            current = current.parent
        return path[::-1]
    
    def visualize_comparison(self):
        # Create random start and goal positions that are on the road network
        road_positions = list(self.network.intersections)
        while True:
            start = road_positions[np.random.randint(len(road_positions))]
            goal = road_positions[np.random.randint(len(road_positions))]
            if start != goal and nx.has_path(self.network.graph, start, goal):
                break
        
        algorithms = {
            "Dijkstra": self.dijkstra,
            "A*": self.a_star,
            "Greedy Best-First": self.greedy_best_first
        }
        
        results = {}
        for name, algo in algorithms.items():
            start_time = time.time()
            path, expanded = algo(start, goal)
            end_time = time.time()
            results[name] = {
                "path": path,
                "expanded": expanded,
                "time": end_time - start_time,
                "path_length": len(path) if path else float('inf')
            }
        
        fig, axes = plt.subplots(1, 3, figsize=(15, 5))
        fig.suptitle('Pathfinding Algorithm Comparison')
        
        for ax, (name, result) in zip(axes, results.items()):
                # "time": end_time - start_time, increase the precision to 6
            ax.grid(False)
            ax.set_title(f"{name}\nTime: {result['time']:.12f}s\nPath Length: {result['path_length']}")
            
            # Plot road network
            for road in self.network.roads:
                ax.plot([road[0][1], road[1][1]], [road[0][0], road[1][0]], 
                       'gray', linewidth=1, alpha=0.5)
            
            # Plot expanded nodes
            expanded_y, expanded_x = zip(*result['expanded'])
            ax.scatter(expanded_x, expanded_y, c='lightblue', 
                      alpha=0.3, s=30, label='Explored')
            
            if result['path']:
                # Plot path with gradient color
                path_coords = np.array(result['path'])
                for i in range(len(path_coords)-1):
                    progress = i / (len(path_coords)-1)
                    color = plt.cm.RdYlBu(progress)
                    ax.plot([path_coords[i][1], path_coords[i+1][1]],
                           [path_coords[i][0], path_coords[i+1][0]],
                           color=color, linewidth=3, solid_capstyle='round')
            
            # Plot start and goal with larger markers
            ax.plot(start[1], start[0], 'go', markersize=12, label='Start')
            ax.plot(goal[1], goal[0], 'ro', markersize=12, label='Goal')
            
            ax.legend()
            ax.set_xlim(-1, self.grid_size)
            ax.set_ylim(-1, self.grid_size)
        
        plt.tight_layout()
        return fig

class PathFindingGUI:
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("Pathfinding Algorithm Comparison")
        
        self.pathfinder = PathFinder()
        self.pathfinder.generate_new_network()
        
        button_frame = tk.Frame(self.root)
        button_frame.pack(side=tk.TOP, fill=tk.X)
        
        tk.Button(button_frame, text="Generate New Road Network", 
                 command=self.generate_new_map).pack(side=tk.LEFT)
        
        self.fig = None
        self.canvas = None
        self.update_plot()
        
    def generate_new_map(self):
        self.pathfinder.generate_new_network()
        self.update_plot()
        
    def update_plot(self):
        if self.canvas:
            self.canvas.get_tk_widget().destroy()
        
        self.fig = self.pathfinder.visualize_comparison()
        self.canvas = FigureCanvasTkAgg(self.fig, master=self.root)
        self.canvas.draw()
        self.canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)
        
    def run(self):
        self.root.mainloop()

if __name__ == "__main__":
    app = PathFindingGUI()
    app.run()