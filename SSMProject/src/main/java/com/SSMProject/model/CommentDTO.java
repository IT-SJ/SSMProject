package com.SSMProject.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDTO {

	private String id;
	private String cmtcontent;
	private String cmtlikes;
	private String title;
	private String cmtdt;
}
