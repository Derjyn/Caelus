/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class', // or 'media' for OS-level preference
  content: [
      './frontend/static/**/*.{html,js}',
      './frontend/templates/**/*.{html,js}',
  ],
  theme: {
    fontFamily: {
      'sans': ['Aspekta', 'ui-sans-serif'],
      'mono': ['MonaspaceKrypton', 'ui-monospace'],
      'display': ['Aspekta', 'ui-sans-serif'],
    }
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/container-queries'),
  ]
}