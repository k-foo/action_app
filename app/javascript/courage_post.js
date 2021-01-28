function post() {
    const submit = document.getElementById("submit_encouragement");
    submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form_encouragement"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/encouragements", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item_2 = XHR.response.encouragement;
      const list = document.getElementById("list_messages");
      const formText = document.getElementById("content_encouragement");
      const HTML = `
      <li class="message-right-side">
        <div class="pic-chat">
          <img src="/assets/kind.png" alt="励ましている画像">
        </div>
        <div class="text-chat">
        <div class="post-content">
          ${item_2.encouragement}
        </div>
        <div class="post-date">
          投稿日時：${item_2.created_at}
        </div>
      </li>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener('load', post);
