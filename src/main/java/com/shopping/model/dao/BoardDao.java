package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Board;

// 게시물과 관련된 Dao(Data Access Object) 클래스
public class BoardDao extends SuperDao {

	public int updateData(Board bean) {
		// no 컬럼은 시퀀스가 알아서 처리합니다.
		String sql = " update boards set id=?, password=?, subject=?, contents=?";
		sql += " where no = ?";

		PreparedStatement pstmt = null;
		int cnt = -999;

		try {
			super.conn = super.getConnection();
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료 된 이후 commit() 메소드를 명시해 줍니다.
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getContents());
			pstmt.setInt(5, bean.getNo());

			cnt = pstmt.executeUpdate();

			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			} 
		}

		return cnt;
	}

	public Board getDataBean(int no) {
		// 해당 게시물 번호를 이용하여 1건의 정보를 반환합니다.
		String sql = "select * from boards ";
		sql += " where no = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = this.resultSet2Bean(rs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean;
	}

	public int InsertData(Board bean) {

		// no 컬럼은 시퀀스가 알아서 처리합니다.
		String sql = " insert into boards(no, id, password, subject, contents)";
		sql += "values(seqboard.nextval, ?, ?, ?, ?)";

		PreparedStatement pstmt = null;
		int cnt = -999;

		try {
			super.conn = super.getConnection();
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료 된 이후 commit() 메소드를 명시해 줍니다.
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getContents());

			cnt = pstmt.executeUpdate();

			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return cnt;
	}

	public BoardDao() {
		super();
	}

	private Board resultSet2Bean(ResultSet rs) {
		try {
			Board bean = new Board();
			bean.setNo(rs.getInt("no"));
			bean.setId(rs.getString("id"));
			bean.setPassword(rs.getString("password"));
			bean.setSubject(rs.getString("subject"));
			bean.setContents(rs.getString("contents"));
			bean.setDepth(rs.getInt("depth"));
			bean.setGroupno(rs.getInt("groupno"));
			bean.setOrderno(rs.getInt("orderno"));
			bean.setReadhit(rs.getInt("readhit"));
			bean.setRemark(rs.getString("remark"));
			bean.setRegdate(String.valueOf(rs.getDate("regdate"))); // 날짜 형식의 컬럼
			return bean;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Board> getDataList() {
		String sql = "select * from boards ";
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;

		List<Board> dataList = new ArrayList<Board>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				Board bean = this.resultSet2Bean(rs);

				dataList.add(bean);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return dataList;
	}

	public List<Board> getDataList02() {

		List<Board> dataList = new ArrayList<Board>();

		dataList.add(new Board(10, "hong", null, "jsp", "제이에쓰피", 11, "2023/07/17", null, 0, 0, 0));
		dataList.add(new Board(20, "park", null, "python", "파이썬", 22, "2023/08/15", null, 0, 0, 1));
		dataList.add(new Board(30, "kim", null, "자바", "나자바바라", 11, "2023/12/25", null, 0, 0, 2));

		return dataList;
	}
}
