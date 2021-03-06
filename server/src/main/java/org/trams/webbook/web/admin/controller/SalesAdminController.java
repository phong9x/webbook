/*
 * Created on 22 Dec 2015 ( Time 09:23:11 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.web.admin.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//--- Common classes
import org.trams.webbook.web.common.AbstractController;
import org.trams.webbook.web.common.FormMode;
import org.trams.webbook.web.common.Pager;
import org.trams.webbook.web.common.Utils;
import org.trams.webbook.web.common.Login;
import org.trams.webbook.web.common.Message;
import org.trams.webbook.web.common.MessageType;
import org.trams.webbook.bean.jpa.CouponUsedEntity;
import org.trams.webbook.bean.jpa.PostEntity;
import org.trams.webbook.bean.jpa.ProfitRefundEntity;
import org.trams.webbook.bean.CouponUsed;
import org.trams.webbook.bean.Post;
//--- Entities
import org.trams.webbook.bean.ProfitRefund;
import org.trams.webbook.bean.User;
import org.trams.webbook.business.service.CouponUsedService;
//--- Services 
import org.trams.webbook.business.service.ProfitRefundService;
import org.trams.webbook.business.service.UserService;


/**
 * Spring MVC controller for 'ProfitRefund' management.
 */
@Controller
@RequestMapping("/admin/sales")
public class SalesAdminController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "profitRefund";
	private static final String MAIN_LIST_NAME = "list";

	private static final String TOTAL_PAGE   = "pages";

	private static final String CURRENT_PAGE   = "pageNumber";

	private static final String LIST_PAGES   = "listPages";

	private static final Integer PAGE_SIZE   = 10;

	private static String nav = "sales";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_LIST   = "admin/sales/list";
	private static final String JSP_REFUND   = "admin/sales/profitRefund";
	private static final String JSP_REFUNDAPP   = "admin/sales/refund_application";
	private static final String JSP_DETAIL   = "admin/sales/profit_detail";
	private static final String JSP_LOGIN   = "redirect:/admin/login";

	//--- Main entity service
	@Resource
    private ProfitRefundService profitRefundService; // Injected by Spring
	@Resource
    private CouponUsedService couponUsedService; // Injected by Spring
	@Resource
    private UserService userService;
	//--- Other service(s)

	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public SalesAdminController() {
		super(SalesAdminController.class, MAIN_ENTITY_NAME );
		log("ProfitRefundAdminController created.");
	}
	//Decription: List all coupon purchase
	//Url: http://kwebsosul.com/admin/sales/list
	@RequestMapping("/list")
	public String list(
			@RequestParam(value="page",defaultValue="1") Integer page,
			@RequestParam(value="type",defaultValue="0") Integer type,
			@RequestParam(value="key",defaultValue="") String key,
			@RequestParam(value="year",defaultValue="0") Integer year,
			@RequestParam(value="month",defaultValue="0") Integer month,
			@RequestParam(value="search",defaultValue="0") Integer search,
			@RequestParam(value="total",defaultValue="0") Integer total,
			@RequestParam(value="filter",defaultValue="0") Integer filter, 
			HttpSession session,
			Model model) {
		if(Login.checkAdminLogin(session)=="0")
			return JSP_LOGIN;
		Page<CouponUsedEntity> listPage = null;
		String id = "";
		String name = "";
		String bookname = "";
		String episodename = "";
		if(key != null){
			if(type == 0){
				id = key;
			}if(type == 1){
				name = key;
			}if(type == 2){
				bookname = key;
			}if(type == 3){
				episodename = key;
			}
		}if(key == null || key == ""){
			key = "";
		}
		
		if(search > 0 || filter > 0){
			listPage = couponUsedService.listPagingSearchSales("%"+id+"%", "%"+name+"%", "%"+bookname+"%", "%"+episodename+"%", page, PAGE_SIZE);
		}else{
			listPage =  couponUsedService.listPaging(page, PAGE_SIZE);
		}
		int yearNow =0;
		int monthNow=0;
		try {
			Date date =new Date();
			Calendar calendar = new GregorianCalendar();
			calendar.setTime(date);
			 yearNow = calendar.get(Calendar.YEAR);
			 monthNow = calendar.get(Calendar.MONTH);
			if(year >0 && month >0){
				yearNow = year;
				monthNow = month;
			}
		} catch (Exception e) {
			System.out.println("Error in fuction"+e);
		}
		
		model.addAttribute("totalPrice",couponUsedService.totalPriceCoupon(yearNow, monthNow));
		model.addAttribute("year", yearNow);
		model.addAttribute("month", monthNow);
		model.addAttribute(MAIN_LIST_NAME, listPage);	
		model.addAttribute("key", key);
		model.addAttribute("type", type);
		model.addAttribute("activePage", nav);
		model.addAttribute("pagination_navigator", "/admin/sales/list/");
		new Pager<CouponUsedEntity>(listPage).setSetting(model, "type="+type+"&amp;key="+key+"&amp;");		
		return JSP_LIST;
	}

	//Decription: show profit detail with each book
	//Url: http://kwebsosul.com/admin/profit_detail/{id}
	@RequestMapping("/profit_detail/{id}")
	public String detail(
	Model model,
	HttpSession session, 
	@RequestParam(value="page1",defaultValue="1") Integer page1,
	@RequestParam(value="page2",defaultValue="1") Integer page2,
	@RequestParam(value="year",defaultValue="0") Integer year,
	@RequestParam(value="month",defaultValue="0") Integer month,
	@PathVariable("id") Integer id) {
		if(Login.checkAdminLogin(session)=="0")
			return JSP_LOGIN;
		ProfitRefundEntity profitRefund = profitRefundService.findOne(id);
		model.addAttribute("profitRefund", profitRefund);
		Page<CouponUsedEntity> listPage = null;
		Page<ProfitRefundEntity> listPage2 = null;
		Calendar c = Calendar.getInstance();
		int now_year = c.get(Calendar.YEAR);
		int now_month = c.get(Calendar.MONTH)+1;
		if(year==0 && month==0){
			year=now_year;
			month=now_month;
		}
		listPage = couponUsedService.listPagingBy_AuthorId_Month_Year(id, month, year, page1, PAGE_SIZE);
		listPage2 = profitRefundService.listPagingBy_UserId(id, page2, PAGE_SIZE);
		Integer totalCharge=couponUsedService.totalChargeAmountBy_UserId(id);
		Integer totalRefund=profitRefundService.totalRefundBy_UserId(id);
		model.addAttribute("total", totalCharge-totalRefund);
		model.addAttribute(MAIN_LIST_NAME, listPage);
		model.addAttribute("page1", page1);
		model.addAttribute("page2", page2);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("now_year", now_year);
		model.addAttribute("now_month", now_month);
		model.addAttribute("type", now_year);
		model.addAttribute("activePage", nav);
		model.addAttribute("pagination_navigator", "/admin/sales/profit_detail/"+id);
		new Pager<CouponUsedEntity>(listPage).setSetting(model, "");	
		new Pager<ProfitRefundEntity>(listPage2).setSettingSecondList(model, "");
		return JSP_DETAIL;
	}
	
	@RequestMapping("/profitRefund")
	public String profitRefund(
			@RequestParam(value="page",defaultValue="1") Integer page,
			@RequestParam(value="type",defaultValue="0") Integer type,
			@RequestParam(value="key",defaultValue="") String key,
			@RequestParam(value="search",defaultValue="0") Integer search,
			@RequestParam(value="filter",defaultValue="0") Integer filter,
			@RequestParam(value="year",defaultValue="0") Integer year,
			@RequestParam(value="month",defaultValue="0") Integer month,
			HttpSession session,
			Model model) {
		if(Login.checkAdminLogin(session)=="0")
			return JSP_LOGIN;
		Page<ProfitRefundEntity> listPage = null;
		String id="";
		String name="";
		if(key != null){
			if(type == 0){
				id = key;
			}if(type == 1){
				name = key;
			}
		}if(key == null || key == ""){
			key = "";
		}
		
		if(search > 0 || filter > 0){
			listPage = profitRefundService.listPagingProfitRefund("%"+id+"%", "%"+name+"%", year, month, page, PAGE_SIZE);	
		}else{
			listPage = profitRefundService.listPaging(page, PAGE_SIZE);
		}
		Calendar c = Calendar.getInstance();
		int now_year = c.get(Calendar.YEAR);
		int now_month = c.get(Calendar.MONTH)+1;
		if(year==0 && month==0){
			year=now_year;
			month=now_month;
		}
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("now_year", now_year);
		model.addAttribute("now_month", now_month);
		model.addAttribute(MAIN_LIST_NAME, listPage);	
		model.addAttribute("key", key);
		model.addAttribute("type", type);
		model.addAttribute("activePage", nav);
		model.addAttribute("pagination_navigator", "/admin/sales/profitRefund");
		new Pager<ProfitRefundEntity>(listPage).setSetting(model, "type="+type+"&amp;key="+key+"&amp;");		
		return JSP_REFUND;
	}
	@RequestMapping("/refund_application/{id}")
	public String refundApplication(
			@RequestParam(value="page",defaultValue="1") Integer page,
			@RequestParam(value="type",defaultValue="0") Integer type,
			@RequestParam(value="delete",defaultValue="0") Integer delete,
			@RequestParam(value="update",defaultValue="0") Integer update,
			@RequestParam(value="bank_name",defaultValue="") String bank_name,
			HttpSession session,@PathVariable("id") Integer id,
			Model model) {
		if(Login.checkAdminLogin(session)=="0")
			return JSP_LOGIN;
		ProfitRefund profitRefund = null;
		profitRefund = profitRefundService.findById(id);
		if(delete > 0){
			ProfitRefund p = profitRefundService.findById(id);
			p.setIsDelete(1);
			profitRefundService.update(p);
			return "redirect:/admin/sales/profitRefund";
		}
		if(update > 0){
			
			ProfitRefund p = profitRefundService.findById(id);
			User u = userService.findById(p.getUserId());
			Integer coupon=Utils.parseInt(u.getTotalCoupon()-p.getDepositAmount());
			u.setTotalCoupon(coupon);
			p.setDeposited(1);
			profitRefundService.update(p);
			return "redirect:/admin/sales/profitRefund";
		}
		Integer totalCharge=couponUsedService.totalChargeAmountBy_UserId(profitRefund.getUserId());
		Integer totalRefund=profitRefundService.totalRefundBy_UserId(profitRefund.getUserId());
		model.addAttribute("total", totalCharge-totalRefund);
		model.addAttribute("bankname", profitRefundService.findByGroupId(15));
		model.addAttribute("bank_name", bank_name);
		model.addAttribute("refund", profitRefund);
		model.addAttribute("activePage", nav);
		
		return JSP_REFUNDAPP;
	}
}
