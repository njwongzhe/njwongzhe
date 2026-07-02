#include <iostream>
#include <string>

using namespace std;

// ==========================================
// 1. Subsystem Classes (Complex Internals)
// ==========================================

class SerialComm {
    public:
        void initialize() {
            cout << "SerialComm: Setting baud rate, parity, and stop bits..." << endl;
        }
        void openConnection() {
            cout << "SerialComm: Connection opened successfully." << endl;
        }
};

class SystemManager {
    public:
        void scheduleMessage() {
            cout << "SystemManager: Message scheduled in the queue." << endl;
        }
};

class WirelessComm {
    public:
        void connectTCP() {
            cout << "WirelessComm: TCP connection established to IP address." << endl;
        }
};

// ==========================================
// 2. Facade Class (Provides Simplified Interface)
// ==========================================

class SensorSystem {
    private:
        // The Facade has dependencies to all required subsystem components.
        SerialComm* _serialComm;
        SystemManager* _systemManager;
        WirelessComm* _wirelessComm;

    public:
        // Constructor: Configure the Facade with its subsystem instances.
        SensorSystem() {
            _serialComm = new SerialComm();
            _systemManager = new SystemManager();
            _wirelessComm = new WirelessComm();
        }

        ~SensorSystem() {
            delete _serialComm;
            delete _systemManager;
            delete _wirelessComm;
        }

        // Unified interface method that hides all complex details and dependencies.
        void transmitSensorData() {
            cout << "--- Facade Execution Started ---" << endl;
            
            // Step 1: Initialize and open serial communication.
            _serialComm->initialize();
            _serialComm->openConnection();

            // Step 2: Establish wireless link.
            _wirelessComm->connectTCP();

            // Step 3: Schedule the collection message.
            _systemManager->scheduleMessage();

            cout << "--- Facade Execution Finished Sucessfully ---" << endl;
        }
};

// ==========================================
// 3. Main
// ==========================================

int main() {
    // The client interacts only with the stable, simplified Facade interface.
    SensorSystem* sensorFacade = new SensorSystem();

    // Client is shielded from knowing the internal classes or their calling order.
    sensorFacade->transmitSensorData();

    delete sensorFacade;

    return 0;
}