package com.SSMProject.model;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.SSMProject.db.SqlSessionManager;

public class CommunityDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 커뮤니티 글 등록 메소드 (회원가입이랑 비슷한 느낌?)
	public int CommunityRegister(CommunityDTO dto) {

		// DB작업을 하기위해 기능 대여 역할
		// true : 자동 commit
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		// 결과 값 받기 
		int cnt = sqlSession.insert("CommunityRegister", dto);
		
		
		if (cnt>0) {
			System.out.println("게시글 등록 성공 !");
		}else {
			System.out.println("게시글 등록 실패 ㅜㅜ");
		}
		sqlSession.close();
		
		return cnt;
	}// 글 등록 메소드 끝
	
	// 커뮤니티 글 셀렉트 메소드
	public ArrayList<CommunityDTO> CommunitySelectAll(CommunityDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		ArrayList<CommunityDTO> list = (ArrayList)sqlSession.selectList("CommunitySelectAll", dto);
		
		sqlSession.close();
		return list;
	}
	
	// 사용자 아이디값에 따른 Community에 적힌 글 호출하는 메서드
	public ArrayList<CommunityDTO> MypageSelectAll(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		ArrayList<CommunityDTO> list = (ArrayList)sqlSession.selectList("MypageSelectAll",id);
		
		sqlSession.close();
		
		return list;
	}
	
}
