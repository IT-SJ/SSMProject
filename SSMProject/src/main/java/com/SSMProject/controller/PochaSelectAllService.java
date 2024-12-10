package com.SSMProject.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SSMProject.model.PochaDTO;
import com.SSMProject.model.UserDAO;
import com.SSMProject.model.UserDTO;


@WebServlet("/PochaSelectAll")
public class PochaSelectAllService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// menu Mainpage.jsp에서 넘어온 쿼리문 뒤쪽 menu
		String menu = (String)request.getParameter("menu");
		
		// 유저정보가 필요해 세션에서 정보를 꺼내옴
		HttpSession session = request.getSession();
		
		UserDTO user = (UserDTO)session.getAttribute("result");
		
		// 지역, 구 꺼내오기
		String city = user.getCity();
		String district = user.getDistrict();
		
		// 포차 dto에 맞춰주기 위해서 String 묶기
		String pocha_addr = city + " " + district;
		
		// 포차 dto에 넣기
		PochaDTO dto = new PochaDTO();
		dto.setMenu(menu);
		dto.setPocha_addr(pocha_addr);
		
		// dao가 가진 selectall 메소드를 실행
		UserDAO dao = new UserDAO();
		
		ArrayList<PochaDTO> list = dao.PochaSelectAll(dto);
		
		request.setAttribute("pochalist", list);
		// session에도 담기
		session.setAttribute("pocharesult", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("Category.jsp");
		rd.forward(request, response);
	}

}
