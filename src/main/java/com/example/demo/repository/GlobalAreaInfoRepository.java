package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.GlobalAreaInfo;

@Repository
public interface GlobalAreaInfoRepository extends JpaRepository<GlobalAreaInfo, String> {
	
}