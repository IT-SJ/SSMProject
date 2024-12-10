package com.SSMProject.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.SSMProject.db.SqlSessionManager;

public class PartyDAO {

	// DB 연결
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int join(PartyDTO pdto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("partyJoin",pdto);
		
		if(cnt > 0) {
			System.out.println("모임 테이블에 등록 완료!");
		}else {
			System.out.println("모임 테이블에 등록 실패!");
		}
		
		return cnt;
	}
	
	// 모임 셀렉트 메소드
		public ArrayList<PartyDTO> PartySelectAll(PartyDTO dto) {
			
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			ArrayList<PartyDTO> list = (ArrayList)sqlSession.selectList("PartySelectAll", dto);
			
			sqlSession.close();
			return list;
		}
		

		

}
