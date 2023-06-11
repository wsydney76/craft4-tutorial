/** @type {import('tailwindcss').Config} */

const colors = require('tailwindcss/colors')

module.exports = {
    content: [
        './templates/**/*.twig',
    ],
    theme: {
        extend: {
            screens: {
                // the default of 768px is a bit too small for our needs
                md: '840px',
            },
            colors: {
                // set the global gray flavor
                gray: colors.slate,

                // let colors match the text of the text color of the typography plugin
                prose: colors.slate[900]
            }
        },
    },
    plugins: [
        require('@tailwindcss/typography'),
    ],
}

