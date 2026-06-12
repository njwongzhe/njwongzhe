#include <iostream>
#include <fstream>
using namespace std;

void writeFileOpen(fstream &, string); // Output File open and detect error function.
void readFileOpen(fstream &, string);  // Input File open and detect error function.

int main() {
    /* Output File */
    fstream writeFile; 
    writeFileOpen(writeFile, "06 - File Operation.txt"); // Output File open and detect error function.

    writeFile << "String"; // Write data into file.

    char letterWFile = 'A'; 
    writeFile.put(letterWFile); // "put" write a single character to an output file.

    writeFile.close();

    /* Input File */
    fstream readFile; 
    readFileOpen(readFile, "06 - File Operation.txt"); // Input File open and detect error function.

    char letterRFile;
    if(readFile.get(letterRFile)) // "get" read a single character from an input file.
        cout << "Output \"get\" : " << letterRFile << endl; // Output: S

    string strFile; 
    readFile >> strFile; // Read data from file.
    cout << "Output Left  : " << strFile << endl; // Output: tringA // "S" already read by "letterRFile".

    readFile.close();

    remove("06 - File Operation.txt"); // Delete file.

    /* Write & Read Data With Whitespace & Newline */
    writeFileOpen(writeFile, "06 - File Operation.txt");
    writeFile << "This is a short paragraph with whitespace and newline.\nDone.";
    writeFile.close();

    readFileOpen(readFile, "06 - File Operation.txt");

    cout << endl << "Output Left  : " << endl;

    // "eof" return 0 if not completely read the full text in document. 
    // The reading process will end when meet newline. Thus, use loop to read multiple line of text.
    while(!readFile.eof()) { 
        string data;
        getline(readFile, data); // "getline" reads input including whitespace.
        cout << data << endl;
    }
    
    writeFile.close();

    return 0;
}



/* Passing File Stream Objects to Functions */

// Output File open and detect error function.
void writeFileOpen(fstream &fileVar, string fileName) { // Always pass file stream objects as reference variable to function since it pass an address.
    fileVar.open(fileName, ios::out);

    if(fileVar.fail()) cout << "\"" << fileName << "\" open failed."  << endl;
    else               cout << "\"" << fileName << "\" open success." << endl;
}

// Input File open and detect error function.
void readFileOpen(fstream &fileVar, string fileName) { // Always pass file stream objects as reference variable to function since it pass an address.
    fileVar.open(fileName, ios::in);

    if(fileVar.fail()) cout << "\"" << fileName << "\" open failed."  << endl;
    else               cout << "\"" << fileName << "\" open success." << endl;
}