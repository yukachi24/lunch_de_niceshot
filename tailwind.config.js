// tailwind.config.js

export default {
  theme: {
    extend: {
      colors: {
        brandGreen:  '#146C17',  // タイトル用の緑
        brandOrange: '#FF990A',  // de のオレンジ
        brandBlue:   '#0E7CCC',  // サブタイトルの濃い水色
        brandBeige:  '#F7F2E5',  // 背景のベージュ
      },
    },
  },
  content: [
    "./app/views/**/*.{html,erb}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.{js,jsx,ts,tsx}"
  ],
};
