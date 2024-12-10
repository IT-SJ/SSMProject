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
import javax.websocket.Session;

import com.SSMProject.model.CommunityDAO;
import com.SSMProject.model.CommunityDTO;
import com.google.gson.Gson;

@WebServlet("/Community")
public class CommunityService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String region = request.getParameter("region");
		String district = request.getParameter("district");

		// 선택한 데이터를 처리
		System.out.println("Region: " + region);
		System.out.println("District: " + district);

		// community dto에 넣기
		CommunityDTO dto = new CommunityDTO();
		dto.setCity(region);
		dto.setDistrict(district);

		// dao가 가진 CommunitySelectAll 메소드를 실행
		CommunityDAO dao = new CommunityDAO();

		ArrayList<CommunityDTO> list = dao.CommunitySelectAll(dto);

		Gson gson = new Gson();
		String jsonResponse = gson.toJson(list);
		System.out.println(jsonResponse);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResponse);
	
		HttpSession session = request.getSession();
		session.setAttribute("communityresult", list);
	}

}
