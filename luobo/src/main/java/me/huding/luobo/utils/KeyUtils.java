/**
 * Copyright (c) 2015-2016, Silly Boy 胡建洪(1043244432@qq.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package me.huding.luobo.utils;

import java.security.MessageDigest;
import java.util.UUID;

import me.huding.luobo.IConstants;

/**
 *
 *
 * @author JianhongHu
 * @version 1.0
 * @date 2016年10月29日
 */
public class KeyUtils {

	/**
	 * 获取 UUID
	 * 
	 * @return
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 对内容进行签名，使用MD5进行哈希
	 * 
	 * @param value
	 * @return
	 */
	public static String signByMD5(String value) {
		return encodeMD5Hex(value);
	}
	
	private static final String MD5 = "MD5";

	public static byte[] encodeMD5(byte[] data) {
		try {
			MessageDigest md = MessageDigest.getInstance(MD5);
			return md.digest(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static byte[] encodeMD5(String data) {
		try {
			return encodeMD5(data.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private static final char[] hexDigits = { '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

	public static String convert2HexStr(byte[] data) {
		int j = data.length;
		char[] str = new char[j * 2];
		int k = 0;
		for (int i = 0; i < j; i++) {
			byte byte0 = data[i];
			str[(k++)] = hexDigits[(byte0 >>> 4 & 0xF)];
			str[(k++)] = hexDigits[(byte0 & 0xF)];
		}
		return new String(str);
	}
	
	public static String encodeMD5Hex(String data) {
		try {
			return convert2HexStr(encodeMD5(data));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static void main(String[] args){
		System.out.println(signByMD5(IConstants.DEFAULT_PASSWORD));
	}

}
