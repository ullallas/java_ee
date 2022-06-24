package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public UserDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // = src/mybatis-config.xml
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); //생성
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		sqlSession.insert("userSQL.write", userDTO); //insert()는 int(개수) 리턴
		sqlSession.commit();
		sqlSession.close();
	} //write()

	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete", id); //값은 한번에 한개씩. 두 개 이상일 땐 map or DTO이용
		sqlSession.commit();
		sqlSession.close();
	} //delete()

	public List<UserDTO> getUserList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getUserList"); //넘겨줄 값 없음. 값이 하나라면(레코드 한 줄) selectOne 사용
		
		sqlSession.close();
		return list;
	} //getUserList()

	 
	public UserDTO getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		UserDTO userDTO = sqlSession.selectOne("userSQL.getUser", id);
		
		sqlSession.close();
		return userDTO;
	} //getUser()

	public void update(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		sqlSession.update("userSQL.update", map);
		sqlSession.commit();
		sqlSession.close();
		
	} //update()

	public List<UserDTO> search(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.search", map);
		
		sqlSession.close();
		return list;
	} //search()

}
