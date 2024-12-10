package com.SSMProject.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SSMProject.model.CommentDAO;
import com.SSMProject.model.CommentDTO;


@WebServlet("/CommunityCommentSelect")
public class CommunityCommentSelectService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("utf-8");
		String title = (String)request.getAttribute("communitytitle");
		
		CommentDTO dto = new CommentDTO();
		dto.setTitle(title);
		
		CommentDAO dao = new CommentDAO();
		ArrayList<CommentDTO> result = dao.CommentSelectAll(dto);
		
		request.setAttribute("Commentlist", result);
		RequestDispatcher rd = request.getRequestDispatcher("CommunityDetail.jsp");
		rd.forward(request, response);
	}

}
