package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Article;
import com.entity.Cart;
import com.entity.Cate;
import com.entity.Complains;
import com.entity.Details;
import com.entity.Goods;
import com.entity.Orders;
import com.entity.Topic;
import com.entity.Users;
import com.service.ArticleService;
import com.service.CartService;
import com.service.CateService;
import com.service.ComplainsService;
import com.service.DetailsService;
import com.service.GoodsService;
import com.service.OrdersService;
import com.service.TopicService;
import com.service.UsersService;
import com.util.MD5;
import com.util.PageHelper;
import com.util.VeDate;

//定义为控制器
@Controller
// 设置路径：mvc通过请求的url路径扫描Controller包
@RequestMapping("/index")
public class IndexController extends BaseController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CateService cateService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private DetailsService detailsService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private ComplainsService complainsService;

	// 公共方法 提供公共查询数据
	private void front() {
		this.getRequest().setAttribute("title", "运动用品在线商城系统");//设置网站的标题
		List<Cate> cateList = this.cateService.getAllCate();//cateList存储从数据库中查询到的所有商品分类数据。
		this.getRequest().setAttribute("cateList", cateList);//将cateList设置为请求属性，供jsp页面显示
		List<Goods> hotList = this.goodsService.getGoodsByHot();//hotList存储从数据库中查询到获取热门商品列表数据。
		this.getRequest().setAttribute("hotList", hotList);//将hotList设置为请求属性，供jsp页面显示
	}

	// 首页显示
	@RequestMapping("index.action")
	public String index() {
		this.front();
		List<Cate> cateList = this.cateService.getCateFront();//获取需要在前端展示的分类数据（这里数据库方法中设置了只展示三个分类商品）
		List<Cate> frontList = new ArrayList<Cate>();//存储最终的分类列表
		for (Cate cate : cateList) {
			List<Goods> goodsList = this.goodsService.getGoodsByCate(cate.getCateid());//获取需要在前端展示的商品数据（这里数据库方法中设置了只展示5个商品）
			cate.setGoodsList(goodsList);
			frontList.add(cate);//添加至最终的分类列表
		}
		this.getRequest().setAttribute("frontList", frontList);//将frontList设置为请求属性，供jsp页面显示
		return "users/index";//返回视图页面
	}

	// 公告
	@RequestMapping("article.action")
	public String article(String number) {
		this.front();
		List<Article> tempList = this.articleService.getAllArticle();
		PageHelper.getIndexPage(tempList, "article", "article", null, 10, number, this.getRequest());
		return "users/article";
	}

	// 阅读公告
	@RequestMapping("read.action")
	public String read(String id) {
		Article article = this.articleService.getArticleById(id);
		article.setHits("" + (Integer.parseInt(article.getHits()) + 1));//更新点击量（阅读量）
		this.articleService.updateArticle(article);
		this.getRequest().setAttribute("article", article);
		return "users/read";
	}

	// 准备登录
	@RequestMapping("preLogin.action")
	public String prelogin() {
		return "users/login";
	}

	// 用户登录
	@RequestMapping("login.action")
	public String login() {
		// 获取用户名和密码
		String username = this.getRequest().getParameter("username");
		String password = MD5.md5(this.getRequest().getParameter("password"));
		//创建user对象
		Users u = new Users();
		u.setUsername(username);
		//查询用户名是否存在
		List<Users> usersList = this.usersService.getUsersByCond(u);
		if (usersList.size() == 0) {
			this.getSession().setAttribute("message", "用户名不存在");
			return "redirect:/index/preLogin.action";
		} else {
			Users users = usersList.get(0);//获取用户名匹配的对象
			//判断用户名与密码是否一致
			if (password.equals(users.getPassword())) {
				this.getSession().setAttribute("userid", users.getUsersid());
				this.getSession().setAttribute("username", users.getUsername());
				this.getSession().setAttribute("users", users);
				return "redirect:/index/index.action";
			} else {
				this.getSession().setAttribute("message", "密码错误");
				return "redirect:/index/preLogin.action";
			}
		}
	}

	// 准备注册
	@RequestMapping("preReg.action")
	public String preReg() {
		return "users/register";
	}

	// 用户注册
	@RequestMapping("register.action")
	public String register(Users users) {
		Users u = new Users();
		u.setUsername(users.getUsername());
		List<Users> usersList = this.usersService.getUsersByCond(u);
		if (usersList.size() == 0) {
			String password = MD5.md5(this.getRequest().getParameter("password"));
			users.setPassword(password);
			users.setRegdate(VeDate.getStringDateShort());
			this.usersService.insertUsers(users);
		} else {
			this.getSession().setAttribute("message", "用户名已存在");
			return "redirect:/index/preReg.action";
		}

		return "redirect:/index/preLogin.action";
	}

	// 退出登录
	@RequestMapping("exit.action")
	public String exit() {
		this.getSession().removeAttribute("userid");
		this.getSession().removeAttribute("username");
		this.getSession().removeAttribute("users");
		return "redirect:/index/index.action";
	}

	// 准备修改密码
	@RequestMapping("prePwd.action")
	public String prePwd() {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		return "users/editpwd";
	}

	// 修改密码
	@RequestMapping("editpwd.action")
	public String editpwd() {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		String password = MD5.md5(this.getRequest().getParameter("password"));
		String repassword = MD5.md5(this.getRequest().getParameter("repassword"));
		Users users = this.usersService.getUsersById(userid);
		if (password.equals(users.getPassword())) {
			users.setPassword(repassword);
			this.usersService.updateUsers(users);
		} else {
			this.getSession().setAttribute("message", "旧密码错误");
			return "redirect:/index/prePwd.action";
		}
		this.getSession().setAttribute("message", "修改成功");
		return "redirect:/index/prePwd.action";
	}

	//用户中心
	@RequestMapping("usercenter.action")
	public String usercenter() {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		return "users/usercenter";
	}
	
	//用户信息
	@RequestMapping("userinfo.action")
	public String userinfo() {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		this.getSession().setAttribute("users", this.usersService.getUsersById(userid));
		return "users/userinfo";
	}

	@RequestMapping("personal.action")
	public String personal(Users users) {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.usersService.updateUsers(users);
		this.getSession().setAttribute("message", "修改成功");
		return "redirect:/index/userinfo.action";
	}

	// 添加商品到购物车
	@RequestMapping("addcart.action")
	public String addcart() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		//获取表达请求的数据
		Cart cart = new Cart();
		cart.setAddtime(VeDate.getStringDateShort());
		cart.setGoodsid(getRequest().getParameter("goodsid"));
		cart.setNum(getRequest().getParameter("num"));
		cart.setPrice(getRequest().getParameter("price"));
		cart.setUsersid(userid);
		//添加至数据库中
		this.cartService.insertCart(cart);
		return "redirect:/index/cart.action";
	}

	// 查看购物车
	@RequestMapping("cart.action")
	public String cart() {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		//按照用户id查找对应的购物车信息
		Cart cart = new Cart();
		cart.setUsersid(userid);
		List<Cart> cartList = this.cartService.getCartByCond(cart);
		this.getRequest().setAttribute("cartList", cartList);
		return "users/cart";
	}

	// 删除购物车中的商品:获取到前端传递的id
	@RequestMapping("deletecart.action")
	public String deletecart(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.cartService.deleteCart(id);
		return "redirect:/index/cart.action";
	}

	// 准备结算
	@RequestMapping("preCheckout.action")
	public String preCheckout() {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		//根据用户id查看该用户的购物车信息
		String userid = (String) this.getSession().getAttribute("userid");
		Cart cart = new Cart();
		cart.setUsersid(userid);
		List<Cart> cartList = this.cartService.getCartByCond(cart);
		if (cartList.size() == 0) {
			this.getRequest().setAttribute("message", "请选购商品");
			return "redirect:/index/cart.action";
		}
		return "users/checkout";
	}

	// 结算
	@RequestMapping("checkout.action")
	public String checkout() {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		//根据用户id查看该用户的购物车信息
		String userid = (String) this.getSession().getAttribute("userid");
		Cart cart1 = new Cart();
		cart1.setUsersid(userid);
		List<Cart> cartList = this.cartService.getCartByCond(cart1);
		//判断购物车信息是否为空
		if (cartList.size() == 0) {
			this.getRequest().setAttribute("message", "请选购商品");
			return "redirect:/index/cart.action";
		} else {
			// 获取一个1000-9999的随机数 防止同时提交
			String ordercode = "PD" + VeDate.getStringDatex();
			double total = 0;
			//遍历购物车
			for (Cart cart : cartList) {
	            //创建订单信息。
				Details details = new Details();
				details.setDetailsid(VeDate.getStringDatex() + (Math.random() * 9 + 1) * 1000);
				details.setGoodsid(cart.getGoodsid());
				details.setNum(cart.getNum());
				details.setOrdercode(ordercode);
				details.setPrice(cart.getPrice());
				this.detailsService.insertDetails(details);
				//更新销售量和库存
				Goods goods = this.goodsService.getGoodsById(cart.getGoodsid());
				goods.setSellnum("" + (Integer.parseInt(goods.getSellnum()) + Integer.parseInt(cart.getNum())));
				goods.setStorage("" + (Integer.parseInt(goods.getStorage()) - Integer.parseInt(cart.getNum())));
				this.goodsService.updateGoods(goods);
				//获取总价
				total += Double.parseDouble(cart.getPrice()) * Double.parseDouble(cart.getNum());
				//从购物车中删除该商品的信息
				this.cartService.deleteCart(cart.getCartid());
			}
			Orders orders = new Orders();
			orders.setAddress(getRequest().getParameter("address"));
			orders.setAddtime(VeDate.getStringDateShort());
			orders.setContact(getRequest().getParameter("contact"));
			orders.setOrdercode(ordercode);
			orders.setReceiver(getRequest().getParameter("receiver"));
			orders.setStatus("未付款");
			orders.setTotal("" + VeDate.getDouble(total));
			orders.setUsersid(userid);
			this.ordersService.insertOrders(orders);
		}
		return "redirect:/index/showOrders.action";
	}
	// 准备付款
	@RequestMapping("prePay.action")
	public String prePay(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.getRequest().setAttribute("id", id);
		Orders orders = this.ordersService.getOrdersById(id);
		this.getRequest().setAttribute("orders", orders);
		return "users/pay";
	}

	// 付款
	@RequestMapping("pay.action")
	public String pay(String id) {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		//更新订单信息为已付款
		Orders orders = this.ordersService.getOrdersById(this.getRequest().getParameter("id"));
		orders.setStatus("已付款");
		this.ordersService.updateOrders(orders);
		return "redirect:/index/showOrders.action";
	}

	// 确认收货
	@RequestMapping("over.action")
	public String over(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		Orders orders = this.ordersService.getOrdersById(this.getRequest().getParameter("id"));
		orders.setStatus("已收货");
		this.ordersService.updateOrders(orders);
		return "redirect:/index/showOrders.action";
	}

	// 取消订单
	@RequestMapping("cancel.action")
	public String cancel(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		Orders orders = this.ordersService.getOrdersById(this.getRequest().getParameter("id"));
		orders.setStatus("已取消");
		this.ordersService.updateOrders(orders);
		return "redirect:/index/showOrders.action";
	}
		
	// 查看我的订单
	@RequestMapping("showOrders.action")
	public String showOrders(String number) {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Orders orders = new Orders();
		orders.setUsersid(userid);
		List<Orders> tempList = this.ordersService.getOrdersByCond(orders);
		PageHelper.getIndexPage(tempList, "orders", "showOrders", null, 10, number, this.getRequest());
		return "users/orderlist";
	}

	//提交我的意见
	@RequestMapping("preComplains.action")
	public String preComplains() {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		return "users/addComplains";
	}
	
	//添加我的意见至数据库表中
	@RequestMapping("addComplains.action")
	public String addComplains(Complains complains) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		complains.setAddtime(VeDate.getStringDateShort());
		complains.setStatus("未回复");
		complains.setUsersid(userid);
		this.complainsService.insertComplains(complains);
		return "redirect:/index/preComplains.action";
	}

	//显示我提出的意见
	@RequestMapping("myComplains.action")
	public String myComplains(String number) {
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String userid = (String) this.getSession().getAttribute("userid");
		Complains complains = new Complains();
		complains.setUsersid(userid);
		List<Complains> complainsList = this.complainsService.getComplainsByCond(complains);
		PageHelper.getIndexPage(complainsList, "complains", "myComplains", null, 10, number, this.getRequest());
		return "users/myComplains";
	}
	
	

	// 订单明细
	@RequestMapping("orderdetail.action")
	public String orderdetail(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		Details details = new Details();
		details.setOrdercode(id);
		List<Details> detailsList = this.detailsService.getDetailsByCond(details);
		this.getRequest().setAttribute("detailsList", detailsList);
		return "users/orderdetail";
	}

	// 按分类查询
	@RequestMapping("cate.action")
	public String cate(String id, String number) {
		this.front();
		Goods goods = new Goods();
		goods.setCateid(id);
		List<Goods> tempList = this.goodsService.getGoodsByCond(goods);
		PageHelper.getIndexPage(tempList, "goods", "cate", id, 12, number, this.getRequest());
		return "users/list";
	}

	// 推荐商品
	@RequestMapping("recommend.action")
	public String recommend(String number) {
		this.front();
		Goods goods = new Goods();
		goods.setRecommend("是");
		List<Goods> tempList = this.goodsService.getGoodsByCond(goods);
		//调用分页工具类（分页的商品列表、数据列表名称、动作名称、ID、每页列数、当前页码、获取当前请求对象）
		PageHelper.getIndexPage(tempList, "goods", "recommend", null, 12, number, this.getRequest());
		return "users/list";
	}

	// 特价商品
	@RequestMapping("special.action")
	public String special(String number) {
		this.front();
		Goods goods = new Goods();
		goods.setSpecial("是");
		List<Goods> tempList = this.goodsService.getGoodsByCond(goods);
		PageHelper.getIndexPage(tempList, "goods", "special", null, 12, number, this.getRequest());
		return "users/list";
	}

	// 全部商品
	@RequestMapping("all.action")
	public String all(String number) {
		this.front();
		List<Goods> tempList = this.goodsService.getAllGoods();
		PageHelper.getIndexPage(tempList, "goods", "all", null, 12, number, this.getRequest());
		return "users/list";
	}

	// 查询商品
	@RequestMapping("query.action")
	public String query(String name) {
		this.front();
		Goods goods = new Goods();
		goods.setGoodsname(name);
		List<Goods> goodsList = this.goodsService.getGoodsByLike(goods);
		this.getRequest().setAttribute("goodsList", goodsList);
		return "users/list";
	}

	// 商品详情
	@RequestMapping("detail.action")
	public String detail(String id) {
		this.front();
		Goods goods = this.goodsService.getGoodsById(id);
		//更新商品的浏览量
		goods.setHits("" + (Integer.parseInt(goods.getHits()) + 1));
		this.goodsService.updateGoods(goods);
		this.getRequest().setAttribute("goods", goods);
		//显示用户对于此商品的评论
		Topic topic = new Topic();
		topic.setGoodsid(id);
		List<Topic> topicList = this.topicService.getTopicByCond(topic);
		this.getRequest().setAttribute("topicList", topicList);
		this.getRequest().setAttribute("tnum", topicList.size());
		return "users/detail";
	}

	// 准备评价
	@RequestMapping("preTopic.action")
	public String preTopic(String id) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		this.getRequest().setAttribute("id", id);
		Orders orders = this.ordersService.getOrdersById(id);
		Details items = new Details();
		items.setOrdercode(orders.getOrdercode());
		List<Details> itemsList = this.detailsService.getDetailsByCond(items);
		this.getRequest().setAttribute("itemsList", itemsList);
		return "users/addTopic";
	}

	// 添加评价
	@RequestMapping("addTopic.action")
	public String addTopic(Topic topic) {
		this.front();
		if (this.getSession().getAttribute("userid") == null) {
			return "redirect:/index/preLogin.action";
		}
		String ordersid = this.getRequest().getParameter("id");
		Orders orders = this.ordersService.getOrdersById(ordersid);
		orders.setStatus("已评价");
		this.ordersService.updateOrders(orders);
		String userid = (String) this.getSession().getAttribute("userid");
		Details items = new Details();
		items.setOrdercode(orders.getOrdercode());
		List<Details> itemsList = this.detailsService.getDetailsByCond(items);
		for (int i = 0; i < itemsList.size(); i++) {
			Details x = itemsList.get(i);
			topic.setAddtime(VeDate.getStringDateShort());
			topic.setGoodsid(x.getGoodsid());
			topic.setNum(this.getRequest().getParameter("tnum_" + i));
			topic.setContents(this.getRequest().getParameter("contents_" + i));
			topic.setOrdersid(ordersid);
			topic.setUsersid(userid);
			topic.setTopicid(UUID.randomUUID().toString().replace("-", ""));
			this.topicService.insertTopic(topic);
		}
		return "redirect:/index/showOrders.action";
	}
}
