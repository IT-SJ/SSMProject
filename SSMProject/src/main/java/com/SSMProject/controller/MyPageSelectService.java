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

import com.SSMProject.model.CommunityDAO;
import com.SSMProject.model.CommunityDTO;
import com.SSMProject.model.UserDTO;

@WebServlet("/MyPageSelect")
public class MyPageSelectService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		UserDTO user = (UserDTO)session.getAttribute("result");
		
		String id = user.getId();
		
		// Community DAO를 호출하여 mypage id에 따른 값 출력
		CommunityDAO dao = new CommunityDAO();
		
		ArrayList<CommunityDTO> result = dao.MypageSelectAll(id);
		// 값을 얻어왔을때
		if(result !=null) {
			request.setAttribute("UserCommunityList", result);
			
			RequestDispatcher rd = request.getRequestDispatcher("MyPage.jsp");
			rd.forward(request, response);
		}else {
			System.out.println("mypageselectService오류! 다시 검색하시오");
		}
	}

}
