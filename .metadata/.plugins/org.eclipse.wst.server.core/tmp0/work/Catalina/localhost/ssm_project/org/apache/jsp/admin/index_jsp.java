/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.84
 * Generated at: 2024-12-22 13:55:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/standard.jar", Long.valueOf(1709948090000L));
    _jspx_dependants.put("jar:file:/D:/EclipseSSM/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ssm_project/WEB-INF/lib/standard.jar!/META-INF/c.tld", Long.valueOf(1054243570000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP 只允许 GET、POST 或 HEAD。Jasper 还允许 OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"zh_CN\">\r\n");
      out.write("<head>\r\n");
      out.write("<base href=\"");
      out.print(basePath);
      out.write("\" />\r\n");
      out.write("<title>欢迎使用运动用品在线商城后台系统</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"asset/css/pintuer.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"asset/css/admin.css\">\r\n");
      out.write("<script src=\"asset/js/jquery.js\"></script><!-- 导入JQuery包 -->\r\n");
      out.write("<script src=\"asset/js/pintuer.js\"></script><!-- 导入Pintuer前端架构 -->\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<div style=\"background-image: url('asset/images/loginBackground.JPG');background-size: 100% 100%;object-fit: cover;\">\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"line bouncein\">\r\n");
      out.write("			<div class=\"xs6 xm4 xs3-move xm4-move\">\r\n");
      out.write("				<div style=\"height: 200px;\"></div>\r\n");
      out.write("				<div class=\"media media-y margin-big-bottom\"></div>\r\n");
      out.write("				<!-- 表单数据发送给controller:admin/login.action -->\r\n");
      out.write("				<form action=\"admin/login.action\" name=\"myform\" method=\"post\">\r\n");
      out.write("					<div class=\"panel loginbox\">\r\n");
      out.write("						<div class=\"text-center margin-big padding-big-top\">\r\n");
      out.write("							<h1 style=\"color: #b027b2;font-size: 28px;font-weight: bold;letter-spacing: 2px;\">运动用品在线商城后台系统</h1>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"panel-body\" style=\"padding: 30px; padding-bottom: 10px; padding-top: 10px;\">\r\n");
      out.write("							<div class=\"form-group\">\r\n");
      out.write("								<div class=\"field field-icon-right\">\r\n");
      out.write("									<input type=\"text\" class=\"input input-big\" name=\"username\" placeholder=\"登录账号\" data-validate=\"required:请填写账号\" /> <span\r\n");
      out.write("										class=\"icon icon-user margin-small\"></span>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"form-group\">\r\n");
      out.write("								<div class=\"field field-icon-right\">\r\n");
      out.write("									<input type=\"password\" class=\"input input-big\" name=\"password\" placeholder=\"登录密码\" data-validate=\"required:请填写密码\" /> <span\r\n");
      out.write("										class=\"icon icon-key margin-small\"></span>\r\n");
      out.write("								</div>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div style=\"padding: 30px;\">\r\n");
      out.write("							<input type=\"submit\" class=\"button button-block bg-main text-big input-big\" value=\"登录\" style=\"background-color: #b027b2;\">\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</form>\r\n");
      out.write("				<div style=\"height: 200px;\"></div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");

	String message = (String) session.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	session.removeAttribute("message");

      out.write("\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
