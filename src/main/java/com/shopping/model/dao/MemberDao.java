package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;

public class MemberDao extends SuperDao{
	
	public int updateData(Member bean) {
		
		// no 컬럼은 시퀀스가 알아서 처리합니다.
				String sql = " update members set name=?, password=?, gender=?, birth=?, marriage=?, hobby=?, address=?, mpoint=default";
				sql += " where id = ?";

				PreparedStatement pstmt = null;
				int cnt = -999;

				try {
					super.conn = super.getConnection();
					// 자동 커밋 기능을 비활성화 시킵니다.
					// 실행이 성공적으로 완료 된 이후 commit() 메소드를 명시해 줍니다.
					conn.setAutoCommit(false);

					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, bean.getName());
					pstmt.setString(2, bean.getPassword());
					pstmt.setString(3, bean.getGender());
					pstmt.setString(4, bean.getBirth());
					pstmt.setString(5, bean.getMarriage());
					pstmt.setString(6, bean.getHobby());
					pstmt.setString(7, bean.getAddress());
					pstmt.setString(8, bean.getId());
					
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
	
	
	public Member getDataBean(String id) {
		
		String sql = "select * from members ";
		sql += " where id = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

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
	
	public int insertData(Member bean) {
		String sql = " insert into members(id, name, password, gender, birth, marriage, hobby, address, mpoint)";
		sql += "values(?, ?, ?, ?, ?, ?, ?, ?, default) " ;
		PreparedStatement pstmt = null;
		int cnt = -9999;
		
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirth());
			pstmt.setString(6, bean.getMarriage());
			pstmt.setString(7, bean.getHobby());
			pstmt.setString(8, bean.getAddress());
			
			cnt = pstmt.executeUpdate();
			
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}
	
	public List<Member> getDataList02(){

		List<Member> dataList = new ArrayList<Member>();
		
		dataList.add(new Member("kimho", "김호철", "abc123", "female", "2023/08/20", "미혼", "music/art/sport/reading/", "마포", 100));
		dataList.add(new Member("park", "박혁신", "abc123", "male", "2002/06/24", "미혼", "music/art/photo/cooking/", "용산", 200));		
		dataList.add(new Member("choi", "최만위", "abc123", "female", "2020/12/12", "이혼", "travel/photo/cooking/", "강남", 300));		
		dataList.add(new Member("kim", "김동섭", "abc123", "male", "2023/08/20", "결혼", "music/art/photo/cooking/", "마포", 400));
		dataList.add(new Member("lee", "이수돌", "abc123", "male", "2023/08/20", "이혼", "music/art/sport/reading/", "서대문", 500));

		return dataList ;
	}
	
	public List<Member> getDataList(){
		String sql = "select * from members " ;
		PreparedStatement pstmt = null ; // 문장 객체
		ResultSet rs = null ;
		
		List<Member> dataList = new ArrayList<Member>();
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery() ;
			
			// 요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {				
				Member bean = this.resultSet2Bean(rs) ;
				
				dataList.add(bean) ;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
			
		return dataList ;	
	}
	
	private Member resultSet2Bean(ResultSet rs) {
		try {
			Member bean = new Member() ;			
			bean.setAddress(rs.getString("address"));
			bean.setBirth(String.valueOf(rs.getDate("birth")));
			bean.setGender(rs.getString("gender"));
			bean.setHobby(rs.getString("hobby"));
			bean.setId(rs.getString("id"));
			bean.setMarriage(rs.getString("marriage"));
			bean.setMpoint(rs.getInt("mpoint"));
			bean.setName(rs.getString("name"));
			bean.setPassword(rs.getString("password"));
			 		
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}


	public Member getDataByIdAndPassword(String id, String password) {
		
		// 아이디와 비밀 번호를 이용하여 해당 회원이 존재하는지 확인합니다.
		String sql = " select * from members ";
		sql += " where id = ? AND password = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);

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
}
