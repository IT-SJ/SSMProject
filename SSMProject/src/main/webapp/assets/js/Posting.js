// 도시별 시/군/구 데이터를 객체로 정의
const districtData = {
    "서울": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구"],
    "부산": ["해운대구", "수영구", "동래구", "연제구", "부산진구", "남구", "동구", "서구"],
    "광주": ["남구", "동구", "서구", "광산구", "북구"]
};

// 도시 선택 시 호출되는 함수
function updateDistrict() {
    // 도시 선택 드롭다운과 시/군/구 드롭다운 요소 가져오기
    const citySelect = document.getElementById("city");
    const districtSelect = document.getElementById("district");

    // 선택한 도시 가져오기
    const selectedCity = citySelect.value;

    // 기존의 시/군/구 옵션 초기화
    districtSelect.innerHTML = '<option value="view" disabled selected>시/군/구</option>';

    // 선택한 도시의 시/군/구 데이터를 가져와 옵션 생성
    if (districtData[selectedCity]) {
        districtData[selectedCity].forEach((district) => {
            const option = document.createElement("option");
            option.value = district;
            option.textContent = district;
            districtSelect.appendChild(option);
        });
    }
}
