/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        'steel-blue': '#2B5D7C',
        'burnt-orange': '#E0701F',
        'gold': '#C9A227',
        'charcoal': '#1F2328',
      },
    },
  },
}
