// DOMContentLoaded : HTML 문서가 완전히 로드된 후 실행
document.addEventListener('DOMContentLoaded', () => {
    
    // '좋아요' 카운트를 표시하는 요소 가져오기
    const likeCount = document.getElementById('likeCount');
    let likeNumber = 1; // 좋아요 수 초기화

    // '좋아요' 텍스트를 클릭할 때마다 좋아요 수 증가
    likeCount.addEventListener('click', () => {
        likeNumber++; // 좋아요 수 증가
        likeCount.textContent = `❤️ 좋아요 ${likeNumber}`; // 텍스트에 새로운 좋아요 수 표시
    });

    // 댓글 폼 및 댓글 입력 필드, 댓글 목록 영역 가져오기
    const commentForm = document.getElementById('commentForm');
    const commentInput = document.getElementById('commentInput');
    const comments = document.querySelector('.comments');

    // 댓글 폼 제출 시 실행될 이벤트 리스너
    commentForm.addEventListener('submit', (e) => {
        e.preventDefault(); // 폼 제출로 인한 페이지 새로고침 방지

        // 댓글 입력값을 가져오고, 불필요한 공백 제거
        const newComment = commentInput.value.trim();

        // 댓글이 비어 있지 않으면 새로운 댓글 추가
        if (newComment) {
            // 새로운 댓글 요소 생성
            const commentElement = document.createElement('div');
            commentElement.className = 'comment d-flex mb-3'; // 댓글 스타일 클래스 추가

            // 댓글의 HTML 내용 구성
            commentElement.innerHTML = `
                <img src="https://via.placeholder.com/40" alt="User Image" class="rounded-circle me-2"> <!-- 댓글 작성자 이미지 -->
                <div>
                    <h6 class="mb-0">새로운 유저</h6> <!-- 댓글 작성자 이름 -->
                    <small class="text-muted">방금</small> <!-- 댓글 작성 시간 -->
                    <p class="mt-1">${newComment}</p> <!-- 실제 댓글 내용 -->
                </div>
            `;

            // 새로운 댓글을 댓글 목록의 맨 위에 추가
            comments.insertBefore(commentElement, commentForm);

            // 댓글 입력 필드 비우기
            commentInput.value = '';
        }
    });
});
