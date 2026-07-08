#include <iostream>
#include <list>
using namespace std;

class System {
    public:
        System() = default;
        virtual ~System() = default;
        virtual void update() = 0;
};

class System1 : public System {
    public:
        System1() = default;
        virtual ~System1() = default;
        virtual void update() {
            
        }
};

class System2 : public System {
    public:
        System2() = default;
        virtual ~System2() = default;
        virtual void update() {

        }
};

class SystemNotifier {
    private:
        list<System*> systemList;
    public:
        void attach(System* s) {
            systemList.push_back(s);
        }
        void notify() {
            for (auto s : systemList) {
                s->update();
            }
        }
};

class NotifyEngine : public SystemNotifier {
    public:
        void trigger() {
            notify();
        }
};

int main() {
    NotifyEngine engine;

    System1* system1 = new System1();
    System2* system2 = new System2();

    engine.attach(system1);
    engine.attach(system2);

    engine.trigger();

    return 0;
}