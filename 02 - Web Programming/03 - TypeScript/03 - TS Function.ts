// --- Regular Function ---
// Syntax: function name(parameter: type): returnType { ... }
function calculateTotal(price: number, tax: number): number {
    return price + tax;
}

// --- Arrow Function (Lambda Expression) ---
// Modern syntax, heavily used in React / Node.js and array methods like ".map()".
const subtraction = (a: number, b: number): number => {
    return a - b;
};

// Short-hand arrow function. (Implicit return, no {} needed for one line.)
const formatCurrency = (amount: number): string => `RM ${amount.toFixed(2)}`;

// --- Optional Parameters (?) ---
// The '?' means the argument is not required. 
// Caution: Optional parameters must always come last in the list.
function logEvent(action: string, userId?: string): void {
    if (userId)
        console.log(`User [${userId}]: ${action}`);
    else
        console.log(`Guest: ${action}`);
}
logEvent("Opened Dashboard");         // Valid
logEvent("Deleted Note", "user_101"); // Valid

// --- Default Parameters (=) ---
// If the caller doesn't provide a value, TS uses the default value. (JS also supports this after ES6.)
function createNote(title: string, category: string = "General"): void {
    console.log(`Saved '${title}' under [${category}]`);
}
createNote("Project Ideas");         // "category" becomes "General".
createNote("Groceries", "Shopping"); // "category" becomes "Shopping".

// --- Rest Parameters (...) ---
// Allows a function to accept an unlimited number of arguments as an Array. (JS also supports this after ES6.)
// Caution: Rest parameters must always be the last parameter in the function definition.
function sumExpenses(...expenses: number[]): number {
    return expenses.reduce((total, current) => total + current, 0);
}
let total = sumExpenses(10.50, 20.00);        // Returns 30.50.
let total2 = sumExpenses(12.50, 45.00, 9.99); // Returns 67.49.
let total3 = sumExpenses();                   // Returns 0 (empty array).