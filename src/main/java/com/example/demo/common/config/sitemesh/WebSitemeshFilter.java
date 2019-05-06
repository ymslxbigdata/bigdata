package com.example.demo.common.config.sitemesh;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class WebSitemeshFilter extends ConfigurableSiteMeshFilter {

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder.addDecoratorPath("/*","/WEB-INF/share/decorator/base.jsp");
		builder.addDecoratorPath("/dashboard/*","/WEB-INF/share/decorator/dashboardDecorator.jsp");
		builder.addDecoratorPath("/login", null);
	}
}
