package com.hoge.dto;

import java.util.List;

import com.hoge.vo.accommo.AccommoImage;
import com.hoge.vo.activities.ActivityImage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class HostingListDto {
	
	private int accName;
	private int actName;
	private List<AccommoImage> accImages;
	private List<ActivityImage> actImages;

}
