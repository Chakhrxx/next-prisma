import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function GET(
  req: Request,
  { params }: { params: { id: string } }
) {
  try {
    const categoryWithPosts = await prisma.category.findUnique({
      where: { id: params.id },
      include: {
        posts: true, // Include related posts in the response
      },
    });
    return Response.json(categoryWithPosts);
  } catch (error) {
    return new Response(error as BodyInit, {
      status: 500,
    });
  }
}
