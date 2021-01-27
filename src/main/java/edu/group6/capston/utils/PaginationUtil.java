package edu.group6.capston.utils;

public class PaginationUtil {
	public static int getOffset(int currentPage) {
		return (currentPage - 1) * GlobalsConstant.LIMIT_PAGE;
	}
	
	public static int getOffset(int currentPage, final int limit) {
		return (currentPage - 1) * limit;
	}
}	
