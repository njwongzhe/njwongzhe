import { NextRequest, NextResponse } from "next/server";

// Sample API dataset
const apiTodos = [
  { id: "101", title: "Setup Route Handlers in Next.js", status: "completed", priority: "high" },
  { id: "102", title: "Test NextResponse.json() headers", status: "pending", priority: "medium" },
  { id: "103", title: "Build Interactive API Sandbox UI", status: "in-progress", priority: "high" },
];

// GET /api/todos
export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams;
  const statusFilter = searchParams.get("status");

  let result = apiTodos;
  if (statusFilter) {
    result = apiTodos.filter((t) => t.status === statusFilter);
  }

  return NextResponse.json(
    {
      success: true,
      totalCount: result.length,
      timestamp: new Date().toISOString(),
      data: result,
    },
    {
      status: 200,
      headers: {
        "x-custom-api-version": "1.0.0",
        "Cache-Control": "no-store, max-age=0",
      },
    }
  );
}

// POST /api/todos
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();

    if (!body.title) {
      return NextResponse.json(
        { success: false, error: "Missing required field: 'title'" },
        { status: 400 }
      );
    }

    const newTodo = {
      id: Date.now().toString(),
      title: body.title,
      status: body.status || "pending",
      priority: body.priority || "medium",
    };

    apiTodos.push(newTodo);

    return NextResponse.json(
      {
        success: true,
        message: "Todo created successfully via Route Handler",
        data: newTodo,
      },
      { status: 201 }
    );
  } catch {
    return NextResponse.json(
      { success: false, error: "Invalid JSON request body" },
      { status: 400 }
    );
  }
}
