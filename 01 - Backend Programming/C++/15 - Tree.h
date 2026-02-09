#ifndef TREE_H
#define TREE_H

struct TreeNode {
    char info;
    TreeNode *left;
    TreeNode *right;
};

void retrieve(TreeNode *&, char, bool &);
void insert(TreeNode *&, char);
TreeNode * deleteNode(TreeNode *&, char);
void destroy(TreeNode *&);
void print(TreeNode *);

class TreeType {
    private:
        TreeNode *root;
        
    public: 
        TreeType() {
            root = NULL;
        };

        bool isEmpty() {
            if(root == NULL) 
                return true;
            else 
                return false;
        };

        int numberOfNodes() {
            // To be implemented in future versions.
            return 0;
        };

        void retrieveItem(char searchItem, bool &found) {
            retrieve(root, searchItem, found);
        };

        void insertItem(char newItem) {
            insert(root, newItem);
        };

        void deleteItem(char delItem) {
            deleteNode(root, delItem);
        };

        void printTree() {
            print(root);
        };

        ~TreeType() {
            destroy(root);
        };
};

void retrieve(TreeNode *&tree, char searchItem, bool &found) {
    if(tree == NULL) 
        found = false;
    else if(searchItem == tree->info) 
        found = true;
    else if(searchItem < tree->info) 
        retrieve(tree->left, searchItem, found);
    else // (searchItem > tree->info)
        retrieve(tree->right, searchItem, found);
}

void insert(TreeNode *&tree, char newItem) {
    // Empty Tree
    if(tree == NULL) {
        tree = new TreeNode();
        tree->right = NULL;
        tree->left = NULL;
        tree->info = newItem;
    }

    // Smaller to Left
    else if(newItem < tree->info) 
        insert(tree->left, newItem);

    // Larger to Right
    else 
        insert(tree->right, newItem);
}

TreeNode * deleteNode(TreeNode *&tree, char delItem) {
    if(tree->info > delItem) 
        tree->left = deleteNode(tree->left, delItem);

    else if(tree->info < delItem) 
        tree->right = deleteNode(tree->right, delItem);

    else { 
        if(tree->left == NULL && tree->right == NULL) { // Leaf Node
            delete tree;
            return NULL;
        }

        else if(tree->left == NULL) { // One Child (Right)
            TreeNode *temp = tree->right;
            delete tree;
            return temp;
        }

        else if(tree->right == NULL) { // One Child (Left)
            TreeNode *temp = tree->left;
            delete tree;
            return temp;
        }
        
        else { // Two Children
            TreeNode *temp = tree->right;

            while(temp->left != NULL) // Find leftmost node in right subtree.
                temp = temp->left;

            tree->info = temp->info; // Replace the value with the leftmost node's value at right subtree.
            tree->right = deleteNode(tree->right, temp->info); // Delete the leftmost node in right subtree that was moved.
            return tree;
        }
    }
}

void destroy(TreeNode *&tree) {
    if(tree != NULL) {
        destroy(tree->left);
        destroy(tree->right);
        delete tree;
    }
}

void print(TreeNode *tree) {
    if(tree != NULL) {
        print(tree->left);
        cout << tree->info << " ";
        print(tree->right);
    }
}

#endif