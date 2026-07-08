#include <iostream>
using namespace std;

class Singleton {
    private:
        static Singleton* _instance;
        Singleton() = default;
    public:
        static Singleton* getInstance() {
            if(_instance == 0) {
                _instance = new Singleton();
            }
            return _instance;
        }
};

Singleton* Singleton :: _instance = 0;

int main () {
    Singleton* instance = Singleton::getInstance();

    delete instance;

    return 0;
}