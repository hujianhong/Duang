package me.huding.luobo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;

import javax.sql.DataSource;

import com.jfinal.kit.Kv;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.template.Engine;

import me.huding.luobo.model.Blog;
import me.huding.luobo.model._MappingKit;
import me.huding.luobo.utils.DateStyle;
import me.huding.luobo.utils.DateUtils;

public class Main {
	
	
	public static String genPath(String url){
		return PathKit.getWebRootPath() + url;
	}
	
	private static Blog findNextBlog(Blog bean){
		String sql = "select title,url from blog where publishTime > ? limit 1";
		Blog nextBlog = Blog.dao.findFirst(sql,bean.getPublishTime());
		if(nextBlog == null){
			sql = "select title,url from blog order by publishTime limit 1";
			nextBlog = Blog.dao.findFirst(sql);
		}
		return nextBlog;
	}
	
    private static Blog findPreBlog(Blog bean){
    	String sql = "select title,url from blog where publishTime < ? limit 1";
    	Blog preBlog = Blog.dao.findFirst(sql,bean.getPublishTime());
		if(preBlog == null){
			sql = "select title,url from blog order by publishTime desc limit 1";
			preBlog = Blog.dao.findFirst(sql);
		}
		return preBlog;
    }
	
	/**
	 * 
	 * @param filePath
	 * @param bean
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public static boolean render(Blog bean) throws IOException {
		Kv t = Kv.create();
		for(Entry<String, Object> entry : bean._getAttrsEntrySet()){
			String key = entry.getKey();
			if(key.equals("publishTime")){
				String value = DateUtils.DateToString(bean.getPublishTime(), DateStyle.YYYY_MM_DD );
				t.put(entry.getKey(),value);
			} else {
				t.put(entry.getKey(),entry.getValue());
			}
		}
		// 查找
		// TODO 如果博客为空，则空指针异常
		Blog nextBlog = findNextBlog(bean);
		if(nextBlog == null){
			t.put("nextURL","javascript:;");
			t.put("nextTitle","无");
		}else {
			t.put("nextURL",nextBlog.getUrl());
			t.put("nextTitle",nextBlog.getTitle());
		}
		Blog preBlog = findPreBlog(bean);
		if(preBlog == null){
			t.put("preURL","javascript:;");
			t.put("preTitle","无");
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
		
		OutputStream stream = null;
		try {
			stream = new FileOutputStream(new File(genPath(bean.getUrl())));
			String result = Engine.use().getTemplate("template.html").renderToString(t);
			stream.write(result.getBytes(Charset.forName("UTF8")));
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
		return true;
	}
	
	
	static {
		Engine.use().setBaseTemplatePath(PathKit.getWebRootPath() + "/template");
	}
	
	public static DataSource getDataSource() {
		DruidPlugin cp = new DruidPlugin(Parameters.DB_URL,
				Parameters.DB_USERNAME, Parameters.DB_PASSWORD);
		cp.start();
		return cp.getDataSource();
	}

	public static void main(String[] args) throws IOException  {
		ActiveRecordPlugin arp = new ActiveRecordPlugin(getDataSource());
		_MappingKit.mapping(arp);
		arp.start();
		
		Blog blog = Blog.dao.findById("093dcae887cd4904b2d244fcdca5473a");
		render(blog);
	}


}
