// --- Optional Chaining (?.) ---
// Safely accesses nested properties. If target is null, it returns undefined instead of crashing.
let userSettings: any = null;
let theme = userSettings.profile.theme; 

// --- Nullish Coalescing (??) ---
// Provides a fallback value only if the left side is exactly "null" or "undefined".
let savedVolume = null;
let currentVolume = savedVolume ?? 100; // Returns 100 because savedVolume is null.

// --- Non-Null Assertion (!) ---
// Tells the TypeScript compiler: "Trust me, I guarantee this value is not null/undefined.".
// Use this carefully since it is defined by the developer and can lead to runtime errors if used incorrectly.
let titleElement: string | null = "Main Heading";
let characterCount = titleElement!.length;