package com.demo.entity;

public class STACKEDLINE {
	private int year;
	private String ftype;
	private double score;
	
	public STACKEDLINE(){}
	
	public STACKEDLINE(int year, double score) {
		super();
		this.year = year;
		this.score = score;
	}
	
	public STACKEDLINE(int year, String ftype, double score) {
		super();
		this.year = year;
		this.ftype = ftype;
		this.score = score;
	}
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "STACKEDLINE [year=" + year + ", ftype=" + ftype + ", score=" + score + "]";
	}
	

}
