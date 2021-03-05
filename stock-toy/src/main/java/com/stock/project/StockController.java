package com.stock.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stock.domain.StockVO;
import com.stock.service.StockService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/stock")
public class StockController {

	
	@Autowired
	private StockService service;
	
	@GetMapping(value = "/list")
	public void GetList(Model model) {
		
		log.info("리스트출력");
		
//		model.addAttribute("list", service.getList());
	}
	
	@ResponseBody
	@GetMapping(value = "/ajax")
	public List<StockVO> GetTestAjax() {
		
		log.info("ajax 데이터뽑아오기");
		return service.getList();
	}
	
	
}
