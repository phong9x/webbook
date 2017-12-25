package org.trams.webbook.rest.item;


public interface RestItem<B, E> {
	public void parserBean(B b);
	public void parserEntity(E b);
}
