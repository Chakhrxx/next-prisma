import { NextApiResponse } from "next";

export async function Get(res: NextApiResponse) {
  res.status(200).json({ message: "test" });
}
