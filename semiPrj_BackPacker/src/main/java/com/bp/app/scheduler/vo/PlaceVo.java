package com.bp.app.scheduler.vo;

public class PlaceVo {

	private String placeNo;
	private String placeCategoryNo;
	private String countryNo;
	private String locationNo;
	private String placeName;
	private String placeIntroduce;
	private String placeImage;
	private String placeLat;
	private String placeLng;
	private String placeTime;
	private String placeExpense;
	public String getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(String placeNo) {
		this.placeNo = placeNo;
	}
	public String getPlaceCategoryNo() {
		return placeCategoryNo;
	}
	public void setPlaceCategoryNo(String placeCategoryNo) {
		this.placeCategoryNo = placeCategoryNo;
	}
	public String getCountryNo() {
		return countryNo;
	}
	public void setCountryNo(String countryNo) {
		this.countryNo = countryNo;
	}
	public String getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(String locationNo) {
		this.locationNo = locationNo;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceIntroduce() {
		return placeIntroduce;
	}
	public void setPlaceIntroduce(String placeIntroduce) {
		this.placeIntroduce = placeIntroduce;
	}
	public String getPlaceImage() {
		return placeImage;
	}
	public void setPlaceImage(String placeImage) {
		this.placeImage = placeImage;
	}
	public String getPlaceLat() {
		return placeLat;
	}
	public void setPlaceLat(String placeLat) {
		this.placeLat = placeLat;
	}
	public String getPlaceLng() {
		return placeLng;
	}
	public void setPlaceLng(String placeLng) {
		this.placeLng = placeLng;
	}
	public String getPlaceTime() {
		return placeTime;
	}
	public void setPlaceTime(String placeTime) {
		this.placeTime = placeTime;
	}
	public String getPlaceExpense() {
		return placeExpense;
	}
	public void setPlaceExpense(String placeExpense) {
		this.placeExpense = placeExpense;
	}
	@Override
	public String toString() {
		return "PlaceVo [placeNo=" + placeNo + ", placeCategoryNo=" + placeCategoryNo + ", countryNo=" + countryNo
				+ ", locationNo=" + locationNo + ", placeName=" + placeName + ", placeIntroduce=" + placeIntroduce
				+ ", placeImage=" + placeImage + ", placeLat=" + placeLat + ", placeLng=" + placeLng + ", placeTime="
				+ placeTime + ", placeExpense=" + placeExpense + "]";
	}
	public PlaceVo(String placeNo, String placeCategoryNo, String countryNo, String locationNo, String placeName,
			String placeIntroduce, String placeImage, String placeLat, String placeLng, String placeTime,
			String placeExpense) {
		super();
		this.placeNo = placeNo;
		this.placeCategoryNo = placeCategoryNo;
		this.countryNo = countryNo;
		this.locationNo = locationNo;
		this.placeName = placeName;
		this.placeIntroduce = placeIntroduce;
		this.placeImage = placeImage;
		this.placeLat = placeLat;
		this.placeLng = placeLng;
		this.placeTime = placeTime;
		this.placeExpense = placeExpense;
	}
	public PlaceVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
