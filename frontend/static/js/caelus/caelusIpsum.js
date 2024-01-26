//!-===========================================================================
//!- caelusIpsum.js
//!-    _____          ______ _     _    _  _____
//!-   / ____|   /\   |  ____| |   | |  | |/ ____|
//!-  | |       /  \  | |__  | |   | |  | | (___
//!-  | |      / /\ \ |  __| | |   | |  | |\___ \
//!-  | |____ / ____ \| |____| |___| |__| |____) |
//!-   \_____/_/    \_\______|______\____/|_____/
//!-
//!-===========================================================================

//=============================================================================

// cSpell:disable
const loremSentencesByLength = {
    short: [
        "Vestibulum vulputate vel.",
        "Phasellus in est.",
        "Sed malesuada aliquet.",
    ],
    medium: [
        "Cras venenatis fermentum rhoncus.",
        "Nunc porta sapien lorem.",
        "In hac habitasse platea.",
    ],
    long: [
        "Quisque vel venenatis metus, ac.",
        "Cras libero quam, hendrerit condimentum.",
        "Morbi vel consectetur lacus. Nullam.",
    ],
    veryLong: [
        "Aliquam pellentesque, tortor et pellentesque porta.",
        "Pellentesque justo eros, eleifend suscipit elementum.",
        "Quisque volutpat velit vel faucibus tempor."
    ]
};
// cSpell:enable

//=============================================================================

function generateLoremIpsum({ paragraphs = 1, length = 'medium' } = {}) {
    const sentenceCountOptions = {
        short: { min: 1, max: 3 },
        medium: { min: 3, max: 5 },
        long: { min: 5, max: 8 },
        veryLong: { min: 8, max: 12 }
    };

    let htmlContent = "";
    for (let i = 0; i < paragraphs; i++) {
        const sentenceRange = sentenceCountOptions[length];
        const sentenceCount = randomBetween(sentenceRange.min, sentenceRange.max);

        let paragraphSentences = [];
        for (let j = 0; j < sentenceCount; j++) {
            const randomIndex = randomBetween(0, loremSentencesByLength[length].length - 1);
            paragraphSentences.push(loremSentencesByLength[length][randomIndex]);
        }

        htmlContent += `<p>${paragraphSentences.join(' ')}</p>`;
    }

    return htmlContent;
};

//=============================================================================

function randomBetween(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
};

//=============================================================================
// EXPORTS
//=============================================================================

export { generateLoremIpsum };

//!-=== EOF ===================================================================