package com.SSMProject.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PochaDTO {
	
	private String pocha_idx;
	private String pocha_name;
	private String pocha_addr;
	private String lat;
	private String lon;
	private String pocha_tel;
	private String dayList;
	private String uploadPath;
	private String shopoper_start;
	private String shopoper_end;
	private String menu;
	private String id;
}
