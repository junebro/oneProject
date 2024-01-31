package com.shopping.model.bean;

public class World {
	private int pnum ;
	private String name ;
	private String company ;
	private int price ;
	
	
	public World() {
		// TODO Auto-generated constructor stub
	}
	
	public World(int pnum, String name, String company, int price) {
		super();
		this.pnum = pnum;
		this.name = name;
		this.company = company;
		this.price = price;
	}

	@Override
	public String toString() {
		return "World [pnum=" + pnum + ", name=" + name + ", company=" + company + ", price=" + price + "]";
	}
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	
}
