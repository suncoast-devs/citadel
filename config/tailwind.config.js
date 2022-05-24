const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/components/**/*.{rb,erb,html}',
    './app/helpers/**/*.{rb}',
    './app/views/**/*.{erb,html}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inria Sans', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [require('@tailwindcss/forms'), require('@tailwindcss/aspect-ratio'), require('@tailwindcss/typography')],
}
