#include <iostream>
#include <cstdlib> // Required for rand() and srand().

using namespace std;

const int MAX_CHARACTER = 100;

// ==========================================
// 1. Prototype Interfaces
// ==========================================

class Character {
    public:
        Character() = default;
        virtual ~Character() = default; 
        virtual void attack() = 0;
        virtual Character* clone() = 0;
};

// ==========================================
// 2. Concrete Prototype
// ==========================================

class EnemyCharacter : public Character {
    public:
        virtual void attack() override {
            cout << "Enemy attack." << endl;
        }
        virtual Character* clone() override {
            return new EnemyCharacter(*this);
        }
};

class TeammateCharacter : public Character {
    public:
        virtual void attack() override {
            cout << "Teammate attack." << endl;
        }
        virtual Character* clone() override {
            return new TeammateCharacter(*this);
        }
};

// ==========================================
// 6. Client
// ==========================================

class GameEngine {
    private: 
        Character* registeredCharacter[MAX_CHARACTER];
    public: 
        Character* generateNextEnemy() {
            int nextCharacterLocation = rand() % MAX_CHARACTER;
            return registeredCharacter[nextCharacterLocation]->clone();
        }
};

// ==========================================
// 7. Main
// ==========================================

int main() {

    // Properly instantiate the engine object using 'new' to avoid a segmentation fault.
    GameEngine* engine = new GameEngine();

    // Capture the returned dynamically allocated pointer to prevent memory leaks.
    Character* spawnedCharacter = engine->generateNextEnemy();

    // Clean up the cloned character memory safely.
    delete spawnedCharacter;

    // Clean up the engine object memory safely.
    delete engine;

    return 0;
}