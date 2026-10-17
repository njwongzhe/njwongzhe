# Next.js

<br />

## 1.0 - What Is Next.js & Installation

- It is a React Framework for building web applications.
- It is built on top of React.js and provides additional features and optimizations for server-side rendering, static site generation and API routes.
- Next.js Installation: https://nextjs.org/

- Installation & Setup Summary:
   1. Ensure Node.js is installed on your computer.
   2. Run "npx create-next-app@latest" in your terminal. If you not install Next.js yet, it will automatically download and run the latest version of Next.js to create your project.
   3. Follow the prompts to set up your Next.js project.

- Included Prompts:

| Prompt | Description |
| :--- | :--- |
| **`Project Name`** | Name of the Next.js project. |
| **`TypeScript`** | Choose whether to use TypeScript for your project. (Default is JavaScript.) |
| **`Tailwind CSS`** | Choose whether to use Tailwind CSS for styling. (Default is CSS.) |
| **`Linter`** | Choose a linter (ESLint / Biome / None) for your project. Linter helps maintain code quality and consistency. (Prefer ESLint.) |
| **`React Compiler`** | Choose whether to use the React Compiler. (Recommended to Enable it.) |
| **`App or Pages Router`** | Choose the routing system for your project. App Router threats each folder in the "app" directory as a route while Pages Router treats each file in the "pages" directory as a route. (Default is App Router. Recommended.) |
| **`"src" Directory`** | Choose whether to use a "src" directory for your source code. If not enable it, the "app" or "pages" directory will be placed at root directory. |
| **`Import Alias`** | Choose whether to use import aliases. It allows you to create custom import paths for your modules, which can help simplify your import statements and make your code more organized. (Recommended to Enable it.) |

<br />

## 2.0 Commands

```html
npx create-next-app@latest 
   | Create a new Next.js project. 
   | It will prompt you to answer some questions about your project setup (e.g., TypeScript, Tailwind CSS, etc.).
   | Run it in the terminal where you want to create your project.

npm install
   | Same as Node.js. Install all dependencies listed in package.json of a project.
   | Run it when you first download a new project or if you deleted the node_modules folder.
   | Your current directory must be the project folder (where the package.json file is).

npm run dev   
   | Same as Node.js. Start the project in development mode.
   | Your current directory must be the project folder.

npm run build 
   | Build and compile the Next.js application for production deployment.
   | Your current directory must be the project folder.

npm run start 
   | Start the Next.js production server after building.
   | Your current directory must be the project folder.