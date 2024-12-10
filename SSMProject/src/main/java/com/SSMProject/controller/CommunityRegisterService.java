package com.SSMProject.controller;

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
import com.SSMProject.model.CommunityDTO;
import com.SSMProject.model.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/CommunityRegister")
public class CommunityRegisterService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한고쿠 인코딩 데스
		request.setCharacterEncoding("utf-8");
	
		// 1. 파일경로
		ServletContext context = request.getServletContext();

		// 2. 실제 저장된 경로
		String uploadPath = context.getRealPath("images/upload");
		String contextPath = request.getContextPath();
		
		// 3. 파일의 최대 크기 지정 ( 최대 크기를 5MB로 지정 )
		int uploadFileSizeLimit = 5 * 1024 * 1024;

		// 4. 파일 저장
		MultipartRequest multi = new MultipartRequest(request, uploadPath, uploadFileSizeLimit, "UTF-8",
				new DefaultFileRenamePolicy());
				
		// 로그인 정보 꺼내오기 
		HttpSession session = request.getSession();
		// 로그인한 회원정보 가져오기
		UserDTO user = (UserDTO)session.getAttribute("result");

		
		// 요청 3개 데이터 꺼내오기 + id 정보 가져오기
		String id = user.getId();
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String cfile = contextPath+"/images/upload/"+multi.getFilesystemName("cfile");
		String city = multi.getParameter("city");
		String district = multi.getParameter("district");
		
		
		// 요청 데이터를 다른 클래스 파일로 넘겨줄 수 있도록 하나로 묶는 작업 . 타입은 CommunityDTO
		CommunityDTO dto = new CommunityDTO();
		dto.setId(id);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCfile(cfile);
		dto.setCity(city);
		dto.setDistrict(district);
		
		// DB에 해당 내용을 전달 
		CommunityDAO dao = new CommunityDAO();
		int result = dao.CommunityRegister(dto);
		
		// 결과값 전달
		if(result>0) {
			System.out.println("서블릿에서 커뮤니티 등록이 완료되었음!");
			response.sendRedirect("Community.jsp");
		}else {
			System.out.println("서블릿에서 커뮤니티 등록이 실패하였음!");
		}
		
	}

}
