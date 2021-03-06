/*
 * Created on 11 Jan 2016 ( Time 15:22:18 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.web.listitem;

import org.trams.webbook.bean.Bookmark;
import org.trams.webbook.web.common.ListItem;

public class BookmarkListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public BookmarkListItem(Bookmark bookmark) {
		super();

		this.value = ""
			 + bookmark.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = bookmark.toString();
	}

	@Override
	public String getValue() {
		return value;
	}

	@Override
	public String getLabel() {
		return label;
	}

}
