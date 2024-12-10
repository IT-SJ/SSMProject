package com.SSMProject.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SSMProject.model.PochaDAO;
import com.SSMProject.model.PochaDTO;
import com.SSMProject.model.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/CeoShopUpdate")
public class CeoShopUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//  ====================== 주의 =====================
		// PochaDTO uploadPath 가져오려고 실제 저장된 경로 P > p로 바꿈 
		
		
		request.setCharacterEncoding("utf-8");
		
		// 세션 불러오기 
		HttpSession session = request.getSession();
		// 로그인 한 회원정보 가져오기 
		UserDTO user = (UserDTO)session.getAttribute("result");
	
		// 1. 파일경로
		ServletContext context = request.getServletContext();
		String contextPath = request.getContextPath();
		
		// 2. 실제 저장된 경로
		String uploadpath = context.getRealPath("images/upload");
		System.out.println("CeoShopUpdateService에서 실행중" +context.getContextPath());
		// 3. 파일의 최대 크기 지정 ( 최대 크기를 5MB로 지정 )
		int uploadFileSizeLimit = 5 * 1024 * 1024;

		// 4. 파일 저장
		MultipartRequest multi = new MultipartRequest(request, uploadpath, uploadFileSizeLimit, "UTF-8",
				new DefaultFileRenamePolicy());
		
		String id = user.getId();
		String relativePath = contextPath+"/images/upload/"+multi.getFilesystemName("shopfile");
		System.out.println("상대경로 " + relativePath);
		String pocha_addr = multi.getParameter("pocha_addr");
		String lat = multi.getParameter("lat");
		String lon = multi.getParameter("lon");
		String day[] = multi.getParameterValues("days");
		String dayList = Arrays.toString(day);
		String shopoper_start = multi.getParameter("shopoper_start");
		String shopoper_end = multi.getParameter("shopoper_end");
		
		PochaDTO pdto = new PochaDTO();
		pdto.setId(id);
		pdto.setUploadPath(relativePath);
		pdto.setPocha_addr(pocha_addr);
		pdto.setLat(lat);
		pdto.setLon(lon);
		pdto.setDayList(dayList);
		pdto.setShopoper_start(shopoper_start);
		pdto.setShopoper_end(shopoper_end);
		
		// db에 해당내용을... 어쩌구 저쩌구 .. 
		PochaDAO pdao = new PochaDAO();
		int result = pdao.shopUpdate(pdto);
		
		// 조건 처리 
		if(result > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
			request.setAttribute("successmsg","가게 사항 변경이 완료됐습니다 !");
			System.out.println("가게 수정 완료 !");
			rd.forward(request, response);
		}else {
			System.out.println("가게 수정 실패했네ㅜ.ㅜ");
			response.sendRedirect("CeoShopUpdate.jsp");
		}
		
		
		
	}

}
