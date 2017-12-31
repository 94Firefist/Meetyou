package com.test.dto;

public class PaymentDTO
{
	// 내역
	
	// 아이디, 상품이름, 갯수, 일자, 가격, 환불여부, 결제번호
	// ID, ITEMNAME, COUNT, PAYMENTDATE, PRICE, HANDLING	
	private String userid, name, count, price, paymentdate, handling, payno;

	public String getUserid()
	{
		return userid;
	}

	public void setUserid(String userid)
	{
		this.userid = userid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getCount()
	{
		return count;
	}

	public void setCount(String count)
	{
		this.count = count;
	}

	public String getPrice()
	{
		return price;
	}

	public void setPrice(String price)
	{
		this.price = price;
	}

	public String getPaymentdate()
	{
		return paymentdate;
	}

	public void setPaymentdate(String paymentdate)
	{
		this.paymentdate = paymentdate;
	}

	public String getHandling()
	{
		return handling;
	}

	public void setHandling(String handling)
	{
		this.handling = handling;
	}

	public String getPayno()
	{
		return payno;
	}

	public void setPayno(String payno)
	{
		this.payno = payno;
	}
	
	
}
