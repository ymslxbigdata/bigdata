package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.GlobalEshopUsersData;

@Repository
public interface GlobalEshopUsersDataRepository extends JpaRepository<GlobalEshopUsersData, String> {
	List<GlobalEshopUsersData> findByEshopNm(String eshopNm);
}