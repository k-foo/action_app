function post() {
    const submit = document.getElementById("submit_worry");
    submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form_worry"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/troubles", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.trouble;
      const list = document.getElementById("list_messages");
      const formText = document.getElementById("content_worry");
      const HTML = `
      <li class="message-left-side">
        <div class="pic-chat">
          <img src="/assets/sad.png" alt="落ち込んでいる画像">
        </div>
        <div class="text-chat">
        <div class="post-content">
          ${item.worry}
        </div>
        <div class="post-date">
          投稿日時：${item.created_at}
        </div>
      </li>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener('load', post);
