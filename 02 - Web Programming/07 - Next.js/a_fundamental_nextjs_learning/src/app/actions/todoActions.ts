"use server";

import { revalidatePath } from "next/cache";

// In-memory server store for demonstration purposes
export interface TodoItem {
  id: string;
  title: string;
  category: string;
  createdAt: string;
}

let todosMemoryStore: TodoItem[] = [
  {
    id: "1",
    title: "Learn Next.js 16 App Router File System",
    category: "Routing",
    createdAt: new Date().toLocaleTimeString(),
  },
  {
    id: "2",
    title: "Understand Server vs Client Components",
    category: "Rendering",
    createdAt: new Date().toLocaleTimeString(),
  },
  {
    id: "3",
    title: "Master Server Actions with revalidatePath()",
    category: "Server Actions",
    createdAt: new Date().toLocaleTimeString(),
  },
];

export async function getTodos(): Promise<TodoItem[]> {
  return todosMemoryStore;
}

export async function addTodoAction(formData: FormData) {
  const title = formData.get("title") as string;
  const category = (formData.get("category") as string) || "General";

  if (!title || title.trim() === "") {
    return { error: "Todo title cannot be empty!" };
  }

  const newTodo: TodoItem = {
    id: Date.now().toString(),
    title: title.trim(),
    category,
    createdAt: new Date().toLocaleTimeString(),
  };

  todosMemoryStore.unshift(newTodo);

  // Trigger cache revalidation for the actions page route
  revalidatePath("/actions");

  return { success: true, message: `Added todo: "${title}"` };
}

export async function deleteTodoAction(id: string) {
  todosMemoryStore = todosMemoryStore.filter((item) => item.id !== id);
  revalidatePath("/actions");
  return { success: true };
}
