package com.SSMProject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SSMProject.model.UserDAO;
import com.SSMProject.model.UserDTO;


@WebServlet("/Login")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 한글 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 2. 요청 데이터 꺼내기(2개)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);
		
		UserDAO dao = new UserDAO();
		
		UserDTO result = dao.login(dto);
		// 로그인 성공시 세션에 담기
		if(result != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("result", result);
			
			response.sendRedirect("MainPage.jsp");
			System.out.println("로그인 성공!");
			
		}
		// 로그인에 실패했다면
		else {
			System.out.println("로그인실패");
			request.setAttribute("errorMessage", "아이디와 비밀번호를 확인하세요.");
			// 포워딩 방식으로 에러메시지 전달
			RequestDispatcher rd = request.getRequestDispatcher("RealLogin.jsp");
			rd.forward(request, response);
		}
		
	}

}
