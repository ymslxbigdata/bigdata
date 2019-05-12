package com.example.demo.entity;
// Generated 2019-5-12 16:40:13 by Hibernate Tools 5.2.5.Final


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * FurnitureTypesInfo generated by hbm2java
 */
@Entity
@Table(name="furniture_types_info"
)
public class FurnitureTypesInfo  implements java.io.Serializable {


     private String typeId;
     private String typeNm;

    public FurnitureTypesInfo() {
    }

    public FurnitureTypesInfo(String typeId, String typeNm) {
       this.typeId = typeId;
       this.typeNm = typeNm;
    }
   
     @Id 

    
    @Column(name="type_id", unique=true, nullable=false, length=32)
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




}


