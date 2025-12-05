import { serve } from "bun";

export default async function handler(req: Request) {
    const start = Date.now();

    // simulate some startup delay if needed
    await new Promise(res => setTimeout(res, 50));

    const end = Date.now();

    return new Response(JSON.stringify({
        message: "Hello from Bun!",
        coldStartTimeMs: end - start,
        timestamp: new Date().toISOString()
    }), { headers: { "Content-Type": "application/json" } });
}
