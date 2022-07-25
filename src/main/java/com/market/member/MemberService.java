package com.market.member;



import java.io.File;
import java.util.Properties;
import java.util.UUID;
import java.util.List;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


	/*
	dao를 통해 데이터를 추가,수정,삭제,조회해야하는 경우 메서드 생성
	혹은 요청/응답과는 별개로 추가적으로 가공해야하는 데이터가 있는 경우 
		
		컨트롤러-> 클라이언트로부터 직접으로 요청을 받고 그 요청에 따라
	 * 추가적인 데이터 가공이 필요하거나, 혹은 DB를 통해 데이터
	 * 수정/삭제/조회/추가해야 하는 경우 controller가 직접 dao 를 호출하지 않고
	 * service 에게 그 작업을 전달함 
	 * -> 그럼 service의 호출된 메서드가 추가적으로 처리해야하는 가공이나 dao 호출을 통해
	 * 비니지스 로직을 수행하고 그에 따른 결과값만 바로 controller에게 전달해 줌.
	 * -> controller는 결과값을 받아서 판단에 따라 응답값을 어떻게 클라이언트에 되돌려
	 * 줄지 결정한다. 
	 * 
	 * 즉 controller는 클라이언트의 요청과 응답관 관련된 직접적인 일들만 처리
	 * 나머지 뒤에서 보이지 않는 일들은 서비스가 처리. 
	 * */
	@Service
	public class MemberService {
	@Autowired
	private MemberDAO dao;
	@Autowired
	private SqlSession session;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
  
  //하륜
  	public List<MemberDTO> selectAll() throws Exception{
		return dao.selectAll();
	}

	public void delete(String id) throws Exception{ 	//manager에서 체크박스 선택 삭제
		dao.delete(id);
	}
	
  //용현 
	// 로그인
	public MemberDTO login(String user_id) throws Exception{
		return dao.login(user_id);
	}
	
	// 아이디 중복확인
	public boolean checkLogin(String user_id) throws Exception{
		return dao.checkLogin(user_id);
	}
	
	// 아이디 찾기
	public String findId(String user_name, String user_phone) throws Exception{
		return dao.findId(user_name, user_phone);
	}
	
	// 이메일 전송
	public String sendEmail(String user_id) {
		Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.naver.com");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.naver.com");
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("leeyong0919", "dydrkfl1234!");
            }
        });
        session.setDebug(true);
        System.out.println("user_id " + user_id);
        try {
            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress("leeyong0919@naver.com", "싸다구 장터"));		// 별명 설정
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(user_id));
            mimeMessage.setSubject("["+"싸다구 장터"+"]"+ "임시 비밀번호 안내");
            
            String changed_pw = update_pw(user_id);
            
            mimeMessage.setContent("안녕하세요<br><strong>" + user_id + "</strong>님,<br>귀하께서 요청하신 임시 비밀번호 수신을 위해 발송된 메일입니다.<br><br>고객님의 임시 비밀번호는 <strong><font color=\"blue\">" + changed_pw + "</font></strong> 입니다.<br><br>로그인 후에는 새로운 비밀번호로 변경하셔야 합니다.<br>감사합니다.", "text/html;charset=euc-kr");
            Transport.send(mimeMessage);
            return "success";
        } catch (Exception e){
        	e.printStackTrace();
            return "fail";
        }
        
	}
	
	//비밀번호찾기
	public String update_pw(String user_id) throws Exception {
		
		// 임시 비밀번호 생성
		String user_pw = "";
		
		for (int i = 0; i < 12; i++) {
			user_pw += (char) ((Math.random() * 26) + 97);
		}
		// 비밀번호 암호화
		String changed_pw = pwdEncoder.encode(user_pw);
		
		// 비밀번호 변경
		dao.update_pw(user_id, changed_pw);

		return user_pw;
	}
	
	// 회원가입
	public int signup(MemberDTO dto) throws Exception{
		return dao.insert(dto);
	}
	
	// 회원탈퇴
	public int delete(String user_id) throws Exception{
		return dao.delete(user_id);
	}
	
	// 회원탈퇴 아이디 & 비밀번호 확인
	public MemberDTO checkPw(String user_id, String user_pw) throws Exception{
		return dao.checkPw(user_id, user_pw);
	}
	
	// 닉네임 중복확인
	public boolean checkNickname(String user_nickname) throws Exception{
		return dao.checkNickname(user_nickname);
	}
	
	// 휴대폰번호 중복확인
	public boolean checkPhone(String user_phone) throws Exception{
		return dao.checkPhone(user_phone);
	}
	
	// 마이페이지로 옮길 것
	public String uploadProfile(MultipartFile file, String realPath) throws Exception{
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		String sys_name = null;
		if(!file.isEmpty()) {
			String ori_name = file.getOriginalFilename();
			sys_name = UUID.randomUUID() + "_" + ori_name;
			file.transferTo(new File(realPath + File.separator + sys_name));
		}
		return sys_name;
	}
	
	// 프로필 사진 수정
	public int modifyProfile(MemberDTO dto) throws Exception{
		return dao.modifyProfile(dto);
	}
	
	// 내 정보 수정
	public int modifyInfo(String user_id, String user_nickname, String user_pw, String user_phone, String postcode, String roadAddr, String detailAddr, String extraAddr) throws Exception{
		return dao.modifyInfo(user_id, user_nickname, user_pw, user_phone, postcode, roadAddr, detailAddr, extraAddr);
	}

}