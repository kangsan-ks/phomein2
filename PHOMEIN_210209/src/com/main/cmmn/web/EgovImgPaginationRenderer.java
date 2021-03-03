/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.main.cmmn.web;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

/** .
 * @Class Name : ImagePaginationRenderer.java
 * @Description : ImagePaginationRenderer Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class EgovImgPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {

	private ServletContext servletContext;

	public EgovImgPaginationRenderer() {
		// no-op
	}

	/** PaginationRenderer.
	*
	* @see 개발프레임웍크 실행환경 개발팀
	*/
	public void initVariables() {

	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

	private String getPageFnc(int pageNum, String jsFunction) {
		return "javascript:"+jsFunction + "('" + pageNum + "')";
	}

	@Override
	public String renderPagination(PaginationInfo paginationInfo, String jsFunction) {

		StringBuffer sb = new StringBuffer();

		int firstPageNo = paginationInfo.getFirstPageNo();
		int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
		int totalPageCount = paginationInfo.getTotalPageCount();
		int pageSize = paginationInfo.getPageSize();
		int lastPageNoOnPageList = paginationInfo.getLastPageNoOnPageList();
		int currentPageNo = paginationInfo.getCurrentPageNo();
		int lastPageNo = paginationInfo.getLastPageNo();
		int totalRecordCount = paginationInfo.getTotalRecordCount();
		
		//System.out.println("======================FIRSTPAGENOONPAGELIST :" + firstPageNoOnPageList);
		//System.out.println("======================PAGE SIZE :" + pageSize);
		//System.out.println("======================LASTPAGENO :" + lastPageNo);
		//System.out.println("======================TOTALRECORDCOUNT :" + totalRecordCount);
		
		/*
		<a href=''><img src='/asset/images/util/paging_first.png' alt='첫번째 목록으로 이동'></a>
		<a href=''><img src='/asset/images/util/paging_prev.png' alt='이전 목록으로 이동'></a>
		<p>
			<a href=''>1</a>
			<a href='' class='on'>2</a>
			<a href=''>3</a>
			<a href=''>4</a>
			<a href=''>5</a>
			<a href=''>6</a>
			<a href=''>7</a>
			<a href=''>8</a>
			<a href=''>9</a>
			<a href=''>10</a>
		</p>
		<a href=''><img src='/asset/images/util/paging_next.png' alt='다음 목록으로 이동'></a>
		<a href=''><img src='/asset/images/util/paging_last.png' alt='마지막 목록으로 이동'></a> 
	 	*/
		sb.append("");
		//if ( totalRecordCount > 0 ) {
			if(firstPageNo > currentPageNo-10){
				sb.append("<a href=\"" + getPageFnc(firstPageNo, jsFunction) + "\" ><img src='/asset/images/util/paging_first.png' alt='첫번째 목록으로 이동'></a><p>");
			}else{
				sb.append("<a href=\"" + getPageFnc(currentPageNo-10, jsFunction) + "\" ><img src='/asset/images/util/paging_prev.png' alt='이전 목록으로 이동'></a><p>");
			}
			
			for (int i = firstPageNoOnPageList; i <= lastPageNoOnPageList; i++) {
				if (i == currentPageNo) {
					sb.append("<a href=\"\" class='on'>" + i + "</a>");
				} else {
					sb.append("<a href=\"" + getPageFnc(i, jsFunction) + "\" >" + i + "</a>");
				}
			}
			if(lastPageNo < currentPageNo+10){
				sb.append("</p><a href=\"" + getPageFnc(lastPageNo, jsFunction) + "\" ><img src='/asset/images/util/paging_next.png' alt='다음 목록으로 이동'></a>");
			}else{
				sb.append("</p><a href=\"" + getPageFnc(currentPageNo+10, jsFunction) + "\" ><img src='/asset/images/util/paging_last.png' alt='마지막 목록으로 이동'></a>");
			}
		//}

		return sb.toString();
	}
}
