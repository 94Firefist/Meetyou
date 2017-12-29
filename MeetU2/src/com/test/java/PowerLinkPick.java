package com.test.java;

import java.util.Random;

public class PowerLinkPick
{
	public static int[] select(int length)
	{
		int[] result = new int[4];
		
		Random random = new Random();
		
		for(int i=0; i<4; i++)
		{
			result[i] = random.nextInt(length);
			for(int j=0; j<i; j++)
			{
				if(result[j] == result[i])
				{
					i--;
					break;
				}
			}
		}
		
		return result;
	}
}
