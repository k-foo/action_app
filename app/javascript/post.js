function post() {
  const submit = document.getElementById("submit_btn");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("new_article"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/troubles", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200 ){
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.trouble;
      //レスポンスのうち、コントローラー側で指定したjson形式のデータを変数に代入
      const contentsArea = document.getElementById("contents_area");
      //今回投稿したデータを追加する要素の取得(追加する要素の親要素)
      const HTML = `
       <div class="trouble">
          ${ item.trouble }
        </div>`;
      //親要素に直前で定義した要素を追加
      contentsArea.insertAdjacentHTML("afterbegin", HTML);
      //親要素内の最上部に追加
      articleText.value = "";
    };
    e.preventDefault();
  })
}
window.addEventListener('load', post);
