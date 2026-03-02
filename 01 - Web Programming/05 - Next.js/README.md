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
    <img height="33%" src="https://github.com/njwongzhe/njwongzhe/blob/main/02%20-%20Flutter/Content_Flutter_Project.png"><br>
    Flutter Project Structure after run "flutter create testfile".
</p>