package poll;
/*******************************************************************************
 * Copyright (c) 2016  Swapnil Kumawat.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms.
 * Contributors:
 *     Webminds Technology
 *******************************************************************************/
import java.io.File;
import java.net.URL;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;

import org.omg.CORBA.Request;

public class DateDifferent  {
	
	
	public long getCDateDifference(String stdate,String lsdate) 
	{
		
		long diff=0;
		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

		Date d1 = null;
		Date d2 = null;
		long diffDays = 0;

		try {
			d1 = format.parse(stdate);
			d2 = format.parse(lsdate);

			//in milliseconds
			diff = d2.getTime() - d1.getTime();

			long diffSeconds = diff / 1000 % 60;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffHours = diff / (60 * 60 * 1000) % 24;
			diffDays = diff / (24 * 60 * 60 * 1000);

/*			System.out.print(diffHours + " hours, ");
			System.out.print(diffMinutes + " minutes, ");
			System.out.print(diffSeconds + " seconds.");*/

		} catch (Exception e) {
			e.printStackTrace();
		}
		return diffDays;
	}

	
	
    public static void main(String[] args) {
    	
    	
    	
        
        
        DateDifferent DF = new DateDifferent();
        
       
        System.out.println("\nThe Date Different Example");
           
        
        
    }
}