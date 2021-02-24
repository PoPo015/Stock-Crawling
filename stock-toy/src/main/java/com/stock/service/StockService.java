package com.stock.service;

import com.stock.domain.StockVO;

public interface StockService {

	public int register(StockVO vo);
	
	public int getJson(StockVO vo);

	public void jsonUpdate(StockVO vo);
}
