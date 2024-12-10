package com.SSMProject.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PartyMeetingDTO {
	private String meetingtitle;
	private String meetinglimit;
	private String meetingdt;
	private String meetingimg;
	private String id;

}
