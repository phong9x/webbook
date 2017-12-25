/*
 * Created on 12 Jan 2016 ( Time 10:26:02 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.web.listitem;

import org.trams.webbook.bean.Comment;
import org.trams.webbook.web.common.ListItem;

public class CommentListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public CommentListItem(Comment comment) {
		super();

		this.value = ""
			 + comment.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = comment.toString();
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
