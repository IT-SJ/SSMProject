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
import javax.websocket.Session;

import com.SSMProject.model.PochaDAO;
import com.SSMProject.model.PochaDTO;
import com.SSMProject.model.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/CeoRegister")
public class CeoRegisterService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html; charset=UTF-8");

		// 세션 불러오기
		HttpSession session = request.getSession();
		// 로그인 한 회원정보 가져오기
		UserDTO user = (UserDTO) session.getAttribute("result");
		// 1. 파일경로
		ServletContext context = request.getServletContext();
		String contextPath = request.getContextPath();
		// 2. 실제 저장된 경로
		String uploadPath = context.getRealPath("images/upload");

		// 3. 파일의 최대 크기 지정 ( 최대 크기를 5MB로 지정 )
		int uploadFileSizeLimit = 5 * 1024 * 1024;

		// 4. 파일 저장
		MultipartRequest multi = new MultipartRequest(request, uploadPath, uploadFileSizeLimit, "UTF-8",
				new DefaultFileRenamePolicy());

		// 업로드된 파일의 이름 얻기
		String id = user.getId();
		String relativePath = contextPath+"/images/upload/"+multi.getFilesystemName("shopimage");
		String shopname = multi.getParameter("shopname");
		String shopaddr = multi.getParameter("shopaddress");
		String lat = multi.getParameter("shoplatitude");
		String lon = multi.getParameter("shoplongitude");
		String shoptel = multi.getParameter("shoptel");
		String day[] = multi.getParameterValues("days");
		String dayList = Arrays.toString(day);
		String shopoperstart = multi.getParameter("shopoper-start");
		String shopoperend = multi.getParameter("shopoper-end");
		String menu = multi.getParameter("shopmenu");

		// 요청받은 데이터를 다른 클래스 파일로 넘겨줄 수 있게 하나로 묶는 작업
		PochaDTO dto = new PochaDTO();
		dto.setId(id);
		dto.setUploadPath(relativePath);
		dto.setPocha_name(shopname);
		dto.setPocha_addr(shopaddr);
		dto.setLat(lat);
		dto.setLon(lon);
		dto.setPocha_tel(shoptel);
		dto.setDayList(dayList);
		dto.setShopoper_start(shopoperstart);
		dto.setShopoper_end(shopoperend);
		dto.setMenu(menu);

		// DB에 해당 내용 전달
		PochaDAO dao = new PochaDAO();
		int result = dao.PochaJoin(dto);

		// 가게 등록 성공 시 request에 담아준다.
		if (result > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
			request.setAttribute("request", "사장님 가게 등록 완료!");
			rd.forward(request, response);
		} else {
			response.sendRedirect("MainPage.jsp");
		}

		// 전부 출력해보기
		System.out.println(relativePath); // 실제 디렉토리 출력해보기
		System.out.println("업로드된 파일의 이름:" + multi.getFilesystemName("shopfile"));
		System.out.println("가게주소:" + shopaddr);
		System.out.println("위도:" + lat);
		System.out.println("경도:" + lon);
		System.out.println("가게 전화번호:" + shoptel);
		System.out.println("가게 운영날짜:" + Arrays.toString(day));
		System.out.println(dayList);
		System.out.println("타입 확인 : " + dayList.getClass().getName());
		System.out.println("가게 메뉴 확인 : " + menu);
	}

}
