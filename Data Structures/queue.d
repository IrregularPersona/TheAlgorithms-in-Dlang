module queue;

import std.stdio;
import std.typecons : Nullable;

alias Link(T) = Node!T*;

struct Queue(T) {
    Link!T head;
    Link!T tail;
    
    void enqueue(T elem) {
        Link!T newNode = new Node!T(elem);
        
        if (tail is null) {
            head = newNode;
            tail = newNode;
        } else {
            tail.next = newNode;
            tail = newNode;
        }
    }
    
    Nullable!T dequeue() {
        if (head is null) {
            return Nullable!T.init;
        }
        
        T elem = head.element;
        head = head.next;
        
        if (head is null) {
            tail = null;
        }
        
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
    Queue!int queue;
    
    assert(queue.isEmpty());
    assert(queue.dequeue().isNull);
    
    queue.enqueue(1);
    queue.enqueue(2);
    queue.enqueue(3);
    
    assert(!queue.isEmpty());
    assert(queue.peek().get == 1);
    
    auto val = queue.dequeue();
    assert(!val.isNull && val.get == 1);
    
    val = queue.dequeue();
    assert(!val.isNull && val.get == 2);
    
    val = queue.dequeue();
    assert(!val.isNull && val.get == 3);
    
    assert(queue.isEmpty());
    assert(queue.dequeue().isNull);
    
    queue.enqueue(10);
    queue.enqueue(20);
    queue.enqueue(30);
    
    int[] expected = [10, 20, 30];
    int i = 0;
    foreach (elem; queue) {
        assert(elem == expected[i++]);
    }
    
    writeln("All tests passed");
}

void main() {
    Queue!int queue;
    
    queue.enqueue(1);
    queue.enqueue(2);
    queue.enqueue(3);
    
    writeln("Queue contents (front to back):");
    foreach (i, elem; queue) {
        writeln("  [", i, "] = ", elem);
    }
    
    writeln("\nDequeuing elements:");
    while (!queue.isEmpty()) {
        auto val = queue.dequeue();
        if (!val.isNull) {
            writeln("  dequeued: ", val.get);
        }
    }
    
    writeln("\nQueue is now empty: ", queue.isEmpty());
    
    Queue!string strQueue;
    strQueue.enqueue("First");
    strQueue.enqueue("Second");
    strQueue.enqueue("Third");
    
    foreach (str; strQueue) {
        writeln("  ", str);
    }
}

