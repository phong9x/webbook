package org.trams.webbook.web.item;

public class StatisticBook {
private Integer totalBook;
private Integer totalNewBook;

public StatisticBook() {
	super();
	this.totalBook = 0;
	this.totalNewBook = 0;
}
public StatisticBook(Integer totalBook, Integer totalNewBook) {
	super();
	this.totalBook = totalBook;
	this.totalNewBook = totalNewBook;
}
public Integer getTotalBook() {
	return totalBook;
}
public void setTotalBook(Integer totalBook) {
	this.totalBook = totalBook;
}
public Integer getTotalNewBook() {
	return totalNewBook;
}
public void setTotalNewBook(Integer totalNewBook) {
	this.totalNewBook = totalNewBook;
}


}
