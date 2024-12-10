package com.SSMProject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SSMProject.model.CommentDAO;
import com.SSMProject.model.CommentDTO;
import com.SSMProject.model.UserDTO;

@WebServlet("/CommunityComment")
public class CommunityCommentService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 인코딩
		request.setCharacterEncoding("utf-8");

		// 세션에 아이디값 가져오기
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("result");

		// 값 불러오기
		String comment = request.getParameter("cmtcomment"); // 댓글 detail submit 채워줌
		String id = user.getId();
		// js에서 넘어온 title
		String title = request.getParameter("title"); // a -> title값 채워줌

		System.out.println("CommunityCommentService 에서 실행중 comment 값" + comment);
		System.out.println("CommunityCommentService 에서 실행중 id 값" + id);
		System.out.println("CommunityCommentService 에서 실행중 title 값" + title);

		CommentDTO cdto = new CommentDTO();
		cdto.setId(id);
		cdto.setCmtcontent(comment);
		cdto.setTitle(title);

		CommentDAO dao = new CommentDAO();
		int result = dao.CommentJoin(cdto);

		RequestDispatcher rd = request.getRequestDispatcher("CommunityCommentSelect");
		request.setAttribute("communitytitle", title);
		rd.forward(request, response);
	}
}
