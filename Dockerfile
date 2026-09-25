# Hunchful is a REMOTE MCP server — https://hunchful.io/mcp (Streamable HTTP,
# OAuth 2.1, sign-in required: it's the person's inbox). Non-interactive
# introspectors (e.g. Glama) can't sign in, so this image bridges stdio to the
# anonymous, read-only endpoint instead. Full server: connect /mcp with OAuth,
# or `npx -y @hunchful/mcp` (opens a browser to sign in).
FROM node:22-alpine
ENTRYPOINT ["npx", "-y", "mcp-remote", "https://hunchful.io/mcp/public"]
