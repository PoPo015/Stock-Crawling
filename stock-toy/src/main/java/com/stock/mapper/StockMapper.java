package com.stock.mapper;

import java.util.List;

import com.stock.domain.StockVO;

public interface StockMapper {

	public int register(StockVO vo);
	
	public int getJson(StockVO vo);
	
	public void jsonUpdate(StockVO vo);
	
	// db데이터 출력
	public List<StockVO> getList();
}
