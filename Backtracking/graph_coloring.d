import std.stdio;

void printSolution(const int[] color_arr) {
    writeln("Solution found:");
    foreach(i, color; color_arr) {
        writefln("Vertex %d -> Color %d", i, color);
    }
    writeln();
}

bool isSafe(int vertex, const int[][] graph, const int[] color_arr, int current_color) {
    foreach(i, connected; graph[vertex]) {
        if (connected && current_color == color_arr[i]) {
            return false;
        }
    }
    return true;
}

void graphColoring(const int[][] graph, int num_colors, ref int[] color_arr, int vertex) {
    if (vertex == graph.length) {
        printSolution(color_arr);
        return;
    }

    foreach(c; 1 .. num_colors + 1) {
        if (isSafe(vertex, graph, color_arr, c)) {
            color_arr[vertex] = c;                                    
            graphColoring(graph, num_colors, color_arr, vertex + 1);  
            color_arr[vertex] = 0;                                    
        }
    }
}

unittest {
    int[][] graph = [
        [0, 1, 1, 1],
        [1, 0, 1, 0],
        [1, 1, 0, 1],
        [1, 0, 1, 0]
    ];

    int m = 3;  
    int[] color = new int[4];  
    
    graphColoring(graph, m, color, 0);
    
    writeln("unittest completed.");
}

void main() {
    // example 1: Triangle
    int[][] triangle = [
        [0, 1, 1],
        [1, 0, 1], 
        [1, 1, 0]
    ];
    int[] triangle_colors = new int[3];
    graphColoring(triangle, 3, triangle_colors, 0);
    
    // example 2: Square 
    int[][] square = [
        [0, 1, 0, 1],
        [1, 0, 1, 0],
        [0, 1, 0, 1],
        [1, 0, 1, 0]
    ];
    int[] square_colors = new int[4];
    graphColoring(square, 2, square_colors, 0);
   
}
