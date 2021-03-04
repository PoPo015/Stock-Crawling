package com.stock.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stock.domain.StockVO;
import com.stock.mapper.StockMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class StockServiceImpl implements StockService {
	
	@Setter(onMethod_ = @Autowired)
	private StockMapper mapper;
	
	
	@Override
	public int register(StockVO vo) {

		log.info("service ------"+vo);
		
		return mapper.register(vo);
	}

	//json 중복됬는지 조회
	@Override
	public int getJson(StockVO vo) {

		return	mapper.getJson(vo);
	
	}

	@Override
	public int getJson2(StockVO vo) {
		
		return mapper.getJson2(vo);
	}

	@Override
	public void jsonUpdate(StockVO vo) {

		mapper.jsonUpdate(vo);
	}

	@Override
	public List<StockVO> getList() {

		return mapper.getList();
	
	}


}
