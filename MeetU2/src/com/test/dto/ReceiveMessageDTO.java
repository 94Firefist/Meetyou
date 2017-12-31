package com.test.dto;

public class ReceiveMessageDTO
{
	private int messageId, messageType, rownumber;
	
	public int getRownumber()
	{
		return rownumber;
	}

	public void setRownumber(int rownumber)
	{
		this.rownumber = rownumber;
	}

	public int getMessageId()
	{
		return messageId;
	}

	public void setMessageId(int messageId)
	{
		this.messageId = messageId;
	}

	public int getMessageType()
	{
		return messageType;
	}

	public void setMessageType(int messageType)
	{
		this.messageType = messageType;
	}

	
	
}
