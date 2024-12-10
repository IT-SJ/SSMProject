package com.SSMProject.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.SSMProject.db.SqlSessionManager;

public class PochaDAO {
	// DB 접속에 대한 모든 내용 요청하는 클래스

	// DB 연결
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 포차 둥록 메소드
	public int PochaJoin(PochaDTO dto) {

		// 기능대여 , 자동 commit
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		// 결과값 받아오고 값 .대입
		int cnt = sqlSession.insert("PochaJoin", dto);

		if (cnt > 0) {
			System.out.println("포차 등록 성공!");
		} else {
			System.out.println("포차 등록 실패 ㅜㅠ");
		}

		// 기능 반납
		sqlSession.close();

		// 리턴값
		return cnt;
	}// 포차등록 메소드 끝

	// 즐겨찾기에 따른 포차 정보 검색
	public ArrayList<PochaDTO> favSelectAll(ArrayList<FavoriteDTO> favlist) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		ArrayList<PochaDTO> list = (ArrayList) sqlSession.selectList("favSelectAll", favlist);
		sqlSession.close();

		return list;
	}

	// 포차 find 메소드

	public ArrayList<PochaDTO> PochaSelectAll(PochaDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		ArrayList<PochaDTO> list = (ArrayList) sqlSession.selectList("PochaSelectAll", dto);

		sqlSession.close();
		return list;
	}

	// 뽀짜 업데이트
	public int shopUpdate(PochaDTO pdto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int result = sqlSession.update("PochaUpdate", pdto);

		sqlSession.close();

		return result;
	}

	// 접속한 id에 따른 포장마차 검색 메소드
	public PochaDTO PochaSelectOne(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		PochaDTO result = sqlSession.selectOne("PochaSelectOne", id);

		sqlSession.close();

		return result;
	}

	public PochaDTO PochaDetailSelect(String pochatitle) {
		 SqlSession sqlSession = sqlSessionFactory.openSession(true);
		 
		 PochaDTO result = (PochaDTO)sqlSession.selectOne("PochaDetailSelect", pochatitle);
		 
		 sqlSession.close();
		 
		 return result;
	}

}
