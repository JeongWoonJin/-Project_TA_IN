package com.project.tain.general.board.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.tain.general.board.model.domain.GnBoard;

@Repository("gDao")
public class GnBoardDao {

	@Autowired
	private SqlSession sqlSession;

	public GnBoard showp_one(String m_id) {
		return sqlSession.selectOne("GnBoard.showp_one", m_id);
	}

	public GnBoard showp_two(String m_id) {
		return sqlSession.selectOne("GnBoard.showp_two", m_id);
	}

	public GnBoard showp_three(String m_id) {
		return sqlSession.selectOne("GnBoard.showp_three", m_id);
	}

	public GnBoard showp_four(String m_id) {
		return sqlSession.selectOne("GnBoard.showp_four", m_id);
	}

	public GnBoard storychk(String m_id) {
		return sqlSession.selectOne("GnBoard.storychk", m_id);
	}

	public List<GnBoard> showpost(String m_id) {
		return sqlSession.selectList("GnBoard.showpost", m_id);
	}

	public List<GnBoard> highlight(String m_id) {
		return sqlSession.selectList("GnBoard.highlight", m_id);
	}

	public GnBoard followchk(String my_name, String m_id) {
		HashMap<String, String> my_info = new HashMap<String, String>();
		my_info.put("m_id", m_id);
		my_info.put("my_name", my_name);
		return sqlSession.selectOne("GnBoard.followchk", my_info);
	}

	public GnBoard showeachpost(String b_id) {
		return sqlSession.selectOne("GnBoard.showeachpost", b_id);
	}
	
	public List<GnBoard> recomFow(String my_name, String m_id){
		HashMap<String, String> rec_fow = new HashMap<String, String>();
		rec_fow.put("my_name", my_name);
		rec_fow.put("m_id", m_id);
		return sqlSession.selectList("GnBoard.recomFow", rec_fow);
	}

	public int chkReportMember(GnBoard gb) {
		return sqlSession.selectOne("GnBoard.chkReportMember", gb);
	}

	public int insertReportMember(GnBoard gb) {
		return sqlSession.insert("GnBoard.insertReportMember", gb);
	}
	
	public String userType(String m_id) {
		return sqlSession.selectOne("GnBoard.userType", m_id);
	}

	public List<GnBoard> selectFollow(String m_id) {
		return sqlSession.selectList("GnBoard.selectFollow", m_id);
	}

	public List<GnBoard> selectFollower(String m_id) {
		return sqlSession.selectList("GnBoard.selectFollower", m_id);
	}

	public GnBoard selectEachPost(String b_id) {
		return sqlSession.selectOne("GnBoard.selectEachPost", b_id);
	}

	public List<GnBoard> selectEachPostComments(String b_id) {
		return sqlSession.selectList("GnBoard.selectEachPostComments", b_id);
	}

	public String selectEachPostPhotos(String b_id) {
		return sqlSession.selectOne("GnBoard.selectEachPostPhotos", b_id);
	}

	public int showpostCount(String m_id) {
		return sqlSession.selectOne("GnBoard.showpostCount", m_id);
	}

	public List<GnBoard> showpostPage(String m_id, int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("GnBoard.showpost", m_id, row);
	}
	
}
