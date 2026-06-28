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
  { id: 'vuejs', name: 'Vue.js', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vuejs/vuejs-original.svg', type: 'original' },
  { id: 'react', name: 'React', url: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/react/react-original.svg', type: 'original' },
  { id: 'nextjs', name: 'Next.js', type: 'custom-nextjs' },
  { id: 'php-slim', name: 'PHP-Slim', type: 'custom-slim' },
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
      } else if (item.type === 'custom-slim') {
        // Custom background-less Slim Framework SVG
        cardSvg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 90" width="120" height="90">
  <style>
    .text {
      fill: #24292f;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
      font-size: 12px;
      font-weight: 600;
    }
    .icon-fill-1 {
      fill: #729544;
    }
    .icon-fill-2 {
      fill: #93bd5a;
    }
    @media (prefers-color-scheme: dark) {
      .text {
        fill: #c9d1d9;
      }
    }
  </style>
  
  <!-- PHP-Slim Framework Logo -->
  <svg x="40" y="8" width="40" height="40" viewBox="0 0 256 274">
    <path class="icon-fill-1" d="M50.424 33.748c-1.482 3.497-3.152 6.929-4.41 10.505-3.051 8.676-3.826 17.641-3.062 26.788.608 7.268 2.018 14.332 4.826 21.081 3.864 9.287 9.938 16.905 17.661 23.267 7.592 6.253 16.107 10.984 24.987 15.102 11.174 5.181 22.757 9.309 34.375 13.355 12.112 4.217 24.071 8.82 35.42 14.862 7.737 4.119 15.031 8.874 21.235 15.143 7.72 7.799 12.345 17.088 13.743 28.03 1.832 14.346-2.33 26.74-11.881 37.408-9.081 10.143-20.523 16.416-33.538 19.968-10.037 2.74-20.248 3.336-30.569 2.134-20.375-2.374-38.284-10.674-54.565-22.824-2.723-2.033-5.27-4.303-7.897-6.465-.342-.282-.666-.588-1.014-.863-2.038-1.61-4.026-1.716-6.092-.153-1.105.836-2.042 1.892-3.199 2.985-2.479-2.251-5.095-4.479-7.546-6.875-17.022-16.64-28.678-36.433-34.762-59.469-2.282-8.64-3.592-17.431-3.995-26.363C-.928 117.693 4.08 95.393 15.304 74.53c8.622-16.025 20.211-29.564 34.617-40.687.114-.088.253-.143.381-.214l.122.119"/>
    <path class="icon-fill-2" d="M208.879 234.173c.993-2.463 2.073-4.896 2.963-7.395 2.077-5.828 3.072-11.854 3.117-18.044.064-8.648-1.086-17.094-4.081-25.245-3.234-8.804-8.389-16.344-15.07-22.871-7.452-7.28-16.104-12.857-25.276-17.68-12.957-6.812-26.589-12.016-40.38-16.822-9.279-3.233-18.638-6.244-27.638-10.229-8.72-3.86-17.104-8.291-24.423-14.505-7.065-5.997-12.433-13.202-15.008-22.19-4.759-16.61-2.089-31.909 8.642-45.591 5.933-7.565 13.616-12.855 22.438-16.542 7.564-3.161 15.478-4.86 23.625-5.599 5.724-.52 11.451-.646 17.173-.133 8.506.762 16.758 2.72 24.799 5.574 9.021 3.201 17.614 7.289 25.682 12.461.558.357 1.153.668 1.759.937 2.121.94 4.074.633 5.714-1.001.851-.848 1.536-1.863 2.407-2.94 2.146 1.44 4.411 2.887 6.599 4.441 15.341 10.899 27.729 24.504 37.117 40.807 7.2 12.5 12.11 25.861 14.754 40.055 1.679 9.012 2.429 18.099 2.151 27.253-.498 16.43-3.939 32.224-10.505 47.315-6.802 15.63-16.358 29.356-28.615 41.188-2.494 2.408-5.214 4.584-7.83 6.867a3.961 3.961 0 0 0-.114-.111"/>
  </svg>
  
  <!-- Label -->
  <text class="text" x="60" y="70" text-anchor="middle">PHP-Slim</text>
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
