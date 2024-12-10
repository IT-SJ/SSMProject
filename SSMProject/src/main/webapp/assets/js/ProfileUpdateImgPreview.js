function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById("imagePreview").src = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
    }
}

document.getElementById('fileUpload').addEventListener("change", function() {
    readURL(this);
});

// 비밀번호 확인 메서드
document.addEventListener('DOMContentLoaded', function() {
    const currentPassword = document.getElementById('currentPassword');
    const newPassword = document.getElementById('newPassword');
    const confirmPassword = document.getElementById('confirmPassword');
    const passwordError = document.getElementById('passwordError');
    const submitButton = document.querySelector('button[type="submit"]');

    function validatePassword() {
        if (newPassword.value === currentPassword.value) {
            passwordError.textContent = '새 비밀번호는 현재 비밀번호와 달라야 합니다.';
            passwordError.style.color = 'red';
            submitButton.disabled = true;
        } else if (newPassword.value !== confirmPassword.value) {
            passwordError.textContent = '새 비밀번호가 일치하지 않습니다.';
            passwordError.style.color = 'red';
            submitButton.disabled = true;
        } else {
            passwordError.textContent = '새 비밀번호가 유효합니다.';
            passwordError.style.color = 'green';
            submitButton.disabled = false;
        }
    }

    newPassword.addEventListener('input', validatePassword);
    confirmPassword.addEventListener('input', validatePassword);
});