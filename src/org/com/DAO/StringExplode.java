package org.com.DAO;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StringExplode {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 int i;
		String Str;
		 
		String str = "hi.12,name.0.,is.0.,Aditya.12";
		List<String> subList = new ArrayList<String>();
		List<String> list = new ArrayList<String>();
		list = Arrays.asList(str.split(","));
		for (i=0; i < list.size() ; i++){
			if(!((String) list.get(i)).contains(".0.")){
				System.out.println(list.get(i));
				Str = list.get(i);
				subList = Arrays.asList(Str.split("."));
				System.out.println("done");
				System.out.println("SubList Size is : "+ subList.size());
			}
			
			
		}
	}

}
