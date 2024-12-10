// 필터링된 구역 데이터를 정의


const districts = {
    '서울': ['강남구', '강북구', '송파구', '서초구', '관악구'],
    '광주': ['동구', '서구', '남구', '북구', '광산구'],
    '부산': ['중구', '서구', '동구', '영도구', '부산진구']
};

// 지역 선택 시 구역을 업데이트하는 함수
function updateDistricts(region) {
    const districtSection = document.getElementById('district-section');
    const districtOptions = document.getElementById('district-options');

    // 선택한 지역에 따른 구역 리스트 가져오기
    const selectedDistricts = districts[region] || [];

    // 구역 목록을 표시
    districtOptions.innerHTML = ''; // 기존 구역 목록 지우기
    selectedDistricts.forEach(district => {
        const label = document.createElement('label');
        label.innerHTML = `
            <input type="radio" name="district" value="${district}" onchange="sendFilterData()">
            ${district}
        `;
        districtOptions.appendChild(label);
    });

    // 구역 섹션을 보이게 함
    districtSection.classList.remove('hidden');
}

// 선택된 region과 district 데이터를 서버로 전송하는 함수
function sendFilterData() {
    const region = document.querySelector('input[name="region"]:checked')?.value;
    const district = document.querySelector('input[name="district"]:checked')?.value;

    if (region && district) {
        // AJAX 요청 보내기
        $.ajax({
            url: 'Community',  // 서블릿 URL
            method: 'GET',
            data: {
                region: region,
                district: district
            },
            success: function(response) {
                renderPosts(response, region, district); // 서버 응답 처리
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
				console.log('Status:', status);
				console.log('Response:', xhr.responseText);
            }
        });
    }
}

// 서버에서 받은 데이터를 필터를 유지하며 렌더링
function renderPosts(data, region, district) {
    const container = document.getElementById('posts-container');
    const pagination = document.getElementById('pagination');
    container.innerHTML = '';
    pagination.innerHTML = '';

    if (data && data.length > 0) {
        const postsPerPage = 3; // 3개씩 표시하도록 변경
        const totalPages = Math.ceil(data.length / postsPerPage);
        let currentPage = 1;

        function showPage(page) {
            container.innerHTML = '';
            const start = (page - 1) * postsPerPage;
            const end = start + postsPerPage;
            const pageData = data.slice(start, end);

            pageData.forEach(post => {
                const imagePath = post.cfile || 'placeholder-image.jpg';
                const postHTML = `
                    <div class="post-card" onclick="window.location.href='CommunityDetail.jsp?title=${post.title}'" style="cursor: pointer">
                        <img src="${imagePath}" class="post-image" alt="게시글 이미지">
                        <div class="post-content">
                            <h3>${post.title}</h3>
                            <p>${post.content}</p>
                        </div>
                    </div>`;
                container.insertAdjacentHTML('beforeend', postHTML);
            });

            updatePagination(page, totalPages);
        }

        function updatePagination(currentPage, totalPages) {
            pagination.innerHTML = '';
            for (let i = 1; i <= totalPages; i++) {
                const li = document.createElement('li');
                li.className = `page-item ${i === currentPage ? 'active' : ''}`;
                const a = document.createElement('a');
                a.className = 'page-link';
                a.href = '#';
                a.textContent = i;
                a.onclick = (e) => {
                    e.preventDefault();
                    showPage(i);
                };
                li.appendChild(a);
                pagination.appendChild(li);
            }
        }

        showPage(currentPage);
    } else {
        container.innerHTML = '<div class="post-card"><div class="post-content"><p align="center">게시글이 없습니다.</p></div></div>';
    }

    // 필터 상태 유지
    document.querySelectorAll('input[name="region"]').forEach(input => {
        input.checked = input.value === region;
    });
    updateDistricts(region); // 구역 갱신
    document.querySelectorAll('input[name="district"]').forEach(input => {
        input.checked = input.value === district;
    });
}