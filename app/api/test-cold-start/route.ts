import { NextResponse } from "next/server";

export async function GET(req: Request) {
    return NextResponse.json({
        message: 'Bun cold start test successful!',
        timestamp: new Date().toISOString(),
        runtime: 'Bun 1.x',
    });
}