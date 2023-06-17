/** @type {import('tailwindcss').Config} */

const colors = require('tailwindcss/colors')

module.exports = {
    content: [
        './templates/**/*.twig',
    ],
    theme: {
        extend: {
            screens: {
                xl: '1200px',
            },
            colors: {
                // set the global gray flavor
                gray: colors.slate,

                // let colors match the text of the text color of the typography plugin
                prose: colors.slate[900]
            },

            // make the list bullets a bit more visible
            // https://tailwindcss.com/docs/typography-plugin#adding-custom-color-themes
            typography: (theme) => ({
                slate: {
                    css: {
                        '--tw-prose-bullets': theme('colors.gray[400]'),
                    }
                }
            }),
        },
    },
    plugins: [
        require('@tailwindcss/typography'),
    ],
}

