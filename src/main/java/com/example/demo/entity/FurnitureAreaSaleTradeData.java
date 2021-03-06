package com.example.demo.entity;
// Generated 2019-5-12 16:40:13 by Hibernate Tools 5.2.5.Final


import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.afterturn.easypoi.excel.annotation.Excel;

/**
 * FurnitureAreaSaleTradeData generated by hbm2java
 */
@Entity
@Table(name="furniture_area_sale_trade_data"
)
public class FurnitureAreaSaleTradeData  implements java.io.Serializable {


	 @Excel(name = "年月(请勿修改)", orderNum = "0")
	 private String tradeDate;
	 @Excel(name = "交易额（亚洲）", orderNum = "1")
	 private BigDecimal tradeVolumeAsia;
	 @Excel(name = "交易额（欧洲）", orderNum = "2")
	 private BigDecimal tradeVolumeEurope;
	 @Excel(name = "交易额（非洲）", orderNum = "3")
	 private BigDecimal tradeVolumeAfrica;
	 @Excel(name = "交易额（大洋洲）", orderNum = "4")
	 private BigDecimal tradeVolumeOceania;
	 @Excel(name = "交易额（北美洲）", orderNum = "5")
	 private BigDecimal tradeVolumeNAmerica;
	 @Excel(name = "交易额（南美洲）", orderNum = "6")
	 private BigDecimal tradeVolumeSAmerica;
	 @Excel(name = "交易额（中国）", orderNum = "7")
	 private BigDecimal tradeVolumeSChina;

    public FurnitureAreaSaleTradeData() {
    }

	
    public FurnitureAreaSaleTradeData(String tradeDate) {
        this.tradeDate = tradeDate;
    }
    public FurnitureAreaSaleTradeData(String tradeDate, BigDecimal tradeVolumeAsia, BigDecimal tradeVolumeEurope, BigDecimal tradeVolumeAfrica, BigDecimal tradeVolumeOceania, BigDecimal tradeVolumeNAmerica, BigDecimal tradeVolumeSAmerica, BigDecimal tradeVolumeSChina) {
       this.tradeDate = tradeDate;
       this.tradeVolumeAsia = tradeVolumeAsia;
       this.tradeVolumeEurope = tradeVolumeEurope;
       this.tradeVolumeAfrica = tradeVolumeAfrica;
       this.tradeVolumeOceania = tradeVolumeOceania;
       this.tradeVolumeNAmerica = tradeVolumeNAmerica;
       this.tradeVolumeSAmerica = tradeVolumeSAmerica;
       this.tradeVolumeSChina = tradeVolumeSChina;
    }
   
     @Id 

    
    @Column(name="trade_date", unique=true, nullable=false, length=7)
    public String getTradeDate() {
        return this.tradeDate;
    }
    
    public void setTradeDate(String tradeDate) {
        this.tradeDate = tradeDate;
    }

    
    @Column(name="trade_volume_asia", precision=12)
    public BigDecimal getTradeVolumeAsia() {
        return this.tradeVolumeAsia;
    }
    
    public void setTradeVolumeAsia(BigDecimal tradeVolumeAsia) {
        this.tradeVolumeAsia = tradeVolumeAsia;
    }

    
    @Column(name="trade_volume_europe", precision=12)
    public BigDecimal getTradeVolumeEurope() {
        return this.tradeVolumeEurope;
    }
    
    public void setTradeVolumeEurope(BigDecimal tradeVolumeEurope) {
        this.tradeVolumeEurope = tradeVolumeEurope;
    }

    
    @Column(name="trade_volume_africa", precision=12)
    public BigDecimal getTradeVolumeAfrica() {
        return this.tradeVolumeAfrica;
    }
    
    public void setTradeVolumeAfrica(BigDecimal tradeVolumeAfrica) {
        this.tradeVolumeAfrica = tradeVolumeAfrica;
    }

    
    @Column(name="trade_volume_oceania", precision=12)
    public BigDecimal getTradeVolumeOceania() {
        return this.tradeVolumeOceania;
    }
    
    public void setTradeVolumeOceania(BigDecimal tradeVolumeOceania) {
        this.tradeVolumeOceania = tradeVolumeOceania;
    }

    
    @Column(name="trade_volume_n_america", precision=12)
    public BigDecimal getTradeVolumeNAmerica() {
        return this.tradeVolumeNAmerica;
    }
    
    public void setTradeVolumeNAmerica(BigDecimal tradeVolumeNAmerica) {
        this.tradeVolumeNAmerica = tradeVolumeNAmerica;
    }

    
    @Column(name="trade_volume_s_america", precision=12)
    public BigDecimal getTradeVolumeSAmerica() {
        return this.tradeVolumeSAmerica;
    }
    
    public void setTradeVolumeSAmerica(BigDecimal tradeVolumeSAmerica) {
        this.tradeVolumeSAmerica = tradeVolumeSAmerica;
    }

    
    @Column(name="trade_volume_s_china", precision=12)
    public BigDecimal getTradeVolumeSChina() {
        return this.tradeVolumeSChina;
    }
    
    public void setTradeVolumeSChina(BigDecimal tradeVolumeSChina) {
        this.tradeVolumeSChina = tradeVolumeSChina;
    }




}


