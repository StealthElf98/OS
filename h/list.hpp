//
// Created by os on 7/1/24.
//

#ifndef OS_LIST_HPP
#define OS_LIST_HPP

class TCB;

class List {
private:
    struct Elem {
        TCB *data;
        Elem *next;

        Elem(TCB *data, Elem *next);
    };

    Elem *head, *tail;

public:
    List();
    List(const List &) = delete;
    List &operator=(const List &) = delete;

    void addFirst(TCB *data);
    void addLast(TCB *data);
    TCB *removeFirst();
    TCB *peekFirst();
    TCB *removeLast();
    TCB *peekLast();
};


#endif //OS_LIST_HPP
