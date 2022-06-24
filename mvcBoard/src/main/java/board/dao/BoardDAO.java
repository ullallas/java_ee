package board.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public class BoardDAO {
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "oracle";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BoardDAO() {
		try {
			Class.forName(driver);
			System.out.println("드라이버 로딩...");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	} //BoardDAO()
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("접속");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	} //getConnection()
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void boardWrite(Map<String, String> map) {
//		String sql = "insert into board values(seq_board.nextval"
//														+",?"
//														+",?"
//														+",?"
//														+",?"
//														+",?"
//														+",seq_board.currval"
//														+",0"
//														+",0"
//														+",0"
//														+",0"
//														+",0"
//														+",sysdate)";
		String sql = "insert into board(seq, id, name, email, subject, content, ref)" 
					+ "values(seq_board.nextval,?,?,?,?,?,seq_board.currval)";
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql); //생성
			pstmt.setString(1, map.get("id"));
			pstmt.setString(2, map.get("name"));
			pstmt.setString(3, map.get("email"));
			pstmt.setString(4, map.get("subject"));
			pstmt.setString(5, map.get("content"));
			
			pstmt.executeUpdate(); //실행
			
		} catch (SQLException e) {
		e.printStackTrace();
		} finally {
			close();
		}
	} //write()

	public List<BoardDTO> getBoardList(int startNum, int endNum) {
		List<BoardDTO> list = new ArrayList<BoardDTO>(); //부모=자식
		String sql = "select * from (select rownum rn, tt.* from "
					  + "(select * from board order by seq desc)tt)"
					  + "where rn>=? and rn<=?";
		
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setSeq(rs.getInt("seq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setEmail(rs.getString("email"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRef(rs.getInt("ref"));
				boardDTO.setLev(rs.getInt("lev"));
				boardDTO.setStep(rs.getInt("step"));
				boardDTO.setPseq(rs.getInt("pseq"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(rs.getDate("logtime"));
				
				list.add(boardDTO);
			} //while
		
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		} finally {
			close();
		}
		
		return list;
	} //getBoardList()

	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from board";
		
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();					 			//포지션 설정	
			totalA = rs.getInt(1);		   		//첫번째 컬럼 꺼내오기
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return totalA;
	} //getTotalA()

	public BoardDTO getBoard(int seq) {
		BoardDTO boardDTO = null;
		String sql = "select * from board where seq = ?";
		
		getConnection();
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, seq);
				
				rs = pstmt.executeQuery();
			
				if(rs.next()) { 
					boardDTO = new BoardDTO();
					boardDTO.setSeq(rs.getInt("seq"));
					boardDTO.setId(rs.getString("id"));
					boardDTO.setName(rs.getString("name"));
					boardDTO.setEmail(rs.getString("email"));
					boardDTO.setSubject(rs.getString("subject"));
					boardDTO.setContent(rs.getString("content"));
					boardDTO.setRef(rs.getInt("ref"));
					boardDTO.setLev(rs.getInt("lev"));
					boardDTO.setStep(rs.getInt("step"));
					boardDTO.setPseq(rs.getInt("pseq"));
					boardDTO.setReply(rs.getInt("reply"));
					boardDTO.setHit(rs.getInt("hit"));
					boardDTO.setLogtime(rs.getDate("logtime"));
				}		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return boardDTO;
	} //getBoardView()
}
