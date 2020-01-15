package egovframework.let.uat.uia.service.impl;
import egovframework.com.cmm.LoginVO;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;
/**
 * 일반 로그인을 처리하는 DAO 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Repository("loginDAO")
public class LoginDAO extends EgovAbstractDAO {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLogin(LoginVO vo) throws Exception {
    	return (LoginVO)select("loginDAO.actionLogin", vo);
    }

    

    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchId(LoginVO vo) throws Exception {

    	return (LoginVO)select("loginDAO.searchId", vo);
    }

    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchPassword(LoginVO vo) throws Exception {

    	return (LoginVO)select("loginDAO.searchPassword", vo);
    }

    /**
	 * 변경된 비밀번호를 저장한다.
	 * @param vo LoginVO
	 * @exception Exception
	 */
    public void updatePassword(LoginVO vo) throws Exception {
    	update("loginDAO.updatePassword", vo);
    }
    
    
    /*20191204 sns 연동*/
    /**
	 * sns연동 정보 저장
	 * @param vo LoginVO
	 * @exception Exception
	 */
    public void insertNvLink(LoginVO vo) throws Exception {
    	insert("loginDAO.insertNvLink", vo);
    }
    /**
	 * sns 연동 존재확인.
	 * @param vo LoginVO
     * @return 
	 * @exception Exception
	 */
    public LoginVO selectNvLink(LoginVO vo) throws Exception {
    	
		return (LoginVO)select("loginDAO.selectNvLink", vo);

    }
    
	/**
	 * sns 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO sns_Login(LoginVO vo) throws Exception {
    	return (LoginVO)select("loginDAO.sns_Login", vo);
    }

    
    
    public LoginVO selectIdLink(LoginVO vo) throws Exception{
    	
    	return (LoginVO)select("loginDAO.selectIdLink", vo);
    }
    
	/**
	 * sns 로그인 아이디 삭제
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO sns_link_del(LoginVO vo) throws Exception{
    	
    	//return (LoginVO)delete("loginDAO.sns_link_del", vo);
    	
    	return (LoginVO) select("loginDAO.sns_link_del", vo);
    }
    
    
	/**
	 * 관리자 페이지권한체크
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO admin_chk(LoginVO vo) throws Exception {
    	return (LoginVO)select("loginDAO.admin_chk", vo);
    }
    
    
    public LoginVO searchPass(LoginVO vo) throws Exception {
    	return (LoginVO)select("loginDAO.searchPass", vo);
    }
    
        
    
    
}
