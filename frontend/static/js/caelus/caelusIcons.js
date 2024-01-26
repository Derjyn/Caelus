//!-===========================================================================
//!- caelusIcons.js
//!-    _____          ______ _     _    _  _____
//!-   / ____|   /\   |  ____| |   | |  | |/ ____|
//!-  | |       /  \  | |__  | |   | |  | | (___
//!-  | |      / /\ \ |  __| | |   | |  | |\___ \
//!-  | |____ / ____ \| |____| |___| |__| |____) |
//!-   \_____/_/    \_\______|______\____/|_____/
//!-
//!-===========================================================================

//=============================================================================

async function loadIcon(iconName) {
    try {
        const module = await import(`/node/lucide/dist/esm/icons/${iconName}.js`);
        return module.default;
    } catch (error) {
        console.error(`Could not load icon: ${iconName}`, error);
        return null;
    }
}

//=============================================================================

function objectToSvg(svgData) {
    // Initialize an empty string to build the SVG markup
    let svgMarkup = '';

    // Function to process each element, whether from an array or object structure
    const processElement = (element, attributes = {}, children = []) => {
        // Convert attributes to string
        const attrsString = Object.entries(attributes).map(([key, value]) => `${key}="${value}"`).join(' ');
        // Start the element tag
        let markup = `<${element} ${attrsString}`;

        if (children.length > 0) {
            // If there are children, close the opening tag and process children
            markup += '>';
            children.forEach(child => {
                // Recursively process each child, which could be an object or array
                markup += typeof child === 'object' ? objectToSvg(child) : child;
            });
            // Close the element tag
            markup += `</${element}>`;
        } else {
            // If no children, close the tag immediately
            markup += '/>';
        }

        return markup;
    };

    if (Array.isArray(svgData)) {
        // Handle the array structure [element, attributes, children]
        const [element, attributes, children] = svgData;
        svgMarkup += processElement(element, attributes, children);
    } else if (typeof svgData === 'object' && svgData !== null) {
        // Handle the object structure; assume the object is the 'attributes' with direct element as key
        Object.entries(svgData).forEach(([element, value]) => {
            if (element === 'default') { // Adjust based on the structure seen in the console
                value.forEach(item => {
                    svgMarkup += processElement(item[0], item[1], item[2]);
                });
            } else {
                const attributes = svgData[element] || {};
                const children = []; // Define how children are structured in your object scenario
                svgMarkup += processElement(element, attributes, children);
            }
        });
    }

    return svgMarkup;
}

//=============================================================================
// EXPORTS
//=============================================================================

export async function displayIcon(iconName, elementId) {
    const iconObject = await loadIcon(iconName);
    const iconSVG = objectToSvg(iconObject);
    document.getElementById(elementId).innerHTML = iconSVG;
}

export async function replaceIcons() {
    const iconElements = document.querySelectorAll('[data-icon]');

    for (const iconElement of iconElements) {
        const iconName = iconElement.getAttribute('data-icon');
        const iconSize = iconElement.getAttribute('data-size') || '24';
        const iconClass = iconElement.getAttribute('data-class') || '';

        try {
            const iconObject = await loadIcon(iconName); // Assuming loadIcon and objectToSvg are defined
            let iconSVG = objectToSvg(iconObject); // Convert the object to SVG markup

            // Create a temporary container to manipulate the SVG DOM
            const tempContainer = document.createElement('div');
            tempContainer.innerHTML = iconSVG;

            // Set the size on the SVG element
            const svgElement = tempContainer.querySelector('svg');
            if (svgElement) {
                svgElement.setAttribute('width', iconSize);
                svgElement.setAttribute('height', iconSize);
                svgElement.setAttribute('class', iconClass);
            }

            // Replace the original <i> element with the SVG, now including size modifications
            iconElement.parentNode.replaceChild(svgElement, iconElement);
        } catch (error) {
            console.error(`Error loading icon: ${iconName}`, error);
        }
    }
}

//!-=== EOF ===================================================================