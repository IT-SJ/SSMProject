package com.SSMProject.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
	
	private String id;
	private String pw;
	private String email;
	private String city;
	private String district;
	private String userType;
	private String profile_img;
	
}
