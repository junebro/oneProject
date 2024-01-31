package com.shopping.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;

public class MemberLogoutController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// session 영역에 장바구니 정보가 존재하면, 임시 테이블에 WishList 테이블에 저장합니다.
		
		if(super.loginfo != null) {
			// 누군가가 로그인 한 경우
			// 로그인시 바인딩하였던 로그인 정보를 깨끗이 지웁니다.
			// 세션 데이터들을 무효화
			super.session.invalidate();
			super.gotoPage("member/meLoginForm.jsp"); // 로그인 페이지로 다시 이동
		} else {
			//미로그인 상태
			super.youNeededLogin();
			return ;
			
		}
		
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
	}
}