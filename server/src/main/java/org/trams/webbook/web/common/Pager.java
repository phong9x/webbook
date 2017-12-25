package org.trams.webbook.web.common;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.ui.Model;


public class Pager<T> {

	private Page<T> m_list;
	public Pager(Page<T> list)
	{
		m_list = list;
	}
	
	public Pager(){}
	
	public void setSetting(Model model, String url)
	{
		int current = m_list.getNumber() + 1;
		int begin = Math.max(1, current - 5);
		int end = Math.min(begin + 10, m_list.getTotalPages());
		model.addAttribute("list", m_list.getContent());
		//model.addAttribute("page", m_list);
	    model.addAttribute("beginIndex", begin);
	    model.addAttribute("endIndex", end);
	    model.addAttribute("currentIndex", current);
	    model.addAttribute("totalCount", m_list.getTotalElements());
	    model.addAttribute("url", url);
	    model.addAttribute("size", m_list.getSize());
	   
	    if (m_list.getTotalElements()==0)
	    	model.addAttribute("page", null);
	    else
	    	model.addAttribute("page", m_list);
	}
	
	public void setSettingSecondList(Model model, String url)
	{
		int current = m_list.getNumber() + 1;
		int begin = Math.max(1, current - 5);
		
		int end = Math.min(begin + 10, m_list.getTotalPages());
		
		model.addAttribute("list2", m_list.getContent());
	    model.addAttribute("beginIndex2", begin);
	    model.addAttribute("endIndex2", end);
	    model.addAttribute("currentIndex2", current);
	    model.addAttribute("totalCount2", m_list.getTotalElements());
	    model.addAttribute("url2", url);
	    model.addAttribute("size2", m_list.getSize());
	    
	    if (m_list.getTotalElements()==0)
	    	model.addAttribute("page_2", null);
	    else
	    	model.addAttribute("page_2", m_list);
	}
	
	public void setSettingThirdList(Model model, String url)
	{
		int current = m_list.getNumber() + 1;
		int begin = Math.max(1, current - 5);
		
		int end = Math.min(begin + 10, m_list.getTotalPages());
		
		model.addAttribute("list3", m_list.getContent());
	    model.addAttribute("beginIndex3", begin);
	    model.addAttribute("endIndex3", end);
	    model.addAttribute("currentIndex3", current);
	    model.addAttribute("totalCount3", m_list.getTotalElements());
	    model.addAttribute("url3", url);
	    model.addAttribute("size3", m_list.getSize());
	    
	    if (m_list.getTotalElements()==0)
	    	model.addAttribute("page_3", null);
	    else
	    	model.addAttribute("page_3", m_list);
	}
	
	
	
	
	public void setSetting(Model model,List<T> list,Integer current,double total)
	{
		int begin = Math.max(1, current - 5);
		
		int end = (int) Math.min(begin + 10, total);
		
		model.addAttribute("list", list);
		model.addAttribute("beginIndex", begin);
		model.addAttribute("endIndex", end);
		model.addAttribute("currentIndex", current);
		model.addAttribute("totalCount",total);
		model.addAttribute("totalPages",total);
		model.addAttribute("size", list.size());
		
		if (list.size()==0)
			model.addAttribute("page", null);
		else
			model.addAttribute("page", m_list);
	}
}
