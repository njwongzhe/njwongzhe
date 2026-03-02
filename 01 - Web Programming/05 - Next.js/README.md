# Next.js

<br />

## 1.0 - What Is Next.js & Installation

- It is a React Framework for building web applications.
- It is built on top of React.js and provides additional features and optimizations for server-side rendering, static site generation and API routes.

```html
- Next.js Installation: https://nextjs.org/
- Summary: 
  1 - Ensure Node.js is installed on your computer.
  2 - Run "npx create-next-app@latest" in your terminal. 
      If you not install Next.js yet, it will automatically download and run the latest version of Next.js to create your project.
  3 - Follow the prompts to set up your Next.js project.
      Prompts include: 
      a) Project Name
      b) TypeScript or JavaScript
         - TypeScript is a superset of JavaScript that adds static typing to the language. 
         - It can help catch errors early and improve code quality. It is recommended to use TypeScript for new projects.
      c) Linter : ESLint / Biome / None
         - ESLint is a tool for identifying and fixing problems in your JavaScript code. It helps maintain code quality and consistency.
         - Prettier is a code formatter that automatically formats your code according to a set of rules. It helps maintain a consistent code style across your project.
         - Biome is a tool that combines the functionalities of both ESLint and Prettier.
      d) Tailwind CSS 
         - A CSS framework that provides pre-designed classes for styling your web application. 
         - It allows you to quickly and easily style your components without writing custom CSS.
      e) React Compiler 
         - It optimizes the performance of your React code. It is recommended to enable it.
      f) Import Alias 
         - It allows you to create custom import paths for your modules. 
         - It can help simplify your import statements and make your code more organized.
      g) App Router or Pages Router 
         - App Router is the new routing system in Next.js that provides a more flexible and powerful way to define routes in your application. It is recommended to use it for new projects.
         - Pages Router is the traditional routing system in Next.js that uses a file-based approach to define routes. It is still supported but may be deprecated in the future.
      h) Use "src" Directory
         - It is a common convention to organize your source code in a "src" directory. (Recommended)
         - It can help keep your project organized and make it easier to find your code files.
```

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
   Next.js Project Structure after run "npx create-next-app@latest".
</p>

<br />

| File / Directory | Description | |
| :--- | :--- | :--- |
| **`.gitignore`** | Specifies which files Git should ignore (e.g., build artifacts, keys). | Git File |
| eslint.config.js | Configuration file for ESLint, a tool for identifying and fixing problems in your JavaScript code. Can be "biome.json" if you're using Biome instead of ESLint. | Linter Configuration File |
| next-env.d.ts | TypeScript declaration file that provides type definitions for Next.js. It helps TypeScript understand the types of Next.js-specific features and APIs. | TypeScript Declaration File |
| next.config.js | Configuration file for Next.js, where you can customize various aspects of your Next.js application. | Next.js Configuration File |
| package-lock.json | Automatically generated file that describes the exact dependency tree of your project. It ensures that the same versions of dependencies are installed across different environments. | Dependency Lock File |
| package.json | Contains metadata about your project, including dependencies, scripts, and other configurations. | Project Metadata File |
| postcss.config.js | Configuration file for PostCSS, a tool for transforming CSS with JavaScript plugins. It is used when you have Tailwind CSS or other PostCSS plugins in your project. | PostCSS Configuration File |
| README.md | A markdown file that provides an overview of your project, instructions for setup, usage, and other relevant information. | Project Documentation File |
| tsconfig.json | Configuration file for TypeScript, where you can specify compiler options and other settings for your TypeScript project. | TypeScript Configuration File |
| next | | Directory for Next.js-specific files and configurations. It may contain files like "app" (for App Router) or "pages" (for Pages Router), depending on your routing choice. | Next.js Directory |
| node_modules | Directory where all the installed dependencies of your project are stored. This directory is automatically generated when you run "npm install". | Dependencies Directory |
| public | Directory for static assets (e.g., images, fonts). Files in this directory can be accessed directly via the URL. | Static Assets Directory |
| src | Directory for your source code. It typically contains your application logic, components, and styles. | Source Code Directory |