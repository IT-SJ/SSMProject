// 각 지역에 따른 시/군/구 목록 정의
   const districtsByCity = {
     "서울": ["강남구", "강동구", "강북구", "강서구"],
     "부산": ["해운대구", "수영구", "동래구", "남구"],
     "광주": ["동구", "서구", "남구", "북구", "광산구"]
   };

   function updateDistrict() {
     const citySelect = document.getElementById("city");
     const districtSelect = document.getElementById("district");
     
     // 선택된 지역 가져오기
     const selectedCity = citySelect.value;

     // 시/군/구 드롭다운 초기화
     districtSelect.innerHTML = `<option value="view" disabled selected>시/군/구</option>`;
     
     // 선택된 지역의 시/군/구 목록 추가
     if (districtsByCity[selectedCity]) {
       districtsByCity[selectedCity].forEach(district => {
         const option = document.createElement("option");
         option.value = district;
         option.textContent = district;
         districtSelect.appendChild(option);
       });
     }
   }