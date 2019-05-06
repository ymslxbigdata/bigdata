package com.example.demo.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "sys_user")
//@EntityListeners(SiteAuditableEntityListener.class)
public class UserAuthUserInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "uid")
	@GenericGenerator(name = "uid", strategy = "uuid")
	@Column(name = "user_id", unique = true)
	private String userId;

	@Column(name = "site_id")
	private String siteId;

	@Column(name = "user_code")
	private String userCode;
	
	@Column(name = "nick_name")
	private String nickName;
	
	@Column(name = "mail")
	private String mail;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "person_id")
	private String personId;

	@Column(name = "effective_date")
	private Date effectiveDate;

	@Column(name = "expired_date")
	private Date expiredDate;

	@Column(name = "password")
	private String password;

//	@Column(name = "extend_list")
//	@Type(type = UserAuthConstants.JSON_FIELD_TYPE)
//	private String extendList;

	@Column(name = "last_updated_by")
	private String lastUpdatedBy;

	@Column(name = "last_updated")
	private LocalDateTime lastUpdated;

	@Column(name = "created_by")
	private String createdBy;

	@Column(name = "date_created")
	private LocalDateTime dateCreated;

	@Version
	@Column(name = "update_count")
	private int updateCounter;

	public UserAuthUserInfo() {
	}

	public UserAuthUserInfo(String userId, String siteId, String userCode, Date effectiveDate, Date expiredDate, String extendList) {
		this.userId = userId;
		this.siteId = siteId;
		this.userCode = userCode;
		this.effectiveDate = effectiveDate;
		this.expiredDate = expiredDate;
//		this.extendList = extendList;
	}
}
