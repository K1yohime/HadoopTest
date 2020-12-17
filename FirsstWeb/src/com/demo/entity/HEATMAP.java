package com.demo.entity;

public class HEATMAP {
	private int year;
	private int month;
	private String ftype;
	private int count;
	
	
	public HEATMAP() {
		super();
		
	}
	public HEATMAP(int count) {
		super();
		this.count = count;
	}
	public HEATMAP(int year, int month, String ftype, int count) {
		super();
		this.year = year;
		this.month = month;
		this.ftype = ftype;
		this.count = count;
	}

	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "HEATMAP [year=" + year + ", month=" + month + ", ftype=" + ftype + ", count=" + count + "]";
	}
	
	

}
