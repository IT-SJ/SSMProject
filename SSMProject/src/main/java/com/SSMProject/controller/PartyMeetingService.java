package com.SSMProject.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SSMProject.model.CommunityDAO;
import com.SSMProject.model.PartyMeetingDAO;
import com.SSMProject.model.PartyMeetingDTO;
import com.SSMProject.model.PochaDTO;
import com.SSMProject.model.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/PartyMeeting")
public class PartyMeetingService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// POST 요청에 대한 인코딩 처리
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("result");

		// 1. 파일 저장 경로 설정
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("images/upload");
		String contextPath = request.getContextPath();
		
		// 2. 디렉토리 존재 여부 확인 및 생성
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs(); // 디렉토리 생성
		}

		// 3. 파일 최대 크기 설정 (5MB)
		int uploadFileSizeLimit = 5 * 1024 * 1024;

		// 4. 파일 업로드 처리
		MultipartRequest multi = new MultipartRequest(request, uploadPath, uploadFileSizeLimit, "UTF-8",
				new DefaultFileRenamePolicy());
	
		// 폼 데이터 가져오기
		String title = multi.getParameter("meetingtitle");
		String dt = multi.getParameter("meetingdt");
		String limit = multi.getParameter("meetinglimit");
		String img = contextPath+"/images/upload/"+multi.getFilesystemName("meetingimg"); // 저장된 경로로 수정
		String id = user.getId();

		// DTO에 값 설정
		PartyMeetingDTO mdto = new PartyMeetingDTO();
		mdto.setMeetingtitle(title);
		mdto.setMeetinglimit(limit);
		mdto.setMeetingdt(dt);
		mdto.setMeetingimg(img);
		mdto.setId(id);

		// DB 등록 처리
		PartyMeetingDAO dao = new PartyMeetingDAO();
		int result = dao.MeetingJoin(mdto);

		// 결과에 따른 응답 처리
		if (result > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("PartyDetail.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("PartyMeetingRegister.jsp");

		}
	}

}
