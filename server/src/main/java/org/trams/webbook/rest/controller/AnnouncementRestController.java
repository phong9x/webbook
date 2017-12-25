/*
 * Created on 15 Dec 2015 ( Time 14:53:44 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.rest.controller;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.trams.webbook.bean.Announcement;
import org.trams.webbook.business.service.AnnouncementService;
import org.trams.webbook.web.listitem.AnnouncementListItem;

/**
 * Spring MVC controller for 'Announcement' management.
 */
@Controller
public class AnnouncementRestController {

	@Resource
	private AnnouncementService announcementService;
	
	@RequestMapping( value="/api/items/announcement",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public List<AnnouncementListItem> findAllAsListItems() {
		List<Announcement> list = announcementService.findAll();
		List<AnnouncementListItem> items = new LinkedList<AnnouncementListItem>();
		for ( Announcement announcement : list ) {
			items.add(new AnnouncementListItem( announcement ) );
		}
		return items;
	}
	
	@RequestMapping( value="/api/announcement",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public List<Announcement> findAll() {
		return announcementService.findAll();
	}

	@RequestMapping( value="/api/announcement/{id}",
			method = RequestMethod.GET,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Announcement findOne(@PathVariable("id") Integer id) {
		return announcementService.findById(id);
	}
	
	@RequestMapping( value="/api/announcement",
			method = RequestMethod.POST,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Announcement create(@RequestBody Announcement announcement) {
		return announcementService.create(announcement);
	}

	@RequestMapping( value="/api/announcement/{id}",
			method = RequestMethod.PUT,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public Announcement update(@PathVariable("id") Integer id, @RequestBody Announcement announcement) {
		return announcementService.update(announcement);
	}

	@RequestMapping( value="/api/announcement/{id}",
			method = RequestMethod.DELETE,
			produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public void delete(@PathVariable("id") Integer id) {
		announcementService.delete(id);
	}
	
}
