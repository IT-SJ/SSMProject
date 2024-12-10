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

import com.SSMProject.model.UserDAO;
import com.SSMProject.model.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UserInfoUpdate")
public class UserInfoUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 세션 불러오기 
		HttpSession session = request.getSession();
		
		// 로그인한 회원정보 가져오기 
		UserDTO user = (UserDTO)session.getAttribute("result");
		
		ServletContext context = request.getServletContext();
		String contextPath = request.getContextPath();
		
		// 2. 실제 저장된 경로
		String uploadPath = context.getRealPath("images/upload");

		// 3. 파일의 최대 크기 지정 ( 최대 크기를 5MB로 지정 )
		int uploadFileSizeLimit = 5 * 1024 * 1024;

		// 4. 파일 저장
		MultipartRequest multi = new MultipartRequest(request, uploadPath, uploadFileSizeLimit, "UTF-8",
				new DefaultFileRenamePolicy());
		
		String id = user.getId();
		String city = multi.getParameter("city");
		String district = multi.getParameter("district");
		String newpassword = multi.getParameter("newPassword");
		String profileimg = contextPath+"/images/upload/"+multi.getFilesystemName("imgFile");
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(newpassword);
		dto.setCity(city);
		dto.setDistrict(district);
		dto.setProfile_img(profileimg);
		
		UserDAO dao = new UserDAO();
		
		int result = dao.update(dto);
		
		// 조건 처리
		if(result>0) {
			session.setAttribute("successmsg", "회원정보를 수정하셨습니다!");
			request.setAttribute("UpdateResult", dto);
			System.out.println("회원 정보 수정 완료 !!");
			// MyPage.jsp로 이동 
			RequestDispatcher rd = request.getRequestDispatcher("MyPage.jsp");
			rd.forward(request, response);
		}else {
			System.out.println("정보 수정 실패.. ㅠㅠ");
		}
		
		
		
	}

}
