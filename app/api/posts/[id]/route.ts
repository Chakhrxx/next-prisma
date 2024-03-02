import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function GET(
  req: Request,
  { params }: { params: { id: string } }
) {
  return Response.json(
    await prisma.post.findUnique({
      where: { id: params.id },
    })
  );
}

export async function PUT(
  req: Request,
  { params }: { params: { id: string } }
) {
  try {
    const { title, content, categoryId } = await req.json();
    const post = await prisma.post.update({
      where: { id: params.id },
      data: { title, content, categoryId },
    });
    return Response.json(post);
  } catch (error) {
    return new Response(error as BodyInit, {
      status: 500,
    });
  }
}

export async function DELETE(
  req: Request,
  { params }: { params: { id: string } }
) {
  try {
    return Response.json(
      await prisma.post.delete({
        where: { id: params.id },
      })
    );
  } catch (error) {
    return new Response(error as BodyInit, {
      status: 500,
    });
  }
}
