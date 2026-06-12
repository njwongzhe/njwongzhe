// --- Generic Function ---
// The <T> acts as a placeholder. 
// When you call the function, TS replaces "T" with the actual type you provide.
function wrapArray<T>(item: T): T[] {
  return [item];
}
const stringArray = wrapArray<string>("Hello"); // Return "string[]".
const numberArray = wrapArray<number>(100);     // Return "number[]".

// --- Generic Interface (Perfect for APIs) ---
// We don't know what "data" will be yet, so we use <T>.
interface ApiResponse<T> {
  status: number;
  message: string;
  data: T; 
}

// Some basic data models.
interface AppNote { id: string; title: string; }
interface User { uid: string; name: string; }

// Here, T becomes 'Note'
const fetchNoteResponse: ApiResponse<AppNote> = {
  status: 200,
  message: "Note retrieved successfully",
  data: { id: "n_001", title: "My First Note" } // "T" is replaced with "AppNote" here, so "data" must match the "AppNote" structure.
};

// Here, T becomes 'User'
const fetchUserResponse: ApiResponse<User> = {
  status: 200,
  message: "User found",
  data: { uid: "u_999", name: "Zhang San" }
};