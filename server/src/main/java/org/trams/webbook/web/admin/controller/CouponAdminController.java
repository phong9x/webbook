/*
 * Created on 22 Dec 2015 ( Time 09:23:11 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.web.admin.controller;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//--- Common classes
import org.trams.webbook.web.common.AbstractController;
import org.trams.webbook.web.common.ApplicationDefine;
import org.trams.webbook.web.common.FileUtils;
import org.trams.webbook.web.common.Pager;
import org.trams.webbook.web.common.Utils;
import org.trams.webbook.web.common.Login;
import org.trams.webbook.bean.jpa.CouponPurchaseEntity;
import org.trams.webbook.bean.jpa.CouponUsedEntity;
//--- Entities
import org.trams.webbook.bean.CouponPurchase;
import org.trams.webbook.bean.CouponUsed;
import org.trams.webbook.bean.User;
//--- Services 
import org.trams.webbook.business.service.CouponPurchaseService;
import org.trams.webbook.business.service.CouponUsedService;
import org.trams.webbook.business.service.UserService;


/**
 * Spring MVC controller for 'CouponPurchase' management.
 */
@Controller
@RequestMapping("/admin")
public class CouponAdminController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "couponPurchase";
	private static final String MAIN_LIST_NAME = "list";

	private static final String TOTAL_PAGE   = "pages";

	private static final String CURRENT_PAGE   = "pageNumber";

	private static final String LIST_PAGES   = "listPages";

	private static final Integer PAGE_SIZE   = 10;

	private static String nav = "coupon";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_COUPON   = "admin/coupon";
	private static final String JSP_COUPON_USE   = "admin/coupon_use";
	private static final String JSP_COUPON_USE_DETAIL   = "admin/coupon_use/detail";
	private static final String JSP_PAYMENT   = "admin/coupon/payment_detail";
	private static final String JSP_LOGIN   = "redirect:/admin/login";

	//--- Main entity service
	@Resource
    private CouponPurchaseService couponPurchaseService; // Injected by Spring
	//--- Other service(s)
	@Resource
    private CouponUsedService couponUsedService; // Injected by Spring
	@Resource
    private UserService userService; // Injected by Spring
	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public CouponAdminController() {
		super(CouponAdminController.class, MAIN_ENTITY_NAME );	
		log("CouponPurchaseAdminController created.");
	}
	//Decription: Show all coupon
	//Url: http://kwebsosul.com/admin/coupon
	@RequestMapping("/coupon")
	public String list(
			@RequestParam(value="page",defaultValue="1") Integer page,
			@RequestParam(value="type",defaultValue="0") Integer type,
			@RequestParam(value="filter",defaultValue="0") Integer filter,
			@RequestParam(value="search",defaultValue="0") Integer search,
			@RequestParam(value="key",defaultValue=" ") String key,
			@RequestParam(value="from",defaultValue="") String from,
			@RequestParam(value="to",defaultValue="") String to,
			@RequestParam(value="lookup",defaultValue="0") Integer lookup,
			@RequestParam(value="confirm",defaultValue="0") Integer confirm,
			@RequestParam(value="deny",defaultValue="0") Integer deny,
			HttpSession session,
			Model model) {
		if(Login.checkAdminLogin(session)=="0")
			return JSP_LOGIN;
		if(confirm>0){
			CouponPurchase c=couponPurchaseService.findById(confirm);
			if(c.getPaymentMethodId()==ApplicationDefine.PAYMENT_METHOD_BANK_TRANFER_ID){
				c.setStatus(1);
				couponPurchaseService.update(c);
				User u =userService.findById(c.getUserId());
				u.setTotalCoupon(u.getTotalCoupon()+c.getChargeAmount());
				userService.update(u);
			}
		}
		if(deny>0){
			CouponPurchase c=couponPurchaseService.findById(deny);
			if(c.getPaymentMethodId()==ApplicationDefine.PAYMENT_METHOD_BANK_TRANFER_ID){
				c.setStatus(-1);
				couponPurchaseService.update(c);
			}
		}
		Page<CouponPurchaseEntity> listPage = null;
		String id = "";
		String name = "";
		if (key==null) {
			key="";
		}
		
		if(key!=null){
			if(type == 0){
				id=key;
			}else{
				name = key;
			}
		}
		if(from!=null && to!=null){
			Date fromday = Utils.convertStringtoUtilDate(from, "yyyy/MM/dd");
			Date today = Utils.convertStringtoUtilDate(to, "yyyy/MM/dd");
			model.addAttribute("totalAmout", couponPurchaseService.totalChargeAmount(fromday, today));
			model.addAttribute("countUser", couponPurchaseService.totalCountUserID(fromday, today));
			model.addAttribute("totalAmount3000", couponPurchaseService.totalCount3000(fromday, today));
			model.addAttribute("totalAmount5000", couponPurchaseService.totalCount5000(fromday, today));
			model.addAttribute("totalAmount10000", couponPurchaseService.totalCount10000(fromday, today));
			model.addAttribute("totalAmount30000", couponPurchaseService.totalCount30000(fromday, today));
			model.addAttribute("totalAmount50000", couponPurchaseService.totalCount50000(fromday, today));
			listPage = couponPurchaseService.listPagingSearch_ByTime("%"+id+"%", "%"+name+"%", fromday, today, page, PAGE_SIZE);
		}else{
			model.addAttribute("totalAmout", "");
			model.addAttribute("countUser", "");
			model.addAttribute("totalAmout", couponPurchaseService.totalChargeAmount());
			model.addAttribute("countUser", couponPurchaseService.totalCountUserID());
			model.addAttribute("totalAmount3000", couponPurchaseService.totalCount3000());
			model.addAttribute("totalAmount5000", couponPurchaseService.totalCount5000());
			model.addAttribute("totalAmount10000", couponPurchaseService.totalCount10000());
			model.addAttribute("totalAmount30000", couponPurchaseService.totalCount30000());
			model.addAttribute("totalAmount50000", couponPurchaseService.totalCount50000());
			listPage = couponPurchaseService.listPagingSearch("%"+id+"%", "%"+name+"%", page, PAGE_SIZE);
		}
		model.addAttribute(MAIN_LIST_NAME, listPage);	
		model.addAttribute("key", key);
		model.addAttribute("type", type);
		if (from==null) {
			from="";
		}
		if (to==null) {
			to="";
		}
		model.addAttribute("from", from);
		model.addAttribute("to", to);
		model.addAttribute("activePage", nav);
		model.addAttribute("pagination_navigator", "/admin/coupon");
		new Pager<CouponPurchaseEntity>(listPage).setSetting(model, "type="+type+"&amp;key="+key+"&amp;");		
		return JSP_COUPON;
	}
	
	
	
	
	
	
	
	
	
	//Decription: Payment detail in coupon page
	//Url: http://kwebsosul.com/admin/coupon/payment_detail/{id}
	@RequestMapping("/coupon/payment_detail/{id}")
	public String payment(
		Model model,
		HttpSession session, 
		@RequestParam(value="cancel_code", defaultValue="") String cancel_code,
		@RequestParam(value="reason", defaultValue="") String reason,
		@RequestParam(value="cancel", defaultValue="0") Integer cancel,
		@PathVariable("id") Integer id) throws Exception {
			if(Login.checkAdminLogin(session)=="0")
				return JSP_LOGIN;
			CouponPurchaseEntity couponPurchase = couponPurchaseService.findOne(id);
			model.addAttribute("couponPurchase", couponPurchase);
			model.addAttribute("cancel_list", couponPurchaseService.findByGroupId(13));
			if(cancel_code == null){
				cancel_code="";
			}
			if(cancel > 0){
				CouponPurchase c = couponPurchaseService.findById(id);
				if(c.getTid()!=null && c.getTid()!=""){
					try {
						
						String t_id=couponPurchase.getTid();
						//String t_id="oss222_2016-4-1.141442151";
						String[] split= t_id.split("_");
						String strEncryptionKey_Text="09858054724197305900369370378726";
						String strInitVector_Tex="7375228737627877";
						String strInputData=split[0]+"@F@"+t_id+"@"+couponPurchase.getTotalFee()+"@"+"NO";
						String base64=FileUtils.encryptBase64(strEncryptionKey_Text, strInitVector_Tex, strInputData);
						String cancel_url="https://service.paygate.net/cancellationRequestReceiveE.jsp?"
								+ "strMid_Text=oss222"
								+ "&strInputEncryptedData_Text="+base64
								+ "&btEnter=Process";
						System.out.println(">>>>>>>>tid:"+couponPurchase.getTid());
						System.out.println(">>>>>>>>mid:"+split[0]);
						System.out.println(">>>>>>>>url:"+cancel_url);
						URL url = new URL(cancel_url);
						URLConnection con = url.openConnection();
						InputStream in = con.getInputStream();
						String encoding = con.getContentEncoding();
						encoding = encoding == null ? "UTF-8" : encoding;
						String body = IOUtils.toString(in, encoding).trim();
						System.out.println("*********Result: "+body);
						if(body.equalsIgnoreCase("SUCCESS")){
							System.out.println("CANCEL TRANSACTION SUCCESS!!!!!!!!");
							c.setCancelReason(reason);
							c.setCancelCode(cancel_code
							);
							c.setStatus(-1);
							CouponPurchase update = couponPurchaseService.update(c);
							if(update!=null && c.getPaymentMethodId()!= ApplicationDefine.PAYMENT_METHOD_BANK_TRANFER_ID){
								User u = userService.findById(c.getUserId());
								u.setTotalCoupon(u.getTotalCoupon()-c.getChargeAmount());
								userService.update(u);
							}
						}else{
							System.out.println("CANCEL TRANSACTION FAIL!!!!!!!!");
						}

						return "redirect:/admin/coupon";
					} catch (Exception e) {
						System.out.println("Error cancel transection in paygate: "+e);
					}
				}
				
			}
			model.addAttribute("activePage", nav);
		return JSP_PAYMENT;
	}
	
	

	//Decription: Show list coupon use
	//Url: http://kwebsosul.com/admin/coupon_use
	@RequestMapping("/coupon_use")
	public String list(
			@RequestParam(value="page",defaultValue="1") Integer page,
			@RequestParam(value="type",defaultValue="0") Integer type,
			@RequestParam(value="key",defaultValue="") String key,
			@RequestParam(value="from",defaultValue="") String from,
			@RequestParam(value="to",defaultValue="") String to,
			@RequestParam(value="filter",defaultValue="0") Integer filter,
			@RequestParam(value="search",defaultValue="0") Integer search,
			@RequestParam(value="lookup",defaultValue="0") Integer lookup,
			HttpSession session,
			Model model) {
		if(Login.checkAdminLogin(session)=="0")
			return JSP_LOGIN;
		Page<CouponUsedEntity> listPage = null;
		String id = "";
		String name = "";
		if(key!=null){
			if(type == 0){
				id=key;
			}if(type == 1){
				name = key;
			}
		}if(key == null || key == ""){
			key = "";
		}
		if(search > 0 || filter >0){
			listPage = couponUsedService.listPagingSearch("%"+id+"%", "%"+name+"%", page, PAGE_SIZE);
		}else{
			listPage = couponUsedService.listPaging(page, PAGE_SIZE);
		}
		if(lookup > 0 && from != null && to != null){
			Date fromday = Utils.convertStringtoUtilDate(from, "yyyy/MM/dd");
			Date today = Utils.convertStringtoUtilDate(to, "yyyy/MM/dd");
			model.addAttribute("totalAmount", couponUsedService.totalCouponChargingAmount(fromday, today));
			model.addAttribute("totalUsed", couponUsedService.totalCouponUser(fromday, today));
		}else{
			model.addAttribute("totalAmount", "");
			model.addAttribute("totalUsed", "");
		}
		
		model.addAttribute(MAIN_LIST_NAME, listPage);	
		model.addAttribute("key", key);
		model.addAttribute("type", type);
		model.addAttribute("activePage", nav);
		model.addAttribute("pagination_navigator", "/admin/coupon_use");
		new Pager<CouponUsedEntity>(listPage).setSetting(model, "type="+type+"&amp;key="+key+"&amp;");		
		return JSP_COUPON_USE;
	}

	//Decription: Show detail coupon use
	//Url: http://kwebsosul.com/admin/coupon_use/detail/{id}
	@RequestMapping("/coupon_use/detail/{id}")
	public String detail(
	Model model,
	@RequestParam(value="delete_bill",defaultValue="0") Integer delete_bill,
	HttpSession session, 
	@PathVariable("id") Integer id) {
		if(Login.checkAdminLogin(session)=="0")
			return JSP_LOGIN;
		if(delete_bill > 0){
			CouponUsed c = couponUsedService.findById(delete_bill);
			c.setIsDelete(1);
			couponUsedService.update(c);
			return "redirect:/admin/coupon_use";
		}
		
		model.addAttribute("activePage", nav);
		CouponUsedEntity couponUsedEntity = couponUsedService.findOne(id);
		model.addAttribute("couponUsed", couponUsedEntity);
		return JSP_COUPON_USE_DETAIL;
	}

}
