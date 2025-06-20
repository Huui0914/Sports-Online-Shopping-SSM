package com.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.entity.Admin;
import com.service.AdminService;
import com.util.MD5;
import com.util.PageHelper;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径
@RequestMapping(value = "/admin", produces = "text/plain;charset=utf-8")
public class AdminController extends BaseController {
	// @Autowired的作用是自动注入依赖的ServiceBean
	@Autowired
	private AdminService adminService;

	// 管理员准备
	@RequestMapping("index.action")
	public String index() {
		return "admin/index";//地址栏中的 URL 不会发生变化，依然是用户访问的原始 URL
	}

	// 管理员登录 1 验证用户名是否存在 2 验证密码是否正确
	@RequestMapping("login.action")
	public String login() {
		//获取表单传递的信息
		String username = this.getRequest().getParameter("username");
		//使用工具类MD5对密码进行加密
		String password = MD5.md5(this.getRequest().getParameter("password"));
		Admin adminEntity = new Admin();
		//查询管理员信息是否一致
		adminEntity.setUsername(username);//创建对象实例
		//数据库中进行查询
		List<Admin> adminlist = this.adminService.getAdminByCond(adminEntity);
		if (adminlist.size() == 0) {
			this.getSession().setAttribute("message", "用户名不存在");
			return "redirect:/admin/index.action";
		} else {
			Admin admin = adminlist.get(0);
			if (password.equals(admin.getPassword())) {
				this.getSession().setAttribute("adminid", admin.getAdminid());
				this.getSession().setAttribute("adminname", admin.getUsername());
				this.getSession().setAttribute("realname", admin.getRealname());
				this.getSession().setAttribute("role", "管理员");
			} else {
				this.getSession().setAttribute("message", "密码错误");
				return "redirect:/admin/index.action";
			}
		}
		return "admin/main";
	}

	// 管理员准备修改密码
	@RequestMapping("prePwd.action")
	public String prePwd() {
		return "admin/editpwd";
	}

	// 修改密码
	@RequestMapping("editpwd.action")
	public String editpwd() {
		String adminid = (String) this.getSession().getAttribute("adminid");
		String password = MD5.md5(this.getRequest().getParameter("password"));
		String repassword = MD5.md5(this.getRequest().getParameter("repassword"));
		Admin admin = this.adminService.getAdminById(adminid);
		if (password.equals(admin.getPassword())) {
			admin.setPassword(repassword);
			this.adminService.updateAdmin(admin);
		} else {
			this.getRequest().setAttribute("message", "旧密码错误");
		}
		return "redirect:/admin/prePwd.action";
	}

	// 管理员退出登录
	@RequestMapping("exit.action")
	public String exit() {
		//从session中移除
		this.getSession().removeAttribute("adminid");
		this.getSession().removeAttribute("adminname");
		this.getSession().removeAttribute("realname");
		return "redirect:/admin/index.action";
	}

	// 准备添加数据
	@RequestMapping("createAdmin.action")
	public String createAdmin() {
		return "admin/addadmin";
	}

	// 添加数据
	@RequestMapping("addAdmin.action")
	public String addAdmin(Admin admin) {
		String password = MD5.md5(admin.getPassword());
		admin.setPassword(password);
		admin.setAddtime(VeDate.getStringDateShort());
		this.adminService.insertAdmin(admin);
		return "redirect:/admin/createAdmin.action";
	}

	// 通过主键删除数据
	@RequestMapping("deleteAdmin.action")
	public String deleteAdmin(String id) {
		this.adminService.deleteAdmin(id);
		return "redirect:/admin/getAllAdmin.action";
	}

	// 批量删除数据
//	@RequestMapping("deleteAdminByIds.action")
//	public String deleteAdminByIds() {
//		String[] ids = this.getRequest().getParameterValues("adminid");
//		if (ids != null) {
//			for (String adminid : ids) {
//				this.adminService.deleteAdmin(adminid);
//			}
//		}
//		return "redirect:/admin/getAllAdmin.action";
//	}

	// 更新数据
	@RequestMapping("updateAdmin.action")
	public String updateAdmin(Admin admin) {
		this.adminService.updateAdmin(admin);
		return "redirect:/admin/getAllAdmin.action";
	}

	// 显示全部数据
	@RequestMapping("getAllAdmin.action")
	public String getAllAdmin(String number) {
		List<Admin> adminList = this.adminService.getAllAdmin();
		PageHelper.getPage(adminList, "admin", null, null, 10, number, this.getRequest(), null);
		return "admin/listadmin";
	}

	// 按条件查询数据 (模糊查询)
	@RequestMapping("queryAdminByCond.action")
	public String queryAdminByCond(String cond, String name, String number) {
		Admin admin = new Admin();
		if (cond != null) {
			if ("username".equals(cond)) {
				admin.setUsername(name);
			}
			if ("password".equals(cond)) {
				admin.setPassword(name);
			}
			if ("realname".equals(cond)) {
				admin.setRealname(name);
			}
			if ("contact".equals(cond)) {
				admin.setContact(name);
			}
			if ("addtime".equals(cond)) {
				admin.setAddtime(name);
			}
		}

		List<String> nameList = new ArrayList<String>();
		List<String> valueList = new ArrayList<String>();
		nameList.add(cond);
		valueList.add(name);
		PageHelper.getPage(this.adminService.getAdminByLike(admin), "admin", nameList, valueList, 10, number,
				this.getRequest(), "query");
		name = null;
		cond = null;
		return "admin/queryadmin";
	}

	// 按主键查询数据
	@RequestMapping("getAdminById.action")
	public String getAdminById(String id) {
		Admin admin = this.adminService.getAdminById(id);
		this.getRequest().setAttribute("admin", admin);
		return "admin/editadmin";
	}

}
