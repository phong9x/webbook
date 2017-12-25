/*

 * Created on 15 Dec 2015 ( Time 14:50:18 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.web.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
//--- Common classes
import org.trams.webbook.web.common.AbstractController;
import org.trams.webbook.web.common.ApplicationDefine;
import org.trams.webbook.web.common.FileUtils;
import org.trams.webbook.web.common.Pager;
import org.trams.webbook.web.common.Utils;
import org.trams.webbook.web.common.Login;
import org.trams.webbook.bean.Comment;
import org.trams.webbook.bean.Post;
import org.trams.webbook.bean.Report;
import org.trams.webbook.bean.User;
import org.trams.webbook.bean.jpa.CategoryEntity;
import org.trams.webbook.bean.jpa.CommentEntity;
import org.trams.webbook.bean.jpa.PostEntity;
//--- Entities
import org.trams.webbook.business.service.CategoryService;
import org.trams.webbook.business.service.CommentService;
import org.trams.webbook.business.service.PostService;
import org.trams.webbook.business.service.ReportService;
//--- Services 
import org.trams.webbook.business.service.UserService;
import org.trams.webbook.business.service.mapping.PostServiceMapper;

/**
 * Spring MVC controller for 'User' management.
 */
@Controller
@RequestMapping("/community/freeboard")
public class FreeboardController extends AbstractController {

	// --- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "user";

	private static final Integer PAGE_SIZE   = 10;

	// --- SAVE ACTION ( in the HTML form )
	private static final String INDEX = "/community/freeboard/index";
	private static final String WRITE = "/community/freeboard/write";
	private static final String VIEW = "/community/freeboard/view";
	private static final String EDIT = "/community/freeboard/edit";
	private static String nav = "community";
	private static String menu = "freeboard";
	// --- Main entity service
	@Resource
	private UserService userService; // Injected by Spring
	// --- Other service(s)
	@Resource
	private CategoryService categoryService;
	@Resource
    private PostService postService;
	@Resource
	private CommentService commentService;
	@Resource
	private ReportService reportService;
	@Resource
	private PostServiceMapper postServiceMapper;
	@Autowired 
	ServletContext servletContext;
	// --------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public FreeboardController() {
		super(FreeboardController.class, MAIN_ENTITY_NAME);
		log("SearchController created.");
	}

	// --------------------------------------------------------------------------------------
	// Spring MVC model management
	// --------------------------------------------------------------------------------------
	
	//Decription:get list freeboard 
	//Url: http://kwebsosul.com/community/freeboard
	@RequestMapping("")
	public String index(
			@RequestParam(value="page",defaultValue="1") Integer page,
			HttpSession session, Model model) {
		Page<PostEntity> list = null; 
		List<PostEntity> top10Views = new ArrayList<>(); 
		
		try {
			Date to =new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(to);
			c.add(Calendar.DATE, -7);
			Date from = c.getTime();
			System.out.println("from: "+from.getDate()+"/"+(from.getMonth()+1));
			System.out.println("to: "+to.getDate()+"/"+(to.getMonth()+1));
			Page<PostEntity> topViews = postService.Top10ViewFreeboard(ApplicationDefine.BULLETIN_FREEBOARD, from, to);
			if(topViews!= null){
				top10Views = topViews.getContent();
			}
			list = postService.findByBulletin(ApplicationDefine.BULLETIN_FREEBOARD, page, PAGE_SIZE, "createDate");
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		 Calendar c = Calendar.getInstance();
		 c.add(Calendar.DAY_OF_YEAR, -1);
		 Date beforeDay = c.getTime();
		 model.addAttribute("beforeDay",beforeDay.getTime());
		new Pager<PostEntity>(list).setSetting(model, "");
		model.addAttribute("activePage", nav);model.addAttribute("activeMenu", menu);
		model.addAttribute("top10Views", top10Views);
		return INDEX;
	}
	
	//Decription:get report freeboard 
	@RequestMapping(value="/report/{id}",method=RequestMethod.POST)
	public String report(
			@PathVariable("id") Integer id,
			@RequestParam(value="reason",defaultValue="") String reason,
			@RequestParam(value="other_reason",defaultValue="") String other_reason,
			HttpSession session, Model model) {
		
		Post post = null;
		model.addAttribute("activePage", nav);model.addAttribute("activeMenu", menu);
		
		try {
			
			if(Login.checkLogin(session)=="0")
				return "redirect:/login";
			
			User user = Login.getUserLogin(session);
			
			if(user != null){
				post = postService.findById(id);
				
				Report report = reportService.findByUserParrentType(user.getId(), post.getId(), ApplicationDefine.REPORT_FREEBOARD);
				if(report == null){
					report = new Report();
					report.setId(0);
					report.setIsDelete(0);
					report.setUserId(user.getId());
					report.setParentId(post.getId());
					
					if(reason.equals("기타")){
						report.setReason(other_reason);
					}else{
						report.setReason(reason);
					}
					
					report.setTypeKey(ApplicationDefine.REPORT_FREEBOARD);
					report.setUpdateDate(new Date());
					report.setCreateDate(new Date());
					
					reportService.create(report);
					
					post.setReportNumber(post.getReportNumber()+1);
					postService.update(post);
				}else{
					if(reason.equals("기타")){
						report.setReason(other_reason);
					}else{
						report.setReason(reason);
					}
					
					report.setUpdateDate(new Date());
					
					reportService.update(report);
				}
				
				return "redirect:/community/freeboard/view/"+post.getId();
				 
			}else{
				return "redirect:/login";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return "redirect:/community/freeboard";
	}
	
	//Decription:get detail freeboard
	//Url: http://kwebsosul.com/community/freeboard/view/{id}
	@RequestMapping(value="/view/{id}",method=RequestMethod.GET)
	public String view(
			@PathVariable("id") Integer id,
			@RequestParam(value="page",defaultValue="1") Integer page,
			@RequestParam(value="action",defaultValue="") String action,
			HttpSession session, Model model) {
		List<CommentEntity> list = null; 
		PostEntity post = null;
		List<CategoryEntity> reportReason = new ArrayList<CategoryEntity>();
		User user =Login.getUserLogin(session);
		try {
			
		
			
			post = postService.getById(id);
		
			if(post != null){
				list = commentService.findAllBy_ParentId_Type(post.getId(), ApplicationDefine.COMMENT_POST_TYPE,page,PAGE_SIZE).getContent();
				
			}else{
				return "redirect:/community/freeboard";
			}
			
			reportReason = categoryService.findByGroupId(ApplicationDefine.GROUP_REPORT_REASON);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		if(post.getViewsNumber()==null){
			post.setViewsNumber(1);
		}else{
			post.setViewsNumber(post.getViewsNumber()+1);
		}
		Post p=postServiceMapper.mapPostEntityToPost(post);
		p=postService.update(p);
		model.addAttribute("list", list);
		model.addAttribute("activePage", nav);
		model.addAttribute("activeMenu", menu);
		model.addAttribute("post", post);
		model.addAttribute("user", user);
		model.addAttribute("reportReason", reportReason);
		return VIEW;
	}
	
	
	@RequestMapping(value="/view/{id}",method=RequestMethod.POST)
	public  String view(
			@PathVariable("id") Integer id,
			@RequestParam(value="comment",defaultValue="") String comment,
			@RequestParam(value="comment_id",defaultValue="0") Integer comment_id,
			@RequestParam(value="action",defaultValue="") String action,
			@RequestParam(value="delete_post",defaultValue="0") Integer delete_post,
			HttpSession session, Model model) {
		
		Post post = null;
		model.addAttribute("activePage", nav);model.addAttribute("activeMenu", menu);
		try {
			if(Login.checkLogin(session)=="0")
				return "redirect:/login";
			
			User user = Login.getUserLogin(session);
			
			if(user != null){
				post = postService.findById(id);

				if(delete_post>0){
					post.setIsDelete(1);;
					postService.update(post);
					return "redirect:/community/freeboard";
				}
				
				if(post != null && action != null){
					if(action.equals("comment")){
						Comment commentObj = new Comment();
						commentObj.setId(0);
						commentObj.setUserId(user.getId());
						commentObj.setParentId(post.getId());
						String ecomment = StringEscapeUtils.escapeHtml4(comment);
						commentObj.setComment(ecomment);
						commentObj.setReportNumber(0);
						commentObj.setTypeKey(ApplicationDefine.COMMENT_POST_TYPE);
						commentObj.setIsDelete(0);
						commentObj.setUpdateDate(new Date());
						commentObj.setCreateDate(new Date());
						commentService.create(commentObj);
					}else if(action.equals("delete")){
						Comment commentObj = commentService.findById(comment_id);
						
						if(commentObj != null){
							commentService.delete(comment_id);
						} 
					}
					
					return "redirect:/community/freeboard/view/"+post.getId();
				}else{
					return "redirect:/community/freeboard";
				}
			}else{
				return "redirect:/login";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "redirect:/community/freeboard";
	}
	
	//Decription:edit freeboard
	//Url: http://kwebsosul.com/community/freeboard/edit/{id}
	@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public String editIndex(
			@PathVariable("id") Integer id,
			HttpSession session, Model model) {
		PostEntity post = null;
		
		try {
			
			if(Login.checkLogin(session)=="0")
				return "redirect:/login";
			
			post = postService.getById(id);
			User editor = Login.getUserLogin(session);
			Integer userId=Utils.parseInt( editor.getId());
			Integer postId=Utils.parseInt(post.getUser().getId());
			if(post == null || (userId !=postId) ){
				return "redirect:/community/freeboard";
			}
			
		} catch (Exception e) {
		}
		
		model.addAttribute("post", post);
		model.addAttribute("activePage", nav);model.addAttribute("activeMenu", menu);
		return EDIT;
	}
	
	
	@RequestMapping(value="/edit/{id}",method=RequestMethod.POST)
	public String edit(
			@PathVariable("id") Integer id,
			@RequestParam(value="title",defaultValue="") String title,
			@RequestParam(value="content",defaultValue="") String content,
			@RequestParam(value="file_attach_1") MultipartFile file_attach_1,
			@RequestParam(value="file_attach_2") MultipartFile file_attach_2,
			HttpSession session, Model model) {
		
		Post post = null;
		try {
			if(Login.checkLogin(session)=="0")
				return "redirect:/login";
			
			User user = Login.getUserLogin(session);
			
			if(user != null){
				if(title != null && content != null){
					post = postService.findById(id);
					User editor = Login.getUserLogin(session);
					model.addAttribute("required", 0);
					
					
					if(post != null && Utils.parseInt(editor.getId()) ==Utils.parseInt(post.getUserId()) ){
						post.setTitle(title);
						post.setContents(content);
						post.setUpdateDate(new Date());
						int size=3*1024*1024;
						if(file_attach_1.getSize()>size || file_attach_2.getSize()>size){
							model.addAttribute("required", 2);
							model.addAttribute("post", post);
							return EDIT;
						}
						try {
							if(file_attach_1.getSize()>0){
								String path ="files/upload/"+menu+"/"+Utils.getPresentTimeString("yyyyMMdd")+"/"+user.getId()+"/";
								path = FileUtils.saveFileUpload(file_attach_1, path, servletContext);
								post.setFilename1(file_attach_1.getOriginalFilename());
								post.setFile1(path);
							}
					} catch (Exception e) {
						System.out.println(e.toString());
					}
					
					try {
						
							if(file_attach_2.getSize()>0){
								String path ="files/upload/"+menu+"/"+Utils.getPresentTimeString("yyyyMMdd")+"/"+user.getId()+"/";
								path = FileUtils.saveFileUpload(file_attach_2, path, servletContext);
								post.setFilename2(file_attach_2.getOriginalFilename());
								post.setFile2(path);
							}
					
					} catch (Exception e) {
						System.out.println(e.toString());
					}
					
						
						Post editPost = postService.create(post);
						
						if(editPost != null){
							return "redirect:/community/freeboard/view/"+editPost.getId();
						}else{
							
						}
					}else{
						return "redirect:/community/freeboard";
					}
				}else{
					return "redirect:/community/freeboard/view/"+id;
				}
			}else{
				return "redirect:/login";
			}
		} catch (Exception e) {
			System.err.println(e);
		}
		
		model.addAttribute("post", post);
		model.addAttribute("activePage", nav);model.addAttribute("activeMenu", menu);
		return EDIT;
	}
	//Decription:Create freeboard
	//Url: http://kwebsosul.com/community/freeboard/write
	@RequestMapping(value="/write",method=RequestMethod.GET)
	public String writeIndex(HttpSession session, Model model) {
		if(Login.checkLogin(session)=="0")
			return "redirect:/login";
		model.addAttribute("activePage", nav);model.addAttribute("activeMenu", menu);
		return WRITE;
	}
	
	@RequestMapping(value="/write",method=RequestMethod.POST)
	public String write(
			@RequestParam(value="title",defaultValue="") String title,
			@RequestParam(value="content",defaultValue="") String content,
			@RequestParam(value="file_attach_1") MultipartFile file_attach_1,
			@RequestParam(value="file_attach_2") MultipartFile file_attach_2,
			HttpSession session, Model model) {
		model.addAttribute("activePage", nav);model.addAttribute("activeMenu", menu);
		try {
			if(Login.checkLogin(session)=="0")
				return "redirect:/login";
			model.addAttribute("required", 0);
			
			if(title != null && content != null){
				User user = Login.getUserLogin(session);
				if(user != null){
					content.trim();
					Post post = new Post();
					post.setTitle(title);
					post.setContents(content);
					int size=3*1024*1024;
					if(file_attach_1.getSize()>size || file_attach_2.getSize()>size){
						model.addAttribute("required", 2);
						return WRITE;
					}
					
					post.setUserId(user.getId());
					post.setReportNumber(0);
					post.setIsDelete(0);
					post.setViewsNumber(0);
					post.setBulletinId(ApplicationDefine.BULLETIN_FREEBOARD);
					post.setBulletinName(ApplicationDefine.BULLETIN_FREEBOARD_NAME);
					post.setUpdateDate(new Date());
					post.setCreateDate(new Date());
					
					try {
						
						
							if(file_attach_1.getSize()>0){
								String path ="files/upload/"+menu+"/"+Utils.getPresentTimeString("yyyyMMdd")+"/"+user.getId()+"/";
								path = FileUtils.saveFileUpload(file_attach_1, path, servletContext);
								post.setFilename1(file_attach_1.getOriginalFilename());
								post.setFile1(path);
							}
						
						
					} catch (Exception e) {
						System.out.println(e.toString());
					}
					
					try {
						
							if(file_attach_2.getSize()>0){
								String path ="files/upload/"+menu+"/"+Utils.getPresentTimeString("yyyyMMdd")+"/"+user.getId()+"/";
								path = FileUtils.saveFileUpload(file_attach_2, path, servletContext);
								post.setFilename2(file_attach_2.getOriginalFilename());
								post.setFile2(path);
							}
					
					} catch (Exception e) {
						System.out.println(e.toString());
					}
					Post createNew = postService.create(post);
					if(createNew != null){
						return "redirect:/community/freeboard/view/"+createNew.getId();
					}else{
						return "redirect:/community/freeboard/write";
					}
				}
			}else{
				model.addAttribute("required", 3);
			}
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return WRITE;
	}
	//Decription:Report comment in freeboard page
	//Url: http://kwebsosul.com/community/freeboard/write
	@RequestMapping(value="/report_comment",method=RequestMethod.POST)
	public String report(
			@RequestParam(value="comment_id",defaultValue="0") Integer comment_id,
			@RequestParam(value="post_id",defaultValue="0") Integer episode_id,
			@RequestParam(value="reason",defaultValue="") String reason,
			@RequestParam(value="other_reason",defaultValue="") String other_reason,
			HttpSession session, Model model) {
		
		Comment comment = null;
	
		try {
			if(Login.checkLogin(session)=="0")
				return "redirect:/login";
			User user = Login.getUserLogin(session);
			
			if(user != null){
				comment = commentService.findById(comment_id);
				Report report = reportService.findByUserParrentType(user.getId(), comment.getId(), ApplicationDefine.REPORT_COMMENT_POST);
				if(report == null){
					report = new Report();
					report.setId(0);
					report.setIsDelete(0);
					report.setUserId(user.getId());
					report.setParentId(comment_id);
					
					if(reason.equals("기타")){
						report.setReason(other_reason);
					}else{
						report.setReason(reason);
					}
					
					report.setTypeKey(ApplicationDefine.REPORT_COMMENT_POST);
					report.setUpdateDate(new Date());
					report.setCreateDate(new Date());
					
					reportService.create(report);
					
					comment.setReportNumber(comment.getReportNumber()+1);
					commentService.update(comment);
				}else{
					if(reason.equals("기타")){
						report.setReason(other_reason);
					}else{
						report.setReason(reason);
					}
					
					report.setUpdateDate(new Date());
					
					reportService.update(report);
				}
				
				return "redirect:/community/freeboard/view/"+episode_id;
				 
			}else{
				return "redirect:/login";
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return "redirect:/community/freeboard/view/"+episode_id;
	}
	
}
