package egovframework.com.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스
 *
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public ImagePaginationRenderer() {
		// no-op
	}

	public void initVariables(){
		firstPageLabel    = "<li class=\"firstp\" ><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"></a></li>";
        previousPageLabel = "<li class=\"prevp\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"></a></li>";
        currentPageLabel  = "<li class=\"page-num active\"><a>{0}</a></li>";
        otherPageLabel    = "<li class=\"page-num\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a></li>";
        nextPageLabel     = "<li class=\"nextp\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"></a></li>";
        lastPageLabel     = "<li class=\"endp\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"></a></li>";
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
