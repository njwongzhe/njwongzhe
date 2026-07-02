#include <iostream>
using namespace std;

// ==========================================
// 1. Adaptee
// ==========================================

class BorrowedCharacter {
    public:
        virtual void borrowedAttack() = 0;
        virtual void borrowedDefend() = 0;
        virtual void borrowedJump() = 0;
};

class ConcreteBorrowedCharacter : public BorrowedCharacter {
    public:
        virtual void borrowedAttack() { cout << "Attack" << endl; }
        virtual void borrowedDefend() { cout << "Defend" << endl; }
        virtual void borrowedJump() { cout << "Jump" << endl; }
};

// ==========================================
// 2. Target Interface
// ==========================================

class Character {
    public:
        virtual void attack() = 0;
        virtual void defend() = 0;
        virtual void jump() = 0;
};

// ==========================================
// 3. Adapter
// ==========================================

class CharacterAdapter : public Character {
    private: 
        BorrowedCharacter* _character;
    public:
        CharacterAdapter(BorrowedCharacter* character) : _character(character) {}
        virtual void attack() { _character->borrowedAttack(); }
        virtual void defend() { _character->borrowedDefend(); }
        virtual void jump() { _character->borrowedJump(); }
};

// ==========================================
// 6. Client
// ==========================================

class GameEngine {
    public:
        void triggeredAction(Character* character) {
            character->attack();
            character->defend();
            character->jump();
        }
};

// ==========================================
// 7. Main
// ==========================================

int main() {
    GameEngine engine;

    ConcreteBorrowedCharacter pCharacter;

    // Allocate the adapter using 'new' to target the polymorphised interface
    CharacterAdapter* adaptedCharacter = new CharacterAdapter(&pCharacter);

    engine.triggeredAction(adaptedCharacter);

    // Critical Fix: Free the allocated heap memory to avoid memory leaks
    delete adaptedCharacter;

    return 0;
}