// Footer Component.
// Named export: exporting a specific constant.
export const AppFooter = {
    // "name" is used for identification of the component.
    name: 'FooterComponent',
    
    // "props" is used to receive data from parent components.
    // It works as the attributes in HTML tag for this component.
    props: ['copyright'],
    
    // "template" is used to define the HTML structure of the component.
    template: `
        <footer>
            <p>{{ copyright }}</p>
        </footer>
    `
};
