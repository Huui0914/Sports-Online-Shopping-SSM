/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.84
 * Generated at: 2024-12-23 02:53:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
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

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;

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
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"zh_CN\">\r\n");
      out.write("<head>\r\n");
      out.write("<base href=\"");
      out.print(basePath);
      out.write("\" />\r\n");
      out.write("<title>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${title }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</title>\r\n");
      out.write("<style>\r\n");
      out.write("	/* 设置表格背景和边框 */\r\n");
      out.write("	.category_item {\r\n");
      out.write("	    border: 1px solid #ddd;\r\n");
      out.write("	    border-radius: 5px;\r\n");
      out.write("	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);\r\n");
      out.write("	    overflow: hidden;\r\n");
      out.write("	}\r\n");
      out.write("	.category_item dl {\r\n");
      out.write("	    background: #fafafa;\r\n");
      out.write("	    width: 100%;\r\n");
      out.write("	    padding: 0;\r\n");
      out.write("	    margin: 0;\r\n");
      out.write("	}\r\n");
      out.write("\r\n");
      out.write("	.category_item h1 {\r\n");
      out.write("	    font-size: 16px;\r\n");
      out.write("	    font-weight: normal;\r\n");
      out.write("	    margin: 10px 0;\r\n");
      out.write("	    padding: 10px;\r\n");
      out.write("	    border-bottom: 1px solid #eee;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.category_tree h1 a {\r\n");
      out.write("	    color: #333;\r\n");
      out.write("	    text-decoration: none;\r\n");
      out.write("	    padding: 8px 15px;\r\n");
      out.write("	    display: block;\r\n");
      out.write("	    transition: all 0.3s ease;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("\r\n");
      out.write("	.category_tree h1 a:hover {\r\n");
      out.write("	    color: #ffffff;\r\n");
      out.write("	    background-color: #EDCDEE;\r\n");
      out.write("	    border-radius: 3px;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 分类框样式 */\r\n");
      out.write("	.box1.cate {\r\n");
      out.write("	    padding: 15px;\r\n");
      out.write("	    margin: 0;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 清除浮动 */\r\n");
      out.write("	.box1.cate div {\r\n");
      out.write("	    clear: both;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 商品详情 */\r\n");
      out.write("	.box_list {\r\n");
      out.write("	    border: 1px solid #ddd;\r\n");
      out.write("	    border-radius: 5px;\r\n");
      out.write("	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);\r\n");
      out.write("	    overflow: hidden;\r\n");
      out.write("	    background-color: #fff;\r\n");
      out.write("	    margin-bottom: 20px;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 标题样式 */\r\n");
      out.write("	.box_list_1 h3 {\r\n");
      out.write("	    font-size: 18px;\r\n");
      out.write("	    font-weight: bold;\r\n");
      out.write("	    color: #ffffff;\r\n");
      out.write("	    background-color: #EDCDEE;\r\n");
      out.write("	    padding: 10px;\r\n");
      out.write("	    margin: 0;\r\n");
      out.write("	    text-align: center;\r\n");
      out.write("	    border-bottom: 1px solid #ddd;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 商品列表容器样式 */\r\n");
      out.write("	.list_details {\r\n");
      out.write("	    display: flex;\r\n");
      out.write("	    flex-wrap: wrap;\r\n");
      out.write("	    padding: 15px;\r\n");
      out.write("	    gap: 15px;\r\n");
      out.write("	    justify-content: flex-start;\r\n");
      out.write("	    background-color: #fafafa;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 单个商品样式 */\r\n");
      out.write("	.item_details {\r\n");
      out.write("	    width: 200px; /* 控制商品卡片宽度 */\r\n");
      out.write("	    border: 1px solid #eee;\r\n");
      out.write("	    border-radius: 5px;\r\n");
      out.write("	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);\r\n");
      out.write("	    background-color: #fff;\r\n");
      out.write("	    text-align: center;\r\n");
      out.write("	    padding: 10px;\r\n");
      out.write("	    transition: transform 0.3s ease, box-shadow 0.3s ease;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 商品悬停效果 */\r\n");
      out.write("	.item_details:hover {\r\n");
      out.write("	    transform: scale(1.05);\r\n");
      out.write("	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 商品图片样式 */\r\n");
      out.write("	.item_details img {\r\n");
      out.write("	    max-width: 80%;\r\n");
      out.write("	    height: auto;\r\n");
      out.write("	    border-radius: 5px;\r\n");
      out.write("	    margin-bottom: 10px;\r\n");
      out.write("	    margin-right:15px;\r\n");
      out.write("	    transition: opacity 0.3s ease;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 图片悬停效果 */\r\n");
      out.write("	.item_details img:hover {\r\n");
      out.write("	    opacity: 0.9;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 商品标题样式 */\r\n");
      out.write("	.item_details p {\r\n");
      out.write("	    font-size: 14px;\r\n");
      out.write("	    margin: 10px 0;\r\n");
      out.write("	    color: #333;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 商品标题链接样式 */\r\n");
      out.write("	.item_details p a {\r\n");
      out.write("	    color: #555;\r\n");
      out.write("	    text-decoration: none;\r\n");
      out.write("	    transition: color 0.3s ease;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	/* 商品价格样式 */\r\n");
      out.write("	.shop_s {\r\n");
      out.write("	    font-size: 16px;\r\n");
      out.write("	    font-weight: bold;\r\n");
      out.write("	    color: #E74C3C;\r\n");
      out.write("	}\r\n");
      out.write("	/* 保证不同行左对齐 */\r\n");
      out.write("	.item_details:nth-child(1n) {\r\n");
      out.write("	    margin-left: 0; /* 确保每行起始元素没有偏移 */\r\n");
      out.write("	}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\r\n");
      out.write("	<div style=\"clear: both\"></div>\r\n");
      out.write("	<div class=\"block box\">\r\n");
      out.write("		<div class=\"blank\"></div>\r\n");
      out.write("		<div id=\"ur_here\">\r\n");
      out.write("			<a href=\"index.jsp\">首页</a>\r\n");
      out.write("			<code> &gt; </code>\r\n");
      out.write("			商品列表\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("	<div class=\"blank\"></div>\r\n");
      out.write("	<div class=\"block clearfix\">\r\n");
      out.write("		<div class=\"AreaL\">\r\n");
      out.write("			<div id=\"category_item\" class=\"category_item\">\r\n");
      out.write("				<h1 style=\"background-color: #EDCDEE;\">所有商品分类</h1>\r\n");
      out.write("				<dl class=\"clearfix\">\r\n");
      out.write("					<div class=\"cate\" id=\"cate\">\r\n");
      out.write("						");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("					<div style=\"clear: both\"></div>\r\n");
      out.write("				</dl>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"blank\"></div>\r\n");
      out.write("			\r\n");
      out.write("			<div class=\"blank5\"></div>\r\n");
      out.write("		</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<div class=\"AreaR\">\r\n");
      out.write("			<div class=\"box_list\">\r\n");
      out.write("				<div class=\"box_list_1\">\r\n");
      out.write("					<h3>\r\n");
      out.write("						<span>商品列表</span>\r\n");
      out.write("					</h3>\r\n");
      out.write("					<div class=\"list_details\">\r\n");
      out.write("						");
      if (_jspx_meth_c_005fforEach_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"blank5\"></div>\r\n");
      out.write("			<table width=\"100%\" border=\"0\" cellpadding=\"5\" cellspacing=\"1\" bgcolor=\"#dddddd\">\r\n");
      out.write("				<tr>\r\n");
      out.write("					<!-- PageHelper中将分页的结果存储到html并设置为请求对象，供JSP调用 -->\r\n");
      out.write("					<td align=\"center\" bgcolor=\"#ffffff\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${html}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</table>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    boolean _jspx_th_c_005fforEach_005f0_reused = false;
    try {
      _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f0.setParent(null);
      // /users/list.jsp(173,6) name = items type = java.lang.Object reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cateList}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      // /users/list.jsp(173,6) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVar("cate");
      int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
        if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("							<h1>\r\n");
            out.write("								<a href=\"index/cate.action?id=");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cate.cateid }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write('"');
            out.write('>');
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cate.catename }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</a>\r\n");
            out.write("							</h1>\r\n");
            out.write("						");
            int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fforEach_005f0.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
      _jspx_th_c_005fforEach_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fforEach_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fforEach_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fforEach_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    boolean _jspx_th_c_005fforEach_005f1_reused = false;
    try {
      _jspx_th_c_005fforEach_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f1.setParent(null);
      // /users/list.jsp(195,6) name = items type = java.lang.Object reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f1.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goodsList}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      // /users/list.jsp(195,6) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f1.setVar("goods");
      int[] _jspx_push_body_count_c_005fforEach_005f1 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f1 = _jspx_th_c_005fforEach_005f1.doStartTag();
        if (_jspx_eval_c_005fforEach_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("							<div class=\"item_details\">\r\n");
            out.write("								<a href=\"index/detail.action?id=");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goods.goodsid }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\"><img src=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goods.image }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\" alt=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goods.goodsname }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\" class=\"goodsimg\" /></a><br />\r\n");
            out.write("								<p>\r\n");
            out.write("									<a href=\"index/detail.action?id=");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goods.goodsid }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\" title=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goods.goodsname }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write('"');
            out.write('>');
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goods.goodsname }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</a>\r\n");
            out.write("								</p>\r\n");
            out.write("								价格：<font class=\"shop_s\">￥");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${goods.price }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("元</font><br />\r\n");
            out.write("							</div>\r\n");
            out.write("						");
            int evalDoAfterBody = _jspx_th_c_005fforEach_005f1.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fforEach_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fforEach_005f1[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fforEach_005f1.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fforEach_005f1.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f1);
      _jspx_th_c_005fforEach_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fforEach_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fforEach_005f1_reused);
    }
    return false;
  }
}
