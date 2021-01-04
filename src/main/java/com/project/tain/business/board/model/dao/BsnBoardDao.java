package com.project.tain.business.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.business.board.model.domain.BsnBoard;
import com.project.tain.business.board.model.domain.BsnBoardAdd;

@Repository("bbDao")
public class BsnBoardDao {
	//디아이
	@Autowired
	private SqlSession sqlSession;
	
	public int listCount() {
		return sqlSession.selectOne("BsnBoard.bsnListCount");
	}
	
	// 게시물 목록(전체)
	public List<BsnBoard> selectListAll(){
		return sqlSession.selectList("BsnBoard.bsnSelectListAll");
	}
	// 게시물 목록(텍스트)
	public List<BsnBoard> selectList(){
		return sqlSession.selectList("BsnBoard.bsnSelectList");
	}
	// 게시물 목록(이미지)
	public List<BsnBoardAdd> selectListImg(){
		return sqlSession.selectList("BsnBoard.bsnAddSelectList");
	}
	
	// 게시물 상세(전체)
	public BsnBoard selectOne(String bb_id) {
		return sqlSession.selectOne("BsnBoard.bsnSelectOne", bb_id);
	}
	// 게시물 상세(텍스트)
	public BsnBoard selectOneText(String bb_id) {
		return sqlSession.selectOne("BsnBoard.bsnTextSelectOne", bb_id);
	}
	// 게시물 상세(이미지)
	public BsnBoardAdd selectOneImg(String bb_id) {
		return sqlSession.selectOne("BsnBoard.bsnAddSelectOne", bb_id);
	}
	
	// 게시물 등록(텍스트)
	public int insertBsnBoard(BsnBoard bb) {
		System.out.println("aaa3");
		return sqlSession.insert("BsnBoard.insertBsnBoard", bb);
	}
	// 게시물 등록(이미지)
	public int insertBsnBoardAdd(BsnBoardAdd bba) {
		System.out.println("bbb");
		System.out.println(bba.getBb_img1());
		System.out.println(bba.getBb_img2());
		System.out.println(bba.getBb_img3());
		System.out.println(bba.getBb_img10());
		return sqlSession.insert("BsnBoard.insertBsnBoardAdd", bba);
	}
	
	// 게시물 수정(텍스트)
	public int updateBsnBoard(BsnBoard bb) {
		return sqlSession.delete("BsnBoard.updateBsnBoard", bb);
	}
	// 게시물 수정(이미지)
	public int updateBsnBoardAdd(BsnBoardAdd bba) {
		return sqlSession.delete("BsnBoard.updateBsnBoardAdd", bba);
	}
	
	// 게시물 삭제(텍스트)
	public int deleteBsnBoard(String bb_id) {
		return sqlSession.delete("BsnBoard.deleteBsnBoard", bb_id);
	}
	// 게시물 삭제(이미지)
	public int deleteBsnBoardAdd(String bb_id) {
		return sqlSession.delete("BsnBoard.deleteBsnBoardAdd", bb_id);
	}
	
	
}
