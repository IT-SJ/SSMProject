package com.SSMProject.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SSMProject.model.PochaDAO;
import com.SSMProject.model.PochaDTO;
import com.SSMProject.model.UserDTO;

@WebServlet("/PochaSelectOne")
public class PochaSelectOneService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 세션 불러오기
		HttpSession session = request.getSession();
		// 로그인 한 회원정보 가져오기
		UserDTO user = (UserDTO) session.getAttribute("result");
		
		String id = user.getId();
		
		PochaDAO dao = new PochaDAO();
		PochaDTO result = dao.PochaSelectOne(id);
		
		// select 성공시 세션에 담기
		if(result != null) {
			session.setAttribute("PochaSelectOne", result);
			System.out.println("포차 검색 성공!");
		}
		response.sendRedirect("CeoShopUpdate.jsp");
	}

}
