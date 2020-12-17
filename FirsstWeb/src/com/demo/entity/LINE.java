package com.demo.entity;

import java.sql.Date;

public class LINE {
	private int Year;
	private float Score;
	
	public LINE() {}
	
	public LINE(int year, float score) {
		super();
		Year = year;
		Score = score;
	}
	
	public int getYear() {
		return Year;
	}

	public void setYear(int year) {
		Year = year;
	}

	public float getScore() {
		return Score;
	}

	public void setScore(float score) {
		Score = score;
	}

	@Override
	public String toString() {
		return "LINE [Year=" + Year + ", Score=" + Score + "]";
	}
	
	
}