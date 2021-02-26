package com.stock.project;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.stock.domain.StockVO;
import com.stock.service.StockService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/stock")
//@AllArgsConstructor
public class StockJsonController {
	
	@Setter(onMethod_ = @Autowired)
	private StockService service;

	//json 배열 db에 담기
	@PostMapping(value = "/new" ,consumes = "application/json")
	public void createList(@RequestBody StockVO vo){
		
		//StockVO 객체에 쌓인 데이터 Arraylist에 담기
		ArrayList<StockVO> jsonList = new ArrayList<StockVO>(vo.getListDate());

//		ArrayList<StockVO> list = new ArrayList<StockVO>();
		
		// 데이터 확인을 위해 객체 생성
		StockVO vo2 = new StockVO();
		
		//ArrayList에 들어온 인덱스 크기만큼 반복문 돔
		for(int i=0; i<jsonList.size(); i++) {
			log.info(jsonList.get(i));
			
			// jsonList데이터 인덱스 i번째 데이터를 vo2에 담음.
			vo2 = jsonList.get(i);
			
			//vo2객체의 rel 데이터 비교를 위해 String 변수에 담아둠
			String rel	= vo2.getStk_rel();
			
			//stk_id int형변환
			int stk_id = Integer.parseInt(vo2.getStk_id());
			log.info("stk_id 값------" +stk_id);
			vo2.setIstk_id(stk_id);
			
			
			log.info("rel 값-------"+rel);
			// json으로 된 데이터중 중복된 데이터가 있는지 확인, 있다면 1반환 없다면 0 반환
			int j = service.getJson(vo2);
			
			log.info("j의값--------"+j);
			
			// j가 0 (Pk비교)라면 등록, 0이 아니라면 다시 2중반복문으로 , rel 변수에 담겨 있는 데이터가 00:00:00이라면, 업데이트X, 00:00:00이 아니면 업데이트  
			if(j == 0) {
				System.out.println("데이터가 없습니다. 등록합니다");
				service.register(vo2);
			}else {
					if(rel.equals("00:00:00")) {
						System.out.println("00:00:00이군요 업데이트 안합니다");
					}else {
						System.out.println("시간 업데이트합니다.");
						service.jsonUpdate(vo2);
					}
				System.out.println("전체 조건문 끝남");
			}
			
			
		}
	  }
}