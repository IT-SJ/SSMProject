const districts = {
	서울: ["종로구", "중구", "용산구", "성동구", "광진구"],
	부산: ["중구", "서구", "동구", "영도구", "부산진구"],
	광주: ["동구", "서구", "남구", "북구", "광산구"],
  };
  
  function updateDistrict() {
	const citySelect = document.getElementById("city");
	const districtSelect = document.getElementById("district");
  
	const selectedCity = citySelect.value;
  
	// Clear existing options
	districtSelect.innerHTML = '<option value="view" disabled selected>시/군/구</option>';
  
	// Add new options based on selected city
	if (districts[selectedCity]) {
	  districts[selectedCity].forEach((district) => {
		const option = document.createElement("option");
		option.value = district.toLowerCase();
		option.textContent = district;
		districtSelect.appendChild(option);
	  });
	}
  }

// 모든 항목을 채웠을때 버튼 변화 함수
const checkAllFields = () => {

	const userid = document.getElementById('userid').value.trim();
	const password = document.getElementById('password').value.trim();
	const checkpw = document.getElementById('checkpw').value.trim();
	const email = document.getElementById('email').value.trim();
	const city = document.getElementById('city').value;
	const district = document.getElementById('district').value;
	const userType = document.querySelector('input[name="userType"]:checked');
	const signupButton = document.getElementById('signup-button');

	const allFieldsFilled = userid && password && checkpw && email &&
		city !== 'view' && district !== 'view' && userType;

	const passwordsMatch = password === checkpw;

	signupButton.disabled = !(allFieldsFilled && passwordsMatch);

	// 비밀번호 확인 아이콘 표시
	const checkIcon = document.querySelector('.check-icon');
	const xIcon = document.querySelector('.x-icon');

	if (password && checkpw) {
		if (passwordsMatch) {
			checkIcon.style.display = 'inline';
			xIcon.style.display = 'none';
		} else {
			checkIcon.style.display = 'none';
			xIcon.style.display = 'inline';
		}
	} else {
		checkIcon.style.display = 'none';
		xIcon.style.display = 'none';
	}
}


// 모든 입력 필드에 이벤트 리스너 추가
document.getElementById('userid').addEventListener('input', checkAllFields);
document.getElementById('password').addEventListener('input', checkAllFields);
document.getElementById('checkpw').addEventListener('input', checkAllFields);
document.getElementById('email').addEventListener('input', checkAllFields);
document.getElementById('city').addEventListener('change', checkAllFields);
document.getElementById('district').addEventListener('change', checkAllFields);


// 라디오 버튼에 이벤트 리스너 추가
const radioButtons = document.querySelectorAll('input[name="userType"]');
radioButtons.forEach(radio => radio.addEventListener('change', checkAllFields));

// 페이지 로드 시 초기 체크
window.addEventListener('load', checkAllFields);

