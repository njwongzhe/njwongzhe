#include <iostream>
using namespace std; 

class Character {
    public:
        Character() = default;
        virtual ~Character() = default;
        virtual void attack() = 0;
        virtual Character* clone() = 0;
};

class Enemy : public Character {
    public:
        Enemy() = default;
        virtual ~Enemy() = default;
        virtual void attack() { cout << "Attack" << endl; }
        virtual Character* clone() { return new Enemy(*this); }
};

class Enemy2 : public Character {
    public:
        Enemy2() = default;
        virtual ~Enemy2() = default;
        virtual void attack() { cout << "Attack" << endl; }
        virtual Character* clone() { return new Enemy2(*this); }
};

class GameEngine {
    private:
        Character* _character[10];
    public:
        GameEngine() = default;
        ~GameEngine() = default;
        Character* generateNextEnemy() {
            int nextEnemyPosition = 10 % rand();
            return _character[nextEnemyPosition]->clone();
        }
};

int main () {
    GameEngine engine;

    Character* character = engine.generateNextEnemy();

    delete character;

    return 0;
}