package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // = src/mybatis-config.xml
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); //생성
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	} //MemberDAO()
	
	public int write(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("memberSQL.write", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	} //write()
	
	public MemberDTO login(String id, String pwd) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", map);
		sqlSession.close();
		return memberDTO;
	} //login()

	
	public boolean isExistId(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
		
		boolean exist = false;
		if(memberDTO != null) exist=true;
		
		sqlSession.close();
		
		return exist;
	} //isExistId()

	public MemberDTO getMember(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember", id);
		
		sqlSession.close();
		return memberDTO;
	} //getMember()

	public void update(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		sqlSession.update("memberSQL.update", memberDTO);
		sqlSession.commit();
		sqlSession.close();
	} //update()

	
}
