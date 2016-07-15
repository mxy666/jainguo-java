package com.jianguo.servlet.login;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jianguo.bean.T_user_info_Bean;
import com.jianguo.bean.T_user_login_Bean;
import com.jianguo.sql.T_enroll_limit_Sql;
import com.jianguo.sql.T_user_info_Sql;
import com.jianguo.sql.T_user_login_Sql;
import com.jianguo.sql.T_user_money_Sql;
import com.jianguo.sql.T_user_resume_Sql;
import com.jianguo.util.Frequently;
import com.jianguo.util.MD5Util;
import com.qiniu.util.Auth;

public class T_login_app_servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public T_login_app_servlet() {
		super();
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("---T_user_login_Insert_Servlet---");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Map params =  new HashMap();
		
		String tel =request.getParameter("tel");
		String password =request.getParameter("vertify");
		
		//------------------访问限制--------开始----------------------
		String only =request.getParameter("only");
		String ss_only = Frequently.daycount();
		String ss_only2 = Frequently.daycount2();
		String ss_only3 = Frequently.daycount3();
		if(only.equals(ss_only) || only.equals(ss_only2) || only.equals(ss_only3)){
			
		//------------------访问限制--------结束----------------------
			boolean b = T_user_login_Sql.check_tel(tel);
			if(b==true){
				long random =(long)((Math.random()*9+1)*100000);
				String codes = random+"";
				String str_psd = MD5Util.MD5(codes);
				if(password == "" || password == null){
					T_user_login_Sql.insert_tel(tel, str_psd,"1","1","0");
				}else{
					T_user_login_Sql.insert_tel(tel, password,"1","1","0");
				}
//				if(i == 1){
					T_user_login_Bean t_user_login = T_user_login_Sql.select_tel(tel);
//					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String ly_time = sdf.format(new java.util.Date());
					T_user_info_Sql.insert_qq_wx(t_user_login.getId()+"", "兼果","", "http://v3.jianguojob.com/moren.png","","0","0","0", ly_time, ly_time);
					T_user_resume_Sql.insert_qq_wx(t_user_login.getId()+"", "兼果", 
							"","http://v3.jianguojob.com/moren.png","","","1","0","0","","","","","");
					T_user_money_Sql.insert(t_user_login.getId()+"", "0", "8.88", "0", "0", "0", "0");
					
					T_user_info_Bean t_user_info = T_user_info_Sql.select_login_id(t_user_login.getId()+"");
					//简单的token(七牛)
					Auth auth = Auth.create("l8JTtsVLzAV4yEvMvLd7Jno_4pDBwg180-_sGPbP","lkYt1WH8OPHoDkOHD_raJugSeJhaRzf7OJStBkNO");	
					//		String token=auth.uploadToken("iqiaqia",null,3600*24*365*10,null);//一年
					String qiniu_token=auth.uploadToken("jianguo",null,3600*24*7,null);//7天
					t_user_info.setQiniu(qiniu_token);
					
					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
					String ly_time2 = sdf2.format(new java.util.Date());
					T_enroll_limit_Sql.insert(t_user_login.getId()+"", "0", ly_time2);
					
					/*if(city_id == "" || city_id == null){
					}else{
					if(city_id == "0" || city_id.equals("0")){
					}else{
						if(city_id.equals("010")){
							T_user_login_Sql.update_city_id("北京", t_user_login.getId()+"");
						}else
						if(city_id.equals("0899")){
							T_user_login_Sql.update_city_id("三亚", t_user_login.getId()+"");
						}else
						if(city_id.equals("0898")){
							T_user_login_Sql.update_city_id("海口", t_user_login.getId()+"");
						}else
						if(city_id.equals("0571")){
							T_user_login_Sql.update_city_id("杭州", t_user_login.getId()+"");
						}else
						if(city_id.equals("029")){
							T_user_login_Sql.update_city_id("西安", t_user_login.getId()+"");
						}else{
							T_user_login_Sql.update_city_id(city_name, t_user_login.getId()+"");
						}
					}
					}*/
			}
			
		}
	}


}
