package com.mall.petshop.mapper;

import com.mall.petshop.member.MemberDTO;

public interface MemberMapper {
	
	public MemberDTO submitLogin(MemberDTO member) throws Exception;
    
    public void submitSignUp(MemberDTO member) throws Exception;

}
