package com.SSMProject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SSMProject.model.PochaDAO;
import com.SSMProject.model.PochaDTO;
import com.SSMProject.model.UserDTO;

@WebServlet("/PochaDetail")
public class PochaDetailService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String pochatitle = request.getParameter("title");
    	System.out.println("Category.jsp에서 넘어온 포장제목 확인 " + pochatitle);
    	
    	PochaDAO dao = new PochaDAO();
    	PochaDTO result = dao.PochaDetailSelect(pochatitle);
    	
    	if( result!= null) {
    		request.setAttribute("PochaInfo", result);
    		System.out.println("포차디테일 정보 검색 성공");
    		RequestDispatcher rd = request.getRequestDispatcher("PochaDetail.jsp");
    		rd.forward(request, response);
    	}
    }
}
