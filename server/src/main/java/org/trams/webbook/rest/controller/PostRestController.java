/*
 * Created on 15 Dec 2015 ( Time 14:53:45 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.rest.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.trams.webbook.bean.Episode;
import org.trams.webbook.bean.Post;
import org.trams.webbook.bean.Report;
import org.trams.webbook.bean.User;
import org.trams.webbook.bean.jpa.BookEntity;
import org.trams.webbook.bean.jpa.ReportEntity;
import org.trams.webbook.business.service.PostService;
import org.trams.webbook.rest.item.ReturnObjectData;
import org.trams.webbook.web.common.Login;
import org.trams.webbook.web.listitem.PostListItem;

/**
 * Spring MVC controller for 'Post' management.
 */
@Controller
public class PostRestController {

	@Resource
	private PostService postService;
	
	@RequestMapping( value="/api/items/post",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public List<PostListItem> findAllAsListItems() {
		List<Post> list = postService.findAll();
		List<PostListItem> items = new LinkedList<PostListItem>();
		for ( Post post : list ) {
			items.add(new PostListItem( post ) );
		}
		return items;
	}
	
	@RequestMapping( value="/api/post",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public List<Post> findAll() {
		return postService.findAll();
	}

	@RequestMapping( value="/api/post_report_history",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public org.trams.webbook.rest.item.ReturnObjectData<Object> add_bookmark(
			@RequestParam(value = "id", defaultValue = "") Integer id,
			HttpSession session
			) {
		ReturnObjectData<Object> data = new ReturnObjectData<Object>(1, "error", null);
		try {
			
				List<ReportEntity> list=null;
				data = new ReturnObjectData<Object>(0, "사용 가능한 아이디입니다.",list);//thanh cong
			
		} catch (Exception e) {
			data = new ReturnObjectData<Object>(2, "사용 중인 아이디입니다.");//nguoc lai
			System.out.println(e);
		} 
		return data;
	}
	
	@RequestMapping( value="/api/post",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Post create(@RequestBody Post post) {
		return postService.create(post);
	}

	@RequestMapping( value="/api/post/{id}",
			method = RequestMethod.PUT,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Post update(@PathVariable("id") Integer id, @RequestBody Post post) {
		return postService.update(post);
	}

	@RequestMapping( value="/api/post/{id}",
			method = RequestMethod.DELETE,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public void delete(@PathVariable("id") Integer id) {
		postService.delete(id);
	}
	
}
