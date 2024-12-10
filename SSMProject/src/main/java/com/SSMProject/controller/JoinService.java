package com.SSMProject.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SSMProject.model.UserDAO;
import com.SSMProject.model.UserDTO;


@WebServlet("/Join")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식이기 때문에 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 요청 데이터 꺼내기 5개
		// id, pw, email, city(도,특별시,광역시), district(군)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String userType = request.getParameter("userType");
		
		
		// 요청받은 데이터를 다른 클래스 파일로 넘겨줄 수 있게 하나로 묶는 작업 (타입=UserDTO)
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setEmail(email);
		dto.setCity(city);
		dto.setDistrict(district);
		dto.setUserType(userType);
		
		// DB에 해당 내용 전달 
		UserDAO dao = new UserDAO();
		int result = dao.join(dto);
		
		// 결과값 전달
		if(result>0) {
			RequestDispatcher rd = request.getRequestDispatcher("Join.jsp");
			request.setAttribute("successmsg", "회원가입에 성공하셨습니다!");
			rd.forward(request, response);
		}else {
			response.sendRedirect("Join.jsp");
		}

	}

}
