package com.tswl;
import java.net.*;

public class GetLocalMac {
	@SuppressWarnings("unused")
	public String getMACAddr() throws SocketException, UnknownHostException {
		NetworkInterface netInterface = NetworkInterface.getByInetAddress(InetAddress.getLocalHost());
		byte[] macAddr = netInterface.getHardwareAddress();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < macAddr.length; i++) {
			if (i != 0) {
				sb.append("-");
			}
			String s = Integer.toHexString(macAddr[i] & 0xFF);
			sb.append(s.length() == 1 ? 0 + s : s);
		}
		String localmac = sb.toString().toUpperCase();
		return localmac;
	}
	@SuppressWarnings("unused")
	private static String toHexString(int integer) {
		String str = Integer.toHexString((int) (integer & 0xff));
		if (str.length() == 1) {
			str = "0" + str;
		}
		return str;
	}
	public static void main(String[] args)  throws SocketException, UnknownHostException {
		//new GetMacAddr().getMACAddr();
		GetLocalMac mnn = new GetLocalMac();
		String lk = mnn.getMACAddr();
		System.out.println(lk);
	}
}