import { PrismaClient } from "@prisma/client";
import { v4 as uuidv4 } from "uuid";

const prisma = new PrismaClient();

export async function GET() {
  try {
    const categories = await prisma.category.findMany();
    return Response.json(categories);
  } catch (error) {
    return new Response(error as BodyInit, {
      status: 500,
    });
  }
}

export async function POST(req: Request) {
  try {
    const { name } = await req.json();
    const id = uuidv4();
    const newCategory = await prisma.category.create({
      data: {
        id,
        name,
      },
    });
    return Response.json(newCategory);
  } catch (error) {
    return new Response(error as BodyInit, {
      status: 500,
    });
  }
}
