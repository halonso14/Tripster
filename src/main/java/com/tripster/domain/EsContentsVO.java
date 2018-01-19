package com.tripster.domain;

import java.util.*;

public class EsContentsVO{
	
	private int category_id;
	private int contents_id;
	private String contents_title;
	private String category_value_kor;
	private String contents_keyword;
	private String contents_location;
	private double contents_rating;
	private int contents_view_cnt;
	private int contents_review_cnt;
	private int contents_scrap_cnt;
	private String contents_country;
	private String contents_city;
	private String contents_thumbnail;
	private String random_thumbnail;
	private Date created;
	private Date updated;
	
	public String getContents_keyword() {
		String result = this.contents_keyword.replace("'", "").replace(" ", "").replace("[", "").replace("]", "");
		return result;
	}
	
	public String getContents_thumbnail() {
		String result = this.contents_thumbnail.replace(" ", "");
		return result;
	}
	public String getRandom_thumbnail() {
		List<String> list = new ArrayList<String>();
		list.add("https://lh5.googleusercontent.com/p/AF1QipOlljc14PiI8Iok9w2GLzp8o_RKdCymCm4-dK82=s815-k-no");
		list.add("http://post.phinf.naver.net/MjAxNzA2MTRfMjY5/MDAxNDk3NDA3MDY2NTQz.zFOZaP_eUJ-aTT_OPM78i65UmDdmDqlirWUZEYsDdqgg.ANdnD0UIGKJkR7zhu8vGQUr8iFBVjaF9BS-RCtJY0cgg.JPEG/1.JPG?type=w1200");
		list.add("https://media-cdn.tripadvisor.com/media/photo-s/11/33/a0/5d/caption.jpg");
		list.add("http://www.rainbowfestival.co.kr/wp-content/uploads/2017/05/585be1aa1600002400bdf2a6-970x658.jpeg");
		list.add("https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/26Fv/image/7qAJNYkzF8pdQZTEmUX5gG5KLV8.jpg");
		list.add("http://cfile6.uf.tistory.com/image/194F3C4F513E39F41D2473");
		list.add("http://cfs14.tistory.com/image/21/tistory/2009/02/09/01/35/498f09c7981c1");
		list.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2rHy0w3rPMVTSvx1rYogDH7qJBpp44cjLODQJrBEL_RaJhqgA");
		String random = list.get(new Random().nextInt(list.size()));
		return random;
	}

	public void setRandom_thumbnail(String random_thumbnail) {
		this.random_thumbnail = random_thumbnail;
	}
	public void setContents_keyword(String contents_keyword) {
		this.contents_keyword = contents_keyword;
	}
	public double getContents_rating() {
		return contents_rating;
	}
	public void setContents_rating(double contents_rating) {
		this.contents_rating = contents_rating;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getContents_id() {
		return contents_id;
	}
	public void setContents_id(int contents_id) {
		this.contents_id = contents_id;
	}
	public String getContents_title() {
		return contents_title;
	}
	public void setContents_title(String contents_title) {
		this.contents_title = contents_title;
	}
	public String getCategory_value_kor() {
		return category_value_kor;
	}
	public void setCategory_value_kor(String category_value_kor) {
		this.category_value_kor = category_value_kor;
	}
	public String getContents_location() {
		return contents_location;
	}
	public void setContents_location(String contents_location) {
		this.contents_location = contents_location;
	}

	public int getContents_view_cnt() {
		return contents_view_cnt;
	}
	public void setContents_view_cnt(int contents_view_cnt) {
		this.contents_view_cnt = contents_view_cnt;
	}
	public int getContents_review_cnt() {
		return contents_review_cnt;
	}
	public void setContents_review_cnt(int contents_review_cnt) {
		this.contents_review_cnt = contents_review_cnt;
	}
	public int getContents_scrap_cnt() {
		return contents_scrap_cnt;
	}
	public void setContents_scrap_cnt(int contents_scrap_cnt) {
		this.contents_scrap_cnt = contents_scrap_cnt;
	}
	public String getContents_country() {
		return contents_country;
	}
	public void setContents_country(String contents_country) {
		this.contents_country = contents_country;
	}
	public String getContents_city() {
		return contents_city;
	}
	public void setContents_city(String contents_city) {
		this.contents_city = contents_city;
	}

	public void setContents_thumbnail(String contents_thumbnail) {
		this.contents_thumbnail = contents_thumbnail;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	@Override
	public String toString() {
		return "EsContentsVO [category_id=" + category_id + ", contents_id=" + contents_id + ", contents_title="
				+ contents_title + ", category_value_kor=" + category_value_kor + ", contents_keyword="
				+ contents_keyword + ", contents_location=" + contents_location + ", contents_rating=" + contents_rating
				+ ", contents_view_cnt=" + contents_view_cnt + ", contents_review_cnt=" + contents_review_cnt
				+ ", contents_scrap_cnt=" + contents_scrap_cnt + ", contents_country=" + contents_country
				+ ", contents_city=" + contents_city + ", contents_thumbnail=" + contents_thumbnail + ", created="
				+ created + ", updated=" + updated + "]";
	}
}		