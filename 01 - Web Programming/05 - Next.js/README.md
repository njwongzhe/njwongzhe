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

## 2.0 Command

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
```

<br />

## 3.0 - Next.js Project Structure

<p align="center" width="100%">
   <img height="33%" src="https://github.com/njwongzhe/njwongzhe/blob/main/01%20-%20Web%20Programming/05%20-%20Next.js/Content_Nextjs_Project.png"><br>
   Next.js Project Structure after run "npx create-next-app@latest".<br>
   TypeScript, Tailwind CSS, ESLint, React Compiler, App Router and "src" directory are all enabled in this example.
</p>

<br />

| File / Directory | Description |
| :--- | :--- |
| **`.gitignore`** | Specifies which files Git should ignore. |
| **`eslint.config.js`** | Configuration file for ESLint, a tool for identifying and fixing problems in your JavaScript code. Can be "biome.json" if you're using Biome instead of ESLint. |
| **`next-env.d.ts`** | TypeScript declaration file that provides type definitions for Next.js. It helps TypeScript understand the types of Next.js-specific features and APIs. |
| **`next.config.js`** | Configuration file for Next.js, where you can customize various aspects of your Next.js application. |
| **`package-lock.json`** | Automatically generated file that describes the exact dependency tree of your project. It ensures that the same versions of dependencies are installed across different environments. |
| **`package.json`** | Contains metadata about your project, including dependencies, scripts, and other configurations. | Project Metadata File |
| **`postcss.config.js`** | Configuration file for PostCSS. It is used when you have Tailwind CSS or other PostCSS plugins in your project. |
| **`README.md`** | A markdown file that provides an overview of your project, instructions for setup, usage, and other relevant information. |
| **`tsconfig.json`** | Configuration file for TypeScript, where you can specify compiler options and other settings for your TypeScript project. |
| **`next\`** | Directory for Next.js-specific files and configurations. It may contain files like "app" (for App Router) or "pages" (for Pages Router), depending on your routing choice. |
| **`node_modules\`** | Directory where all the installed dependencies of your project are stored. This directory is automatically generated when you run "npm install". | 
| **`public`** | Directory for static assets (e.g., images, fonts). Files in this directory can be accessed directly via the URL. | 
| **`src`** | Directory for your source code. It typically contains your application logic, components, and styles. Can not exist if you choose not to use a "src" directory. |
| └ **`app\`** | Directory for App Router (if you chose App Router). It contains your application code organized by route. | Application Code Directory |
| --└ **`global.css`** | Global CSS file for your application. It is used to define global styles that apply to the entire app. (File name can be changed.) |
| --└ **`layout.tsx`** | The root layout file for your application. It defines the common structure and layout for all pages in your app. (File name cannot be changed.) |
| --└ **`page.tsx`** | The main page file for your application. It serves as the entry point for your app and typically contains the main content and components. (File name cannot be changed.) |
| └ **`pages\`** | Directory for Pages Router (if you chose Pages Router). It contains your application code organized by page. |