// @ts-check
import { defineConfig } from 'astro/config'
import sitemap from '@astrojs/sitemap'

import cloudflare from '@astrojs/cloudflare';

// Static site output, deployed through Cloudflare Workers (`wrangler deploy`).
// build.format 'directory' (default) emits /the-problem/index.html -> served at /the-problem/,
// matching the old Jekyll pretty permalinks. No baseurl: this is a root-domain site now.
export default defineConfig({
  site: 'https://haief.org',
  integrations: [sitemap()],
  adapter: cloudflare(),
})