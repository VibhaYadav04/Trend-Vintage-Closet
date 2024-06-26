package com.entity;

public class ClothDtls {
    private int clothId;
    private String clothName;
    private String price;
    private String clothCategory;
    private String status;
    private String photoName;
    private String email;
    
    
    
	public ClothDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public ClothDtls(String clothName, String price, String clothCategory, String status, String photoName,
			String email) {
		super();
		this.clothName = clothName;
		this.price = price;
		this.clothCategory = clothCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}



	public int getClothId() {
		return clothId;
	}
	public void setClothId(int clothId) {
		this.clothId = clothId;
	}
	public String getClothName() {
		return clothName;
	}
	public void setClothName(String clothName) {
		this.clothName = clothName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getClothCategory() {
		return clothCategory;
	}
	public void setClothCategory(String clothCategory) {
		this.clothCategory = clothCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "ClothDtls [clothId=" + clothId + ", clothName=" + clothName + ", price=" + price + ", clothCategory="
				+ clothCategory + ", status=" + status + ", photoName=" + photoName + ", email=" + email + "]";
	}
	
	
}
