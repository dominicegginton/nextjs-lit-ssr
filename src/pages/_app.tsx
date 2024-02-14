import "@/styles/globals.css";
import type { AppProps } from "next/app";
import '@arc-web/components/themes/index.css';
import '@arc-web/components/themes/light.css';
import '@arc-web/components/themes/dark.css';

export default function App({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />;
}
