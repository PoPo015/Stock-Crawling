package com.stock.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/stock/")
public class StockController {

	@GetMapping(value = "/list")
	public void GetList() {
		log.info("리스트");
	}

	
}
