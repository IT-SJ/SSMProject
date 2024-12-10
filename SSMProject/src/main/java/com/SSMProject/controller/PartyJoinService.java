package com.SSMProject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SSMProject.model.PartyDAO;
import com.SSMProject.model.PartyDTO;
import com.SSMProject.model.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/PartyJoin")
public class PartyJoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html; charset=UTF-8");

		// 1. 파일경로
		ServletContext context = request.getServletContext();
		String contextPath = request.getContextPath();
		
		// 2. 실제 저장된 경로
		String uploadPath = context.getRealPath("images/upload");

		// 3. 파일의 최대 크기 지정 ( 최대 크기를 5MB로 지정 )
		int uploadFileSizeLimit = 5 * 1024 * 1024;

		// 4. 파일 저장
		MultipartRequest multi = new MultipartRequest(request, uploadPath, uploadFileSizeLimit, "UTF-8",new DefaultFileRenamePolicy());
		
		String partyname = multi.getParameter("Partyname");
		String partydesc = multi.getParameter("Partydesc");
		String city = multi.getParameter("city");
		String district = multi.getParameter("district");
		String partyimg = contextPath+"/images/upload/"+multi.getFilesystemName("imgFile");
		
		// 사용자 id
		HttpSession session = request.getSession();
		
		UserDTO user = (UserDTO)session.getAttribute("result");
		
		String id = user.getId();
		
		PartyDTO pdto = new PartyDTO();
		pdto.setParty_name(partyname);
		pdto.setParty_desc(partydesc);
		pdto.setCity(city);
		pdto.setDistrict(district);
		pdto.setParty_img(partyimg);
		pdto.setId(id);
		
		PartyDAO pdao = new PartyDAO();
		int result = pdao.join(pdto);
		
		if(result>0) {
			RequestDispatcher rd = request.getRequestDispatcher("Party.jsp");
			request.setAttribute("successmsg", "모임을 생성하셨습니다!");
			rd.forward(request, response);
		}else {
			response.sendRedirect("PartyRegister.jsp");
		}
	}

}
