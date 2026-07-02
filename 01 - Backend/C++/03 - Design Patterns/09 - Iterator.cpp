#include <iostream>
#include <string>

using namespace std;

// ==========================================
// 1. Product Interfaces
// ==========================================

class ComputerProduct {
    private:
        int _id;
        int _price;
        string _description;
    public:
        ComputerProduct(int id, int price, string desc) : _id(id), _price(price), _description(desc) {}
        
        int getProductId() { return _id; }
        int getPrice() const { return _price; }
        string getDescription() const { return _description; }
};

// ==========================================
// 2. Supporting Internal Collections
// ==========================================

class SimpleProductList {
    private:
        ComputerProduct* _items[3]; 
    public:
        SimpleProductList() {
            _items[0] = new ComputerProduct(101, 500, "Basic PC");
            _items[1] = new ComputerProduct(102, 700, "Office PC");
            _items[2] = new ComputerProduct(103, 900, "Home PC");
        }
        ~SimpleProductList() {
            for(int i = 0; i < getLength(); i++) delete _items[i];
        }
        int getLength() { 
            return sizeof(_items) / sizeof(_items[0]); 
        }
        ComputerProduct* getSimpleProduct(int index) { return _items[index]; }
};

class AdvancedProductList {
    private:
        ComputerProduct* _items[2];
    public:
        AdvancedProductList() {
            _items[0] = new ComputerProduct(201, 1500, "Gaming Rig");
            _items[1] = new ComputerProduct(202, 2500, "Workstation");
        }
        ~AdvancedProductList() {
            for(int i = 0; i < getLength(); i++) delete _items[i];
        }
        int getLength() { 
            return sizeof(_items) / sizeof(_items[0]); 
        }
        ComputerProduct* getAdvancedProduct(int index) { return _items[index]; }
};

// ==========================================
// 3. Iterator Interface
// ==========================================

class StoreProductIterator {
    private:
        int _position;
    protected:
        void setPosition(int pos) { _position = pos; }
        int getPosition() { return _position; }
    public:
        StoreProductIterator() : _position(0) {}
        virtual ~StoreProductIterator() = default;

        virtual bool hasNext() = 0;
        virtual ComputerProduct* getNext() = 0;
        virtual void reset() { _position = 0; }
};

// ==========================================
// 4. Concrete Iterators
// ==========================================

class SimpleStoreProductIterator : public StoreProductIterator {
    private:
        SimpleProductList* _products;
    public:
        SimpleStoreProductIterator(SimpleProductList* products) : _products(products) {}
        
        virtual bool hasNext() {
            return getPosition() < _products->getLength();
        }
        
        virtual ComputerProduct* getNext() {
            if (this->hasNext()) {
                int current = getPosition();
                ComputerProduct* p = _products->getSimpleProduct(current);
                setPosition(current + 1);
                return p;
            }
            return 0;
        }
};

class AdvancedStoreProductIterator : public StoreProductIterator {
    private:
        AdvancedProductList* _products;
    public:
        AdvancedStoreProductIterator(AdvancedProductList* products) : _products(products) {}

        virtual bool hasNext() {
            return getPosition() < _products->getLength();
        }

        virtual ComputerProduct* getNext() {
            if (this->hasNext()) {
                int current = getPosition();
                ComputerProduct* p = _products->getAdvancedProduct(current);
                setPosition(current + 1);
                return p;
            }
            return 0;
        }
};

// ==========================================
// 5. Aggregate Interface
// ==========================================

class ComputerStore {
    public:
        virtual ~ComputerStore() = default;
        virtual StoreProductIterator* createIterator() = 0;
};

// ==========================================
// 6. Concrete Aggregates
// ==========================================

class SimpleComputerStore : public ComputerStore {
    private:
        SimpleProductList _products;
    public:
        virtual StoreProductIterator* createIterator() {
            return new SimpleStoreProductIterator(&_products);
        }
};

class AdvancedComputerStore : public ComputerStore {
    private:
        AdvancedProductList _products;
    public:
        virtual StoreProductIterator* createIterator() {
            return new AdvancedStoreProductIterator(&_products);
        }
};

// ==========================================
// 7. Main
// ==========================================

void displayProducts(StoreProductIterator* pIterator) {
    ComputerProduct* pProduct = 0;
    while (pIterator->hasNext()) {
        pProduct = pIterator->getNext();
        cout << "\nProduct id: " << pProduct->getProductId()
             << "\nProduct price: " << pProduct->getPrice()
             << "\nProduct Description: " << pProduct->getDescription() << endl;
    }
}

int main() {
    // ------------------------------------------
    // 1. Process Simple Store Inventory
    // ------------------------------------------
    cout << "--- Simple Computer Store (Traversing via Iterator) ---" << endl;
    ComputerStore* store1 = new SimpleComputerStore();
    StoreProductIterator* it1 = store1->createIterator();
    displayProducts(it1);

    // ------------------------------------------
    // 2. Process Advanced Store Inventory
    // ------------------------------------------
    cout << "\n--- Advanced Computer Store (Traversing via Iterator) ---" << endl;
    ComputerStore* store2 = new AdvancedComputerStore();
    StoreProductIterator* it2 = store2->createIterator();
    displayProducts(it2);

    // ------------------------------------------
    // 3. Cleanup Memory
    // ------------------------------------------
    delete it1;
    delete it2;
    delete store1;
    delete store2;

    return 0;
}