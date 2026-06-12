// --- Type for Unions ---
type NoteID = string | number;
let myId: NoteID = "n_123";
let yourId: NoteID = 456;

// --- Type for Functions ---
type MathOperation = (a: number, b: number) => number;
const add: MathOperation = (a, b) => a + b;
const multiply: MathOperation = (x, y) => x * y;

// --- Type for Objects ---
// This looks exactly like an interface but it allows you to create a type alias for an object structure.
type ThemeConfig = {
  mode: "light" | "dark"; // Literal type
  primaryColor: string;
};

const myTheme: ThemeConfig = {
  mode: "dark",
  primaryColor: "#3498db"
};