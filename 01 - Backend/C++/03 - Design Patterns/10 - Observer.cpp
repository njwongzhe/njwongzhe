#include <iostream>
#include <list>
using namespace std;

// ==========================================
// 1. Product Interfaces
// ==========================================

class Service {
    public:
        virtual ~Service() = default;
        virtual void update(string message) = 0;
};

// ==========================================
// 2. Concrete Product: Basic Family
// ==========================================

class EmailService : public Service {
    public:
        virtual void update(string message) {
            cout << "EmailService Notification: " << message << endl;
        }
};

class SmsService : public Service {
    public:
        virtual void update(string message) {
            cout << "SmsService Notification: " << message << endl;
        }
};

class PhoneService : public Service {
    public:
        virtual void update(string message) {
            cout << "PhoneService (Voice) Notification: " << message << endl;
        }
};

// ==========================================
// 4. Factory Interface
// ==========================================

class ServiceNotifier {
    private: 
        list<Service*> serviceList;
    public:
        virtual ~ServiceNotifier() = default;
        virtual void attach(Service* service) {
            serviceList.push_back(service);
        }
    protected:
        virtual void notify(string message) {
            for(auto service : serviceList)
                service->update(message);
        }
};

// ==========================================
// 5. Concrete Factory
// ==========================================

class NotifierEngine : public ServiceNotifier {
    public: 
        void triggeredNotify(string message) {
            // Put the decision logic here.
            notify(message);
        }
};

// ==========================================
// 7. Main
// ==========================================

int main() {
    // ------------------------------------------
    // 1. Initialize Observer Services
    // ------------------------------------------
    // Create concrete subscriber instances on the stack.
    EmailService emailHandler;
    SmsService smsHandler;
    PhoneService voiceHandler;

    // ------------------------------------------
    // 2. Initialize Subject (Engine)
    // ------------------------------------------
    // Create the unified notifier engine that inherits management interface capabilities.
    NotifierEngine notifier;
    
    // ------------------------------------------
    // 3. Register Subscriptions
    // ------------------------------------------
    // Attach the services directly to the dispatcher instance that will trigger notifications.
    notifier.attach(&emailHandler);
    notifier.attach(&smsHandler);
    notifier.attach(&voiceHandler);

    // ------------------------------------------
    // 4. Broadcast Notifications
    // ------------------------------------------
    // Execute broadcasting. The engine recursively loops through all attached listeners.
    notifier.triggeredNotify("Update");

    return 0;
}