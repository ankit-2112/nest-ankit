# Step 1: Build React app
FROM node:18 AS build

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . ./
RUN npm run build

# Step 2: Serve with Node.js
FROM node:18

WORKDIR /app
COPY --from=build /app /app

RUN npm install --omit=dev

EXPOSE 3000
CMD ["node", "server.js"]
