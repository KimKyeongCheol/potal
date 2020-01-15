package egovframework.com.cmm.service.impl;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * EgovComAbstractDAO.java 클래스
 *
 * @author 서준식
 * @since 2011. 9. 23.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 23.   서준식        최초 생성
 * </pre>
 */
public abstract class EgovComAbstractDAO extends EgovAbstractDAO {

	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());
	
	@Override
	@Resource(name = "egov.sqlMapClient")
	public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
		super.setSuperSqlMapClient(sqlMapClient);
	}
	
	
	/**
	 * 입력 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 입력 처리 SQL mapping 쿼리 ID
	 * @return 입력 시 selectKey 를 사용하여 key 를 딴 경우 해당 key
	 */
	public Object insert(String queryId) {
		return getSqlMapClientTemplate().insert(queryId);
	}

	/**
	 * 입력 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 입력 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 입력 처리 SQL mapping 입력 데이터를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @return 입력 시 selectKey 를 사용하여 key 를 딴 경우 해당 key
	 */
	public Object insert(String queryId, Object parameterObject) {
		return getSqlMapClientTemplate().insert(queryId, parameterObject);
	}

	/**
	 * 수정 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 수정 처리 SQL mapping 쿼리 ID
	 * @return DBMS가 지원하는 경우 update 적용 결과 count
	 */
	public int update(String queryId) {
		return getSqlMapClientTemplate().update(queryId);
	}

	/**
	 * 수정 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 수정 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 수정 처리 SQL mapping 입력 데이터(key 조건 및 변경 데이터)를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @return DBMS가 지원하는 경우 update 적용 결과 count
	 */
	public int update(String queryId, Object parameterObject) {
		return getSqlMapClientTemplate().update(queryId, parameterObject);
	}

	/**
	 * 수정 처리 SQL mapping 을 실행한다.
	 * 반환값이 없는 대신 예상 결과행 수와 맞지 않으면 예외 오류 발생한다.
	 *
	 * @param queryId - 수정 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 수정 처리 SQL mapping 입력 데이터(key 조건 및 변경 데이터)를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @param requiredRowsAffected - 수정할 row 수
	 */
	public void update(String queryId, Object parameterObject, int requiredRowsAffected) {
		getSqlMapClientTemplate().update(queryId, parameterObject, requiredRowsAffected);
	}

	/**
	 * 삭제 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 삭제 처리 SQL mapping 쿼리 ID
	 * @return DBMS가 지원하는 경우 delete 적용 결과 count
	 */
	public int delete(String queryId) {
		return getSqlMapClientTemplate().delete(queryId);
	}

	/**
	 * 삭제 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 삭제 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 삭제 처리 SQL mapping 입력 데이터(일반적으로 key 조건)를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @return DBMS가 지원하는 경우 delete 적용 결과 count
	 */
	public int delete(String queryId, Object parameterObject) {
		return getSqlMapClientTemplate().delete(queryId, parameterObject);
	}

	/**
	 * 삭제 처리 SQL mapping 을 실행한다.
	 * 반환값이 없는 대신 예상 결과행 수와 맞지 않으면 예외 오류 발생한다.
	 *
	 * @param queryId - 삭제 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 삭제 처리 SQL mapping 입력 데이터(일반적으로 key 조건)를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @param requiredRowsAffected - 삭제할 row 수
	 * @return DBMS가 지원하는 경우 delete 적용 결과 count
	 */
	public void delete(String queryId, Object parameterObject, int requiredRowsAffected) {
		getSqlMapClientTemplate().delete(queryId, parameterObject, requiredRowsAffected);
	}

	//CHECKSTYLE:OFF
	/**
	 * 명명규칙에 맞춰 select()로 변경한다.
	 * @deprecated select() 메소드로 대체
	 * 
	 * @see EgovAbstractDAO.select
	 */
	//CHECKSTYLE:ON
	@Deprecated
	public Object selectByPk(String queryId, Object parameterObject) {
		return getSqlMapClientTemplate().queryForObject(queryId, parameterObject);
	}

	/**
	 * 단건조회 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 단건 조회 처리 SQL mapping 쿼리 ID
	 * @return 결과 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 단일 결과 객체(보통 VO 또는 Map)
	 */
	public Object select(String queryId) {
		return getSqlMapClientTemplate().queryForObject(queryId);
	}

	/**
	 * 단건조회 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 단건 조회 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 단건 조회 처리 SQL mapping 입력 데이터(key)를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @return 결과 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 단일 결과 객체(보통 VO 또는 Map)
	 */
	public Object select(String queryId, Object parameterObject) {
		return getSqlMapClientTemplate().queryForObject(queryId, parameterObject);
	}

	/**
	 * 단건조회 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 단건 조회 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 단건 조회 처리 SQL mapping 입력 데이터(key)를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @param resultObject - 특정 오브젝트로 결과값을 반환할 경우
	 * @return 결과 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 단일 결과 객체(보통 VO 또는 Map)
	 */
	public Object select(String queryId, Object parameterObject, final Object resultObject) {
		return getSqlMapClientTemplate().queryForObject(queryId, parameterObject, resultObject);
	}

	/**
	 * 리스트 조회 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 리스트 조회 처리 SQL mapping 쿼리 ID
	 * @return 결과 List 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 결과 객체(보통 VO 또는 Map)의 List
	 */
	public List<?> list(String queryId) {
		return getSqlMapClientTemplate().queryForList(queryId);
	}

	/**
	 * 리스트 조회 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 리스트 조회 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 리스트 조회 처리 SQL mapping 입력 데이터(조회 조건)를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @return 결과 List 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 결과 객체(보통 VO 또는 Map)의 List
	 */
	public List<?> list(String queryId, Object parameterObject) {
		return getSqlMapClientTemplate().queryForList(queryId, parameterObject);
	}

	/**
	 * 리스트 조회 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 리스트 조회 처리 SQL mapping 쿼리 ID
	 * @param skipResults - 쿼리를 시작하는 행
	 * @param maxResults - 최대 결과를 나타내는 행
	 * @return 결과 List 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 결과 객체(보통 VO 또는 Map)의 List
	 */
	public List<?> list(String queryId, int skipResults, int maxResults) {
		return getSqlMapClientTemplate().queryForList(queryId, skipResults, maxResults);
	}

	/**
	 * 리스트 조회 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 리스트 조회 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 입력 처리 SQL mapping 입력 데이터를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @param skipResults - 쿼리를 시작하는 행
	 * @param maxResults - 최대 결과를 나타내는 행
	 * @return 결과 List 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 결과 객체(보통 VO 또는 Map)의 List
	 */
	public List<?> list(String queryId, final Object parameterObject, int skipResults, int maxResults) {
		return getSqlMapClientTemplate().queryForList(queryId, parameterObject, skipResults, maxResults);
	}

	/**
	 * 부분 범위 리스트 조회 처리 SQL mapping 을 실행한다.
	 * (부분 범위 - pageIndex 와 pageSize 기반으로 현재 부분 범위 조회를 위한 skipResults, maxResults 를 계산하여 ibatis 호출)
	 *
	 * @param queryId - 리스트 조회 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 리스트 조회 처리 SQL mapping 입력 데이터(조회 조건)를  세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @param pageIndex - 현재 페이지 번호
	 * @param pageSize - 한 페이지 조회 수(pageSize)
	 * @return 부분 범위 결과 List 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 부분 범위 결과 객체(보통 VO 또는 Map) List
	 */
	public List<?> listWithPaging(String queryId, Object parameterObject, int pageIndex, int pageSize) {
		int skipResults = pageIndex * pageSize;
		///int maxResults = (pageIndex * pageSize) + pageSize;
		int maxResults = pageSize;

		return getSqlMapClientTemplate().queryForList(queryId, parameterObject, skipResults, maxResults);
	}

	/**
	 * 리스트 조회 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 리스트 조회 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 입력 처리 SQL mapping 입력 데이터를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @param keyProperty - key값이 될 field
	 * @return 결과 List 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 결과 객체(보통 VO 또는 Map)의 Map
	 */
	public Map<?, ?> map(final String queryId, final Object parameterObject, final String keyProperty) {
		return getSqlMapClientTemplate().queryForMap(queryId, parameterObject, keyProperty);
	}

	/**
	 * 리스트 조회 처리 SQL mapping 을 실행한다.
	 *
	 * @param queryId - 리스트 조회 처리 SQL mapping 쿼리 ID
	 * @param parameterObject - 입력 처리 SQL mapping 입력 데이터를 세팅한 파라메터 객체(보통 VO 또는 Map)
	 * @param keyProperty - key값이 될 field
	 * @param valueProperty - map에 저장할 특정 field
	 * @return 결과 List 객체 - SQL mapping 파일에서 지정한 resultClass/resultMap 에 의한 결과 객체(보통 VO 또는 Map)의 Map
	 */
	public Map<?, ?> map(final String queryId, final Object parameterObject, final String keyProperty, final String valueProperty) {
		return getSqlMapClientTemplate().queryForMap(queryId, parameterObject, keyProperty, valueProperty);
	}

}
