// --- Base Class ---
class Note {
    public title: string;       // Accessible anywhere.
    protected category: string; // Accessible only in this class & child classes.
    private content: string;    // Accessible only in this exact class.

    constructor(title: string, category: string, content: string) {
        this.title = title;
        this.category = category;
        this.content = content;
    }
}

// --- Child Class (Inheritance) ---
class SecureNote extends Note {
    constructor(title: string, category: string, content: string) {
        super(title, category, content); // Call the parent class constructor.
    }

    public printInfo() {
        console.log(this.title);    // No error since "title" is public.
        console.log(this.category); // No error since "category" is protected and we're inside a child class.
        // console.log(this.content); // Error since "content: is private to "Note" only.
    }
}

// --- Testing Access from the Outside ---
const myNote = new SecureNote("Bank PIN", "Finance", "1234"); // Create an instance of "SecureNote" with all properties.

console.log(myNote.title);       // No error since "title" is public.
// console.log(myNote.category); // Error.
// console.log(myNote.content);  // Error. 

myNote.printInfo(); // Can access "title" and "category" but not "content" since it's private to "Note".

// myNote.newMethod = () => console.log("This is a new method added to the instance.");
// Error. Unlike JavaScript, you cannot add new properties or methods to an instance of a class in TypeScript.