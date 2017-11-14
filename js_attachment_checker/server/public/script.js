// window.onload = function() {
//   // console.log('loaded');
//   const textarea = document.getElementsByTagName('textarea'),
//     attachInput = document.getElementById('attachment'),
//     errorDiv = document.getElementById('error'),
//     msg = "Did you mean to attach a file to this message?",
//     sendButtons = document.getElementsByClassName('send');
//
//   for (var i = 0; i < sendButtons.length; i++) {
//     // console.log(sendButtons[i]);
//     sendButtons[i].onclick = function() {
//       var body = textarea.body.value;
//       // console.log('body', body);
//
//       var saysAttach = (body.toLowerCase().indexOf('attach') !== -1);
//       // console.log('sayAttach', saysAttach);
//
//       var hasAttachment = (attachInput.value.length > 0);
//       // console.log('hasAttachment', hasAttachment);
//
//       if (saysAttach && !hasAttachment) {
//         alert(msg);
//         errorDiv.innerText = msg;
//         errorDiv.style.display = 'block';
//         // console.dir(errorDiv);
//       }
//     };
//   };
// }

$(function() {
    const $textarea = $('textarea'),
      $attachInput = $('#attachment'),
      $errorDiv = $('#error'),
      msg = "Did you mean to attach a file to this message?";

    $('.send').click(function() {
      var body = $textarea.val();
      // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes
      var saysAttach = body.toLowerCase().includes('attach');
      var hasAttachment = !!$attachInput.val();

      if (saysAttach && !hasAttachment) {
        alert(msg);
        $errorDiv.text(msg).slideDown();
      }
    });
});
