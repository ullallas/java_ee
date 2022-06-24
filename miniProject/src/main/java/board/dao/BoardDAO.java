package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public BoardDAO() {
		Reader reader;
		try {
			reader = Resources.getResourceAsReader("mybatis-config.xml"); // = src/mybatis-config.xml
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); //생성
		} catch (IOException e) {
			e.printStackTrace();
		} 
	} //BoardDAO()
	
	public void boardWrite(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		sqlSession.insert("boardSQL.boardWrite", map);
		sqlSession.commit();
		sqlSession.close();
	} //write()

	public List<BoardDTO> getBoardList(int startNum, int endNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardList", map);
		
		sqlSession.close();
		return list;
	} //getBoardList()

	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	} //getTotalA()

	public BoardDTO getBoard(int seq) { //String 타입으로 오면
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq); //seq에 parseInt 해줘야함
		sqlSession.close();
		return boardDTO;
	} //getBoard()

	public void boardUpdate(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardUpdate", map);
		sqlSession.commit();
		sqlSession.close();
		
	} //boardUpdate()

	public void boardReply(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = this.getBoard(Integer.parseInt(map.get("pseq"))); //원글, 내 클래스 안에 있으니 this
		System.out.println("원글 = " + boardDTO);
		
		//step(글순서) update
		sqlSession.update("boardSQL.boardReply1", boardDTO);
		
		//insert
		map.put("ref", boardDTO.getRef()+""); //답글ref = 원글ref
		map.put("lev", boardDTO.getLev()+1+""); //답글lev = 원글lev+1
		map.put("step", boardDTO.getStep()+1+""); //답글step = 원글step+1
		sqlSession.insert("boardSQL.boardReply2", map);
		
		//reply(답글수) update
		//sqlSession.update("boardSQL.boardReply3", boardDTO.getSeq());
		sqlSession.update("boardSQL.boardReply3", map);
		
		sqlSession.commit();
		sqlSession.close();
	} //boardReply

	public void boardDelete(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("boardSQL.boardDelete", seq);
		sqlSession.commit();
		sqlSession.close();
		
	}

	public void setHit(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.setHit", seq);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardSearch", map);
		sqlSession.close();
		return list;
	}

	public int getTotalSearchA(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalSearchA", map);
		sqlSession.close();
		return totalA;
	}
}















