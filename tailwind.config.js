/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class', // or 'media' for OS-level preference
  content: [
      './frontend/static/**/*.{html,js}',
      './frontend/templates/**/*.{html,js}',
  ],
  theme: {
    extend: {
      fontFamily: {
        'dispaly': ['AspektaVariable, ui-serif'],
        'dispaly': ['MonaspaceKrypton, ui-monospace'],
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/container-queries'),
  ]
}