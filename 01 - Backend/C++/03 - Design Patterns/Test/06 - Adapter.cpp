#include <iostream>
using namespace std;

class BorrowedCharacter {
    public:
        BorrowedCharacter() = default;
        virtual ~BorrowedCharacter() = default;
        virtual void borrowedAttack() = 0;
};

class ConcreteBorrowedCharacter : public BorrowedCharacter {
    public:
        ConcreteBorrowedCharacter() = default;
        virtual ~ConcreteBorrowedCharacter() = default;
        virtual void borrowedAttack() { cout << "Attack" << endl; };
};

class Character {
    public:
        Character() = default;
        virtual ~Character() = default;
        virtual void attack() = 0;
};

class CharacterAdapter : public Character {
    private:
        BorrowedCharacter* _character;
    public:
        CharacterAdapter(BorrowedCharacter* c) : _character(c) {};
        virtual ~CharacterAdapter() = default;
        virtual void attack() { _character->borrowedAttack(); }
};

class GameEngine {
    public:
        GameEngine() = default;
        ~GameEngine() = default;
        void displayCharacter(Character* character) {
            character->attack();
        }
};

int main () {
    GameEngine engine;

    BorrowedCharacter* cha = new ConcreteBorrowedCharacter();

    CharacterAdapter* adapted = new CharacterAdapter(cha);
    
    engine.displayCharacter(adapted);

    return 0;
}