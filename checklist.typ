#set page(
  margin: (x: 1cm, y: 2cm),
  numbering: "1",
  fill: rgb("#1e1e1e"), // Dark background
)

#set text(
  font: "IBM Plex Mono",
  size: 10pt,
  fill: rgb("#e0e0e0"), // Light gray text
)

#set par(justify: true)

// Define all checklist data as variables
#let backtracking_items = (
  ("all combination of size k", false),
  ("graph coloring", true),
  ("hamiltonian cycle", false),
  ("knight tour", false),
  ("n queens", false),
  ("parentheses generator", true),
  ("permutations", false),
  ("rat in a maze", false),
  ("subset sum", false),
  ("sudoku", false),
)

#let big_integer_items = (
  ("fast factorial", true),
  ("multiply", false),
  ("poly1305", false),
)

#let bit_manipulation_items = (
  ("counting bits", true),
  ("highest set bit", true),
  ("n bits gray code", false),
  ("sum of two integers", false),
)

#let ciphers_items = (
  ("aes", false),
  ("baconian cipher", true),
  ("base64", false),
  ("blake2b", false),
  ("caesar", true),
  ("chacha", false),
  ("diffie hellman", false),
  ("hashing traits", false),
  ("kerninghan", false),
  ("morse code", true),
  ("polybius", false),
  ("RAIL fence", false),
  ("rot13", true),
  ("salsa", false),
  ("sha256", false),
  ("sha3", false),
  ("tea", false),
  ("theoretical rot13", false),
  ("transposition", false),
  ("vigenere", false),
  ("xor", true),
)

#let compression_items = (
  ("move to front", true),
  ("run length encoding", false),
)

#let conversions_items = (
  ("binary to decimal", true),
  ("binary to hexadecimal", true),
  ("decimal to binary", false),
  ("decimal to hexadecimal", false),
  ("hexadecimal to binary", false),
  ("hexadecimal to decimal", false),
  ("length conversion", false),
  ("octal to binary", false),
  ("octal to decimal", false),
  ("rgb cmyk conversion", false),
)

#let data_structures_items = (
  ("avl tree", false),
  ("binary search tree", false),
  ("b tree", false),
  ("fenwick tree", false),
  ("floyds algorithm", false),
  ("graph", false),
  ("hash table", false),
  ("heap", false),
  ("lazy segment tree", false),
  ("linked list", false),
  ("queue", false),
  ("range minimum query", false),
  ("rb tree", false),
  ("segment tree recursive", false),
  ("segment tree", false),
  ("stack using singly linked list", true),
  ("treap", false),
  ("trie", false),
  ("union find", false),
  ("veb tree", false),
)

#let probabilistic_items = (
  ("bloom filter", false),
  ("count min sketch", false),
)

#let dynamic_programming_items = (
  ("coin change", false),
  ("egg dropping", false),
  ("fibonacci", true),
  ("fractional knapsack", false),
  ("is subsequence", false),
  ("knapsack", false),
  ("longest common subsequence", false),
  ("longest common substring", false),
  ("longest continuous increasing subsequence", false),
  ("longest increasing subsequence", false),
  ("matrix chain multiply", false),
  ("maximal square", false),
  ("maximum subarray", false),
  ("minimum cost path", false),
  ("optimal bst", false),
  ("rod cutting", false),
  ("snail", false),
  ("subset generation", false),
  ("trapped rainwater", false),
  ("word break", false),
)

#let financial_items = (
  ("present value", true),
)

#let general_items = (
  ("convex hull", false),
  ("fisher yates shuffle", false),
  ("genetic", false),
  ("hanoi", false),
  ("huffman encoding", false),
  ("kadane algorithm", false),
  ("kmeans", false),
  ("mex", false),
  ("two sum", true),
)

#let geometry_items = (
  ("closest points", false),
  ("graham scan", false),
  ("jarvis scan", false),
  ("point", false),
  ("polygon points", false),
  ("ramer douglas peucker", false),
  ("segment", false),
)

#let graph_items = (
  ("astar", false),
  ("bellman ford", false),
  ("bipartite matching", false),
  ("breadth first search", false),
  ("centroid decomposition", false),
  ("decremental connectivity", false),
  ("depth first search", false),
  ("depth first search tic tac toe", false),
  ("detect cycle", false),
  ("dijkstra", false),
  ("dinic maxflow", false),
  ("disjoint set union", false),
  ("eulerian path", false),
  ("floyd warshall", false),
  ("ford fulkerson", false),
  ("graph enumeration", false),
  ("heavy light decomposition", false),
  ("kosaraju", false),
  ("lee breadth first search", false),
  ("lowest common ancestor", false),
  ("minimum spanning tree", false),
  ("prim", false),
  ("strongly connected components", false),
  ("tarjans ssc", false),
  ("topological sort", false),
  ("two satisfiability", false),
)

#let greedy_items = (
  ("job sequencing", false),
  ("stable matching", false),
)

#let machine_learning_items = (
  ("cholesky", false),
  ("k means", false),
  ("linear regression", true),
  ("logistic regression", false),
)

#let loss_function_items = (
  ("average margin ranking loss", false),
  ("hinge loss", false),
  ("huber loss", false),
  ("kl divergence loss", false),
  ("mean absolute error loss", true),
  ("mean squared error loss", true),
  ("negative log likelihood", false),
)

#let optimization_items = (
  ("adam", false),
  ("gradient descent", false),
)

#let math_items = (
  ("abs", true),
  ("aliquot sum", true),
  ("amicable numbers", false),
  ("area of polygon", false),
  ("area under curve", false),
  ("armstrong number", false),
  ("average", true),
  ("baby step giant step", false),
  ("bell numbers", false),
  ("binary exponentiation", false),
  ("binomial coefficient", false),
  ("catalan numbers", false),
  ("ceil", false),
  ("chinese remainder theorem", false),
  ("collatz sequence", false),
  ("combinations", false),
  ("cross entropy loss", false),
  ("decimal to fraction", false),
  ("doomsday", true),
  ("elliptic curve", false),
  ("euclidean distance", false),
  ("exponential linear unit", false),
  ("extended euclidean algorithm", false),
  ("factorial", false),
  ("factors", false),
  ("faster perfect numbers", false),
  ("fast fourier transform", false),
  ("fast power", false),
  ("field", false),
  ("frizzy number", false),
  ("gaussian elimination", false),
  ("gaussian error linear unit", false),
  ("gcd of n numbers", false),
  ("geometric series", false),
  ("greatest common divisor", false),
  ("huber loss", false),
  ("infix to postfix", false),
  ("interest", false),
  ("interpolation", false),
  ("interquartile range", false),
  ("karatsuba multiplication", false),
  ("lcm of n numbers", false),
  ("leaky relu", false),
  ("least square approx", false),
  ("linear sieve", false),
  ("logarithm", false),
  ("lucas series", false),
  ("matrix ops", false),
  ("mersenne primes", false),
  ("miller rabin", false),
  ("modular exponential", false),
  ("newton raphson", false),
  ("nthprime", false),
  ("pascal triangle", false),
  ("perfect cube", false),
  ("perfect numbers", false),
  ("perfect square", true),
  ("pollard rho", false),
  ("postfix evaluation", false),
  ("prime check", false),
  ("prime factors", false),
  ("prime numbers", false),
  ("quadratic residue", false),
  ("random", false),
  ("relu", false),
  ("sieve of eratosthenes", true),
  ("sigmoid", false),
  ("signum", false),
  ("simpsons integration", false),
  ("softmax", false),
  ("sprague grundy theorem", false),
  ("square pyramidal numbers", false),
  ("square root", true),
  ("sum of digits", false),
  ("sum of geometric progression", false),
  ("sum of harmonic series", false),
  ("sylvester sequence", false),
  ("tanh", false),
  ("trapezoidal integration", false),
  ("trial division", false),
  ("trig functions", false),
  ("vector cross product", false),
  ("zellers congruence algorithm", false),
)

#let navigation_items = (
  ("bearing", false),
  ("haversine", false),
)

#let number_theory_items = (
  ("compute totient", false),
  ("euler totient", false),
  ("kth factor", false),
)

#let permutations_items = (
  ("heap", false),
  ("naive", false),
  ("steinhaus johnson trotter", false),
)

#let searching_items = (
  ("binary search recursive", false),
  ("binary search", true),
  ("exponential search", false),
  ("fibonacci search", false),
  ("interpolation search", false),
  ("jump search", false),
  ("kth smallest heap", false),
  ("linear search", true),
  ("moore voting", false),
  ("quick select", false),
  ("saddleback search", false),
  ("ternary search min max recursive", false),
  ("ternary search min max", false),
  ("ternary search recursive", false),
  ("ternary search", false),
)

#let sorting_items = (
  ("bead sort", false),
  ("binary insertion sort", false),
  ("bingo sort", false),
  ("bitonic sort", false),
  ("bogo sort", true),
  ("bubble sort", true),
  ("bucket sort", false),
  ("cocktail shaker sort", false),
  ("comb sort", false),
  ("counting sort", false),
  ("cycle sort", false),
  ("dutch national flag sort", false),
  ("exchange sort", false),
  ("gnome sort", false),
  ("heap sort", false),
  ("insertion sort", false),
  ("intro sort", false),
  ("merge sort", false),
  ("odd even sort", false),
  ("pancake sort", false),
  ("patience sort", false),
  ("pigeonhole sort", false),
  ("quick sort 3 ways", false),
  ("quick sort", false),
  ("radix sort", false),
  ("selection sort", false),
  ("shell sort", false),
  ("sleep sort", false),
  ("sort utils", false),
  ("stooge sort", false),
  ("tim sort", false),
  ("tree sort", false),
  ("wave sort", false),
  ("wiggle sort", false),
)

#let string_items = (
  ("aho corasick", false),
  ("anagram", false),
  ("autocomplete using trie", false),
  ("boyer moore search", false),
  ("burrows wheeler transform", false),
  ("duval algorithm", false),
  ("hamming distance", false),
  ("isogram", false),
  ("isomorphism", false),
  ("jaro winkler distance", false),
  ("knuth morris pratt", false),
  ("levenshtein distance", false),
  ("lipogram", false),
  ("manacher", false),
  ("palindrome", false),
  ("pangram", false),
  ("rabin karp", false),
  ("reverse", false),
  ("run length encoding", false),
  ("shortest palindrome", false),
  ("suffix array manber myers", false),
  ("suffix array", false),
  ("suffix tree", false),
  ("z algorithm", false),
)

// Function to calculate percentage for a single category
#let calculate_percentage(items) = {
  let total = items.len()
  let completed = items.filter(((item, checked)) => checked).len()
  if total == 0 { 0 } else { calc.round((completed / total) * 100, digits: 1) }
}

#let count_completed(..checklists) = {
  let total = 0
  let completed = 0
  for checklist in checklists.pos() {
    for (item, checked) in checklist {
      total += 1
      if checked { completed += 1 }
    }
  }
  (completed, total)
}

// Calculate progress
#let (completed, total) = count_completed(
  backtracking_items,
  big_integer_items,
  bit_manipulation_items,
  ciphers_items,
  compression_items,
  conversions_items,
  data_structures_items,
  probabilistic_items,
  dynamic_programming_items,
  financial_items,
  general_items,
  geometry_items,
  graph_items,
  greedy_items,
  machine_learning_items,
  loss_function_items,
  optimization_items,
  math_items,
  navigation_items,
  number_theory_items,
  permutations_items,
  searching_items,
  sorting_items,
  string_items,
)

#align(center)[
  #text(size: 24pt, weight: "bold", fill: rgb("#ffffff"))[Algorithms Checklist]
  #v(0.2em)
  #text(size: 14pt, weight: "bold", fill: rgb("#4caf50"))[
    Progress: #completed/#total (#calc.round((completed / total) * 100, digits: 1)%)
  ]
  #v(0.3em)
  #text(size: 11pt, style: "italic", fill: rgb("#b0b0b0"))[A comprehensive collection of algorithm implementations]
  #v(1em)
]

// Function to create heading with percentage
#let section_heading(title, items) = [
  #set text(size: 16pt, weight: "bold", fill: rgb("#64b5f6"))
  #let percentage = calculate_percentage(items)
  #let color = if percentage == 100 { rgb("#4caf50") } else if percentage >= 50 { rgb("#ff9800") } else { rgb("#f44336") }
  #block(above: 1.5em, below: 0.8em)[
    #title #h(0.5em) #text(size: 12pt, fill: color, weight: "bold")[(#percentage%)]
  ]
]

#show heading.where(level: 2): it => [
  #set text(size: 13pt, weight: "bold", fill: rgb("#81c784")) // Light green for subheadings
  #block(above: 1.2em, below: 0.6em)[#it.body]
]

#let checklist(items) = {
  for (item, checked) in items [
    #box(width: 1.2em)[#if checked [#text(fill: rgb("#4caf50"))[☑]] else [#text(fill: rgb("#757575"))[☐]]] #item \
  ]
}

#columns(2, gutter: 1.5em)[

#section_heading("Backtracking", backtracking_items)
#checklist(backtracking_items)

#section_heading("Big Integer", big_integer_items)
#checklist(big_integer_items)

#section_heading("Bit Manipulation", bit_manipulation_items)
#checklist(bit_manipulation_items)

#section_heading("Ciphers", ciphers_items)
#checklist(ciphers_items)

#section_heading("Compression", compression_items)
#checklist(compression_items)

#section_heading("Conversions", conversions_items)
#checklist(conversions_items)

#section_heading("Data Structures", data_structures_items)
#checklist(data_structures_items)

=== Probabilistic
#checklist(probabilistic_items)

#section_heading("Dynamic Programming", dynamic_programming_items)
#checklist(dynamic_programming_items)

#section_heading("Financial", financial_items)
#checklist(financial_items)

#section_heading("General", general_items)
#checklist(general_items)

=== Permutation
#checklist(permutations_items)

#colbreak()

#section_heading("Geometry", geometry_items)
#checklist(geometry_items)

#section_heading("Graph", graph_items)
#checklist(graph_items)

#section_heading("Greedy", greedy_items)
#checklist(greedy_items)

#section_heading("Machine Learning", machine_learning_items)
#checklist(machine_learning_items)

=== Loss Function
#checklist(loss_function_items)

=== Optimization
#checklist(optimization_items)

#colbreak()

#section_heading("Math", math_items)
#checklist(math_items)

#section_heading("Navigation", navigation_items)
#checklist(navigation_items)

#section_heading("Number Theory", number_theory_items)
#checklist(number_theory_items)

#section_heading("Searching", searching_items)
#checklist(searching_items)

#section_heading("Sorting", sorting_items)
#checklist(sorting_items)

#section_heading("String", string_items)
#checklist(string_items)

]
