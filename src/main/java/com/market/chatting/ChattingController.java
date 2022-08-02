package com.market.chatting;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;


@RequestMapping(value = "/chatting")
@Controller
public class ChattingController {
	@Autowired
    ChattingService cService;
	/*
    @Autowired
    ProductService pService;
    
    @Autowired
    private ChattingSession cSession;
    */
	public ChattingController() {
		System.out.println("ChattingController 인스턴스 생성");
	}
	
	@RequestMapping(value = "/toChatting")
	public String toChatting() {
		return "chatting/chatting";
	}
	/*
	// 해당 채팅방의 채팅 메세지 불러오기
    @RequestMapping(value="{roomId}.do")
    public void messageList(@PathVariable String roomId, Model model, HttpServletResponse response) throws JsonIOException, IOException {
        
        List<ChattingMessageDTO> mList = cService.messageList(roomId);
        response.setContentType("application/json; charset=utf-8");
 
        // 안읽은 메세지의 숫자 0으로 바뀌기
        ChattingMessageDTO message = new ChattingMessageDTO();
        message.setRoomId(roomId);
        cService.updateCount(message);
        
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(mList,response.getWriter());
    }
    

    // 채팅 방이 없을 때 생성
    @ResponseBody
    @RequestMapping("createChat.do")
    public String createChat(ChattingRoomDTO room, String userName, String masterNickname){
        
        UserMaster m = pService.getProductDetail(masterNickname);
        
        room.setUserName(userName);
        room.setMasterEmail(m.getEmail());
        room.setMasterName(m.getmNickname());
        room.setMasterPic(m.getmProPicRe());
 
        ChattingRoomDTO exist  = cService.searchChatRoom(room);
        
        // DB에 방이 없을 때
        if(exist == null) {
            System.out.println("방이 없다!!");
            int result = cService.createChat(room);
            if(result == 1) {
                System.out.println("방 만들었다!!");
                return "new";
            }else {
                return "fail";
            }
        }
        // DB에 방이 있을 때
        else{
            System.out.println("방이 있다!!");
            return "exist";
        }
    }
    

    // 채팅 방 목록 불러오기
    @RequestMapping("chatRoomList.do")
    public void createChat(ChattingRoomDTO room, ChattingMessageDTO message, String userName, HttpServletResponse response) throws JsonIOException, IOException{
        List<ChattingRoomDTO> cList = cService.chatRoomList(userName);
        
        for(int i = 0; i < cList.size(); i++) {
            message.setRoomId(cList.get(i).getRoomId());
            int count = cService.selectUnReadCount(message);
            cList.get(i).setUnReadCount(count);
        }
        
        response.setContentType("application/json; charset=utf-8");
 
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(cList,response.getWriter());
    }
    
    @RequestMapping("chatSession.do")
    public void chatSession( HttpServletResponse response) throws JsonIOException, IOException{
        
        ArrayList<String> chatSessionList = cSession.getLoginUser();
        
        response.setContentType("application/json; charset=utf-8");
 
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
        gson.toJson(chatSessionList,response.getWriter());
    }
    */
}
