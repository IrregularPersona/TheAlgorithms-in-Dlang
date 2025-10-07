import std.stdio;
import std.typecons : Nullable;

alias Link(T) = Node!T*;

struct Stack(T) {
    Link!T head;
    
    void push(T elem) {
        Node!T* newNode = new Node!T(elem, head);
        head = newNode;
    }
    
    Nullable!T pop() {
        if (head is null) {
            return Nullable!T.init;  // return null
        }
        
        T elem = head.element;
        head = head.next;
        return Nullable!T(elem);
    }
    
    Nullable!T peek() const {
        if (head is null) {
            return Nullable!T.init;
        }
        return Nullable!T(head.element);
    }
    
    bool isEmpty() const {
        return head is null;
    }
    
    int opApply(scope int delegate(T) dg) {
        int result = 0;
        for (Link!T current = head; current !is null; current = current.next) {
            result = dg(current.element);
            if (result) break;
        }
        return result;
    }
    
    int opApply(scope int delegate(size_t, T) dg) {
        int result = 0;
        size_t i = 0;
        for (Link!T current = head; current !is null; current = current.next) {
            result = dg(i++, current.element);
            if (result) break;
        }
        return result;
    }
}

struct Node(T) {
    T element;
    Link!T next;  
}



unittest {
    Stack!int stack;
    
    assert(stack.isEmpty());
    assert(stack.pop().isNull);
    
    stack.push(1);
    stack.push(2);
    stack.push(3);
    
    assert(!stack.isEmpty());
    assert(stack.peek().get == 3);
    
    auto val = stack.pop();
    assert(!val.isNull && val.get == 3);
    
    val = stack.pop();
    assert(!val.isNull && val.get == 2);
    
    val = stack.pop();
    assert(!val.isNull && val.get == 1);
    
    assert(stack.isEmpty());
    assert(stack.pop().isNull);
    
    // iteration test
    stack.push(10);
    stack.push(20);
    stack.push(30);
    
    int[] expected = [30, 20, 10];
    int i = 0;
    foreach (elem; stack) {
        assert(elem == expected[i++]);
    }
}

void main() {
    Stack!int stack;
    
    writeln("Pushing 1, 2, 3...");
    stack.push(1);
    stack.push(2);
    stack.push(3);
    
    writeln("stack contents (top to bottom):");
    foreach (i, elem; stack) {
        writeln("  [", i, "] = ", elem);
    }
    
    writeln("\n popping elements:");
    while (!stack.isEmpty()) {
        auto val = stack.pop();
        if (!val.isNull) {
            writeln("  popped: ", val.get);
        }
    }
    
    writeln("\nstack is now empty: ", stack.isEmpty());
    
    // with strings
    writeln("\n--- testing with strings ---");
    Stack!string strStack;
    strStack.push("Hello");
    strStack.push("World");
    strStack.push("!");
    
    foreach (str; strStack) {
        writeln("  ", str);
    }
}
