package com.market.utills;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.market.file.FileService;

//@Component
public class Scheduler {

	@Autowired
	private FileService service;
	@Autowired
	private ServletContext sCtx;
	
	public Scheduler() {
		System.out.println("스케쥴러 생성");
	}
	
	@Scheduled(cron="0 5 * * * *")
	public void deleteFiles() throws Exception{
		String path =sCtx.getRealPath("board");
		System.out.println("path : "+ path);
		service.deleteFiles(path);
	}
}
