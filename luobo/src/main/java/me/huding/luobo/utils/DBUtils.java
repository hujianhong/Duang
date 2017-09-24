/**
 * Copyright (c) 2015-2017, Silly Boy 胡建洪(1043244432@qq.com).
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

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.ibatis.common.jdbc.ScriptRunner;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

import me.huding.luobo.Parameters;

/**
 *
 *
 * @author JianhongHu
 * @version 1.0
 * @date 2017年1月14日
 */
public class DBUtils {
	
	
	public static <T extends Model<T>> List<T> findAll(Model<T> model,String... columns){
		StringBuilder builder = new StringBuilder();
		builder.append("select ");
		Table table = TableMapping.me().getTable(model.getClass());
		if(columns == null || columns.length == 0){
			/*Set<String> set = table.getColumnTypeMap().keySet();
			columns = set.toArray(new String[0]);*/
			builder.append(" * ");
		} else {
			for(int i = 0;i <columns.length;i ++){
				builder.append(columns[i]);
				if(i != columns.length - 1){
					builder.append(",");
				}
			}
		}
		
		builder.append(" from ").append(table.getName());
		return model.find(builder.toString());
	}
	
	
	public static <T extends Model<T>> List<T> findAll(Model<T> model){
		StringBuilder builder = new StringBuilder();
		builder.append("select * ");
		Table table = TableMapping.me().getTable(model.getClass());
		builder.append(" from ").append(table.getName());
		return model.find(builder.toString());
	}
	
	
	public static void detectTable(){
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(Parameters.DB_URL, Parameters.DB_USERNAME, Parameters.DB_PASSWORD);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		try {
			Statement statement = connection.createStatement();
			statement.executeQuery("select * from blog where 1 = 3");
		} catch (Exception e) {
			// 发生异常则说明表不存在，需要执行SQL脚本
			try {
				System.out.println("start to execute sql");
				executeSQL(connection);
				System.out.println("execute sql success");
			} catch (Exception e2) {
				throw new RuntimeException(e2);
			}
		} finally {
		    if(connection != null){
		    	try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		    }
		}
	}
	
	private static void executeSQL(Connection connection) throws Exception{
		ScriptRunner runner = new ScriptRunner(connection, false, true);
		runner.runScript(new FileReader(Parameters.SQL_PATH));
	}
	
	public static void main(String[] args) throws IOException {
		detectTable();
//		BufferedReader reader = new BufferedReader(new FileReader(Parameters.SQL_PATH));
//		String string;
//	    while((string = reader.readLine()) != null){
//	    	System.out.println(string);
//	    }
	}
}
