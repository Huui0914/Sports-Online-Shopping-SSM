package com.test;

import java.util.UUID;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dao.AdminDAO;
import com.entity.Admin;
import com.util.MD5;
import com.util.VeDate;

public class Test {

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		ApplicationContext resource = new ClassPathXmlApplicationContext("springmvc-servlet.xml");
		AdminDAO adminDAO = (AdminDAO) resource.getBean(AdminDAO.class);
		Admin admin = new Admin();
		admin.setAddtime(VeDate.getStringDateShort());
		admin.setContact("709664889");
		admin.setPassword(MD5.md5("admin"));
		admin.setRealname("管理员");
		admin.setUsername("admin");
		adminDAO.insertAdmin(admin);
	}
}
























