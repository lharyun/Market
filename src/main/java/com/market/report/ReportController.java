package com.market.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ReportController {
	@Autowired
	private ReportService service;
	
	public void delete(String user_id) throws Exception{
		service.delete(user_id);
	}
}
