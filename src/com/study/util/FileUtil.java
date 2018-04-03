package com.study.util;

import java.text.DecimalFormat;

public class FileUtil {

	// 300 "300 bytes", 1024 bytes ~ 1 kb, 1042kb ~ 1 mb 
	public static String fancySize(long size) {
		
		DecimalFormat df = new DecimalFormat("###,###,0");
		
		if(size < 1024) {
		
			return size + " Bytes";
		
		} else if(size < (1024 * 1024) ) {
		
			return df.format(size/1024) + " Kb";
		
		} else {
		
			return df.format(size/(1024*1024)) + " Kb"; 
		
		}
		
	}
	
	public static void main(String[] args) {
		System.out.println( 14 / 50);
		System.out.println( FileUtil.fancySize(500));
		System.out.println( FileUtil.fancySize(2200));
		System.out.println( FileUtil.fancySize(1050000));
		
	}
	
}
