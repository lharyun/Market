package com.market.chatting;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class WSConfig extends Configurator{
	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		HttpSession session = (HttpSession)request.getHttpSession();
		// nickname이라는 key값으로 사용자의 닉네임을 셋팅해줌.
		sec.getUserProperties().put("nickname", session.getAttribute("nickname"));
		super.modifyHandshake(sec, request, response);
	}
	
}
