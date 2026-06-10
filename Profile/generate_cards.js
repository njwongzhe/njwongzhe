const fs = require('fs');
const path = require('path');

const items = [
  // Languages
  { id: 'cplusplus', name: 'C++', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/cplusplus/cplusplus-original.svg', type: 'original' },
  { id: 'java', name: 'Java', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/java/java-original.svg', type: 'original' },
  { id: 'php', name: 'PHP', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/php/php-original.svg', type: 'original' },
  { id: 'dart', name: 'Dart', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dart/dart-original.svg', type: 'original' },
  { id: 'html5', name: 'HTML5', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/html5/html5-original.svg', type: 'original' },
  { id: 'css3', name: 'CSS3', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/css3/css3-original.svg', type: 'original' },
  { id: 'javascript', name: 'JavaScript', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/javascript/javascript-original.svg', type: 'original' },
  { id: 'typescript', name: 'TypeScript', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/typescript/typescript-original.svg', type: 'original' },
  
  // Frontend & Frameworks
  { id: 'nodejs', name: 'Node.js', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/nodejs/nodejs-original.svg', type: 'original' },
  { id: 'react', name: 'React', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/react/react-original.svg', type: 'original' },
  { id: 'nextjs', name: 'Next.js', type: 'custom-nextjs' },
  { id: 'tailwindcss', name: 'Tailwind CSS', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/tailwindcss/tailwindcss-original.svg', type: 'original' },
  { id: 'flutter', name: 'Flutter', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/flutter/flutter-original.svg', type: 'original' },
  
  // Databases & Cloud
  { id: 'mysql', name: 'MySQL', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/mysql/mysql-original.svg', type: 'original' },
  { id: 'postgresql', name: 'PostgreSQL', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postgresql/postgresql-original.svg', type: 'original' },
  { id: 'prisma', name: 'Prisma', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/prisma/prisma-original.svg', type: 'original' },
  { id: 'firebase', name: 'Firebase', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/firebase/firebase-original.svg', type: 'original' },
  { id: 'supabase', name: 'Supabase', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/supabase/supabase-original.svg', type: 'original' },
  
  // Tools & Technologies
  { id: 'git', name: 'Git', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/git/git-original.svg', type: 'original' },
  { id: 'github', name: 'GitHub', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/github.svg', type: 'simpleicon', color: '#7E8C9A', darkColor: '#c9d1d9' },
  { id: 'vscode', name: 'VS Code', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vscode/vscode-original.svg', type: 'original' },
  { id: 'antigravity', name: 'Antigravity', url: 'https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/deepmind.svg', type: 'simpleicon', color: '#4F46E5', darkColor: '#818CF8' }
];

const cardsDir = path.join(__dirname, 'cards');
if (!fs.existsSync(cardsDir)) {
  fs.mkdirSync(cardsDir, { recursive: true });
}

async function fetchSvg(url) {
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to fetch ${url}: ${response.statusText}`);
  }
  return await response.text();
}

function parseSvgContent(svgText) {
  const viewBoxMatch = svgText.match(/viewBox=["']([^"']+)["']/);
  const viewBox = viewBoxMatch ? viewBoxMatch[1] : "0 0 24 24";
  
  const startIdx = svgText.indexOf('>');
  const endIdx = svgText.lastIndexOf('</svg>');
  if (startIdx === -1 || endIdx === -1) {
    throw new Error("Invalid SVG format");
  }
  const innerContent = svgText.substring(startIdx + 1, endIdx).trim();
  
  return { viewBox, innerContent };
}

async function generate() {
  console.log("Starting SVG card generation...");
  
  for (const item of items) {
    try {
      console.log(`Generating card for ${item.name}...`);
      let cardSvg = '';
      
      if (item.type === 'custom-nextjs') {
        // Custom background-less Next.js SVG
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
      } else {
        const rawSvg = await fetchSvg(item.url);
        const { viewBox, innerContent } = parseSvgContent(rawSvg);
        
        let styledContent = innerContent;
        if (item.type === 'simpleicon') {
          styledContent = `<g class="icon-fill">${innerContent}</g>`;
        }
        
        cardSvg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 90" width="120" height="90">
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
    ${styledContent}
  </svg>
  
  <!-- Label -->
  <text class="text" x="60" y="70" text-anchor="middle">${item.name}</text>
</svg>`;
      }
      
      const filename = path.join(cardsDir, `${item.id}.svg`);
      fs.writeFileSync(filename, cardSvg, 'utf8');
      console.log(`Saved ${filename}`);
    } catch (err) {
      console.error(`Error generating card for ${item.name}:`, err);
    }
  }
  console.log("SVG card generation complete.");
}

generate();
