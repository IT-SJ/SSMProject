package com.SSMProject.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SSMProject.model.PartyDAO;
import com.SSMProject.model.PartyDTO;
import com.google.gson.Gson;


@WebServlet("/PartySelect")
public class PartySelectService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String region = request.getParameter("region");
		String district = request.getParameter("district");

		// 선택한 데이터를 처리
		System.out.println("Region: " + region);
		System.out.println("District: " + district);

		// community dto에 넣기
		PartyDTO dto = new PartyDTO();
		dto.setCity(region);
		dto.setDistrict(district);

		// dao가 가진 PartySelectAll 메소드를 실행
		PartyDAO dao = new PartyDAO();

		ArrayList<PartyDTO> list = dao.PartySelectAll(dto);

		Gson gson = new Gson();
		String jsonResponse = gson.toJson(list);
		System.out.println(jsonResponse);
	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResponse);
	}
		
		

}
