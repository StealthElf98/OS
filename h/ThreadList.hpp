//
// Created by os on 9/7/24.
//

#ifndef OS_THREADLIST_HPP
#define OS_THREADLIST_HPP

class Thread;

class ThreadList {
private:
    struct Elem {
        Thread *data;
        Elem *next;

        Elem(Thread *data, Elem *next);
    };

    Elem *head, *tail;

public:
    ThreadList();
    ThreadList(const ThreadList &) = delete;
    ThreadList &operator=(const ThreadList &) = delete;

    void addFirst(Thread *data);
    void addLast(Thread *data);
    Thread *removeFirst();
    Thread *peekFirst();
    Thread *removeLast();
    Thread *peekLast();
};

#endif //OS_THREADLIST_HPP
