package com.demo.dao;

import java.util.List;

import com.demo.entity.RADAR;

public interface RadarDao {
	public List<RADAR> queryAllRADAR();
	public List<RADAR> queryAllRADARByName(String name);
}
