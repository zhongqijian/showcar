package com.tswl;
import com.tswl.GetMac;

public class Test {

	public static void main(String[] args) {
		GetMac aa = new GetMac();
		String client_mac= aa.getmac(null);
		System.out.print(client_mac);
	}

}
