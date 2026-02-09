#include <iostream>
#include <fstream>
using namespace std;

int main() {
    /* Output File (Binary) */
    fstream writeBinaryFile("07 - File Operation (Binary File).txt", ios::out | ios::binary);

    int num = 12345;
    writeBinaryFile.write((char *)&num, sizeof(num)); // Use "write" instead of ">>" to write binary data into files.
    // Parameter 1 - Address of where to get the data from. 
    //               The data variable must be "char". 
    //               If other than char, it must be type casted. 
    // Parameter 2 - Number of bytes to write to the file.

    writeBinaryFile.close();

    /* Input File (Binary) */
    fstream readBinaryFile("07 - File Operation (Binary File).txt", ios::in | ios::binary);

    int numBinary;
    readBinaryFile.read((char *)&numBinary, sizeof(numBinary)); // Use "read" instead of "<<" to read binary data from files.
    // Parameter 1 - Address of where to put the data being read in. 
    //               The data variable must be "char". 
    //               If other than char, it must be type casted. 
    // Parameter 2 - Number of bytes to read from the file.

    cout << numBinary; // Output: 123445

    return 0;
}