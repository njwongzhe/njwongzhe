#include <iostream>
#include <iomanip>
using namespace std;

class Account {
    private:
        string accountName;
        string accountNumber;
        int accountType;
        float accountBalance;

    public:
        /* Constructor 1 (Initializer List) */
        Account()
        : accountName("Default"), accountNumber("0"), accountType(0), accountBalance(0) { // Initializer List
            cout << "Constructor 1 Executed Successfully" << endl; 
        }; 

        /* Constructor 1 (Default) */                              /* 
        Account() {
            accountName = "Default"; 
            accountNumber = "0"; 
            accountType = 0;
            accountBalance = 0;
            cout << "Constructor 1 Executed Successfully" << endl; 
        };                                                         */

        /* Constructor 2 (Initializer List) */
        Account(string accName, string accNum, int accType, float accBalance) 
        : accountName(accName), accountNumber(accNum), accountType(accType), accountBalance(accBalance) { // Initializer List
            cout << "Constructor 2 Executed Successfully" << endl; 
        }; 

        /* Constructor 2 (Default) */                                           /*
        Account(string accName, string accNum, int accType, float accBalance) {
            accountName = accName; 
            accountNumber = accNum; 
            accountType = accType;
            accountBalance = accBalance;
            cout << "Constructor 2 Executed Successfully" << endl; 
        };                                                                      */
                                                         
        float getBalance();
        void withdraw(float amount);
        void deposit(float amount);
        void printDetail();
};

int main() {
    return 0;
}