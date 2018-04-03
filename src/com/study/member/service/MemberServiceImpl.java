package com.study.member.service;
//비즈니스 영역, 여러개의 프로세스 (insert, update ....)를 처리할 수 있는 곳. 트랜잭션은 서비스객체에서 묶이는 것이다.
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.study.member.dao.IMemberDao;
import com.study.member.dao.MemberDaoJDBC;
import com.study.member.dao.MemberDaoMyBatis;
import com.study.member.vo.Member;
import com.study.member.vo.MemberSearch;

public class MemberServiceImpl {
	
	private IMemberDao memberDao = new MemberDaoMyBatis(); // (IMemberDao) new MemberDaoJDBC();
	
	public int getMemberCount(MemberSearch memberSearch) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = memberDao.getMemberCount(conn, memberSearch);
			return cnt;
		} catch (SQLException e) {
			throw new RuntimeException("회원 목록 조회 오류", e);
		} finally {
			if(conn != null) try {conn.close();}catch(Exception e){}
		}
		
		
	}
	
	
	public List<Member> getMemberList(MemberSearch memberSearch) {
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			
			List<Member> list = memberDao.getMemberList(conn, memberSearch);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException("회원조회 오류", e);
		}finally {
			if(conn != null) try {conn.close();}catch(Exception e){};
		}
	}
	
	public Member getMember(String mem_id) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			Member member = memberDao.getMember(conn, mem_id);
			return member;
		} catch (SQLException e) {
			throw new RuntimeException("회원상세 오류", e);
		}finally {
			if(conn != null) try {conn.close();}catch(Exception e){};
		}
		
	}

	public int modifyMember(Member member) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = memberDao.updateMember(conn, member);
			return cnt;
		} catch (SQLException e) {
			throw new RuntimeException("회원수정 오류", e);
		}finally {
			if(conn != null) try {conn.close();}catch(Exception e){};
		}
	}
	
	public int registMember(Member member) {
		Connection conn = null;
		int cnt=0;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			cnt = memberDao.insertMember(conn, member);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try {conn.close();}catch(Exception e){};			
		}
		return cnt;
	}
	
	public int deleteMember(Member member) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = memberDao.deleteMember(conn, member);
			return cnt;
		} catch (SQLException e) {
			throw new RuntimeException("회원등록 삭제", e);
		}finally {
			if(conn != null) try {conn.close();}catch(Exception e){};
		}
	}
	
}








