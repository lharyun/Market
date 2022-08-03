package com.market.chatting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.member.MemberDTO;
import com.market.member.MemberService;
import com.market.post.PostService;

@RequestMapping(value = "/chatting")
@Controller
public class ChattingController {
	@Autowired
    ChattingService cService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PostService postService;
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
	//준철
	@RequestMapping(value = "/toChatting")
	public String toChatting(Model model) throws Exception{
		String masterName= ((MemberDTO) session.getAttribute("loginSession")).getUser_nickname();
		//로그인된 닉네임으로 멤버 조회
		MemberDTO memdto = memberService.selectByNickname(masterName);
		model.addAttribute("memdto", memdto);
		System.out.println(memdto);
		//로그인된 닉네임으로 채팅룸 조회
		List<Map<String, Object>> list=cService.chat_mamberJoin(masterName);
		model.addAttribute("list", list);
		System.out.println(list);
		return "chatting/chatting";
	}
	
	@RequestMapping(value = "/chat_insert")
	public String chat_insert(ChattingRoomDTO dto) throws Exception{
		String userName = dto.getUserName();//닉네임으로 조회
		dto.setExtraAddr(memberService.e_makeAddr(userName));
		System.out.println(dto);
		System.out.println(dto.getPost_seq());
		String loginName= ((MemberDTO) session.getAttribute("loginSession")).getUser_nickname();
		System.out.println("user" + userName);
		if(!cService.overlapping(dto.getMasterName(), dto.getPost_seq())) {//중복값이 없다면
			cService.chat_insert(dto);// 채팅방 만들기
			// 포스트 조회수 업데이트
			int post_chatting_cnt = cService.chatCount(dto.getPost_seq());
			postService.update_chatting_cnt(dto.getPost_seq(), post_chatting_cnt);
		};
		return "redirect:/chatting/toChatting";
	}
	//채팅방 나가기
	@RequestMapping(value = "/chat_m_exit")
	public String toChatting(ChattingMessageDTO dto, int post_seq) throws Exception{
		System.out.println(dto);
		
		String message = "거래를 시작하세요!";
		dto.setMessage(message);
		cService.roomUpdate(dto);
		cService.chat_m_exit(dto.getRoomId());
		// 포스트 조회수 업데이트
		int post_chatting_cnt = cService.chatCount(post_seq);
		postService.update_chatting_cnt(post_seq, post_chatting_cnt);
		
		return "redirect:/chatting/toChatting";
	}
	
	@ResponseBody
	@RequestMapping(value = "/chat_m_select")
	public Map<String, Object> chat_m_select(int roomId, int post_seq,Model model) throws Exception{
		Map<String, Object> map = new HashMap<>();
		System.out.println(roomId+":" + post_seq);
		List<ChattingMessageDTO> messagelist = cService.chat_m_select(roomId);
		Map<String,Object> postMap = postService.selectPost_member(post_seq);
		map.put("postMap", postMap);
		System.out.println(postMap);
		map.put("messagelist", messagelist);
		
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/chat_m_insert")
	public String chat_m_insert(ChattingMessageDTO dto,String message2) throws Exception{
		System.out.println(message2);
		System.out.println(dto);
		if(dto != null) {
			cService.chat_m_insert(dto);
			dto.setMessage(message2);
			cService.roomUpdate(dto);
			return "success";
		}
		return "fail";
	}
	/*
>>>>>>> 997cd0621eecdda7a0648be46c89322f804edf0b
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
