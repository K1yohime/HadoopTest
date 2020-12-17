package com.demo.entity;

public class BAIDUMAP {
	private String name;
	private int value;
	
	public BAIDUMAP(){}
	
	
	public BAIDUMAP(String name, int value) {
		super();
		this.name = name;
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	
	@Override
	public String toString() {
		return "BAIDUMAP [name=" + name + ", value=" + value + "]";
	}
	

}
