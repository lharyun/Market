package com.market.chatting;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.market.member.MemberDTO;
import com.market.member.MemberService;

@RequestMapping(value = "/chatting")
@Controller
public class ChattingController {
	@Autowired
    ChattingService cService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HttpSession session;
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
	public String toChatting(Model model) throws Exception{
		String masterName= ((MemberDTO) session.getAttribute("loginSession")).getUser_nickname();
		MemberDTO memdto = memberService.selectByNickname(masterName);
		model.addAttribute("memdto", memdto);
		System.out.println(memdto);
		List<Map<String, Object>> list=cService.chat_mamberJoin(masterName);
		model.addAttribute("list", list);
		System.out.println(list);
		return "chatting/chatting";
	}
	//준철
	@RequestMapping(value = "/chat_insert")
	public String chat_insert(ChattingRoomDTO dto) throws Exception{
		String userName = dto.getUserName();//닉네임으로 조회
		System.out.println(userName);
		dto.setExtraAddr(memberService.e_makeAddr(userName));
		System.out.println(dto);
		System.out.println(dto.getPost_seq());
		if(!cService.overlapping(userName, dto.getPost_seq())) {//중복값이 없다면
			cService.chat_insert(dto);// 채팅방 만들기
		};
		return "redirect:/chatting/toChatting";
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
