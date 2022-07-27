package com.its.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private Long id;
    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberAge;
    private String memberEmail;
    private String memberMobile;

}
