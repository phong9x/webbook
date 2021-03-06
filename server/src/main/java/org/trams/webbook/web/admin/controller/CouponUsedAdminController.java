/*
 * Created on 22 Dec 2015 ( Time 09:23:11 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.web.admin.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;

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

//--- Entities
import org.trams.webbook.bean.CouponUsed;

//--- Services 
import org.trams.webbook.business.service.CouponUsedService;


/**
 * Spring MVC controller for 'CouponUsed' management.
 */
@Controller
@RequestMapping("/admin/couponUsed")
public class CouponUsedAdminController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "couponUsed";
	private static final String MAIN_LIST_NAME = "list";

	private static final String TOTAL_PAGE   = "pages";

	private static final String CURRENT_PAGE   = "pageNumber";

	private static final String LIST_PAGES   = "listPages";

	private static final Integer PAGE_SIZE   = 10;

	private static String nav = "couponUsed";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_CREATE   = "admin/couponUsed/create";
	private static final String JSP_LIST   = "admin/couponUsed/list";
	private static final String JSP_PAGING   = "admin/couponUsed";
	private static final String JSP_EDIT   = "admin/couponUsed/edit";
	private static final String JSP_DETAIL   = "admin/couponUsed/detail";
	private static final String JSP_LOGIN   = "redirect:/admin/login";

	//--- Main entity service
	@Resource
    private CouponUsedService couponUsedService; // Injected by Spring
	//--- Other service(s)

	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public CouponUsedAdminController() {
		super(CouponUsedAdminController.class, MAIN_ENTITY_NAME );
		log("CouponUsedAdminController created.");
	}

	
	
	@RequestMapping(value = "/edit/{id}")
	public String update(
	@RequestParam(value="edit",defaultValue="0") Integer edit,
	HttpSession session,
	@PathVariable("id") Integer id,
	Model model  ) {
	if(Login.checkAdminLogin(session)=="0")
			return JSP_LOGIN;
	CouponUsed couponUsed = couponUsedService.findById(id);
		try {
			if(edit>0){
				couponUsed = couponUsedService.update(couponUsed);
				couponUsed.setUpdateDate(new Date());
			}
			model.addAttribute("item", couponUsed);
			return JSP_EDIT;
		} catch(Exception e) {
			return JSP_LIST;
		}
	}
	
	@RequestMapping(value = "/create" ) // GET or POST
	public String create(
			@RequestParam(value="create",defaultValue="0") Integer create,
			HttpSession session,
			Model model) {
		log("Action 'create'");
		if(Login.checkAdminLogin(session)=="0")
			return JSP_LOGIN;
		try {
			if(create>0){
			CouponUsed couponUsed = new CouponUsed();
			
			couponUsed.setUpdateDate(new Date());
			couponUsed.setCreateDate(new Date());
			couponUsedService.create(couponUsed);
			}
			return JSP_LIST;
		} catch(Exception e) {
			
			return JSP_CREATE;
		}
	}

}
