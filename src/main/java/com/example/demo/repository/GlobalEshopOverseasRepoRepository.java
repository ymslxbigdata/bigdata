package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.GlobalEshopOverseasRepo;

@Repository
public interface GlobalEshopOverseasRepoRepository extends JpaRepository<GlobalEshopOverseasRepo, String> {
	
	List<GlobalEshopOverseasRepo> findByEshopId(String eshopId);
	
}