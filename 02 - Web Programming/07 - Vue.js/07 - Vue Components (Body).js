// Body Component.
// Named export: exporting a specific constant.
export const AppBody = {
    // "name" is used for identification of the component.
    name: 'BodyComponent',
    
    // "props" is used to receive data from parent components.
    // It works as the attributes in HTML tag for this component.
    props: ['content', 'initialLikeCount'],
    
    // "data()" is used to hold the component's local reactive state.
    data() {
        return {
            likes: this.initialLikeCount
        };
    },
    
    // "methods" is used to define functions inside the component.
    methods: {
        like() {
            this.likes++;

            // Syntax: this.$emit('custom-event-name', data);
            // "this.$emit" triggers a custom event to notify parent components.
            this.$emit('like-updated', this.likes);
        }
    },
    
    // "template" is used to define the HTML structure of the component.
    template: `
        <main>
            <p>{{ content }}</p>
            <button @click="like">❤️ Like ({{ likes }})</button>
        </main>
    `
};
