document.addEventListener('DOMContentLoaded', function() {
    const fileUpload = document.getElementById('fileUpload');
    const profilePreview = document.getElementById('profilePreview');
    const changePhotoBtn = document.getElementById('changePhotoBtn');

    changePhotoBtn.addEventListener('click', function() {
        fileUpload.click(); // 버튼 클릭 시 파일 입력 필드 활성화
    });

    fileUpload.addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                profilePreview.src = e.target.result;
            }
            reader.readAsDataURL(file);
        }
    });
});