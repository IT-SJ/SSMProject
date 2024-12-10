package com.SSMProject.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PartyDTO {
	
	private String party_name;
	private String party_desc;
	private String party_img;
	private String city;
	private String district;
	private String id;
	
	
}
