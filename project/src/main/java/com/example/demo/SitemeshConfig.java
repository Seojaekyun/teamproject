package com.example.demo;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SitemeshConfig extends ConfigurableSiteMeshFilter{

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		// 제외할 폴더와 문서
		builder.addExcludedPath("/login/loginAd");
		builder.addExcludedPath("/flights/seats");
		builder.addExcludedPath("/flights/seatsReturn");
		builder.addDecoratorPath("*", "/default.jsp");
		builder.addDecoratorPath("/admin/*", "/addefault.jsp");
		
		super.applyCustomConfiguration(builder);
		
	}
}
