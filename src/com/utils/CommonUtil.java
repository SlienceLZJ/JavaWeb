package com.utils;

public class CommonUtil {

	
    /**    
     * @param hexStr 十六进制
     * @return 汉字
     */
    
  public static String hexStr2Str(String hexStr) {
		
	    String str = "0123456789abcdef";
	    char[] hexs = hexStr.toCharArray();
	    byte[] bytes = new byte[hexStr.length() / 2];
	    int n;
	    for (int i = 0; i < bytes.length; i++) {
	        n = str.indexOf(hexs[2 * i]) * 16;
	        n += str.indexOf(hexs[2 * i + 1]);
	        bytes[i] = (byte) (n & 0xff);
	    }
	    return new String(bytes);	   
	}
    
    
	
      	
}
