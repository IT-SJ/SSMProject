function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        var imgArea = document.getElementById('img-area');
        imgArea.style.backgroundImage = `url(${e.target.result})`;
        imgArea.classList.add('has-image');
        // Remove the original elements
        var uploadIcon = document.getElementById('upload-icon');
        var uploadTitle = document.getElementById('upload-title');
        var uploadInfo = document.getElementById('upload-info');
        if (uploadIcon) uploadIcon.remove();
        if (uploadTitle) uploadTitle.remove();
        if (uploadInfo) uploadInfo.remove();
      };
      reader.readAsDataURL(input.files[0]);
    }
  }