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

import com.SSMProject.model.FavoriteDAO;
import com.SSMProject.model.FavoriteDTO;
import com.SSMProject.model.PochaDAO;
import com.SSMProject.model.PochaDTO;
import com.SSMProject.model.UserDTO;


@WebServlet("/Favorite")
public class FavoriteJoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// Category.jsp에서 받아온 pochadix
		String pochaidx = request.getParameter("pochaidx");
		System.out.println("category에서 받아온 pochadix"+pochaidx);
		
		// session에서 받아온 userid 정보
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("result");
		
		String id = user.getId();
		
		FavoriteDTO dto = new FavoriteDTO();
		dto.setId(id);
		dto.setPochaidx(pochaidx);
		
		FavoriteDAO fdao = new FavoriteDAO();
		int result = fdao.favoriteJoin(dto);
					
		if(result > 0) {
			System.out.println("서블릿에서 즐겨찾기등록성공!");
		}else {
			System.out.println("서블릿에서 즐겨찾기등록실패");
		}
		// request 방식으로 FavoirteSelect에 포차 인덱스 전달
		request.setAttribute("pochaidx", pochaidx);
		RequestDispatcher rd = request.getRequestDispatcher("FavoriteSelect");
		rd.forward(request, response);
	}

}
