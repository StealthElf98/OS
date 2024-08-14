//
// Created by os on 8/14/24.
//
#include "../h/list.hpp"

// Elem constructor
ListaTCB::Elem::Elem(TCB *data, Elem *next) : data(data), next(next) {}

// ListaTCB constructor
ListaTCB::ListaTCB() : head(0), tail(0) {}

// Add element to the front of the list
void ListaTCB::addFirst(TCB *data) {
    Elem *elem = new Elem(data, head);
    head = elem;
    if (!tail) {
        tail = head;
    }
}

// Add element to the end of the list
void ListaTCB::addLast(TCB *data) {
    Elem *elem = new Elem(data, 0);
    if (tail) {
        tail->next = elem;
        tail = elem;
    } else {
        head = tail = elem;
    }
}

// Remove and return the first element from the list
TCB *ListaTCB::removeFirst() {
    if (!head) {
        return 0;
    }

    Elem *elem = head;
    head = head->next;
    if (!head) {
        tail = 0;
    }

    TCB *ret = elem->data;
    delete elem;
    return ret;
}

// Peek at the first element without removing it
TCB *ListaTCB::peekFirst() {
    if (!head) {
        return 0;
    }
    return head->data;
}

// Remove and return the last element from the list
TCB *ListaTCB::removeLast() {
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

    TCB *ret = elem->data;
    delete elem;
    return ret;
}

// Peek at the last element without removing it
TCB *ListaTCB::peekLast() {
    if (!tail) {
        return 0;
    }
    return tail->data;
}