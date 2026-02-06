# 04 - Node.js

<br />

## 1.0 - What Is Node.js & Installation

- It is a JavaScript Runtime Environment.
- JavaScript allows your computer to execute JavaScript code outside of a web browser.
- Standard computers don't speak JavaScript but they speak binary. Node.js translates JavaScript into instructions the computer understands.
- Node.js Download: https://nodejs.org/en/download
- Node Package Manager (NPM) Tools Library: https://www.npmjs.com/

<br />

## 2.0 Command

```html
- node -v | Check version of Node.js. Use this to verify Node.js is installed and recognized by your computer.
- npm -v  | Check version of NPM. Use this to verify Node Package Manager is installed and recognized by your computer.

- npm install 
  | Install all dependencies listed in package.json of a project.
  | Run it when you first download a new project or if you deleted the node_modules folder.
  | Your current directory must be the project folder (where the package.json file is).

- npm install <targetTool> 
  | Install a specific new tool into your project.
  | Example: "npm install axios" will download the "axios" tool and add it to your project list.

- npm run dev   
  | Start the project in development mode.
  | Your current directory must be the project folder.

- npm run build 
  | Build the project for production.

- npm config set fetch-retry-maxtimeout <maxTimeOutTime> 
  | Increase the network timeout limit.
  | Tells npm to wait longer before giving up on a slow download.
  | Example: "npm config set fetch-retry-maxtimeout 120000" set the maximum timeout time to 120000 milliseconds.
```
