//
// Created by os on 9/7/24.
//
#include "../h/ThreadList.hpp"

// Elem constructor
ThreadList::Elem::Elem(Thread *data, Elem *next) : data(data), next(next) {}

// ListaTCB constructor
ThreadList::ThreadList() : head(0), tail(0) {}

// Add element to the front of the list
void ThreadList::addFirst(Thread *data) {
    Elem *elem = new Elem(data, head);
    head = elem;
    if (!tail) {
        tail = head;
    }
}

// Add element to the end of the list
void ThreadList::addLast(Thread *data) {
    Elem *elem = new Elem(data, 0);
    if (tail) {
        tail->next = elem;
        tail = elem;
    } else {
        head = tail = elem;
    }
}

// Remove and return the first element from the list
Thread *ThreadList::removeFirst() {
    if (!head) {
        return 0;
    }

    Elem *elem = head;
    head = head->next;
    if (!head) {
        tail = 0;
    }

    Thread *ret = elem->data;
    delete elem;
    return ret;
}

// Peek at the first element without removing it
Thread *ThreadList::peekFirst() {
    if (!head) {
        return 0;
    }
    return head->data;
}

// Remove and return the last element from the list
Thread *ThreadList::removeLast() {
    if (!head) {
        return 0;
    }

    Elem *prev = 0;
    for (Elem *curr = head; curr && curr != tail; curr = curr->next) {
        prev = curr;
    }

    Elem *elem = tail;
    if (prev) {
        prev->next = 0;
    } else {
        head = 0;
    }
    tail = prev;

    Thread *ret = elem->data;
    delete elem;
    return ret;
}

// Peek at the last element without removing it
Thread *ThreadList::peekLast() {
    if (!tail) {
        return 0;
    }
    return tail->data;
}