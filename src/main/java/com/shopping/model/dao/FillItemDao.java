package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.FillItem;

public class FillItemDao extends SuperDao{
	private FillItem resultSet2Bean(ResultSet rs) {
		
		try {
			FillItem bean = new FillItem();
			
			bean.setEngname(rs.getString("engname")); 
			bean.setField(rs.getString("field"));
			bean.setKorname(rs.getString("korname"));
			bean.setModule(rs.getString("module"));
			bean.setOrdering(rs.getInt("ordering"));
			
			return bean;			
		} catch (Exception e) {
			e.printStackTrace();
			return null ; 
		}
	}	
	
	public List<FillItem> getDataList(String module, String field) {
		String sql = " select * from fillitems";
		sql += " where module = ? and field = ?";
		sql += " order by ordering asc  "; 
		
		// ?를 placeholder이라고 합니다.
		// 어떠한 값으로 치환될 대상입니다.
		
		PreparedStatement pstmt = null;
		ResultSet rs = null ;	
		
		
		List<FillItem> dataList = new ArrayList<FillItem>() ;
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, module);
			pstmt.setString(2, field);			
			
			rs = pstmt.executeQuery() ;
			
			// 목록에 담기
			while(rs.next()) {
				FillItem bean = this.resultSet2Bean(rs);
				
				dataList.add(bean);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dataList;
	}


}




