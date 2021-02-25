package com.stock.mapper;

import com.stock.domain.StockVO;

public interface StockMapper {

	public int register(StockVO vo);
	
	public int getJson(StockVO vo);
	
	public void jsonUpdate(StockVO vo);
}
