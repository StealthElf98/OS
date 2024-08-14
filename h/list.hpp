//
// Created by os on 7/1/24.
//

#ifndef OS_LIST_HPP
#define OS_LIST_HPP

class TCB;

class ListaTCB {
private:
    struct Elem {
        TCB *data;
        Elem *next;

        Elem(TCB *data, Elem *next);
    };

    Elem *head, *tail;

public:
    ListaTCB();
    ListaTCB(const ListaTCB &) = delete;
    ListaTCB &operator=(const ListaTCB &) = delete;

    void addFirst(TCB *data);
    void addLast(TCB *data);
    TCB *removeFirst();
    TCB *peekFirst();
    TCB *removeLast();
    TCB *peekLast();
};


#endif //OS_LIST_HPP
