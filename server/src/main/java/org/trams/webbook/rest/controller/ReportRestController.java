/*
 * Created on 15 Dec 2015 ( Time 14:53:45 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.rest.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.trams.webbook.bean.Book;
import org.trams.webbook.bean.Bookmark;
import org.trams.webbook.bean.Comment;
import org.trams.webbook.bean.Episode;
import org.trams.webbook.bean.Report;
import org.trams.webbook.bean.User;
import org.trams.webbook.bean.jpa.ReportEntity;
import org.trams.webbook.business.service.CommentService;
import org.trams.webbook.business.service.ReportService;
import org.trams.webbook.rest.item.ReturnObjectData;
import org.trams.webbook.web.common.Login;
import org.trams.webbook.web.listitem.ReportListItem;

/**
 * Spring MVC controller for 'Report' management.
 */
@Controller
public class ReportRestController {

	@Resource
	private ReportService reportService;
	@Resource
	private CommentService commentService;
	
	@RequestMapping( value="/api/items/report",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public List<ReportListItem> findAllAsListItems() {
		List<Report> list = reportService.findAll();
		List<ReportListItem> items = new LinkedList<ReportListItem>();
		for ( Report report : list ) {
			items.add(new ReportListItem( report ) );
		}
		return items;
	}
	
	@RequestMapping( value="/api/report_comment_episode",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public org.trams.webbook.rest.item.ReturnObjectData<Object> report(
			@RequestParam(value = "id", defaultValue = "") Integer id,
			HttpSession session
			) {
		ReturnObjectData<Object> data = new ReturnObjectData<Object>(1, "error", null);
		try {
			Comment e = commentService.findById(id);
			User u =Login.getUserLogin(session);
			Report b=new Report();
			b.setTypeKey("EPISODE");
			b.setCreateDate(new Date());
			b.setUpdateDate(new Date());
			b.setUserId(u.getId());
			b.setIsDelete(0);
			Report create = reportService.create(b);
			if(create != null){
				data = new ReturnObjectData<Object>(0, "사용 가능한 아이디입니다.");
			}else{
				data = new ReturnObjectData<Object>(2, "사용 중인 아이디입니다.");
			}
		} catch (Exception e) {
		} 
		return data;
	}

	
	@RequestMapping( value="/api/report_history",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public org.trams.webbook.rest.item.ReturnObjectData<Object> add_bookmark(
			@RequestParam(value = "id", defaultValue = "") Integer id,
			@RequestParam(value = "type", defaultValue = "") String type,
			HttpSession session
			) {
		ReturnObjectData<Object> data = new ReturnObjectData<Object>(1, "error", null);
		try {
				List<ReportEntity>list_report=reportService.listPopupHistory(id, type);
				if(list_report.size()>0){
					List<Book> list =new ArrayList<>();
					for (ReportEntity reportEntity : list_report) {
						Book r=new Book();
						r.setTitle(reportEntity.getUser().getNickname());
						r.setIntroduce(reportEntity.getReason());
						DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						String date = df.format(reportEntity.getCreateDate());
						r.setDayOfWeek(date);
						list.add(r);
					}
					data = new ReturnObjectData<Object>(0, "Success",list);
				}else{
					data = new ReturnObjectData<Object>(2, "no");
				}
				
			
		} catch (Exception e) {
			data = new ReturnObjectData<Object>(1, "Error");
			System.out.println(e);
		} 
		return data;
	}
	
	
	
	
	
	@RequestMapping( value="/api/report/{id}",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Report findOne(@PathVariable("id") Integer id) {
		return reportService.findById(id);
	}
	
	@RequestMapping( value="/api/report",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Report create(@RequestBody Report report) {
		return reportService.create(report);
	}

	@RequestMapping( value="/api/report/{id}",
			method = RequestMethod.PUT,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Report update(@PathVariable("id") Integer id, @RequestBody Report report) {
		return reportService.update(report);
	}

	@RequestMapping( value="/api/report/{id}",
			method = RequestMethod.DELETE,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public void delete(@PathVariable("id") Integer id) {
		reportService.delete(id);
	}
	
}
