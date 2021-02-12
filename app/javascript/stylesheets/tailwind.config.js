const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors: {
      // Build your palette here
      transparent: 'transparent',
      current: 'currentColor',
      bgray: colors.blueGray,
      cgray: colors.coolGray,
      gray: colors.gray,
      tgray: colors.trueGray,
      wgray: colors.warmGray,
      red: colors.red,
      orange: colors.orange,
      amber: colors.amber,
      yellow: colors.yellow,
      lime: colors.lime,
      green: colors.green,
      emerald: colors.emerald,
      teal: colors.teal,
      cyan: colors.cyan,
      lblue: colors.lightBlue,
      blue: colors.blue,
      indigo: colors.indigo,
      violet: colors.violet,
      purple: colors.purple,
      fuchsia: colors.fuchsia,
      pink: colors.pink,
      rose: colors.rose,
      black: colors.black,
      white: colors.white,
    },
    extend: {
      fontFamily: {
        title: ['Gilroy'],
        body: ['Inter']
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography')
  ],
}
