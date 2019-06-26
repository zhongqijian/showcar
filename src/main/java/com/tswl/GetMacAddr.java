package com.tswl;

import java.net.*;

public class GetMacAddr {

	@SuppressWarnings("unused")
	private void getMACAddr() throws SocketException, UnknownHostException {

		// 获得ＩＰ
		NetworkInterface netInterface = NetworkInterface.getByInetAddress(InetAddress.getLocalHost());
        // 获得Mac地址的byte数组
        byte[] macAddr = netInterface.getHardwareAddress();
        //System.out.print("MAC Addr:\t");
        // 循环输出
        StringBuffer sb = new StringBuffer();
        for (byte b : macAddr) {
        // 这里的toHexString()是自己写的格式化输出的方法，见下步。
           //System.out.print(toHexString(b) + "-");
           String mm=toHexString(b);
           sb.append(mm+"-");
        }
        String macaa = sb.toString().toUpperCase();
        System.out.println(macaa);
	}	
	private static String toHexString(int integer) {
		// 将得来的int类型数字转化为十六进制数
		String str = Integer.toHexString((int) (integer & 0xff));
		// 如果遇到单字符，前置0占位补满两格
		if (str.length() == 1) {
		   str = "0" + str;
		}
		   return str;
	}
	public static void main(String[] args)  throws SocketException, UnknownHostException {
		new GetMacAddr().getMACAddr();
	}
}
