#include <iostream>
#include <list>
using namespace std;

class Message {
    protected:
        string data;
    public:
        Message(string d) : data(d) {}
        virtual ~Message() = default;
        virtual void operate() = 0;
};

class TestMessage : public Message {
    public:
        TestMessage(string d) : Message(d) {}
        virtual ~TestMessage() = default;
        virtual void operate() {
            cout << this->data << endl;
        }
};

class TryMessage : public Message {
    public:
        TryMessage(string d) : Message(d) {}
        virtual ~TryMessage() = default;
        virtual void operate() {
            cout << this->data << endl;
        }
};

class MessageComposite : public Message {
    private:
        list<Message*> test;
    public:
        MessageComposite(string d) : Message(d) {}
        virtual ~MessageComposite() = default;
        void add(Message* msg) {
            test.push_back(msg);
        }
        virtual void operate() {
            for (auto data : test) {
                data->operate();
            }
        }
};

int main() {
    MessageComposite* messageSet1 = new MessageComposite("Set 1");
    TestMessage* test = new TestMessage("Test");
    TryMessage* test2 = new TryMessage("try");

    messageSet1->add(test);
    messageSet1->add(test2);
    messageSet1->operate();

    return 0;
}