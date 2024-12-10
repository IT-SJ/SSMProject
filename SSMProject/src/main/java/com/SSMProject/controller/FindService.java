package com.SSMProject.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SSMProject.model.PochaDAO;
import com.SSMProject.model.PochaDTO;


@WebServlet("/Find")
public class FindService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 인코딩
	    response.setContentType("text/html; charset=UTF-8"); 
	    
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String addr = city+" "+district;
		String menu = request.getParameter("menu");
		
		PochaDTO dto =new PochaDTO();
		dto.setPocha_addr(addr);
		dto.setMenu(menu);
		
		
		// dao가 가진 selectall 메소드를 실행
		PochaDAO dao = new PochaDAO();
		
		ArrayList<PochaDTO> list = dao.PochaSelectAll(dto);
				
		request.setAttribute("pochalist", list);
	
		RequestDispatcher rd = request.getRequestDispatcher("Find.jsp");
		rd.forward(request, response);
		
		
		
		
		
	}

}
