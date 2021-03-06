/*
 * Created on 22 Dec 2015 ( Time 09:23:11 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.web.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
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
import org.trams.webbook.bean.jpa.AnnouncementEntity;
import org.trams.webbook.bean.jpa.BookEntity;
import org.trams.webbook.bean.jpa.BookmarkEntity;
import org.trams.webbook.bean.jpa.CouponUsedEntity;
import org.trams.webbook.bean.jpa.EpisodeEntity;
import org.trams.webbook.bean.Announcement;
//--- Entities
import org.trams.webbook.bean.Book;
import org.trams.webbook.bean.BookViewing;
import org.trams.webbook.bean.CouponUsed;
import org.trams.webbook.bean.Episode;
import org.trams.webbook.bean.User;
import org.trams.webbook.business.service.AnnouncementService;
//--- Services 
import org.trams.webbook.business.service.BookService;
import org.trams.webbook.business.service.BookViewingService;
import org.trams.webbook.business.service.CategoryService;
import org.trams.webbook.business.service.CouponPurchaseService;
import org.trams.webbook.business.service.CouponUsedService;
import org.trams.webbook.business.service.EpisodeService;
import org.trams.webbook.business.service.UserService;
import org.trams.webbook.business.service.mapping.BookServiceMapper;


/**
 * Spring MVC controller for 'Book' management.
 */
@Controller
@RequestMapping("/book")
public class BookController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "book";
	private static final String MAIN_LIST_NAME = "list";

	private static final String TOTAL_PAGE   = "pages";

	private static final String CURRENT_PAGE   = "pageNumber";

	private static final String LIST_PAGES   = "listPages";

	private static final Integer PAGE_SIZE   = 10;

	private static String nav = "book";

	//--- JSP pages names ( View name in the MVC model )
	private static final String JSP_CREATE   = "book/create";
	private static final String JSP_LIST   = "book/list";
	private static final String JSP_PAGING   = "book";
	private static final String JSP_EDIT   = "book/edit";
	private static final String JSP_BOOK_DETAIL   = "book/detail";
	private static final String JSP_LOGIN   = "redirect:/login";

	//--- Main entity service
	@Resource
	 private EpisodeService episodeService; 
	@Resource
    private BookService bookService; 
	@Resource
	private CategoryService categoryService;
	@Resource
	private AnnouncementService announcementService;
	@Resource
	private UserService userService;
	@Resource
	private CouponPurchaseService couponPurchaseService;
	@Resource
	private CouponUsedService couponUsedService;
	@Resource
	private BookViewingService bookViewingService;
	@Resource
	private BookServiceMapper bookServiceMapper;
	//--- Other service(s)

	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public BookController() {
		super(BookController.class, MAIN_ENTITY_NAME );
		log("BookController created.");
	}

	
	@RequestMapping("/list")
	public String list(
			@RequestParam(value="page",defaultValue="1") Integer page,
			@RequestParam(value="type",defaultValue="id") String type,
			@RequestParam(value="key",defaultValue="") String key,
			HttpSession session,
			Model model) {

		Page<BookEntity> listPage = null;
		listPage=bookService.findAll(page);
		model.addAttribute(MAIN_LIST_NAME, listPage);	
		model.addAttribute("key", key);
		model.addAttribute("type", type);
		model.addAttribute("activePage", nav);
		model.addAttribute("pagination_navigator", "/book/list");
		new Pager<BookEntity>(listPage).setSetting(model, "type="+type+"&amp;key="+key+"&amp;");		
		return JSP_LIST;
	}

	//Decription:Get detail book by id
	//Url: 		 http://kwebsosul.com/book/detail/148
	@RequestMapping("/detail/{id}")
	public String detail(
	@RequestParam(value="page1",defaultValue="1") Integer page_episode,
	@RequestParam(value="page2",defaultValue="1") Integer page_announcement,
	@RequestParam(value="page3",defaultValue="1") Integer page_temporary,
	@RequestParam(value="order",defaultValue="asc") String order,
	@RequestParam(value="category",defaultValue="") String category,
	@RequestParam(value="active",defaultValue="episode") String active,
	@RequestParam(value="pay",defaultValue="0") Integer pay,
	@RequestParam(value="not_enough",defaultValue="0") Integer not_enough,
	@RequestParam(value="price",defaultValue="0") Integer price,
	Model model, 
	HttpSession session,
	@PathVariable("id") Integer id) {
		
		if(category!=null){
			model.addAttribute("category",category );
		}
		User user=new User();
		try {
			user=Login.getUserLogin(session);
		} catch (Exception e) {
			user=null;
		}
		
		BookEntity book = bookService.findOne(id);
		try {
			if(user!=null){
			BookViewing bv=new BookViewing();
			bv.setBookId(id);
			bv.setCreateDate(new Date());
			bv.setUpdateDate(new Date());
			bv.setUserId(user.getId());
			bookViewingService.create(bv);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(pay>0){
			if(Login.checkLogin(session)=="0")
				return JSP_LOGIN;
			CouponUsedEntity couponUsed = couponUsedService.findBy_UserId_EpisodeId(user.getId(), pay);
			if(couponUsed==null){
			try {
				user.setTotalCoupon(user.getTotalCoupon()-1);
				User u=userService.update(user);
				CouponUsed c=new CouponUsed();
				c.setBookId(id);
				c.setChargeAmount(price);
				c.setEpisodeId(pay);
				c.setIsDelete(0);
				c.setUserId(user.getId());
				c.setUpdateDate(new Date());
				c.setCreateDate(new Date());
				couponUsedService.create(c);
				Login.save(u, session);
				model.addAttribute("pay_success",1);
				model.addAttribute("pay_price",price);
				model.addAttribute("pay_episode",pay);
				model.addAttribute("total_coupon",u.getTotalCoupon());
			
			} catch (Exception e) {
				// TODO: handle exception
			}
			}else{
				return "redirect:/episode/detail/"+pay;
			}
		}
		PageRequest pageable =null;
		Page<EpisodeEntity> listEpisode=null;
		if(order.equalsIgnoreCase("desc")){
			 pageable = new PageRequest(page_episode-1, PAGE_SIZE, new Sort(new Order(Direction.DESC, "episodeNumber")));
			 listEpisode=episodeService.listPagingByBookId(id, pageable);
			 model.addAttribute("order", "desc");
		}else{
			pageable = new PageRequest(page_episode-1, PAGE_SIZE, new Sort(new Order(Direction.ASC, "episodeNumber")));
			listEpisode=episodeService.listPagingByBookId(id, pageable);
			model.addAttribute("order", "asc");
		}
		if(user!=null){
			if(listEpisode.getContent()!=null){
				List<CouponUsedEntity> listcouponUsed =couponUsedService.findBy_UserId_BookId(user.getId(), id);
				for (EpisodeEntity e : listEpisode.getContent()) {
					for (CouponUsedEntity c : listcouponUsed) {
						if(e.getId().equals(c.getEpisode().getId())){
							e.setIsShow(2);
						}
					}
				}
				}
		}
		
		
			Page<AnnouncementEntity> listAnnouncement=announcementService.listPagingByBookId(id, page_announcement, PAGE_SIZE);
			Page<AnnouncementEntity> announcement=announcementService.listPagingByBookId(id, 1, 1);
			if(announcement.getTotalElements()>0){
				model.addAttribute("a", announcement.getContent().get(0));
			}
			new Pager<EpisodeEntity>(listEpisode).setSetting(model, "");
			model.addAttribute("active",active);
			model.addAttribute("user",user);
			new Pager<AnnouncementEntity>(listAnnouncement).setSettingSecondList(model, "");
			model.addAttribute("pagination_navigator", "/book/detail/"+id);
			model.addAttribute("page1", page_episode);
			model.addAttribute("page2", page_announcement);
			model.addAttribute("book", book);
			return JSP_BOOK_DETAIL;
	}	
	
	

	

}
