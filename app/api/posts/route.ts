import { PrismaClient } from "@prisma/client";
import { type NextRequest } from "next/server";
import { v4 as uuidv4 } from "uuid";

const prisma = new PrismaClient();

export async function GET(req: NextRequest) {
  const searchParams = req.nextUrl.searchParams;
  const category = searchParams.get("category");
  const search = searchParams.get("search") || "";
  const sort = searchParams.get("sort") || "desc";

  const whereCondition = category
    ? {
        category: { is: { name: category } },
        title: {
          contains: search,
          mode: "insensitive",
        },
      }
    : {
        title: {
          contains: search,
          mode: "insensitive",
        },
      };

  try {
    const posts = await prisma.post.findMany({
      where: whereCondition,
      include: {
        category: true, // Include category data in the response
      },
      orderBy: {
        createdAt: sort,
      },
    });
    return Response.json(posts);
  } catch (error) {
    return new Response(error, {
      status: 500,
    });
  }
}

export async function POST(req: Request) {
  try {
    const { title, content, categoryId } = await req.json();
    const id = uuidv4();
    const newPost = await prisma.post.create({
      data: {
        id,
        title,
        content,
        categoryId,
      },
    });
    return Response.json(newPost);
  } catch (error) {
    return new Response(error as BodyInit, {
      status: 500,
    });
  }
}
