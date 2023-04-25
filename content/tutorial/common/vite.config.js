import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit()],

	// Normally this would be unnecessary, but we
	// need it for learn.meetlily
	server: {
		fs: {
			strict: false
		}
	}
});
