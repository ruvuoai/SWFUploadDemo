package test.com.me.code;

import org.apache.commons.codec.binary.Base64;

public class Test01 {

    public static void main(String[] args) {

	
	Test01 t=new Test01();
	t.test01();
	
    }

    private void test01() {
	
	
	String s="中文";
	
	s=Base64.encodeBase64String(s.getBytes());
	System.out.println(s);
	
    }

}
