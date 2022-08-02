package com.market.chatting;

import java.util.Date;

import com.market.utils.Time;

public class ChattingMessageDTO {
    
    private int roomId;		// 방 번호
    private String messageId;	// 메세지 아이디
    private String message;		// 메세지 내용
    private String name;		// 보낸이 닉네임
    private int unReadCount;	// 안 읽은 메세지 수 0,1
    private int sessionCount;	// 현재 세션 수 2
    private String upload_date; // 업로드 시간
    
    public ChattingMessageDTO() {
        super();
    }
 
    public ChattingMessageDTO(int roomId, String messageId, String message, String name, int unReadCount,
            int sessionCount, String upload_date) {
        super();
        this.roomId = roomId;
        this.messageId = messageId;
        this.message = message;
        this.name = name;
        this.unReadCount = unReadCount;
        this.sessionCount = sessionCount;
        this.upload_date = upload_date;
    }
 
    public int getRoomId() {
        return roomId;
    }
 
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
 
    public String getMessageId() {
        return messageId;
    }
 
    public void setMessageId(String messageId) {
        this.messageId = messageId;
    }
 
    public String getMessage() {
        return message;
    }
 
    public void setMessage(String message) {
        this.message = message;
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }

    public int getUnReadCount() {
        return unReadCount;
    }
 
    public void setUnReadCount(int unReadCount) {
        this.unReadCount = unReadCount;
    }
 
    public int getSessionCount() {
        return sessionCount;
    }
 
    public void setSessionCount(int sessionCount) {
        this.sessionCount = sessionCount;
    }
    
 
    public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	@Override
	public String toString() {
		return "ChattingMessageDTO [roomId=" + roomId + ", messageId=" + messageId + ", message=" + message + ", name="
				+ name + ", unReadCount=" + unReadCount + ", sessionCount=" + sessionCount + ", upload_date="
				+ upload_date + "]";
	}

}

