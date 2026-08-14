"use client";

import { useRef, useState } from "react";
import { addTodoAction, deleteTodoAction, TodoItem } from "./todoActions";

export default function TodoForm({ initialTodos }: { initialTodos: TodoItem[] }) {
  const formRef = useRef<HTMLFormElement>(null);
  const [statusMsg, setStatusMsg] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsSubmitting(true);
    setStatusMsg(null);

    const formData = new FormData(e.currentTarget);
    const result = await addTodoAction(formData);

    setIsSubmitting(false);
    if (result.error) {
      setStatusMsg(`❌ ${result.error}`);
    } else {
      setStatusMsg(`✅ ${result.message}`);
      formRef.current?.reset();
    }
  };

  const handleDelete = async (id: string) => {
    await deleteTodoAction(id);
  };

  return (
    <div className="space-y-6">
      {/* Form Submission Card */}
      <form
        ref={formRef}
        onSubmit={handleSubmit}
        className="bg-[#0d1117] p-5 rounded-xl border border-[#30363d] space-y-4"
      >
        <div className="flex items-center justify-between">
          <span className="text-xs font-semibold text-gray-300">
            Submit New Item (Invokes &apos;use server&apos; action):
          </span>
          <span className="text-[11px] font-mono bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 px-2 py-0.5 rounded">
            revalidatePath(&apos;/actions&apos;)
          </span>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
          <input
            type="text"
            name="title"
            placeholder="Enter todo title..."
            required
            className="sm:col-span-2 px-3 py-2 rounded-lg bg-[#161b22] border border-[#30363d] text-xs text-white placeholder-gray-500 focus:outline-none focus:border-emerald-500"
          />
          <select
            name="category"
            className="px-3 py-2 rounded-lg bg-[#161b22] border border-[#30363d] text-xs text-white focus:outline-none focus:border-emerald-500"
          >
            <option value="General">General</option>
            <option value="Routing">Routing</option>
            <option value="Rendering">Rendering</option>
            <option value="Server Actions">Server Actions</option>
            <option value="API Handlers">API Handlers</option>
          </select>
        </div>

        <button
          type="submit"
          disabled={isSubmitting}
          className="w-full py-2.5 rounded-lg bg-emerald-600 hover:bg-emerald-500 disabled:opacity-50 text-white font-semibold text-xs shadow-lg shadow-emerald-600/30 transition-all flex items-center justify-center gap-2"
        >
          {isSubmitting ? "Executing Server Action..." : "🚀 Execute Server Action Form Submit"}
        </button>

        {statusMsg && (
          <div className="p-2.5 rounded-lg bg-[#161b22] border border-[#30363d] text-xs font-mono text-emerald-400">
            {statusMsg}
          </div>
        )}
      </form>

      {/* Todo List Rendering */}
      <div className="space-y-3">
        <h3 className="text-sm font-bold text-white flex items-center justify-between">
          <span>📋 Current Server State Items ({initialTodos.length}):</span>
        </h3>

        <div className="space-y-2">
          {initialTodos.map((todo) => (
            <div
              key={todo.id}
              className="bg-[#0d1117] p-3.5 rounded-xl border border-[#30363d] flex items-center justify-between gap-4"
            >
              <div className="space-y-1 overflow-hidden">
                <div className="text-xs font-semibold text-white truncate">{todo.title}</div>
                <div className="flex items-center gap-2 text-[11px] text-gray-500 font-mono">
                  <span className="px-2 py-0.5 rounded bg-[#21262d] text-emerald-400">
                    {todo.category}
                  </span>
                  <span>&bull;</span>
                  <span>{todo.createdAt}</span>
                </div>
              </div>

              <button
                onClick={() => handleDelete(todo.id)}
                className="px-2.5 py-1 rounded bg-rose-500/10 hover:bg-rose-600 text-rose-400 hover:text-white border border-rose-500/20 text-xs font-medium transition-all"
              >
                Delete
              </button>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
