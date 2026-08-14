import { NextRequest, NextResponse } from "next/server";

// GET /api/todos/[id]
export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;

  return NextResponse.json({
    success: true,
    message: `Fetched details for todo ID: ${id}`,
    data: {
      id,
      title: `Sample Item #${id}`,
      status: "active",
      updatedAt: new Date().toISOString(),
    },
  });
}

// PUT /api/todos/[id]
export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;
  const body = await request.json();

  return NextResponse.json({
    success: true,
    message: `Successfully updated item ID #${id}`,
    updatedFields: body,
  });
}

// DELETE /api/todos/[id]
export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;

  return NextResponse.json({
    success: true,
    message: `Successfully deleted todo item with ID: ${id}`,
    deletedId: id,
  });
}
