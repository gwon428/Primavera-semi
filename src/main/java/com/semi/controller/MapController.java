package com.semi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {

	@GetMapping("mainMap")
	public String mainMap() {
		return "map/mainMap";
	}
	
	@GetMapping("map1")
	public String map1() {
		return "map/map1";
	}
	
	@GetMapping("map2")
	public String map2() {
		return "map/map2";
	}
	
}
