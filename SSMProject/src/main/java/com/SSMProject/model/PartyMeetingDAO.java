package com.SSMProject.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.SSMProject.db.SqlSessionManager;


public class PartyMeetingDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

    public int MeetingJoin(PartyMeetingDTO dto) {
    	SqlSession sqlSession = sqlSessionFactory.openSession(true);
    	
    	int cnt = sqlSession.insert("MeetingJoin",dto);
    	
    	if(cnt > 0 ) {
    		System.out.println("모임 일정이 등록되었습니다!");
    	}else {
    		System.out.println("모임 일정 등록이 실패되었습니다.");
    	}
    	
    	sqlSession.close();
    	
    	return cnt;
        }
    }

