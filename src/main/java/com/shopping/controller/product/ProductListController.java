package com.shopping.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.ProductDao;

public class ProductListController extends SuperClass {
	
	private final String PREFIX = "product/";
	
	 @Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doGet(request, response);
		System.out.println("상품 목록 페이지입니다.");
		
		ProductDao dao = new ProductDao();
		int beginRow = 1 ;
		int endRow = 6 ;
		List<Product> dataList = dao.getDataList(beginRow, endRow);
		
		// 상품 목록 request 영역에 바인딩
		request.setAttribute("dataList", dataList);
		
		super.gotoPage(PREFIX + "prList.jsp");
	}
}
