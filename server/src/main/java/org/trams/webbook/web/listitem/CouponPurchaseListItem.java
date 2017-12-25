/*
 * Created on 11 Jan 2016 ( Time 15:22:18 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.trams.webbook.web.listitem;

import org.trams.webbook.bean.CouponPurchase;
import org.trams.webbook.web.common.ListItem;

public class CouponPurchaseListItem implements ListItem {

	private final String value ;
	private final String label ;
	
	public CouponPurchaseListItem(CouponPurchase couponPurchase) {
		super();

		this.value = ""
			 + couponPurchase.getId()
		;

		//TODO : Define here the attributes to be displayed as the label
		this.label = couponPurchase.toString();
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
