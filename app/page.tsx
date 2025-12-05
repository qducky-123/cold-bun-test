import Image from 'next/image';

export default function Home() {
  return (
    <main className="flex flex-col min-h-screen items-center justify-center bg-gray-50 p-8 dark:bg-black">
      <div className="flex items-center space-x-10">
        <Image
          className="dark:invert"
          src="/next.svg"
          alt="Next.js logo"
          width={120}
          height={20}
          priority
        />
        <p className='font-light'>powered by</p>
        <Image
          src="/bun.svg"
          alt="Bun logo"
          width={80}
          height={20}
          priority
        />
      </div>
    </main>
  );
}
