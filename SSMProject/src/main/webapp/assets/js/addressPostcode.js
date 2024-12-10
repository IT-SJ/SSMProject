function addressPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            kakao.maps.load(() => {
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new kakao.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                        level: 5 // 지도의 확대 레벨
                    };
                var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                var addr = data.address; // 최종 주소 변수
                var center = map.getCenter();


                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;

                // 주소로 상세 정보를 검색
                var geocoder = new kakao.maps.services.Geocoder();
                geocoder.addressSearch(data.address, function (results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new kakao.maps.LatLng(result.y, result.x);
                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                        // 위도, 경도
                        document.getElementById("latitude").value = result.y;
                        document.getElementById("longitude").value = result.x;

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        // var marker = new kakao.maps.Marker({
                        //     map: map,
                        //     position: coords
                        // });

                    }
                });

            });

        }
    }).open({
        popupKey: 'popup1',
        autoClose: false
    });
}
