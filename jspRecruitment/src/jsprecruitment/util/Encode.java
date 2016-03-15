package jsprecruitment.util;

import java.io.UnsupportedEncodingException;

public class Encode {
	public static  String  getNewString (String str) throws UnsupportedEncodingException{
		return new String(str.getBytes("ISO-8859-1"),"utf-8");
	}
}
