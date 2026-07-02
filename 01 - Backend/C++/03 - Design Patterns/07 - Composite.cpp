#include <iostream>
#include <list>
using namespace std;

// ==========================================
// 1. Product Interfaces
// ==========================================

class Message {
    protected:
        string _name;
    public: 
        Message(string name) : _name(name) {}
        virtual ~Message() = default; 
        virtual void operate() = 0;
};

// ==========================================
// 2. Concrete Product: Basic Family
// ==========================================

class VideoControlMessage : public Message {
    public:
        VideoControlMessage(string name) : Message(name) {}
        virtual ~VideoControlMessage() {}
        virtual void operate() {
            cout << "VideoControlMessage: " << _name << endl; 
        }
};

class SelfTestMessage : public Message {
    public:
        SelfTestMessage(string name) : Message(name) {}
        virtual ~SelfTestMessage() {}
        virtual void operate() {
            cout << "SelftTestMessage: " << _name << endl; 
        }
};

// ==========================================
// 3. Composite
// ==========================================

class Composite : public Message {
    private: 
        list<Message*> messageList;
    public:
        Composite(string name) : Message(name) {}
        virtual ~Composite() {
            for (auto msg : messageList)
                delete msg;
        }
        void add(Message* msg) {
            messageList.push_back(msg);
        }
        void operate() {
            for(auto msg : messageList) 
                msg->operate();
        }
};

// ==========================================
// 7. Main
// ==========================================

int main() {

    // ------------------------------------------
    // 1. Construct Subtree 1
    // ------------------------------------------
    // Create the first composite branch and attach its leaf nodes.
    Composite* messageSet1 = new Composite("Message Set 1");
    VideoControlMessage* msg1 = new VideoControlMessage("Video Control Message 1");
    SelfTestMessage* msg2 = new SelfTestMessage("Self Test Message 1");
    messageSet1->add(msg1);
    messageSet1->add(msg2);

    // ------------------------------------------
    // 2. Construct Subtree 2
    // ------------------------------------------
    // Create the second composite branch and attach its leaf nodes.
    Composite* messageSet2 = new Composite("Message Set 2");
    VideoControlMessage* msg3 = new VideoControlMessage("Video Control Message 2");
    SelfTestMessage* msg4 = new SelfTestMessage("Self Test Message 2");
    messageSet2->add(msg3);
    messageSet2->add(msg4);

    // ------------------------------------------
    // 3. Assembly Root Tree (Message Set Complete)
    // ------------------------------------------
    // Create the supreme root composite container and link both sub-branches into it.
    Composite* messageSetComplete = new Composite("Message Set Complete");
    messageSetComplete->add(messageSet1);
    messageSetComplete->add(messageSet2);

    // ------------------------------------------
    // 4. Execute Root Operation
    // ------------------------------------------
    // Client invokes operation uniformly. The composite recursively cascades calls down to all elements.
    cout << "--- Executing Composite Message Tree ---" << endl;
    messageSetComplete->operate();

    // ------------------------------------------
    // 5. Destruct Root tree (Cascading Deletion)
    // ------------------------------------------
    // Deleting the root object safely triggers nested virtual destructors, wiping the whole tree structure.
    delete messageSetComplete;

    return 0;
}