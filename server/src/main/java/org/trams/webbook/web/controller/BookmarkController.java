/*
 * Created on 22 Dec 2015 ( Time 09:23:11 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.web.controller;

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
import org.trams.webbook.web.common.Login;
import org.trams.webbook.web.common.Message;
import org.trams.webbook.web.common.MessageType;
import org.trams.webbook.bean.jpa.BookmarkEntity;

//--- Entities
import org.trams.webbook.bean.Bookmark;
import org.trams.webbook.bean.User;
//--- Services 
import org.trams.webbook.business.service.BookmarkService;


/**
 * Spring MVC controller for 'Bookmark' management.
 */
@Controller
@RequestMapping("/book_mark")
public class BookmarkController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "bookmark";
	private static final String MAIN_LIST_NAME = "list";

	private static final String TOTAL_PAGE   = "pages";

	private static final String CURRENT_PAGE   = "pageNumber";

	private static final String LIST_PAGES   = "listPages";

	private static final Integer PAGE_SIZE   = 15;

	private static String nav = "bookmark";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_CREATE   = "bookmark/create";
	private static final String JSP_LIST   = "bookmark/list";
	private static final String JSP_PAGING   = "bookmark";
	private static final String JSP_EDIT   = "bookmark/edit";
	private static final String JSP_DETAIL   = "bookmark/detail";
	private static final String JSP_LOGIN   = "redirect:/login";

	//--- Main entity service
	@Resource
    private BookmarkService bookmarkService; // Injected by Spring
	//--- Other service(s)

	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public BookmarkController() {
		super(BookmarkController.class, MAIN_ENTITY_NAME );
		log("BookmarkController created.");
	}
	//Decription:Get bookmark list
	//Url: 		http://kwebsosul.com/my_book/book_mark
	@RequestMapping("/list")
	public String list(
			@RequestParam(value="page",defaultValue="1") Integer page,
			@RequestParam(value="type",defaultValue="id") String type,
			@RequestParam(value="key",defaultValue="") String key,
			HttpSession session,
			Model model) {
		if(Login.checkLogin(session)=="0")
			return JSP_LOGIN;
		Page<BookmarkEntity> listPage = null;
		listPage=bookmarkService.findAll(page);
		model.addAttribute(MAIN_LIST_NAME, listPage);	
		model.addAttribute("key", key);
		model.addAttribute("type", type);
		model.addAttribute("activePage", nav);
		model.addAttribute("pagination_navigator", "/bookmark/list");
		new Pager<BookmarkEntity>(listPage).setSetting(model, "type="+type+"&amp;key="+key+"&amp;");		
		return JSP_LIST;
	}

	
	@RequestMapping("/detail/{id}")
	public String detail(
	Model model, 
	HttpSession session,
	@PathVariable("id") Integer id) {
		if(Login.checkLogin(session)=="0")
			return JSP_LOGIN;
		Bookmark bookmark = bookmarkService.findById(id);
		model.addAttribute("bookmark", bookmark);
		return JSP_DETAIL;
	}
	
	@RequestMapping(value = "/edit/{id}")
	public String update(
	@RequestParam(value="edit",defaultValue="0") Integer edit,
	HttpSession session,
	@PathVariable("id") Integer id,
	Model model  ) {
	if(Login.checkLogin(session)=="0")
			return JSP_LOGIN;
Bookmark bookmark = bookmarkService.findById(id);
		try {
			if(edit>0){
				bookmark = bookmarkService.update(bookmark);
				bookmark.setUpdateDate(new Date());
				
			}
			model.addAttribute("item", bookmark);
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
		if(Login.checkLogin(session)=="0")
			return JSP_LOGIN;
		try {
			if(create>0){
			Bookmark bookmark = new Bookmark();
			
			bookmark.setUpdateDate(new Date());
			bookmark.setCreateDate(new Date());
			bookmarkService.update(bookmark);
			}
			return JSP_LIST;
		} catch(Exception e) {
			
			return JSP_CREATE;
		}
	}

	@RequestMapping(value = "/delete/{id}")
	public String delete(
	Model model, 
	HttpSession session,
	@PathVariable("id") Integer id ) {
	if(Login.checkLogin(session)=="0")
			return JSP_LOGIN;
		bookmarkService.delete(id);
		return JSP_LIST;
	}
	
}
