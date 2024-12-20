package com.SSMProject.db;

import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

	// 사용하고자 하는 DB의 기본정보 (드라이버 주소, username, pw등등)를 가지고
	// 여러개의 sqlSession을 생성할 수 있는 SqlSessionFactory를 생성하고
	// 관리할 수 있는 클래스!
	// 즉, 전반적인 DB에 대한 정보들을 저장하고 있는 클래스

	// try-catch는 스스로 동작할 수 없다! => main()

	static SqlSessionFactory sqlSessionFactory;

	// 초기화 블럭 문법! -> main()시작되자 마자 같이 호출될 수 있는 { } 구조!
	static {

		try {
			String resource = "com/SSMProject/db/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {

		}
	} // static 초기화 닫는 구조

	// 다른 클래스에서 해당하는 SqlSessionFactory를 호출할 수 있는 메소드 생성!
	// 공장의 기능들을 리턴 해주는 메서드 => DB를 사용하고싶을때마다 호출
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}

} // class 닫는 구조
