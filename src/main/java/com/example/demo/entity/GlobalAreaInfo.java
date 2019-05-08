package com.example.demo.entity;
// Generated 2019-5-8 8:54:23 by Hibernate Tools 5.2.5.Final


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * GlobalAreaInfo generated by hbm2java
 */
@Entity
@Table(name="global_area_info"
)
public class GlobalAreaInfo  implements java.io.Serializable {


     private String areaId;
     private String continents;
     private String continentsDetail;

    public GlobalAreaInfo() {
    }

    public GlobalAreaInfo(String areaId, String continents, String continentsDetail) {
       this.areaId = areaId;
       this.continents = continents;
       this.continentsDetail = continentsDetail;
    }
   
     @Id 
 	@GeneratedValue(generator = "uid")
 	@GenericGenerator(name = "uid", strategy = "uuid")
    @Column(name="area_id", unique=true, nullable=false, length=64)
    public String getAreaId() {
        return this.areaId;
    }
    
    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    
    @Column(name="continents", nullable=false, length=12)
    public String getContinents() {
        return this.continents;
    }
    
    public void setContinents(String continents) {
        this.continents = continents;
    }

    
    @Column(name="continents_detail", nullable=false, length=24)
    public String getContinentsDetail() {
        return this.continentsDetail;
    }
    
    public void setContinentsDetail(String continentsDetail) {
        this.continentsDetail = continentsDetail;
    }




}

