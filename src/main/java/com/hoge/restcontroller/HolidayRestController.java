package com.hoge.restcontroller;

import java.net.URL;
import java.util.ArrayList;
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
}
