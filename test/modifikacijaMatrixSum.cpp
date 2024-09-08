//
// Created by os on 9/8/24.
//
#include "../h/TCB.hpp"
#include "../test/printing.hpp"

static int n = 0;

struct MatrixStruct {
    int** matrix;
    //int sum;
    int id;
};
class MatrixThread: public Thread {
    MatrixStruct* matrixStruct;

    int id;
public:
    MatrixThread(MatrixStruct* m, int id):Thread() {
        this->matrixStruct = m;
        this->id = id;
    }

    void run() override {
        MatrixThreadWorkA();
    }

    void MatrixThreadWorkA() {
        int sum = 0;
        for(int i = 0; i < 10; i++) {
            sum+=matrixStruct->matrix[id][i];
        }
        matrixStruct->matrix[id][0] = sum;
        //matrixStruct->sum += sum;
        printString("Worker ");
        printInt(id);
        printString(" zavrsio!\n");
        n++;
    }
};

void modifikacijaMatrixSum() {
    Thread *threads[10];

    auto* matrixStruct = new MatrixStruct;
    //matrixStruct->sum = 0;
    matrixStruct->matrix = new int*[10];
    for(int i = 0; i < 10; i++) {
        matrixStruct->matrix[i] = new int[10];
        for(int j = 0; j < 10; j++) {
            matrixStruct->matrix[i][j] = i+j;
        }
    }

    for(int i = 0; i < 10; i++) {
        threads[i] = new MatrixThread(matrixStruct, i);
    }

    for(int i = 0; i < 10; i++) {
        threads[i]->start();
    }

    while(n<10) {
        thread_dispatch();
    }

    int suma = 0;
    printString("Sabiranje.....\n");

    for(int i = 0; i < 10; i++) {
        suma+=matrixStruct->matrix[i][0];
    }
    printString("\nZbir: ");
    printInt(suma);
    printString("\n");
}