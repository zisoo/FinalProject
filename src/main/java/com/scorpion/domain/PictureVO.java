package com.scorpion.domain;

import lombok.Data;

@Data
public class PictureVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private Long StudyIndex;
	private String leaId;

}
