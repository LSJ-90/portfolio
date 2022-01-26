package com.hoge.restcontroller;

import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HolidayRestController {
	
	@GetMapping("/holidays")
	public List<String> getHolidays(String year, String month) throws Exception {
		JSONParser parser = new JSONParser(new URL("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?solYear="+year+"&solMonth="+month+"&ServiceKey=1irZIYQbfl88iS1EiVAwaM7fW30u69nAf7PYWisL91H/f8lNcpcbqX5lO38L0mL1jhD8yRBduof7dNNoz6joiA==&_type=json").openStream());
		
		Map<String, Object> object = parser.parseObject();
		
		System.out.println(object);
		
		Map<String, Object> response = (Map<String, Object>) object.get("response");
		Map<String, Object> body = (Map<String, Object>) response.get("body");
		Map<String, Object> items = (Map<String, Object>) body.get("items");
		List<Map<String, Object>>itemList = (List<Map<String, Object> >) items.get("item");
		
		
		List<String> result = new ArrayList<String>();
		for (Map<String, Object> item : itemList) {
			String isHoliday = (String) item.get("isHoliday");
			String locdate = String.valueOf(item.get("locdate"));
			
			if ("Y".equals(isHoliday)) {
				result.add(locdate);
			}
		}

		return result;
	}
	
	@GetMapping("/getPrice")
	public List<String> getPrice(String checkIn, String checkOut, int number) throws Exception {
		String inYear = checkIn.substring(0, 4);
		String outYear = checkOut.substring(0, 4);
		
		// 두 날짜 사이의 날짜list 생성
		List<Date> dateList = new ArrayList<>();
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		
		Date d1 = df.parse(checkIn);
		Date d2 = df.parse(checkOut);		
		
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(d1);
		c1.add(Calendar.DATE, +1);
		c2.setTime(d2);
		
		while (c1.compareTo(c2) != 1) {
			// System.out.printf("%tF\n", c1.getTime());
			dateList.add(c1.getTime());
			c1.add(Calendar.DATE, 1);
		}
		
		// 공휴일 날짜 List에 담기
		JSONParser parser = new JSONParser(new URL("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?solYear="+inYear+"&ServiceKey=1irZIYQbfl88iS1EiVAwaM7fW30u69nAf7PYWisL91H/f8lNcpcbqX5lO38L0mL1jhD8yRBduof7dNNoz6joiA==&_type=json&numOfRows=50").openStream());
		
		Map<String, Object> object = parser.parseObject();
		// System.out.println(object);
		Map<String, Object> response = (Map<String, Object>) object.get("response");
		Map<String, Object> body = (Map<String, Object>) response.get("body");
		Map<String, Object> items = (Map<String, Object>) body.get("items");
		List<Map<String, Object>>itemList = (List<Map<String, Object> >) items.get("item");
		
		List<Date> holidayList = new ArrayList<>();
		for (Map<String, Object> item : itemList) {
			String locdate = String.valueOf(item.get("locdate"));
			Date d3 = df.parse(locdate);
			Calendar c3 = Calendar.getInstance();
			c3.setTime(d3);
			// System.out.printf("%tF\n", c3.getTime());
			holidayList.add(c3.getTime());
		}
		
		// checkIn, checkOut 연도가 다를 경우 List에 추가 작업
		if (!inYear.equals(outYear)) {
			parser = new JSONParser(new URL("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?solYear="+outYear+"&ServiceKey=1irZIYQbfl88iS1EiVAwaM7fW30u69nAf7PYWisL91H/f8lNcpcbqX5lO38L0mL1jhD8yRBduof7dNNoz6joiA==&_type=json&numOfRows=50").openStream());
			
			object = parser.parseObject();
			// System.out.println(object);
			response = (Map<String, Object>) object.get("response");
			body = (Map<String, Object>) response.get("body");
			items = (Map<String, Object>) body.get("items");
			itemList = (List<Map<String, Object> >) items.get("item");
			
			for (Map<String, Object> item : itemList) {
				String locdate = String.valueOf(item.get("locdate"));
				Date d3 = df.parse(locdate);
				Calendar c3 = Calendar.getInstance();
				c3.setTime(d3);
				// System.out.printf("%tF\n", c3.getTime());
				holidayList.add(c3.getTime());
			}
		}
		
		Date peakStart = df.parse("20220715");
		Date peakEnd = df.parse("20220814");
		
		// 주말, 공휴일, 평일 구분하기
		for (Date date : dateList) {
			
		}
		
		return null;
	}
}
