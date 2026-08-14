import TodoForm from "./TodoForm";
import { getTodos } from "./todoActions";

export default async function ActionsPage() {
  const todos = await getTodos();

  return (
    <div className="space-y-8 max-w-4xl mx-auto">
      {/* Page Header */}
      <div className="border-b border-[#30363d] pb-6 space-y-2">
        <div className="flex items-center gap-2">
          <span className="text-xs font-mono bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 px-2.5 py-0.5 rounded-full">
            Data Mutation
          </span>
          <span className="text-gray-500 text-xs font-mono">src/app/actions/page.tsx</span>
        </div>
        <h1 className="text-3xl font-extrabold text-white">Server Actions (&apos;use server&apos;)</h1>
        <p className="text-gray-400 text-sm">
          Server Actions allow client forms and buttons to execute asynchronous backend logic directly on the server without manually writing API endpoints or handling fetch boilerplate.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* Left Explanation Card */}
        <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
          <h2 className="text-xl font-bold text-white flex items-center gap-2">
            💡 How Server Actions Work
          </h2>
          <p className="text-xs text-gray-400 leading-relaxed">
            Declare functions with the <span className="code-inline">&apos;use server&apos;</span> directive at the top of the file or inline within an async function. Next.js creates a POST request endpoint automatically under the hood.
          </p>

          <div className="bg-[#0d1117] p-4 rounded-xl border border-[#30363d] text-xs font-mono text-gray-300 space-y-2">
            <div className="text-emerald-400 font-semibold">// src/app/actions/todoActions.ts</div>
            <pre className="overflow-x-auto text-[11px]">
{`"use server";
import { revalidatePath } from "next/cache";

export async function addTodoAction(formData) {
  const title = formData.get("title");
  // Save to DB...
  revalidatePath("/actions");
}`}
            </pre>
          </div>

          <div className="space-y-2 text-xs">
            <span className="font-semibold text-gray-300">Key Features:</span>
            <ul className="space-y-1 text-gray-400 list-disc list-inside text-xs">
              <li>Works without JavaScript enabled via HTML form submission</li>
              <li>Progressive enhancement & type-safe arguments</li>
              <li>Integrated with <span className="code-inline">revalidatePath()</span> and <span className="code-inline">revalidateTag()</span></li>
            </ul>
          </div>
        </div>

        {/* Right Interactive Demo Card */}
        <div className="bg-[#161b22] border border-[#30363d] rounded-2xl p-6 space-y-4">
          <h2 className="text-xl font-bold text-white flex items-center gap-2">
            ⚡ Interactive Server Action Demo
          </h2>
          <p className="text-xs text-gray-400">
            Submit new items below to trigger <span className="code-inline">addTodoAction</span> on the server and instantly revalidate the server cache.
          </p>

          <TodoForm initialTodos={todos} />
        </div>
      </div>
    </div>
  );
}
