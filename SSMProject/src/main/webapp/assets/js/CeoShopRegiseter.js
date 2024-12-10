/**
 * 
 */function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			// img-area 요소 가져오기
			var imgArea = document.getElementById('img-area');

			// 배경 이미지를 선택한 이미지로 설정
			imgArea.style.backgroundImage = `url(${e.target.result})`;

			// has-image 클래스 추가
			imgArea.classList.add('has-image');

			// 기존 요소 제거 (아이콘, 제목, 정보 텍스트, 라벨)
			var elementsToRemove = [
				'upload-icon',
				'upload-title',
				'upload-info',
				'update-image-label'  // "update image" 라벨의 ID
			];

			elementsToRemove.forEach(function(elementId) {
				var element = document.getElementById(elementId);
				if (element) element.style.display = 'none';
			});
		};

		// 파일 읽기 시작
		reader.readAsDataURL(input.files[0]);
	}
}


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

