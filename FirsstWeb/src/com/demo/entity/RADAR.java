package com.demo.entity;

public class RADAR {
	private String Dname;
	private String Ftype;
	private double Score;
	
	public RADAR() {}
	public RADAR(double score) {
		super();
		
		Score = score;
	}
	public RADAR(String dname, String ftype, double score) {
		super();
		Dname = dname;
		Ftype = ftype;
		Score = score;
	}
	public String getDname() {
		return Dname;
	}
	public void setDname(String dname) {
		Dname = dname;
	}
	public String getFtype() {
		return Ftype;
	}
	public void setFtype(String ftype) {
		Ftype = ftype;
	}
	public double getScore() {
		return Score;
	}
	public void setScore(double score) {
		Score = score;
	}
	@Override
	public String toString() {
		return "RADAR [Dname=" + Dname + ", Ftype=" + Ftype + ", Score=" + Score + "]";
	}

}
