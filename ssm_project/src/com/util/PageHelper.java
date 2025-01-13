package com.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class PageHelper {
	//生成网页上显示的分页信息，并根据页面请求参数展示不同的数据子集
	public static void getPage(List<?> list, String name, List<String> nameList, List<String> valueList, int pageSize, String number,
            HttpServletRequest request, String method) {

    // 创建一个StringBuffer用于构建分页HTML字符串
    StringBuffer buffer = new StringBuffer();
    
    // 将name的首字母大写，形成name2用于构建action名称
    String name2 = name.substring(0, 1).toUpperCase() + name.substring(1);
    
    // 初始化路径和action
    String path = "";
    String action = "getAll" + name2 + ".action";
    
    // 如果method不为空，使用条件查询的action名
    if (method != null) {
        action = "query" + name2 + "ByCond.action";
    }
    
    // 创建一个新列表用于存储当前页要显示的对象
    List<Object> objList = new ArrayList<Object>();
    
    // 如果nameList和valueList不为空，构建查询参数的路径
    if (nameList != null && valueList != null) {
        for (int i = 0; i < nameList.size(); i++) {
            path += "&" + nameList.get(i) + "=" + valueList.get(i);
        }
    }
    
    // 获取列表的大小，即总条目数，并计算最大页数
    int pageNumber = list.size();
    int maxPage = pageNumber;
    if (maxPage % pageSize == 0) {
        maxPage = maxPage / pageSize;
    } else {
        maxPage = maxPage / pageSize + 1;
    }
    
    // 如果number为空，默认显示第一页
    if (number == null) {
        number = "0";
    }
    
    // 计算当前页数据的起始和结束索引
    int start = Integer.parseInt(number) * pageSize;
    int over = (Integer.parseInt(number) + 1) * pageSize;
    int count = pageNumber - over;
    if (count <= 0) {
        over = pageNumber;
    }
    
    // 截取当前页的数据子集，并添加到objList
    for (int i = start; i < over; i++) {
        Object obj = list.get(i);
        objList.add(obj);
    }
    
    // 构建分页导航的HTML字符串
    buffer.append("&nbsp;&nbsp;共为");
    buffer.append(maxPage);
    buffer.append("页&nbsp; 共有");
    buffer.append(pageNumber);
    buffer.append("条&nbsp; 当前为第");
    buffer.append((Integer.parseInt(number) + 1));
    buffer.append("页 &nbsp;");
    
    // 添加首页链接
    if ((Integer.parseInt(number) + 1) == 1) {
        buffer.append("首页");
    } else {
        buffer.append("<a href=\"" + name + "/" + action + "?number=0" + path + "\">首页</a>");
    }
    buffer.append("&nbsp;&nbsp;");
    
    // 添加上一页链接
    if ((Integer.parseInt(number) + 1) == 1) {
        buffer.append("上一页");
    } else {
        buffer.append("<a href=\"" + name + "/" + action + "?number=" + (Integer.parseInt(number) - 1) + "" + path + "\">上一页</a>");
    }
    buffer.append("&nbsp;&nbsp;");
    
    // 添加下一页链接
    if (maxPage <= (Integer.parseInt(number) + 1)) {
        buffer.append("下一页");
    } else {
        buffer.append("<a href=\"" + name + "/" + action + "?number=" + (Integer.parseInt(number) + 1) + "" + path + "\">下一页</a>");
    }
    buffer.append("&nbsp;&nbsp;");
    
    // 添加尾页链接
    if (maxPage <= (Integer.parseInt(number) + 1)) {
        buffer.append("尾页");
    } else {
        buffer.append("<a href=\"" + name + "/" + action + "?number=" + (maxPage - 1) + "" + path + "\">尾页</a>");
    }
    
    // 将构造的HTML字符串和分页对象列表设置到请求域
    String html = buffer.toString();
    request.setAttribute("html", html);
    request.setAttribute(name + "List", objList);
	}

	public static void getUserPage(List<?> list, String name, String actionName, int pageSize, String number, HttpServletRequest request) {

	    // 创建一个StringBuffer用于构建分页HTML字符串
	    StringBuffer buffer = new StringBuffer();
	    
	    // 初始化请求路径和action名
	    String path = "";
	    String action = actionName + ".action";
	    
	    // 创建一个新列表用于存储当前页要显示的对象
	    List<Object> objList = new ArrayList<Object>();
	    
	    // 获取列表的大小，即总条目数，并计算最大页数
	    int pageNumber = list.size();
	    int maxPage = pageNumber;
	    if (maxPage % pageSize == 0) {
	        maxPage = maxPage / pageSize;
	    } else {
	        maxPage = maxPage / pageSize + 1;
	    }
	    
	    // 如果number为空，默认显示第一页
	    if (number == null) {
	        number = "0";
	    }
	    
	    // 计算当前页数据的起始和结束索引
	    int start = Integer.parseInt(number) * pageSize;
	    int over = (Integer.parseInt(number) + 1) * pageSize;
	    int count = pageNumber - over;
	    if (count <= 0) {
	        over = pageNumber;
	    }
	    
	    // 截取当前页的数据子集，并添加到objList
	    for (int i = start; i < over; i++) {
	        Object obj = list.get(i);
	        objList.add(obj);
	    }
	    
	    // 构建分页导航的HTML字符串
	    buffer.append("&nbsp;&nbsp;共为");
	    buffer.append(maxPage);  // 总页数
	    buffer.append("页&nbsp; 共有");
	    buffer.append(pageNumber);  // 总条目数
	    buffer.append("条&nbsp; 当前为第");
	    buffer.append((Integer.parseInt(number) + 1));  // 当前页码
	    buffer.append("页 &nbsp;");
	    
	    // 添加首页链接
	    if ((Integer.parseInt(number) + 1) == 1) {
	        buffer.append("首页");
	    } else {
	        buffer.append("<a href=\"" + name + "/" + action + "?number=0" + path + "\">首页</a>");
	    }
	    buffer.append("&nbsp;&nbsp;");
	    
	    // 添加上一页链接
	    if ((Integer.parseInt(number) + 1) == 1) {
	        buffer.append("上一页");
	    } else {
	        buffer.append("<a href=\"" + name + "/" + action + "?number=" + (Integer.parseInt(number) - 1) + "" + path + "\">上一页</a>");
	    }
	    buffer.append("&nbsp;&nbsp;");
	    
	    // 添加下一页链接
	    if (maxPage <= (Integer.parseInt(number) + 1)) {
	        buffer.append("下一页");
	    } else {
	        buffer.append("<a href=\"" + name + "/" + action + "?number=" + (Integer.parseInt(number) + 1) + "" + path + "\">下一页</a>");
	    }
	    buffer.append("&nbsp;&nbsp;");
	    
	    // 添加尾页链接
	    if (maxPage <= (Integer.parseInt(number) + 1)) {
	        buffer.append("尾页");
	    } else {
	        buffer.append("<a href=\"" + name + "/" + action + "?number=" + (maxPage - 1) + "" + path + "\">尾页</a>");
	    }
	    
	    // 将构造的HTML字符串和分页对象列表设置到请求域
	    String html = buffer.toString();
	    request.setAttribute("html", html);
	    request.setAttribute(name + "List", objList);
	}

	public static void getIndexPage(List<?> list, String name, String actionName, String id, int pageSize, String number,
            HttpServletRequest request) {
	    // 创建一个StringBuffer用于构建分页HTML字符串
	    StringBuffer buffer = new StringBuffer();
	    
	    // 初始化路径和action名称
	    String path = "";
	    String action = actionName + ".action";
	    
	    // 如果id存在，添加到路径参数中
	    if (!"".equals(id) && id != null) {
	        path = "&id=" + id + "";
	    }
	    
	    // 创建一个新列表用于存储当前页要显示的对象
	    List<Object> objList = new ArrayList<Object>();
	    
	    // 获取列表的大小，即总条目数，并计算最大页数
	    int pageNumber = list.size();
	    int maxPage = pageNumber;
	    if (maxPage % pageSize == 0) {
	        maxPage = maxPage / pageSize;
	    } else {
	        maxPage = maxPage / pageSize + 1;
	    }
	    
	    // 如果number为空，默认显示第一页
	    if (number == null) {
	        number = "0";
	    }
	    
	    // 计算当前页数据的起始和结束索引
	    int start = Integer.parseInt(number) * pageSize;
	    int over = (Integer.parseInt(number) + 1) * pageSize;
	    int count = pageNumber - over;
	    if (count <= 0) {
	        over = pageNumber;
	    }
	    
	    // 截取当前页的数据子集，并添加到objList
	    for (int i = start; i < over; i++) {
	        Object obj = list.get(i);
	        objList.add(obj);
	    }
	    
	    // 构建分页导航的HTML字符串
	    buffer.append("&nbsp;&nbsp;共为");
	    buffer.append(maxPage);  // 总页数
	    buffer.append("页&nbsp; 共有");
	    buffer.append(pageNumber);  // 总条目数
	    buffer.append("条&nbsp; 当前为第");
	    buffer.append((Integer.parseInt(number) + 1));  // 当前页码
	    buffer.append("页 &nbsp;");
	    
	    // 添加首页链接
	    if ((Integer.parseInt(number) + 1) == 1) {
	        buffer.append("首页");
	    } else {
	        buffer.append("<a href=\"index/" + action + "?number=0" + path + "\">首页</a>");
	    }
	    buffer.append("&nbsp;&nbsp;");
	    
	    // 添加上一页链接
	    if ((Integer.parseInt(number) + 1) == 1) {
	        buffer.append("上一页");
	    } else {
	        buffer.append("<a href=\"index/" + action + "?number=" + (Integer.parseInt(number) - 1) + "" + path + "\">上一页</a>");
	    }
	    buffer.append("&nbsp;&nbsp;");
	    
	    // 添加下一页链接
	    if (maxPage <= (Integer.parseInt(number) + 1)) {
	        buffer.append("下一页");
	    } else {
	        buffer.append("<a href=\"index/" + action + "?number=" + (Integer.parseInt(number) + 1) + "" + path + "\">下一页</a>");
	    }
	    buffer.append("&nbsp;&nbsp;");
	    
	    // 添加尾页链接
	    if (maxPage <= (Integer.parseInt(number) + 1)) {
	        buffer.append("尾页");
	    } else {
	        buffer.append("<a href=\"index/" + action + "?number=" + (maxPage - 1) + "" + path + "\">尾页</a>");
	    }
	    
	    // 将构造的HTML字符串和分页对象列表设置到请求域
	    String html = buffer.toString();
	    request.setAttribute("html", html);
	    request.setAttribute(name + "List", objList);
	}
}