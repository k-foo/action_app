// 新規登録画面において15文字以上passwordを入力することによってアイコンが鮮明になるよう実装
window.addEventListener('load', () => {
const password = document.getElementById('password');
const icon = document.getElementById('pass-logo');

password.addEventListener('input', (e) => {
  const input = e.target.value;
  const length = input.length;
  const blurValue = 15 - length * 1;
  const blur = `blur(${blurValue}px)`;
  icon.style.filter = blur;
});
});