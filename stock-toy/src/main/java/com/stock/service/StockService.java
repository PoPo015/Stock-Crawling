package com.stock.service;

import java.util.List;

import com.stock.domain.StockVO;

public interface StockService {

	public int register(StockVO vo);

	public int getJson(StockVO vo);
	
	public int getJson2(StockVO vo);

	public void jsonUpdate(StockVO vo);
	
	public List<StockVO> getList();
}
