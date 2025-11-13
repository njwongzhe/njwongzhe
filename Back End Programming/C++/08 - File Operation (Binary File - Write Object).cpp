#include <iostream>
#include <fstream>
using namespace std;

class Box {
    public:
        Box() {}; // Default constructor
        Box(double w) : width(w) {};
        double getWidth() { return width; };
    private:
        double width;
};

int main() {
    Box arrBoxOriginal[3] = {Box(10), Box(20), Box(30)};

    /* Output File (Binary) */
    fstream writeObject("08 - File Operation (Binary File - Write Object).txt", ios::out | ios::binary);

    for(int i = 0; i < 3; i++)
        writeObject.write((char *)(arrBoxOriginal + i), sizeof(Box)); // "arrBox" already is an address since it is an array. There is no need to use "&".
    
    // OR // writeObject.write((char *)arrBoxOriginal, 3 * sizeof(Box)); // Write all objects at once. Thus, no loop is required.

    writeObject.close();

    /* Input File (Binary) */
    fstream readObject("08 - File Operation (Binary File - Write Object).txt", ios::in | ios::binary);

    Box arrBoxNew[3];

    for(int i = 0; i < 3; i++)
        readObject.read((char *)(arrBoxNew + i), sizeof(Box));
    
    // OR // readObject.read((char *)arrBoxNew, 3 * sizeof(Box)); // Read all objects at once. Thus, no loop is required.
    
    readObject.close();

    /* Show Read Result */
    for(int i = 0; i < 3; i++)
        cout << arrBoxNew[i].getWidth() << endl;

    return 0;
}