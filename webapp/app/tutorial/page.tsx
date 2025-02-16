import Image from "next/image";

function generateStaticParams() {}
 
export default function Page() {
    return (
        <footer className="row-start-3 flex gap-6 flex-wrap items-center justify-center">
            <a
                className="flex items-center gap-2 hover:underline hover:underline-offset-4"
                href="https://github.com/moritzan/ComputerCraft-Bahnsystem"
                target="_blank"
                rel="noopener noreferrer"
            >
                <Image
                    aria-hidden
                    src="/globe.svg"
                    alt="Globe icon"
                    width={16}
                    height={16}
                />
                Source Code →
            </a>
        </footer>
    ); // Diese Klammer und das Semikolon waren möglicherweise das Problem.
}