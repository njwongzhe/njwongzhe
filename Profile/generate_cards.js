const fs = require('fs');
const path = require('path');

const categories = [
  { id: 'languages', title: 'Languages', icon: '💻', desc: 'Mainstream programming, scripting, and markup languages' },
  { id: 'frontend', title: 'Frontend & Mobile Frameworks', icon: '⚛️', desc: 'UI libraries, CSS frameworks, and cross-platform mobile SDKs' },
  { id: 'backend', title: 'Backend Frameworks & Runtimes', icon: '🛠️', desc: 'Server runtimes, APIs, and web application frameworks' },
  { id: 'databases', title: 'Databases & Storage', icon: '🗄️', desc: 'SQL, NoSQL, ORMs, BaaS, and caching layers' },
  { id: 'cloud', title: 'Cloud Platforms', icon: '☁️', desc: 'Cloud providers and edge platforms' },
  { id: 'ai', title: 'AI & Large Language Models', icon: '🤖', desc: 'Mainstream LLMs and local runtimes' },
  { id: 'tools', title: 'Developer Tools & Platforms', icon: '🧰', desc: 'IDEs, editors, version control, OS, and package managers' }
];

const items = [
  // 1. Languages (Mainstream)
  { id: 'c', name: 'C', category: 'languages', type: 'custom-c' },
  { id: 'cplusplus', name: 'C++', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/cplusplus/cplusplus-original.svg', type: 'original' },
  { id: 'csharp', name: 'C#', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/csharp/csharp-original.svg', type: 'original' },
  { id: 'java', name: 'Java', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/java/java-original.svg', type: 'original' },
  { id: 'python', name: 'Python', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/python/python-original.svg', type: 'original' },
  { id: 'go', name: 'Go', category: 'languages', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/go.svg', type: 'simpleicon', color: '#00ADD8', darkColor: '#00ADD8' },
  { id: 'rust', name: 'Rust', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/rust/rust-original.svg', type: 'original' },
  { id: 'php', name: 'PHP', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/php/php-original.svg', type: 'original' },
  { id: 'swift', name: 'Swift', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/swift/swift-original.svg', type: 'original' },
  { id: 'kotlin', name: 'Kotlin', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/kotlin/kotlin-original.svg', type: 'original' },
  { id: 'dart', name: 'Dart', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dart/dart-original.svg', type: 'original' },
  { id: 'html5', name: 'HTML5', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/html5/html5-original.svg', type: 'original' },
  { id: 'css3', name: 'CSS3', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/css3/css3-original.svg', type: 'original' },
  { id: 'javascript', name: 'JavaScript', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/javascript/javascript-original.svg', type: 'original' },
  { id: 'typescript', name: 'TypeScript', category: 'languages', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/typescript/typescript-original.svg', type: 'original' },

  // 2. Frontend & Mobile
  { id: 'react', name: 'React', category: 'frontend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/react/react-original.svg', type: 'original' },
  { id: 'nextjs', name: 'Next.js', category: 'frontend', type: 'custom-nextjs' },
  { id: 'nestjs', name: 'NestJS', category: 'frontend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/nestjs/nestjs-original.svg', type: 'original' },
  { id: 'vuejs', name: 'Vue.js', category: 'frontend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vuejs/vuejs-original.svg', type: 'original' },
  { id: 'angular', name: 'Angular', category: 'frontend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/angular/angular-original.svg', type: 'original' },
  { id: 'tailwindcss', name: 'Tailwind CSS', category: 'frontend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/tailwindcss/tailwindcss-original.svg', type: 'original' },
  { id: 'bootstrap', name: 'Bootstrap', category: 'frontend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/bootstrap/bootstrap-original.svg', type: 'original' },
  { id: 'flutter', name: 'Flutter', category: 'frontend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flutter/flutter-original.svg', type: 'original' },
  { id: 'reactnative', name: 'React Native', category: 'frontend', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/react.svg', type: 'simpleicon', color: '#61DAFB', darkColor: '#61DAFB' },
  { id: 'electron', name: 'Electron', category: 'frontend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/electron/electron-original.svg', type: 'original' },
  { id: 'jquery', name: 'jQuery', category: 'frontend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/jquery/jquery-original.svg', type: 'original' },

  // 3. Backend & Runtimes
  { id: 'nodejs', name: 'Node.js', category: 'backend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/nodejs/nodejs-original.svg', type: 'original' },
  { id: 'fastapi', name: 'FastAPI', category: 'backend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/fastapi/fastapi-original.svg', type: 'original' },
  { id: 'django', name: 'Django', category: 'backend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/django/django-plain.svg', type: 'original' },
  { id: 'flask', name: 'Flask', category: 'backend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flask/flask-original.svg', type: 'original' },
  { id: 'spring', name: 'Spring Boot', category: 'backend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/spring/spring-original.svg', type: 'original' },
  { id: 'dotnet', name: '.NET', category: 'backend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dotnetcore/dotnetcore-original.svg', type: 'original' },
  { id: 'laravel', name: 'Laravel', category: 'backend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/laravel/laravel-original.svg', type: 'original' },
  { id: 'symfony', name: 'Symfony', category: 'backend', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/symfony/symfony-original.svg', type: 'original' },
  { id: 'php-slim', name: 'PHP-Slim', category: 'backend', type: 'custom-slim' },

  // 4. Databases & Storage
  { id: 'mysql', name: 'MySQL', category: 'databases', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/mysql/mysql-original.svg', type: 'original' },
  { id: 'postgresql', name: 'PostgreSQL', category: 'databases', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postgresql/postgresql-original.svg', type: 'original' },
  { id: 'sqlite', name: 'SQLite', category: 'databases', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/sqlite/sqlite-original.svg', type: 'original' },
  { id: 'prisma', name: 'Prisma', category: 'databases', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/prisma/prisma-original.svg', type: 'original' },
  { id: 'supabase', name: 'Supabase', category: 'databases', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/supabase/supabase-original.svg', type: 'original' },
  { id: 'firebase', name: 'Firebase', category: 'databases', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/firebase/firebase-original.svg', type: 'original' },
  { id: 'mongodb', name: 'MongoDB', category: 'databases', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/mongodb/mongodb-original.svg', type: 'original' },

  // 5. Cloud
  { id: 'aws', name: 'AWS', category: 'cloud', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg', type: 'original' },
  { id: 'googlecloud', name: 'Google Cloud', category: 'cloud', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/googlecloud/googlecloud-original.svg', type: 'original' },
  { id: 'azure', name: 'Azure', category: 'cloud', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/azure/azure-original.svg', type: 'original' },
  { id: 'docker', name: 'Docker', category: 'tools', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/docker/docker-original.svg', type: 'original' },
  { id: 'cloudflare', name: 'Cloudflare', category: 'cloud', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/cloudflare/cloudflare-original.svg', type: 'original' },
  { id: 'vercel', name: 'Vercel', category: 'cloud', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/vercel.svg', type: 'simpleicon', color: '#000000', darkColor: '#ffffff' },

  // 6. AI (Mainstream Large Language Models & Local Runtimes)
  { id: 'openai', name: 'OpenAI', category: 'ai', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/openai.svg', type: 'simpleicon', color: '#10A37F', darkColor: '#10A37F' },
  { id: 'claude', name: 'Claude', category: 'ai', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/claude.svg', type: 'simpleicon', color: '#D97757', darkColor: '#D97757' },
  { id: 'googlegemini', name: 'Google Gemini', category: 'ai', type: 'custom-gemini' },
  { id: 'deepseek', name: 'DeepSeek', category: 'ai', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/deepseek.svg', type: 'simpleicon', color: '#4D6BFE', darkColor: '#4D6BFE' },
  { id: 'qwen', name: 'Qwen', category: 'ai', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/qwen.svg', type: 'simpleicon', color: '#615CED', darkColor: '#615CED' },
  { id: 'ollama', name: 'Ollama', category: 'ai', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/ollama.svg', type: 'simpleicon', color: '#000000', darkColor: '#ffffff' },

  // 7. Developer Tools & Platforms
  { id: 'git', name: 'Git', category: 'tools', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/git/git-original.svg', type: 'original' },
  { id: 'github', name: 'GitHub', category: 'tools', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/github.svg', type: 'simpleicon', color: '#7E8C9A', darkColor: '#c9d1d9' },
  { id: 'vscode', name: 'VS Code', category: 'tools', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vscode/vscode-original.svg', type: 'original' },
  { id: 'visualstudio', name: 'Visual Studio', category: 'tools', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/visualstudio/visualstudio-original.svg', type: 'original' },
  { id: 'cursor', name: 'Cursor', category: 'tools', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/cursor.svg', type: 'simpleicon', color: '#000000', darkColor: '#ffffff' },
  { id: 'antigravity', name: 'Antigravity', category: 'tools', type: 'custom-antigravity' },
  { id: 'codex', name: 'Codex', category: 'tools', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/openai.svg', type: 'simpleicon', color: '#10A37F', darkColor: '#10A37F' },
  { id: 'claudecode', name: 'Claude Code', category: 'tools', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/claudecode.svg', type: 'simpleicon', color: '#D97757', darkColor: '#D97757' },
  { id: 'figma', name: 'Figma', category: 'tools', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/figma/figma-original.svg', type: 'original' },
  { id: 'postman', name: 'Postman', category: 'tools', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postman/postman-original.svg', type: 'original' },

  // Platforms & Operating Systems (Referenced by Native Mobile and OS rows)
  { id: 'androidstudio', name: 'Android Studio', category: 'tools', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/androidstudio/androidstudio-original.svg', type: 'original' },
  { id: 'xcode', name: 'Xcode', category: 'tools', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/xcode/xcode-original.svg', type: 'original' }
];

const cardsDir = path.join(__dirname, 'cards');
if (!fs.existsSync(cardsDir)) {
  fs.mkdirSync(cardsDir, { recursive: true });
}

async function fetchSvg(url, retries = 3) {
  for (let i = 0; i < retries; i++) {
    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`Failed to fetch ${url}: ${response.statusText} (${response.status})`);
      }
      return await response.text();
    } catch (err) {
      if (i === retries - 1) throw err;
      await new Promise(r => setTimeout(r, 1000));
    }
  }
}

function parseSvgContent(svgText) {
  const cleaned = svgText.replace(/<\?xml[\s\S]*?\?>/gi, '').replace(/<!DOCTYPE[\s\S]*?>/gi, '').trim();
  const svgOpenTagMatch = cleaned.match(/<svg\b([^>]*)>/i);
  if (!svgOpenTagMatch) {
    throw new Error("Invalid SVG format: No <svg> tag found");
  }
  const tagAttrs = svgOpenTagMatch[1];
  const viewBoxMatch = tagAttrs.match(/viewBox=["']([^"']+)["']/i);
  let viewBox = viewBoxMatch ? viewBoxMatch[1] : null;

  if (!viewBox) {
    const wMatch = tagAttrs.match(/width=["']([^"']+)["']/i);
    const hMatch = tagAttrs.match(/height=["']([^"']+)["']/i);
    if (wMatch && hMatch) {
      viewBox = `0 0 ${parseFloat(wMatch[1])} ${parseFloat(hMatch[1])}`;
    } else {
      viewBox = "0 0 24 24";
    }
  }

  const startIdx = cleaned.indexOf('>', svgOpenTagMatch.index) + 1;
  const endIdx = cleaned.lastIndexOf('</svg>');
  if (startIdx === 0 || endIdx === -1) {
    throw new Error("Invalid SVG format: Missing closing tag");
  }
  const innerContent = cleaned.substring(startIdx, endIdx).trim();

  return { viewBox, innerContent };
}

function generateSvgCard(item, viewBox, content) {
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 90" width="120" height="90">
  <style>
    .text {
      fill: #24292f;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
      font-size: 12px;
      font-weight: 600;
    }
    .icon-fill {
      fill: ${item.color || '#000000'};
    }
    @media (prefers-color-scheme: dark) {
      .text {
        fill: #c9d1d9;
      }
      .icon-fill {
        fill: ${item.darkColor || item.color || '#ffffff'};
      }
    }
  </style>
  
  <!-- Icon container -->
  <svg x="40" y="8" width="40" height="40" viewBox="${viewBox}">
    ${content}
  </svg>
  
  <!-- Label -->
  <text class="text" x="60" y="70" text-anchor="middle">${item.name}</text>
</svg>`;
}

async function processItem(item) {
  try {
    const filename = path.join(cardsDir, `${item.id}.svg`);
    if (!item.type.startsWith('custom-') && fs.existsSync(filename) && fs.statSync(filename).size > 50) {
      return { success: true, item };
    }

    let cardSvg = '';

    if (item.type === 'custom-c') {
      // Clean C logo that aesthetically matches C++'s 3D isometric hexagon shield
      cardSvg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 90" width="120" height="90">
  <style>
    .text {
      fill: #24292f;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
      font-size: 12px;
      font-weight: 600;
    }
    @media (prefers-color-scheme: dark) {
      .text {
        fill: #c9d1d9;
      }
    }
  </style>
  
  <!-- Icon container (Identical isometric 3D hexagon shield container to C++) -->
  <svg x="40" y="8" width="40" height="40" viewBox="0 0 128 128">
    <path fill="#00599c" d="M118.766 95.82c.89-1.543 1.441-3.28 1.441-4.843V36.78c0-1.558-.55-3.297-1.441-4.84l-55.32 31.94Zm0 0"/>
    <path fill="#004482" d="m68.36 126.586 46.933-27.094c1.352-.781 2.582-2.129 3.473-3.672l-55.32-31.94L8.12 95.82c.89 1.543 2.121 2.89 3.473 3.672l46.933 27.094c2.703 1.562 7.13 1.562 9.832 0Zm0 0"/>
    <path fill="#659ad2" d="M118.766 31.941c-.891-1.546-2.121-2.894-3.473-3.671L68.359 1.172c-2.703-1.563-7.129-1.563-9.832 0L11.594 28.27C8.89 29.828 6.68 33.66 6.68 36.78v54.196c0 1.562.55 3.3 1.441 4.843L63.445 63.88Zm0 0"/>
    <path fill="#fff" d="M63.445 26.035c-20.867 0-37.843 16.977-37.843 37.844s16.976 37.844 37.843 37.844c13.465 0 26.024-7.247 32.77-18.91L79.84 73.335c-3.38 5.84-9.66 9.465-16.395 9.465-10.433 0-18.922-8.488-18.922-18.922 0-10.434 8.49-18.922 18.922-18.922 6.73 0 13.017 3.629 16.39 9.465l16.38-9.477c-6.75-11.664-19.305-18.91-32.77-18.91z"/>
  </svg>
  
  <!-- Label -->
  <text class="text" x="60" y="70" text-anchor="middle">C</text>
</svg>`;
    } else if (item.type === 'custom-nextjs') {
      cardSvg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 90" width="120" height="90">
  <style>
    .text {
      fill: #24292f;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
      font-size: 12px;
      font-weight: 600;
    }
    .icon-fill {
      fill: #000000;
    }
    .icon-fill-fade {
      fill: #000000;
      opacity: 0.55;
    }
    @media (prefers-color-scheme: dark) {
      .text {
        fill: #c9d1d9;
      }
      .icon-fill {
        fill: #ffffff;
      }
      .icon-fill-fade {
        fill: #ffffff;
        opacity: 0.55;
      }
    }
  </style>
  
  <!-- Next.js "N" logo without outer circle -->
  <svg x="40" y="8" width="40" height="40" viewBox="0 0 256 256">
    <path class="icon-fill" d="M212.634 224.028L98.335 76.8H76.8v102.357h17.228V98.68L199.11 234.446a128 128 0 0 0 13.524-10.418"/>
    <path class="icon-fill-fade" d="M163.556 76.8h17.067v102.4h-17.067z"/>
  </svg>
  
  <!-- Label -->
  <text class="text" x="60" y="70" text-anchor="middle">Next.js</text>
</svg>`;
    } else if (item.type === 'custom-slim') {
      const existing = path.join(cardsDir, 'php-slim.svg');
      if (fs.existsSync(existing)) {
        cardSvg = fs.readFileSync(existing, 'utf8');
      }
    } else if (item.type === 'custom-antigravity') {
      const existing = path.join(cardsDir, 'antigravity.svg');
      if (fs.existsSync(existing)) {
        cardSvg = fs.readFileSync(existing, 'utf8');
      }
    } else if (item.type === 'custom-gemini') {
      cardSvg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 90" width="120" height="90">
  <defs>
    <linearGradient id="gemini-grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#1BA1E3"/>
      <stop offset="25%" stop-color="#4285F4"/>
      <stop offset="55%" stop-color="#9B72CB"/>
      <stop offset="80%" stop-color="#D96570"/>
      <stop offset="100%" stop-color="#F4B400"/>
    </linearGradient>
  </defs>
  <style>
    .text {
      fill: #24292f;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
      font-size: 12px;
      font-weight: 600;
    }
    @media (prefers-color-scheme: dark) {
      .text {
        fill: #c9d1d9;
      }
    }
  </style>
  
  <!-- Icon container -->
  <svg x="40" y="8" width="40" height="40" viewBox="0 0 24 24">
    <path fill="url(#gemini-grad)" d="M11.04 19.32Q12 21.51 12 24q0-2.49.93-4.68.96-2.19 2.58-3.81t3.81-2.55Q21.51 12 24 12q-2.49 0-4.68-.93a12.3 12.3 0 0 1-3.81-2.58 12.3 12.3 0 0 1-2.58-3.81Q12 2.49 12 0q0 2.49-.96 4.68-.93 2.19-2.55 3.81a12.3 12.3 0 0 1-3.81 2.58Q2.49 12 0 12q2.49 0 4.68.96 2.19.93 3.81 2.55t2.55 3.81"/>
  </svg>
  
  <!-- Label -->
  <text class="text" x="60" y="70" text-anchor="middle">Google Gemini</text>
</svg>`;
    } else {
      const rawSvg = await fetchSvg(item.url);
      const { viewBox, innerContent } = parseSvgContent(rawSvg);
      
      let styledContent = innerContent;
      if (item.type === 'simpleicon') {
        styledContent = `<g class="icon-fill">${innerContent}</g>`;
      }
      cardSvg = generateSvgCard(item, viewBox, styledContent);
    }

    if (cardSvg) {
      const filename = path.join(cardsDir, `${item.id}.svg`);
      fs.writeFileSync(filename, cardSvg, 'utf8');
      return { success: true, item };
    } else {
      return { success: false, item, error: 'Empty SVG generated' };
    }
  } catch (err) {
    return { success: false, item, error: err.message };
  }
}

function generateReadme() {
  console.log("Generating README.md for cards directory...");
  
  const itemMap = {};
  for (const it of items) {
    itemMap[it.id] = it;
  }

  function cardImg(id) {
    const it = itemMap[id];
    const name = it ? it.name : id;
    return `<img src="${id}.svg" width="88" height="66" alt="${name}" />`;
  }

  const matrixRows = [
    { name: 'C Family', languages: ['c', 'cplusplus', 'csharp'], frameworks: ['dotnet'] },
    { name: 'Java', languages: ['java'], frameworks: ['spring'] },
    { name: 'Python', languages: ['python'], frameworks: ['fastapi', 'django', 'flask'] },
    { name: 'PHP', languages: ['php'], frameworks: ['laravel', 'symfony', 'php-slim'] },
    { name: 'Go', languages: ['go'], frameworks: [] },
    { name: 'Rust', languages: ['rust'], frameworks: [] },
    { name: 'Web', languages: ['html5', 'css3', 'javascript', 'typescript'], frameworks: ['react', 'nextjs', 'vuejs', 'angular', 'nodejs', 'nestjs', 'tailwindcss', 'bootstrap', 'jquery'] },
    { name: 'Cross-Platform', languages: ['dart'], frameworks: ['flutter', 'reactnative', 'electron'] },
    { name: 'Native Mobile', languages: ['swift', 'kotlin'], frameworks: ['androidstudio', 'xcode'] },
    { name: 'Database', languages: ['mysql', 'postgresql', 'sqlite', 'prisma'], frameworks: ['supabase', 'firebase', 'mongodb'] },
    { name: 'Cloud', languages: [], frameworks: ['aws', 'googlecloud', 'azure', 'cloudflare', 'vercel'] },
    { name: 'Developer Tools', languages: [], frameworks: ['git', 'github', 'docker', 'figma', 'postman'] },
    { name: 'IDE / Editor', languages: [], frameworks: ['vscode', 'visualstudio', 'cursor', 'antigravity', 'codex', 'claude', 'claudecode'] },
    { name: 'AI', languages: [], frameworks: ['openai', 'claude', 'googlegemini', 'deepseek', 'qwen', 'ollama'] }
  ];

  let matrixTable = `| &nbsp; | <div align="center">Language</div> | <div align="center">Framework / Platform</div> |\n| :--- | :--- | :--- |\n`;
  const emptyPlaceholder = '<div align="center">—</div>';
  for (const row of matrixRows) {
    const langHtml = row.languages.length > 0
      ? row.languages.map(cardImg).join(' ')
      : emptyPlaceholder;
    const fwHtml = row.frameworks.length > 0
      ? row.frameworks.map(cardImg).join(' ')
      : emptyPlaceholder;
    matrixTable += `| **${row.name}** | ${langHtml} | ${fwHtml} |\n`;
  }

  const readmeContent = `# 🎨 Tech Stack Cards Collection\n\n${matrixTable}\n`;

  const readmePath = path.join(cardsDir, 'README.md');
  fs.writeFileSync(readmePath, readmeContent, 'utf8');
  console.log(`Saved README to ${readmePath}`);
}

async function generate() {
  console.log(`Starting SVG card generation for ${items.length} technologies...`);
  
  const batchSize = 12;
  const failed = [];
  let completed = 0;

  for (let i = 0; i < items.length; i += batchSize) {
    const chunk = items.slice(i, i + batchSize);
    const results = await Promise.all(chunk.map(it => processItem(it)));
    
    for (const res of results) {
      if (!res.success) {
        failed.push(res);
        console.error(`❌ Failed ${res.item.name}: ${res.error}`);
      } else {
        completed++;
      }
    }
    console.log(`Progress: ${completed}/${items.length} cards processed...`);
  }

  generateReadme();

  console.log("\n==================================");
  console.log(`Card generation complete!`);
  console.log(`Successfully generated: ${completed}`);
  console.log(`Failed: ${failed.length}`);
  if (failed.length > 0) {
    console.log(`Failed items:`, failed.map(f => `${f.item.name} (${f.error})`));
  }
  console.log("==================================");
}

generate();
