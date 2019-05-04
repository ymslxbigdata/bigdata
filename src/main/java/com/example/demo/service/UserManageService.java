package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.UserAuthUserInfo;
import com.example.demo.repository.UserManageRepository;

@Service
public class UserManageService {

	@Autowired 
	private UserManageRepository userInfoRepo;
//	@Autowired
//	private UserManageRepository userInfoRepo;
//	private UserRepository userRepository;
//	@Inject 
//	private UserAuthorityRepository userAuthRepo;
//	@Inject 
//	private MenuManageRepository menuMgtRepo;

//	public UserAuthUserInfo findUserById(String userId) {
//		
//		return userInfoRepo.findOne(userId);
//	}
//	
//	public List<UserAuthUserInfo> getUser(String siteId) {
//		
////		return userInfoRepo.findBySiteId(StringUtils.asString(siteId, ""));
//		return userInfoRepo.findBySiteId(StringUtils.asString(siteId, ""));
//	}
//	
//	public List<UserAuthUserInfo> getValidUser(String siteId) {
//		
//		return userInfoRepo.findValidBySiteId(StringUtils.asString(siteId, ""), DateUtils.getCurrentDate());
//	}
	
//	public UserAuthUserAuthority findUserAuthById(String userId, String siteId) {
//		
//		return userAuthRepo.findByUserIdAndSiteId(userId, StringUtils.asString(siteId, ""));
//	}
	
//	public List<String> findAuthMenuIdByUser(String siteId, String userId) {
//		
//		return menuMgtRepo.findAuthMenuIdByUser(StringUtils.asString(siteId, ""), userId);
//	}
	
//	public int existCodeAndSite(String code, String siteId) {
//		
//		return userInfoRepo.existCodeAndSite(code, StringUtils.asString(siteId, ""));
//	}
	
//	public void newOrModifyUser(UserAuthUserInfo userInfo, UserAuthUserAuthority userAuth) {
//		
//		userInfoRepo.save(userInfo);
//		userAuth.setUserId(userInfo.getUserId());
//		userAuthRepo.save(userAuth);
//	}
	
//	public void newOrModifyUser(UserAuthUserInfo userInfo) {
//		
//		userInfoRepo.save(userInfo);
//	}
//	
//	public int existCodeAndPwdAndSite(String userCode, String password, String siteId) {
//		
//		return userInfoRepo.existCodeAndPwd(userCode, MD5Util.convertMD5(password), StringUtils.asString(siteId, ""));
//	}
//	
//	public List<UserAuthUserInfo> findByCodeAndPwdAndSite(String userCode, String password, String siteId) {
//		
//		return userInfoRepo.findByCodeAndPwd(userCode, MD5Util.convertMD5(password), StringUtils.asString(siteId, ""));
//	}
//	
//	public List<UserAuthUserInfo> findUserAuthByCode(String userCode, String siteId) {
//		
//		return userInfoRepo.findByCodeAndSiteId(userCode, "");
//	}
//	
//	public UserAuthUserInfo findOneByCode(String userCode, String siteId) {
//		
//		return userInfoRepo.findOneByCodeAndSiteId(userCode, StringUtils.asString(siteId, ""));
//	}
//	
	public List<UserAuthUserInfo> findUserAuthByCode(String userCode) {
		
		return userInfoRepo.findByUserCode(userCode);
	}
}
