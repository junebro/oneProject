package com.shopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.FillItem;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.FillItemDao;
import com.shopping.model.dao.MemberDao;

public class MemberListController extends SuperClass {
	
	private final String PREFIX = "member/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		MemberDao dao = new MemberDao();	
		List<Member> dataList = dao.getDataList();
		
		FillItemDao fdao = new FillItemDao();
		String module = "members" ;
		String field = "hobby" ;
		List<FillItem> hobbyList = fdao.getDataList(module, field);
		
		request.setAttribute("dataList", dataList);
		request.setAttribute("hobbyList", hobbyList);
		
		super.gotoPage(PREFIX + "meList.jsp");
	}
}
