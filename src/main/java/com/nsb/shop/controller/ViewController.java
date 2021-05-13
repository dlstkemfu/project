package com.nsb.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("view/*")
public class ViewController {

	@RequestMapping("view/dashboard")
	public ModelAndView dashboard() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

}