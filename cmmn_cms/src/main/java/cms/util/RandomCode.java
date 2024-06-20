package cms.util;

import java.util.Random;

public class RandomCode {
	private Random ran = new Random();
	
	public String getEngSepCode(int digit) {
		String[] eng = {"a","b","c","d","e","f","g","h","i","j","k","l","n","m","o","p","q","r","s","t","u","v","w","x","y","z"};
		String[] sep = {"!","@","#","$","%","^","&","*","+","-"};
		
		StringBuffer mkCode = new StringBuffer();
		for(int j=0; j<digit; j++) {
			int gubun = ran.nextInt(2);
			if(gubun == 0) {
				boolean eng_gubun = ran.nextBoolean();
				if(eng_gubun) mkCode.append(eng[ran.nextInt(eng.length)]);
				else mkCode.append(eng[ran.nextInt(eng.length)].toUpperCase());
			} else if(gubun == 1) {
				mkCode.append(sep[ran.nextInt(sep.length)]);
			}
		}
			
		return mkCode.toString();
	}
	
	public String getEngNumCode(int digit) {
		String[] eng = {"a","b","c","d","e","f","g","h","i","j","k","l","n","m","o","p","q","r","s","t","u","v","w","x","y","z"};
		String[] num = {"1","2","3","4","5","6","7","8","9","0"};
		
		StringBuffer mkCode = new StringBuffer();
		for(int j=0; j<digit; j++) {
			int gubun = ran.nextInt(2);
			if(gubun == 0) {
				boolean eng_gubun = ran.nextBoolean();
				if(eng_gubun) mkCode.append(eng[ran.nextInt(eng.length)]);
				else mkCode.append(eng[ran.nextInt(eng.length)].toUpperCase());
			} else if(gubun == 1) {
				mkCode.append(num[ran.nextInt(num.length)]);
			}
		}
			
		return mkCode.toString();
	}
	
	public String getEngSepNumCode(int digit) {
		String[] eng = {"a","b","c","d","e","f","g","h","i","j","k","l","n","m","o","p","q","r","s","t","u","v","w","x","y","z"};
		String[] sep = {"!","@","#","$","%","^","&","*","+","-"};
		String[] num = {"1","2","3","4","5","6","7","8","9","0"};
		
		StringBuffer mkCode = new StringBuffer();
		for(int j=0; j<digit; j++) {
			int gubun = ran.nextInt(3);
			if(gubun == 0) {
				boolean eng_gubun = ran.nextBoolean();
				if(eng_gubun) mkCode.append(eng[ran.nextInt(eng.length)]);
				else mkCode.append(eng[ran.nextInt(eng.length)].toUpperCase());
			} else if(gubun == 1) {
				mkCode.append(sep[ran.nextInt(sep.length)]);
			} else if(gubun == 2) {
				mkCode.append(num[ran.nextInt(num.length)]);
			}
		}
			
		return mkCode.toString();
	}
}
