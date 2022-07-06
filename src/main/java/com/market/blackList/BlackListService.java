package com.market.blackList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.client.ClientDAO;

@Service
public class BlackListService {
	@Autowired
	private BlackListDAO blackListDAO;
}
