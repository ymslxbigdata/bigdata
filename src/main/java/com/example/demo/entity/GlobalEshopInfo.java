package com.example.demo.entity;
// Generated 2019-5-8 8:54:23 by Hibernate Tools 5.2.5.Final


import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.afterturn.easypoi.excel.annotation.Excel;

/**
 * GlobalEshopInfo generated by hbm2java
 */
@Entity
@Table(name="global_eshop_info"
)
public class GlobalEshopInfo  implements java.io.Serializable {

	 @Excel(name = "电商ID", orderNum = "0")
     private String eshopId;
	 @Excel(name = "电商名称", orderNum = "1")
	 private String eshopNm;
	 @Excel(name = "所属国家", orderNum = "2")
	 private String countryNm;
	 @Excel(name = "公司地点", orderNum = "3")
	 private String address;
	 @Excel(name = "地理位置(经度)", orderNum = "4")
	 private BigDecimal locationX;
	 @Excel(name = "地理位置(纬度)", orderNum = "5")
	 private BigDecimal locationY;
	 @Excel(name = "成立时间", orderNum = "6")
	 private String establishedDate;
	 @Excel(name = "公司简介", orderNum = "7")
	 private String briefIntroduction;
	 @Excel(name = "公司详情", orderNum = "8")
	 private String detailsIntroduction;
	 @Excel(name = "是否主流电商平台", orderNum = "9")
	 private Boolean isMainEshop;

    public GlobalEshopInfo() {
    }

	
    public GlobalEshopInfo(String eshopId, String eshopNm, String countryNm) {
        this.eshopId = eshopId;
        this.eshopNm = eshopNm;
        this.countryNm = countryNm;
    }
    public GlobalEshopInfo(String eshopId, String eshopNm, String countryNm, String address, BigDecimal locationX, BigDecimal locationY, String establishedDate, String briefIntroduction, String detailsIntroduction, Boolean isMainEshop) {
       this.eshopId = eshopId;
       this.eshopNm = eshopNm;
       this.countryNm = countryNm;
       this.address = address;
       this.locationX = locationX;
       this.locationY = locationY;
       this.establishedDate = establishedDate;
       this.briefIntroduction = briefIntroduction;
       this.detailsIntroduction = detailsIntroduction;
       this.isMainEshop = isMainEshop;
    }
   
     @Id 

    
    @Column(name="eshop_id", unique=true, nullable=false, length=24)
    public String getEshopId() {
        return this.eshopId;
    }
    
    public void setEshopId(String eshopId) {
        this.eshopId = eshopId;
    }

    
    @Column(name="eshop_nm", nullable=false, length=32)
    public String getEshopNm() {
        return this.eshopNm;
    }
    
    public void setEshopNm(String eshopNm) {
        this.eshopNm = eshopNm;
    }

    
    @Column(name="country_nm", nullable=false, length=32)
    public String getCountryNm() {
        return this.countryNm;
    }
    
    public void setCountryNm(String countryNm) {
        this.countryNm = countryNm;
    }

    
    @Column(name="address", length=64)
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    @Column(name="location_x", precision=6, scale=3)
    public BigDecimal getLocationX() {
        return this.locationX;
    }
    
    public void setLocationX(BigDecimal locationX) {
        this.locationX = locationX;
    }

    
    @Column(name="location_y", precision=6, scale=3)
    public BigDecimal getLocationY() {
        return this.locationY;
    }
    
    public void setLocationY(BigDecimal locationY) {
        this.locationY = locationY;
    }

    
    @Column(name="established_date", length=10)
    public String getEstablishedDate() {
        return this.establishedDate;
    }
    
    public void setEstablishedDate(String establishedDate) {
        this.establishedDate = establishedDate;
    }

    
    @Column(name="brief_introduction", length=200)
    public String getBriefIntroduction() {
        return this.briefIntroduction;
    }
    
    public void setBriefIntroduction(String briefIntroduction) {
        this.briefIntroduction = briefIntroduction;
    }

    
    @Column(name="details_introduction", length=200)
    public String getDetailsIntroduction() {
        return this.detailsIntroduction;
    }
    
    public void setDetailsIntroduction(String detailsIntroduction) {
        this.detailsIntroduction = detailsIntroduction;
    }

    
    @Column(name="is_main_eshop")
    public Boolean getIsMainEshop() {
        return this.isMainEshop;
    }
    
    public void setIsMainEshop(Boolean isMainEshop) {
        this.isMainEshop = isMainEshop;
    }
}


