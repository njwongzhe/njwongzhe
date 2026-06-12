# Vue.js

<br />

## 1.0 - What is Vue.js

- Vue.js is a client-side progressive JavaScript framework for building user interfaces.
- It acts as the View layer in traditional MVC architecture, simplifying data-to-view synchronization.
- Utilizes declarative template binding and a reactive system to automatically update the DOM when data changes.

<br />

## 2.0 - Basic Structure

- There is two types of API: Options API and Composition API.
- Options API structure organizes component components under designated properties:
  - `data()`: A function returning a reactive object containing component state/data.
  - `methods`: Object grouping action functions and custom logic.
  - `mounted()`: Lifecycle hook triggered automatically after the component is rendered in the DOM.
  ```html
  <div id="app">
      <h1>{{ title }}</h1>
      <button @click="updateTitle">Change Title</button>
  </div>

  <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
  <script>
      Vue.createApp({
          data() {
              return {
                  title: "Vue.js Basic Structure"
              };
          },
          methods: {
              updateTitle() {
                  // "this." is mandatory inside methods to reference data properties.
                  this.title = "Title Updated!"; 
              }
          }
        }).mount('#app');
  </script>
  ```

- Composition API structure organizes component components under the `setup()` function.
  ```html
    <!--Future Implementation-->
  ```
- **The Mandatory `this.` Rule**: When referencing variables declared in `data()` from inside `methods`, prefixing them with `this.` is strictly mandatory (e.g., `this.counter`).

<br />

## 3.0 - Directives

Directives are special helper attributes prefixed with `v-` that extend HTML element behaviors in Vue.

<br />

### 3.1 - Event Listeners
- `v-on:click` (Shorthand `@click`): Binds click actions to callback methods.
- Event argument passing (`$event`) for accessing native DOM event properties.
- Modifiers: `.prevent` (stops page reload/default), `.stop` (stops propagation), and key-based listeners (e.g., `@keyup.enter`).

<br />

### 3.2 - Conditional and List Rendering
- `v-if` / `v-else-if` / `v-else`: Adds or removes DOM elements dynamically.
- `v-show`: Toggles visible display state (`display: none`) in line CSS. Ideal for frequent toggles.
- `v-for`: Maps array items or objects into lists (requires a unique `:key`).

<br />

### 3.3 - Attribute Bindings
- `v-bind` (Shorthand `:`): Binds standard HTML properties dynamically (e.g., `:href`, `:src`, `:disabled`).
- `:class`: Object/array notation to toggle CSS classes dynamically (e.g., `:class="{ active: isActive }"`).
- `:style`: Object-based styles linking properties (e.g., `:style="{ color: textColor }"`).

<br />

### 3.4 - Form and Content Bindings
- `v-model`: Two-way data binding connecting user input states back to `data()`.
- `v-text` / `v-html`: Content bindings to render strings as text or raw HTML dynamically.
- Supports inputs, textareas, checkboxes (boolean/array), radio buttons, and select dropdowns.
- Modifiers: `.trim` (strips whitespace), `.number` (casts input to float/integer), `.lazy` (syncs on blur/change).

<br />

### 3.5 - Advanced or Special Directives
- `v-pre`: Bypasses parsing, rendering raw mustache codes verbatim (e.g., outputting `{{ message }}`).
- `v-once`: Evaluates and renders elements exactly once. Subsequent changes are ignored.
- `v-cloak`: Hides uncompiled HTML components until Vue triggers compiler rendering.
- `v-slot` (Shorthand `#`): Inject custom content into named slots in components.