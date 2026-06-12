// --- Interface ---
interface NoteData {
  readonly id: string; // "readonly" means it cannot be changed after it is created. (Read Only)
  title: string;
  content: string;
  tags?: string[];     // Optional property since "?" is used. It can be safely skipped when creating an object of this type.
  
  getSummary(): string; // Method signature. (No actual code here.)
}

// --- Implementation (Object) ---
const myFirstNote: NoteData = {
  id: "n_001",
  title: "TS Interfaces",
  content: "Interfaces define blueprints for data.",
  // "tag" is optional, so we can safely skip it.

  getSummary() {
    return `${this.title}: ${this.content}`;
  }
};

// --- Implementation (Class) ---
class DatabaseNote implements NoteData {
  constructor(
    public readonly id: string,
    public title: string,
    public content: string,
    public tags?: string[]
  ) {}

  public getSummary(): string {
    return `[${this.title}] saved to database.`;
  }
}