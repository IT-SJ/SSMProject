package com.SSMProject.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.SSMProject.db.SqlSessionManager;

public class CommentDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int CommentJoin(CommentDTO cdto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("CommentJoin", cdto);
		
		if(cnt>0) {
			System.out.println("댓글 등록 정상 작동 !");
		}else {
			System.out.println("댓글 작성 실패 !");
		}	
		sqlSession.close();
		
		return cnt;
	}
	// 제목으로 댓글 출력하는 메서드
	public ArrayList<CommentDTO> CommentSelectAll(CommentDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		System.out.println("DAO에서 title 넘어왔는지 실험 " + dto);
		
		ArrayList<CommentDTO> list = (ArrayList)sqlSession.selectList("CommentSelectAll",dto);
		for(int i = 0 ; i < list.size();i++) {
			System.out.println("CommentSelectAll 메서드에서 출력중! " + list.get(i).getCmtcontent());
			System.out.println("CommentSelectAll 메서드에서 출력중! " + list.get(i).getCmtdt());
			System.out.println("CommentSelectAll 메서드에서 출력중! " + list.get(i).getTitle());
		}
		
		sqlSession.close();
		
		return list;
	}

}
