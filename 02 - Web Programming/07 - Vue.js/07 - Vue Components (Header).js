// Header Component.
export default {
    // "name" is used for identification of the component.
    name: 'HeaderComponent',
    
    // "props" is used to receive data from parent components.
    // It works as the attributes in HTML tag for this component.
    props: ['title'],
    
    // "template" is used to define the HTML structure of the component.
    template: `
        <header>
            <h1>{{ title }}</h1>
        </header>
    `
};
