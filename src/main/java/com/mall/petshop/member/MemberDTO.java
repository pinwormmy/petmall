package com.mall.petshop.member;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class MemberDTO {

    private String id;
    private String pw;
    private String name;
    private String phone;
    private String address;
    private String email;
    private int lv;

}
