#include <iostream>
using namespace std;

class Code {
    private: 
        string code;
    public:
        string getCode() {
            return code;
        }
        void setCode(string c) {
            code.append(c);
        }
};

class CodeBuilder {
    private:
        Code* _code;
    public:
        CodeBuilder() { _code = new Code(); };
        virtual ~CodeBuilder() { delete _code; };
        virtual void createClass() = 0;
        virtual void closeClass() = 0;
        Code* getProduct() { return _code; }
};

class CppCodeBuilder : public CodeBuilder {
    public:
        CppCodeBuilder() : CodeBuilder() {};
        virtual ~CppCodeBuilder() = default;
        virtual void createClass() { getProduct()->setCode("test"); }
        virtual void closeClass() { getProduct()->setCode("test"); }
};

class JavaCodeBuilder : public CodeBuilder {
    public:
        JavaCodeBuilder() : CodeBuilder() {};
        virtual ~JavaCodeBuilder() = default;
        virtual void createClass() { getProduct()->setCode("test"); }
        virtual void closeClass() { getProduct()->setCode("test"); }
};

class CodeGenerator {
    private:
        CodeBuilder* _builder;
    public:
        CodeGenerator(CodeBuilder* builder) { _builder = builder; } 
        ~CodeGenerator() { delete _builder; }
        void generateCode() {
            _builder->createClass();
            _builder->closeClass();
        }
};

int main () {
    CppCodeBuilder* builder = new CppCodeBuilder();

    CodeGenerator generator(builder);

    generator.generateCode();

    return 0;
}