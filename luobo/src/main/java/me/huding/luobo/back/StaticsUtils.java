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
package me.huding.luobo.back;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.jfinal.kit.PathKit;
import com.jfinal.template.Engine;

import me.huding.luobo.Parameters;
import me.huding.luobo.model.Blog;

/**
 * 
 *  新闻正文静态化工具类
 *
 * @author JianhongHu
 * @version 1.0
 * @date 2016年4月1日
 */
public class StaticsUtils {

	static {
		Engine.use().setBaseTemplatePath(PathKit.getWebRootPath() + "/template");
	}
	
	/**
	 * 生成静态化的HTML的文件路径
	 * @return
	 */
	public static String genHtmlFilePath(String filename){
		return Parameters.getFinalFrontPath() + File.separator + filename;
	}

	/**
	 * 生成静态化的HTML的相对URL
	 * @param value
	 * @return
	 */
	public static String genHtmlURL(String baseURL,String value){
		return baseURL + "/front/" + value;
	}
	
	public static boolean render(Blog bean) throws IOException {
		Map<String, Object> t = doHandle(bean);
		doRender(bean.getPath(), t);
		return true;
	}
	
	interface NoTip {
		String URL = "javascript:;";
		String MSG = "无";
	}
	
	
    private static final ThreadLocal<SimpleDateFormat> threadLocal = new ThreadLocal<SimpleDateFormat>();
	
	private static final Object object = new Object();
	
	private static SimpleDateFormat getDateFormat(String pattern) throws RuntimeException {
		SimpleDateFormat dateFormat = threadLocal.get();
		if (dateFormat == null) {
			synchronized (object) {
				if (dateFormat == null) {
					dateFormat = new SimpleDateFormat(pattern);
					dateFormat.setLenient(false);
					threadLocal.set(dateFormat);
				}
			}
		}
		dateFormat.applyPattern(pattern);
		return dateFormat;
	}
	
	private static final String YYYY_MM_DD = "yyyy-MM-dd";
	
	
	public static String dateToString(Date date, String pattern) {
		String dateString = null;
		if (date != null) {
			try {
				dateString = getDateFormat(pattern).format(date);
			} catch (Exception e) {
			}
		}
		return dateString;
	}
	
	private static Map<String,Object> doHandle(Blog bean){
		Map<String, Object> t = new HashMap<String, Object>();
		for(Entry<String, Object> entry : bean._getAttrsEntrySet()){
			String key = entry.getKey();
			if(key.equals("publishTime")){
				String value = dateToString(bean.getPublishTime(), YYYY_MM_DD);
				t.put(entry.getKey(),value);
			} else {
				t.put(entry.getKey(),entry.getValue());
			}
		}
		// 查找
		// TODO 如果博客为空，则空指针异常
		Blog nextBlog = Blog.findNextBlog(bean);
		if(nextBlog == null){
			t.put("nextURL",NoTip.URL);
			t.put("nextTitle",NoTip.MSG);
		}else {
			t.put("nextURL",nextBlog.getUrl());
			t.put("nextTitle",nextBlog.getTitle());
		}
		Blog preBlog = Blog.findPreBlog(bean);
		if(preBlog == null){
			t.put("preURL",NoTip.URL);
			t.put("preTitle",NoTip.MSG);
		} else {
			t.put("preURL",preBlog.getUrl());
			t.put("preTitle",preBlog.getTitle());
		}
		List<String> blogTags = new ArrayList<String>();
		if(bean.getTags() != null){
			String[] arr = bean.getTags().split(",");
			for(String tag:arr){
				blogTags.add(tag);
			}
		}
		t.put("blogTags",blogTags);
		return t;
	}
	
	
	public static final String TEMPLATE = "template.html";
	
	public static final Charset UTF8 = Charset.forName("UTF8");
	
	private static void doRender(String path,Map<String, Object> t) throws IOException {
		OutputStream stream = null;
		try {
			stream = new FileOutputStream(new File(path));
			Engine engine = Engine.use();
			String result = engine.getTemplate(TEMPLATE).renderToString(t);
			stream.write(result.getBytes(UTF8));
			stream.close();
		} finally {
			try {
				if (stream != null) {
					stream.close();
				}
			} catch (IOException ioe) {
				// ignore
			}
		}
	}
}
