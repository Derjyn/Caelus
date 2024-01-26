/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',  // or 'media' for OS-level preference
  important: true,    // Tailwind’s utilities should be marked with !important

  content: [
      './frontend/static/**/*.{html,js}',
      './frontend/templates/**/*.{html,js}',
  ],

  theme: {    
    fontFamily: {
      'sans': ['Aspekta', 'ui-sans-serif'],
      'mono': ['MonaspaceKrypton', 'ui-monospace']
    },
    extend: {
      colors: {
        'caelus': {
          'base': '#0D0D0D',
          'primary': '#202020',
          'secondary': '#444444',
          'tertiary': '#C2C2C2',
          'accent': '#780000'
        },
      },
    },
  },

  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/container-queries'),
    require("tailwindcss-animate"),
  ]   
}