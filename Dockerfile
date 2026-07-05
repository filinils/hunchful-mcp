# Hunchful is a REMOTE MCP server — https://hunchful.io/mcp (Streamable HTTP,
# OAuth 2.1). This image bridges a stdio client (e.g. Glama's introspector) to
# the live endpoint via mcp-remote, so the current tool set is what gets
# indexed. Anonymous reads are open; owner writes use OAuth in the connecting
# client. (Local package alternative: `npx -y @hunchful/mcp`.)
FROM node:22-alpine
ENTRYPOINT ["npx", "-y", "mcp-remote", "https://hunchful.io/mcp"]
