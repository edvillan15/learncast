<script>
	import { Icon, Nav, NavItem, Shell } from '@sveltejs/site-kit/components';
	import '@sveltejs/site-kit/styles/index.css';
	import '../app.css';
</script>

<Shell>
	<Nav slot="top-nav">
		<svelte:fragment slot="home">
			<strong>meetlily</strong> Learn
		</svelte:fragment>

		<svelte:fragment slot="nav-right">
			<NavItem external="https://learn.meetlily.org">Meetlily</NavItem>

			<NavItem external="https://chat.meetlily.org/chat" title="Meetlily Chat">
				<span slot="small">Chat</span>
				<Icon name="message-square" />
			</NavItem>

			<NavItem external="https://github.com/meetlily/learn.meetlily.org" title="GitHub Repo">
				<span slot="small">GitHub</span>
				<Icon name="github" />
			</NavItem>
		</svelte:fragment>
	</Nav>

	<slot />
</Shell>

<style>
	:global(body) {
		margin: 0;
		width: 100%;
		min-height: 100dvh;
	}

	span {
		display: none;
	}

	@media (min-width: 800px) {
		span {
			height: 100%;
			display: flex;
			align-items: center;
			color: var(--sk-text-2);
			font-size: var(--sk-text-s);
			opacity: 1;
			white-space: nowrap;
		}
	}
</style>
