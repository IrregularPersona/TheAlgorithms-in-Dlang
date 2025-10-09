import std.stdio;
import std.typecons : Nullable;

// rust impl creates a doubly linked list

alias Link(T) = Node!T*;

struct List(T) {
    uint length;
    Link!T head;
    Link!T tail;

    void push(T elem) {
        Link!T newNode = new Node!T(elem);

        if (head is null) {
            head = newNode;
            tail = newNode;
        } else {
            newNode.next = head;
            head.prev = newNode;
            head = newNode;
        }

        length++;
    }

    Nullable!T pop() {
        if (head is null) {
            return Nullable!T.init; 
        }

        T data = head.data;
        head = head.next;

        if (head !is null) {
            head.prev = null; 
        } else {
            tail = null; 
        }

        length--;
        return Nullable!T(data);
    }

    void insertTail(T elem) {
        Link!T newNode = new Node!T(elem);
        
        if (tail is null) {

            head = newNode;
            tail = newNode;
        } else {
            tail.next = newNode;
            newNode.prev = tail;
            tail = newNode;
        }
        
        length++;
    }

    void insertAt(size_t index, T elem) {
        if (index == 0) {
            push(elem);
            return;
        }
        
        if (index >= length) {
            insertTail(elem); 
            return;
        }
        
        Link!T current = head;
        for (size_t i = 0; i < index - 1; i++) {
            current = current.next;
        }
        
        Link!T newNode = new Node!T(elem);
        newNode.next = current.next;
        newNode.prev = current;
        
        if (current.next !is null) {
            current.next.prev = newNode;
        }
        current.next = newNode;
        
        length++;
    }
}

struct Node(T) {
    T data;
    Link!T next;
    Link!T prev;

    this(T data) {
        this.data = data;
        this.next = null;
        this.prev = null;
    }
}

unittest
{
    List!int list;
    
    
    assert(list.length == 0);
    assert(list.pop().isNull);
    
    
    list.push(1);
    assert(list.length == 1);
    list.push(2);
    list.push(3);
    assert(list.length == 3);
    
    
    auto val = list.pop();
    assert(!val.isNull && val.get == 3);
    assert(list.length == 2);
    
    
    list.insertTail(10);
    assert(list.length == 3);
    assert(list.head.data == 2);
    assert(list.tail.data == 10);
    
    
    list.insertAt(0, 99);  
    assert(list.head.data == 99);
    assert(list.length == 4);
    
    list.insertAt(2, 50);  
    assert(list.length == 5);
    
    list.insertAt(100, 88);  
    assert(list.tail.data == 88);
    assert(list.length == 6);
    
    
    List!int emptyList;
    emptyList.push(1);
    emptyList.pop();
    assert(emptyList.head is null);
    assert(emptyList.tail is null);
    assert(emptyList.length == 0);
    
    
    List!string strList;
    strList.push("world");
    strList.push("hello");
    strList.insertTail("!");
    assert(strList.length == 3);
    
    auto str = strList.pop();
    assert(!str.isNull && str.get == "hello");
    
    writeln("All tests passed");
}

void main() {
    List!int list;
    
    list.push(1);
    list.push(2);
    list.push(3);
    writeln("Length: ", list.length);
    writeln("Head: ", list.head.data, ", Tail: ", list.tail.data);
    
    
    writeln("\nInserting 99 at tail...");
    list.insertTail(99);
    writeln("Length: ", list.length);
    writeln("Head: ", list.head.data, ", Tail: ", list.tail.data);
    
    
    writeln("\nInserting 50 at index 2...");
    list.insertAt(2, 50);
    writeln("Length: ", list.length);
    
    
    writeln("\nList (forward traversal from head):");
    Link!int current = list.head;
    while (current !is null) {
        writeln("  -> ", current.data);
        current = current.next;
    }
    
    
    writeln("\nList (backward traversal from tail):");
    current = list.tail;
    while (current !is null) {
        writeln("  <- ", current.data);
        current = current.prev;
    }
    
    
    writeln("\nPopping elements:");
    while (list.length > 0) {
        auto val = list.pop();
        if (!val.isNull) {
            writeln("  Popped: ", val.get, " (remaining: ", list.length, ")");
        }
    }
    
    writeln("\nList is now empty!");
    
    List!string strList;
    strList.push("World");
    strList.push("Hello");
    strList.insertTail("from");
    strList.insertTail("D!");
    
    writeln("String list:");
    auto strCurrent = strList.head;
    while (strCurrent !is null) {
        write(strCurrent.data, " ");
        strCurrent = strCurrent.next;
    }
    writeln();
}
