package com.study.member.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.study.member.vo.Member;
import com.study.member.vo.MemberSearch;
import com.study.util.MyBatisFactory;

public class MemberDaoMyBatis implements IMemberDao {

	private String namespace = "com.study.member.dao.IMemberDao.";
	
	@Override
	public List<Member> getMemberList(Connection conn, MemberSearch memberSearch) throws SQLException {
		
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		
		try {
			List<Member> list = session.selectList(namespace + "getMemberList", memberSearch );
			return list;
		} finally {
			session.close();
		}
		
	}

	@Override
	public Member getMember(Connection conn, String mem_id) throws SQLException {
		
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		
		
		try {
			Member member = session.selectOne(namespace + "getMember", mem_id);		
			return member;
		} finally {
			session.close();
		}
		
	}

	@Override
	public int insertMember(Connection conn, Member member) throws SQLException {
		
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		
		
		
		try {
			int cnt = session.insert(namespace + "insertMember", member);	
			session.commit();
			return cnt;
		} finally {
			session.close();
		}
		
	}

	@Override
	public int updateMember(Connection conn, Member member) throws SQLException {
		
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		
		
		try {
			int cnt = session.update(namespace + "updateMember", member);		
			session.commit();
			return cnt;
		} finally {
			session.close();
		}
		
	}


	@Override
	public int deleteMember(Connection conn, Member member) throws SQLException {

		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		
		try {
		int cnt = session.delete(namespace + "deleteMember", member);
		session.commit();
		return cnt;
		
		} finally {
			session.close();
			
		}
		
		
	}

	@Override
	public int getMemberCount(Connection conn, MemberSearch memberSearch) throws SQLException {
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		
		
		try {
			int cnt = session.selectOne(namespace + "getMemberCount", memberSearch);		
			return cnt;
		} finally {
			session.close();
		}
	}

}
