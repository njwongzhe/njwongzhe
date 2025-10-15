#include <iostream>
#include <fstream>
using namespace std;

// Sequential Access - Start at beginning of file and go through data in file in order to end.
// Random Access     - Access data in a file in any order.

// Both keyword use to move the current read / write position to a specific position (in Bytes) in a file.
// seekg() - (seek get) It used with input files.
// seekp() - (seek put) It used with output files.
// Parameter 1 - Number of bytes to move. (+ve Value Move Forward / -ve Value Move Backward)
// Parameter 2 - Mode Flag. It set the starting point to compute offset.
//             - Example Flag :
//               ios::beg - Beginning of file.
//               ios::cur - Current position.
//               ios::end - End of file.

// If "eof()" is true, it must use "clear()" before "seekg()" or "seekp()".

// tellg() - Return current byte position in input file.
// tellp() - Return current byte position in output file.

int main() {
    /* Output File (Binary) */
    fstream writeBinaryFile("09 - File Operation (Random Access File).txt", ios::out | ios::binary);

    int num = 12345;               // 4 bytes Integer // Hexadecimal : 00 00 30 39
    writeBinaryFile.write((char *)&num, sizeof(num)); // Write in data based on Little-Endian (Intel / AMD): 
                                                      // Byte 0 : 39h
                                                      // Byte 1 : 30h
                                                      // Byte 2 : 00h
                                                      // Byte 3 : 00h
                                                      // Byte 4 : Next Start (Empty Now)

    cout << "Current Location: " << writeBinaryFile.tellp() << endl; // Current Location at Byte 4 since complete write in a 4 bytes integer.

    writeBinaryFile.seekp(0, ios::beg); // Set the current position to beginning (ios::beg).
    cout << "Current Location: " << writeBinaryFile.tellp() << endl; // Current Location at Byte 0.

    writeBinaryFile.seekp(0, ios::end); // Set the current position to end (ios::end).
    cout << "Current Location: " << writeBinaryFile.tellp() << endl; // Current Location at Byte 4.

    writeBinaryFile.seekp(1, ios::beg); // Set the current position to beginning (ios::beg) and move to next 1 byte (Byte 1) from beginning.
    cout << "Current Location: " << writeBinaryFile.tellp() << endl; // Current Location at Byte 1.

    int numOverwrite = 0x50; // 4 bytes Integer // Hexadecimal : 00 00 00 50
    writeBinaryFile.write((char *)&numOverwrite, sizeof(num)); // Write in data based on Little-Endian (Intel / AMD): 
                                                               // Byte 0 : 39h
                                                               // Byte 1 : 30h -> 50h
                                                               // Byte 2 : 00h -> 00h
                                                               // Byte 3 : 00h -> 00h
                                                               // Byte 4 : Next Start (Empty Now) -> 00h
                                                               // Byte 5 : Next Start (Empty Now)
                                                               // Overwrite "Byte 1" until "Byte 4".

    writeBinaryFile.seekp(0, ios::end); // Set the current position to end (ios::end).
    cout << "Current Location: " << writeBinaryFile.tellp() << endl; // Current Location at Byte 5.

    writeBinaryFile.close();

    /* Input File (Binary) */
    fstream readBinaryFile("09 - File Operation (Random Access File).txt", ios::in | ios::binary);

    int numBinary;
    readBinaryFile.read((char *)&numBinary, sizeof(numBinary)); // Read data based on Little-Endian (Intel / AMD): 
                                                                // Byte 0 : 39h
                                                                // Byte 1 : 50h
                                                                // Byte 2 : 00h
                                                                // Byte 3 : 00h
                                                                // Byte 4 : 00h
                                                                // Byte 5 : Next Start (Empty Now)
                                                                // Hexadecimal : 00 00 50 39 // Decimal : 20537
    cout << numBinary << endl; // Output: 20537

    readBinaryFile.seekg(-1, ios::end); 
    cout << "Current Location: " << readBinaryFile.tellg() << endl; // Current Location at Byte 4.

    readBinaryFile.read((char *)&numBinary, sizeof(numBinary)); 
    cout << numBinary << endl; // Output: 20480
    // The final output 20480 occurs because we are started reading at byte 4.
    // Since only 1 byte was available (With Value), thus remaining 3 bytes of int kept old values from before:
    // "numBinary" Before : 00 00 50 39 in Hexadecimal // Only last byte "39h" able to exchange.
    // "numBinary" After  : 00 00 50 00 in Hexadecimal // Decimal : 20480

    readBinaryFile.close();

    return 0;
}