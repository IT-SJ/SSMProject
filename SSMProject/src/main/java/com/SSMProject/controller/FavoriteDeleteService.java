package com.SSMProject.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SSMProject.model.FavoriteDAO;

@WebServlet("/FavoriteDelete")
public class FavoriteDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// PochaFavorite.jsp에서 받아온 pochadix
		String pochaidx = request.getParameter("pochaidx");
		System.out.println("PochaFavorite.jsp에서 받아온 pochadix" + pochaidx);
		
		FavoriteDAO fdao = new FavoriteDAO();
		int result = fdao.favoriteDelete(pochaidx);
		
		if(result > 0) {
			System.out.println("DB에서 즐겨찾기 삭제 완료!");
		}else {
			System.out.println("DB에서 즐겨찾기 삭제 실패!");
		}
		
		
		
	}
}
