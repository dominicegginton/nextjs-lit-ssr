import Head from "next/head";

import SimpleGreeter from '../components/simple-greeter/simple-greeter-react';
// import { ArcButton } from "@arc-web/react/src/components/arc-button";

/* SSR */
export async function getStaticProps() {
  return { props: {} };
}

export default function Home() {
  return (
    <>
      <Head>
        <title>Create Next App</title>
        <meta name="description" content="Generated by create next app" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <main>

        <SimpleGreeter name="World" />

      </main>
    </>
  );
}
