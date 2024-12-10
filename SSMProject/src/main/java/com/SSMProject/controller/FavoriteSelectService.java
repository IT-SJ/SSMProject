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


@WebServlet("/FavoriteSelect")
public class FavoriteSelectService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pochaidx = (String)request.getAttribute("pochaidx");
		System.out.println("FavoriteJoinService에서 받아온 pochadix"+pochaidx);
		
		// session에서 받아온 userid 정보
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("result");
		
		String id = user.getId();
		
		FavoriteDTO dto = new FavoriteDTO();
		dto.setId(id);
		dto.setPochaidx(pochaidx);
		
		// 즐겨찾기 검색하여 현재 즐겨찾기 얼마나 쌓였는지 출력! => 즐겨찾기 테이블에쌓인 포장마차 번호를 다시 포장마차에서 검색하여 출력!
		FavoriteDAO fdao = new FavoriteDAO();
		ArrayList<FavoriteDTO> favlist = fdao.favoriteAllSelect(dto);
		
		// 즐겨찾기에 따른 포차 결과
		PochaDAO pdao = new PochaDAO();
		ArrayList<PochaDTO> pochalist = pdao.favSelectAll(favlist);
		
		request.setAttribute("favpochalist", pochalist);
		
		for(int i = 0 ; i < pochalist.size() ; i++) {
			System.out.println("즐겨찾기서블릿에서 실행중 받아온 포차이름 "+pochalist.get(i).getPocha_name()); 
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("PochaFavorite.jsp");
		rd.forward(request, response);
		
		
		
	}

}
