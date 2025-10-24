# --- Build stage ---
FROM node:20.16.0 as build
WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build
RUN npm prune --production

# --- Production stage ---
FROM node:20.16.0 as production
WORKDIR /app
COPY package*.json ./
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist
COPY --from=build /app/.production.env ./
CMD ["node", "dist/main.js"]
