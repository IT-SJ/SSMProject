package com.SSMProject.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityDTO {
	private String id;
	private String title;
	private String content;
	private String cfile;
	private String city;
	private String district;
}
