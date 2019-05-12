package com.example.demo.entity;
// Generated 2019-5-12 16:40:13 by Hibernate Tools 5.2.5.Final


import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * FurnitureHotSaleTradeData generated by hbm2java
 */
@Entity
@Table(name="furniture_hot_sale_trade_data"
)
public class FurnitureHotSaleTradeData  implements java.io.Serializable {


     private String saleTradeId;
     private String typeId;
     private String typeNm;
     private String productId;
     private String productNm;
     private String hotSalePlace;
     private String productPlace;
     private String tradeDate;
     private BigDecimal tradeVolume;
     private BigDecimal tradeAmazon;
     private BigDecimal tradeAli;
     private BigDecimal tradeWish;
     private BigDecimal tradeEbay;
     private BigDecimal tradeOthers;

    public FurnitureHotSaleTradeData() {
    }

	
    public FurnitureHotSaleTradeData(String saleTradeId, String typeId, String typeNm) {
        this.saleTradeId = saleTradeId;
        this.typeId = typeId;
        this.typeNm = typeNm;
    }
    public FurnitureHotSaleTradeData(String saleTradeId, String typeId, String typeNm, String productId, String productNm, String hotSalePlace, String productPlace, String tradeDate, BigDecimal tradeVolume, BigDecimal tradeAmazon, BigDecimal tradeAli, BigDecimal tradeWish, BigDecimal tradeEbay, BigDecimal tradeOthers) {
       this.saleTradeId = saleTradeId;
       this.typeId = typeId;
       this.typeNm = typeNm;
       this.productId = productId;
       this.productNm = productNm;
       this.hotSalePlace = hotSalePlace;
       this.productPlace = productPlace;
       this.tradeDate = tradeDate;
       this.tradeVolume = tradeVolume;
       this.tradeAmazon = tradeAmazon;
       this.tradeAli = tradeAli;
       this.tradeWish = tradeWish;
       this.tradeEbay = tradeEbay;
       this.tradeOthers = tradeOthers;
    }
   
    @Id
  	@GeneratedValue(generator = "uid")
  	@GenericGenerator(name = "uid", strategy = "uuid")
    @Column(name="sale_trade_id", unique=true, nullable=false, length=64)
    public String getSaleTradeId() {
        return this.saleTradeId;
    }
    
    public void setSaleTradeId(String saleTradeId) {
        this.saleTradeId = saleTradeId;
    }

    
    @Column(name="type_id", nullable=false, length=32)
    public String getTypeId() {
        return this.typeId;
    }
    
    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    
    @Column(name="type_nm", nullable=false, length=32)
    public String getTypeNm() {
        return this.typeNm;
    }
    
    public void setTypeNm(String typeNm) {
        this.typeNm = typeNm;
    }

    
    @Column(name="product_id", length=32)
    public String getProductId() {
        return this.productId;
    }
    
    public void setProductId(String productId) {
        this.productId = productId;
    }

    
    @Column(name="product_nm", length=32)
    public String getProductNm() {
        return this.productNm;
    }
    
    public void setProductNm(String productNm) {
        this.productNm = productNm;
    }

    
    @Column(name="hot_sale_place", length=24)
    public String getHotSalePlace() {
        return this.hotSalePlace;
    }
    
    public void setHotSalePlace(String hotSalePlace) {
        this.hotSalePlace = hotSalePlace;
    }

    
    @Column(name="product_place", length=24)
    public String getProductPlace() {
        return this.productPlace;
    }
    
    public void setProductPlace(String productPlace) {
        this.productPlace = productPlace;
    }

    
    @Column(name="trade_date", length=7)
    public String getTradeDate() {
        return this.tradeDate;
    }
    
    public void setTradeDate(String tradeDate) {
        this.tradeDate = tradeDate;
    }

    
    @Column(name="trade_volume", precision=12)
    public BigDecimal getTradeVolume() {
        return this.tradeVolume;
    }
    
    public void setTradeVolume(BigDecimal tradeVolume) {
        this.tradeVolume = tradeVolume;
    }

    
    @Column(name="trade_amazon", precision=12)
    public BigDecimal getTradeAmazon() {
        return this.tradeAmazon;
    }
    
    public void setTradeAmazon(BigDecimal tradeAmazon) {
        this.tradeAmazon = tradeAmazon;
    }

    
    @Column(name="trade_ali", precision=12)
    public BigDecimal getTradeAli() {
        return this.tradeAli;
    }
    
    public void setTradeAli(BigDecimal tradeAli) {
        this.tradeAli = tradeAli;
    }

    
    @Column(name="trade_wish", precision=12)
    public BigDecimal getTradeWish() {
        return this.tradeWish;
    }
    
    public void setTradeWish(BigDecimal tradeWish) {
        this.tradeWish = tradeWish;
    }

    
    @Column(name="trade_ebay", precision=12)
    public BigDecimal getTradeEbay() {
        return this.tradeEbay;
    }
    
    public void setTradeEbay(BigDecimal tradeEbay) {
        this.tradeEbay = tradeEbay;
    }

    
    @Column(name="trade_others", precision=12)
    public BigDecimal getTradeOthers() {
        return this.tradeOthers;
    }
    
    public void setTradeOthers(BigDecimal tradeOthers) {
        this.tradeOthers = tradeOthers;
    }




}


