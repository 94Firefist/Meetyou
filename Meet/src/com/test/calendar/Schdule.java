package com.test.calendar;

import org.springframework.stereotype.Service;

@Service("Schdule")
public class Schdule
{
	int schduleCheck(int year, int month, int date) 
	{
		int iljungSu = 0;
	
		if (year == 2017 && month == 11 && date == 17)
			iljungSu = 3;
	
		if (year == 2017 && month == 11 && date == 3)
			iljungSu = 4;
	
		if (year == 2017 && month == 10 && date == 3)
			iljungSu = 8;
	
		return iljungSu;
	}
}
