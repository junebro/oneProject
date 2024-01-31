package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Member;
import com.shopping.model.bean.Product;

public class ProductDao extends SuperDao {
	
	public List<Product> getDataList(int beginRow, int endRow){
		String sql = " select pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate" ;
		sql += " from (select rank() over(order by pnum asc) as ranking, pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate" ;
		sql += " from products)" ;
		sql += " where ranking between ? and ?" ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		List<Product> dataList = new ArrayList<Product>() ;
		
		super.conn = super.getConnection() ;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product bean = this.resultSet2Bean(rs) ;
				
				dataList.add(bean) ;
			}			
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
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
	
	private Product resultSet2Bean(ResultSet rs) {
		try {
			Product bean = new Product() ;
			
			bean.setCategory(rs.getString("category"));
			bean.setCompany(rs.getString("company"));
			bean.setContents(rs.getString("contents"));
			bean.setImage01(rs.getString("image01"));
			bean.setImage02(rs.getString("image02"));
			bean.setImage03(rs.getString("image03"));
			
			bean.setInputdate(String.valueOf(rs.getDate("inputdate")));
			
			bean.setName(rs.getString("name"));
			bean.setPnum(rs.getInt("pnum"));
			bean.setPoint(rs.getInt("point"));
			bean.setPrice(rs.getInt("price"));
			bean.setStock(rs.getInt("stock"));
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}

	public List<Product> getDataList02(){
		
		List<Product> dataList = new ArrayList<Product>() ;
		
		for (int i = 1; i <= 6; i++) {
			if(i%2 ==0) {
				dataList.add(new Product(10 * i, "상품0" + i, null, 
						"croissant_0" + i + ".png", null, null, 0, 0, null, "이 상품은 너무 조아요. 엄청 맛있어요", 0, null));					

			}else{
				dataList.add(new Product(10 * i, "상품0" + i, null, 
						"croissant_0" + i + ".png", null, null, 0, 0, null, "별루에요.", 0, null));					
			}

		}
		
		
		return dataList ;
	}
}
