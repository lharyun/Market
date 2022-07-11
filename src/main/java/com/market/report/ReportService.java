package com.market.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {
	@Autowired
	private ReportDAO reportDAO;
	
	public List<ReportDTO> selectAll() throws Exception{
		return reportDAO.selectAll();
	}
	
	public void delete(String user_id) throws Exception{
		reportDAO.delete();
	}
	
}
