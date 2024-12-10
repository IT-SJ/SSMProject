package com.SSMProject.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.SSMProject.db.SqlSessionManager;

public class UserDAO {

	// 데이터베이스 접속에 대한 모든 내용 요청하는 클래스
	// DB연결
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 회원가입 메소드
	public int join(UserDTO dto) {

		// DB작업을 하기위해 기능 대여 역할
		// true : 자동 commit
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		// 결과값을 받아온다.
		int cnt = sqlSession.insert("join", dto);

		// 리턴
		if (cnt > 0) {
			System.out.println("가입 성공!");
		} else {
			System.out.println("가입 실패!");
		}

		// sql 기능 반납
		sqlSession.close();

		return cnt;
	} // 회원가입 메소드 끝 !

	
	// 로그인 담당 메서드
	public UserDTO login(UserDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		UserDTO result = sqlSession.selectOne("login", dto);

		sqlSession.close();
		
		return result;
	} // 로그인 메소드 끝 
	
	
	// 회원정보 업데이트 메서드
	public int update(UserDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int result = sqlSession.update("update", dto);
		
		sqlSession.close();
		
		return result;
	}


	public ArrayList<PochaDTO> PochaSelectAll(PochaDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		ArrayList<PochaDTO> list = (ArrayList)sqlSession.selectList("PochaSelectAll", dto);
		
		sqlSession.close();
		return list;
	}
	

}
