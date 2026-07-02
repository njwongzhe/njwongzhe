#include <iostream>
using namespace std;

// ==========================================
// 1. Product Interfaces
// ==========================================

class Code {
    private:
        string code;
    public:
        void addCode(string code) {
            this->code += code;
        }
        void printCode() {
            cout << code << endl;
        }
};

// ==========================================
// 4. Factory Interface (Builder Interface)
// ==========================================

class MessageBuilder {
    private:
        Code* _code;
    public: 
        MessageBuilder() { _code = new Code(); }
        virtual ~MessageBuilder() { delete _code; }
        
        virtual void buildNewClass(string name) = 0;
        virtual void buildNewAttributes(string attributeList) = 0;
        virtual void buildClassOperations(string operationList) = 0;
        virtual void closeClass() = 0;
        
        Code* getProduct() {
            return _code;
        }
};

// ==========================================
// 5. Concrete Factory (Concrete Builders)
// ==========================================

class CppMessageBuilder : public MessageBuilder {
    public: 
        virtual void buildNewClass(string name) override { getProduct()->addCode("class " + name + " {\n"); }
        virtual void buildNewAttributes(string attributeList) override { getProduct()->addCode("  " + attributeList + ";\n"); }
        virtual void buildClassOperations(string operationList) override { getProduct()->addCode("  " + operationList + "();\n"); }
        virtual void closeClass() override { getProduct()->addCode("};\n\n"); }
};

class JavaMessageBuilder : public MessageBuilder {
    public: 
        virtual void buildNewClass(string name) override { getProduct()->addCode("public class " + name + " {\n"); }
        virtual void buildNewAttributes(string attributeList) override { getProduct()->addCode("  " + attributeList + ";\n"); }
        virtual void buildClassOperations(string operationList) override { getProduct()->addCode("  " + operationList + "() {}\n"); }
        virtual void closeClass() override { getProduct()->addCode("}\n\n"); }
};

// ==========================================
// 6. Client (Director)
// ==========================================

class CodeGenerator {
    private: 
        MessageBuilder* _builder;
    public: 
        CodeGenerator(MessageBuilder* builder) : _builder(builder) {}
        void generateCode() {
            _builder->buildNewClass("TestClass");
            _builder->buildNewAttributes("int myAttribute");
            _builder->buildClassOperations("void myOperation");
            _builder->closeClass();
        }
};

// ==========================================
// 7. Main
// ==========================================

int main() {
    // Create a concrete builder instance on the heap.
    CppMessageBuilder* cppBuilder = new CppMessageBuilder();

    // Pass the builder instance to the Director (Generator) using proper 'new' syntax.
    CodeGenerator* pBuilder = new CodeGenerator(cppBuilder);

    // Use '->' operator for pointers to direct the construction process.
    pBuilder->generateCode();

    // Retrieve and verify the built product.
    Code* finalProduct = cppBuilder->getProduct();
    finalProduct->printCode();

    // Safely clean up heap memory.
    delete pBuilder;
    delete cppBuilder;

    return 0;
}