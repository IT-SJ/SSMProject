package com.SSMProject.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.SSMProject.db.SqlSessionManager;

public class FavoriteDAO {
	
	// DB 연결 
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 즐겨찾기 등록 메소드
	public int favoriteJoin(FavoriteDTO dto) {
		
		// 자동 commit
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("favoriteJoin",dto);
		
		if(cnt > 0) {
			System.out.println("즐겨찾기 등록 성공!");
		}else {
			System.out.println("즐겨찾기 등록 실패!");
		}
		
		return cnt;
	}
	
	// 유저정보에 따라 즐겨찾기에 쌓인 정보들 모두 검색
	public ArrayList<FavoriteDTO> favoriteAllSelect(FavoriteDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		ArrayList<FavoriteDTO> list = (ArrayList)sqlSession.selectList("favoriteAllSelect",dto);
		
		sqlSession.close();
		
		return list;
	}

	public int favoriteDelete(String pochaidx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.delete("favoriteDelete",pochaidx);
		
		sqlSession.close();
		
		return cnt;
	}
	
	
	
	
}
