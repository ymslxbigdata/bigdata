package com.example.demo.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.UserAuthUserInfo;

@Repository
public interface UserManageRepository extends JpaRepository<UserAuthUserInfo, String> {
	
	@Query(value="SELECT * "
			+ " FROM sys_user "
			+ " WHERE CASE WHEN ?1 = '' THEN (site_id IS NULL OR site_id ='')"
			+ " ELSE site_id = ?1 END", nativeQuery = true)
	public List<UserAuthUserInfo> findBySiteId(String siteId);
	
	@Query(value="SELECT * "
			+ " FROM sys_user "
			+ " WHERE CASE WHEN ?1 = '' THEN (site_id IS NULL OR site_id ='')"
			+ " ELSE site_id = ?1 END"
			+ " AND effective_date <= ?2"
			+ " AND expired_date >= ?2"
			+ " ORDER BY user_code", nativeQuery = true)
	public List<UserAuthUserInfo> findValidBySiteId(String siteId, Date currentDate);
	
	@Query(value="SELECT count(*) "
			+ " FROM sys_user "
			+ " WHERE user_code = ?1"
			+ " AND CASE WHEN ?2 = '' THEN (site_id IS NULL OR site_id ='')"
			+ " ELSE site_id = ?2 END", nativeQuery = true)
	public int existCodeAndSite(String code, String siteId);
	
	@Query(value="SELECT count(*) "
			+ " FROM sys_user "
			+ " WHERE user_code = ?1"
			+ " AND password  = ?2"
			+ " AND CASE WHEN ?3 = '' THEN (site_id IS NULL OR site_id ='')"
			+ " ELSE site_id = ?3 END", nativeQuery = true)
	public int existCodeAndPwd(String code, String password, String siteId);
	
	@Query(value="SELECT * "
			+ " FROM sys_user "
			+ " WHERE user_code = ?1"
			+ " AND password  = ?2"
			+ " AND CASE WHEN ?3 = '' THEN (site_id IS NULL OR site_id ='')"
			+ " ELSE site_id = ?3 END", nativeQuery = true)
	public List<UserAuthUserInfo> findByCodeAndPwd(String code, String password, String siteId);
	
	@Query(value="SELECT * "
			+ " FROM sys_user "
			+ " WHERE user_code = ?1"
			+ " AND CASE WHEN ?2 = '' THEN (site_id IS NULL OR site_id ='')"
			+ " ELSE site_id = ?2 END", nativeQuery = true)
	public List<UserAuthUserInfo> findByCodeAndSiteId(String code, String siteId);
	
	@Query(value="SELECT * "
			+ " FROM sys_user "
			+ " WHERE user_code = ?1"
			+ " AND CASE WHEN ?2 = '' THEN (site_id IS NULL OR site_id ='')"
			+ " ELSE site_id = ?2 END"
			+ " LIMIT 1", nativeQuery = true)
	public UserAuthUserInfo findOneByCodeAndSiteId(String code, String siteId);

	public List<UserAuthUserInfo> findByUserCode(String code);
}