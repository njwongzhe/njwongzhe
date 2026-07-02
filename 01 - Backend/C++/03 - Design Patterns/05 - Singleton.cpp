#include <iostream>
using namespace std;

// ==========================================
// 1. Singleton Class
// ==========================================

class EventManager {
    private: 
        // Static pointer declaration to hold the single instance.
        static EventManager* _instance;
        
        // Private constructor prevents direct instantiation from outside.
        EventManager() {}

    public:
        // Destructor (Optional but good practice for cleanup.)
        virtual ~EventManager() {}

        // Static tracking method to retrieve the unique instance.
        static EventManager* getInstance() {
            if(_instance == nullptr) 
                _instance = new EventManager();
            return _instance;
        }

        // A simple logging function to record events.
        void logEvent(string message) {
            cout << "[LOG]: " << message << endl;
        }
};

EventManager* EventManager::_instance = nullptr;

// ==========================================
// 2. Main
// ==========================================

int main() {
    // This bypasses the need for an uninitialized instance wrapper pointer entirely.
    EventManager* manager = EventManager::getInstance();

    // Call the logEvent function through the singleton instance.
    manager->logEvent("System initialized successfully.");
    manager->logEvent("User logged into the application.");

    return 0;
}