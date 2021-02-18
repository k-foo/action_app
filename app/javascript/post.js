function post() {
    const submit = document.getElementById("submit_message");
    submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("self_compassion"));
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
      if(document.querySelector("#trouble_message_type_trouble").checked) {
      const HTML_trouble= `
      <li class="message-left-side">
        <div class="pic-chat">
          <img src="images/sad.png" alt="落ち込んでいる画像">
        </div>
        <div class="text-chat">
        <div class="post-content">
          ${item.worry}
        </div>
        <div class="post-date">
          投稿日時：${item.created_at.slice(0,19)}
        </div>
      </li>`;
      list.insertAdjacentHTML("afterend", HTML_trouble);
      formText.value = "";
      return false;
    } else (document.querySelector("#trouble_message_type_encouragement").checked)
      const HTML_encouragement= `
      <li class="message-right-side">
        <div class="pic-chat">
          <img src="/assets/kind.png" alt="励ましている画像">
        </div>
        <div class="text-chat">
        <div class="post-content">
          ${item.worry}
        </div>
        <div class="post-date">
          投稿日時：${item.created_at.slice(0,19)}
        </div>
      </li>`;
      list.insertAdjacentHTML("afterend", HTML_encouragement);
      formText.value = "";
      return false;
    };
    e.preventDefault();
  });
}
window.addEventListener('load', post);
