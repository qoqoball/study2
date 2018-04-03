package com.study.board.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;

public interface IBoardDao {

	int getBoardCount(Connection conn, BoardSearch boardSearch) throws SQLException;

	List<Board> getBoardList(Connection conn, BoardSearch boardSearch) throws SQLException;

	// 회원상세
	Board getBoard(Connection conn, Integer bo_no) throws SQLException;

	// 회원등록 
	int insertBoard(Connection conn, Board board) throws SQLException;

	// 회원수정 
	int updateBoard(Connection conn, Board board) throws SQLException;

}