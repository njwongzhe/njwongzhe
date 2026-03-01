// --- Permitive Types ---
let firstName: string = "John";
let age: number = 25;
let isActive: boolean = true;
let emptyValue: null = null;
let notAssigned: undefined = undefined;

// --- Special Types (any) ---
let anything: any = "String"; // Should be avoided if possible because one of the reasons we use TypeScript is to have type safety and 'any' defeats that purpose
anything = 42;                // "any" allows you to assign any type of value without errors.

// --- Special Types (unknown) ---
let userInput: unknown; // Safer than "any". Forces you to check type before using.
userInput = 5;
userInput = "Zhang San";

// Error if "unknown" is used without type checking
// console.log(userInput.toUpperCase()); // Error: Object is of type "unknown".
// console.log(userInput + 10);          // Error: Object is of type "unknown".
if (typeof userInput === "string")      console.log(userInput.toUpperCase()); 
else if (typeof userInput === "number") console.log(userInput + 10);

// --- Special Types (void) ---
function logMessage(msg: string): void { // "void" used when a function returns absolutely nothing.
  console.log(msg);
}

// --- Special Types (never) ---
function crashApp(errMsg: string): never { // 'never' used when a function never finishes. 
  throw new Error(errMsg);
}

// --- Logic Based Type ---
let id: string | number; // Union type. It can be either a string or a number.
id = "ABC-123";
id = 101;

let alignment: "left" | "center" | "right"; // Literal type. It can be exact specific values only.
alignment = "center"; 
// alignment = "top"; // Error since type '"top"' is not assignable to type '"left" | "center" | "right"'.

// --- Arrays & Tuples ---
let skills: string[] = ["HTML", "CSS", "JS"];
let scores: Array<number> = [90, 85, 88];                       // Alternative array syntax
let coordinates: [string, number, boolean] = ["x", 10.5, true]; // Tuple: Fixed length and specific types

// --- Enumeration ---
enum Status {
  Pending = "PENDING",
  Active = "ACTIVE",
  Done = "DONE"
}
let currentStatus: Status = Status.Active;