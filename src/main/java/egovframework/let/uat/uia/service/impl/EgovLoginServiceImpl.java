package egovframework.let.uat.uia.service.impl;
import egovframework.com.cmm.LoginVO;
import egovframework.let.cop.ems.service.EgovSndngMailRegistService;
import egovframework.let.cop.ems.service.SndngMailVO;
import egovframework.let.uat.uia.service.EgovLoginService;
import egovframework.let.utl.fcc.service.EgovNumberUtil;
import egovframework.let.utl.fcc.service.EgovStringUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
/**
 * 일반 로그인을 처리하는 비즈니스 구현 클래스
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
@Service("loginService")
public class EgovLoginServiceImpl extends EgovAbstractServiceImpl implements
        EgovLoginService {

    @Resource(name="loginDAO")
    private LoginDAO loginDAO;

    /** EgovSndngMailRegistService */
  	@Resource(name = "sndngMailRegistService")
      private EgovSndngMailRegistService sndngMailRegistService;
    
    /**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    @Override
	public LoginVO actionLogin(LoginVO vo) throws Exception {

    	// 1. 입력한 비밀번호를 암호화한다.
    	String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getId());
    	vo.setPassword(enpassword);
    	// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	LoginVO loginVO = loginDAO.actionLogin(vo);

    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
    }

    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    @Override
	public LoginVO searchId(LoginVO vo) throws Exception {

    	// 1. 이름, 이메일주소가 DB와 일치하는 사용자 ID를 조회한다.
    	LoginVO loginVO = loginDAO.searchId(vo);

    	// 2. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getId().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
    }

    /**
	 * 비밀번호를 찾는다. (비밀번호를 재발급하여 db에 저장한다.)
	 * @param vo LoginVO
	 * @return boolean
	 * @exception Exception
	 */
    @Override
	public boolean searchPassword(LoginVO vo) throws Exception {

    	boolean result = true;

    	// 1. 아이디, 이름, 이메일주소가 DB와 일치하는 사용자 Password를 조회한다.
    	LoginVO loginVO = loginDAO.searchPassword(vo);
    	if (loginVO == null || loginVO.getPassword() == null || loginVO.getPassword().equals("")) {
    		return false;
    	}

    	// 2. 임시 비밀번호를 생성한다.(영+영+숫+영+영+숫=6자리)
    	String newpassword = "";
    	for (int i = 1; i <= 6; i++) {
    		// 영자
    		if (i % 3 != 0) {
    			newpassword += EgovStringUtil.getRandomStr('a', 'z');
    		// 숫자
    		} else {
    			newpassword += EgovNumberUtil.getRandomNum(0, 9);
    		}
    	}

    	// 3. 임시 비밀번호를 암호화하여 DB에 저장한다.
    	LoginVO pwVO = new LoginVO();
    	String enpassword = EgovFileScrty.encryptPassword(newpassword, vo.getId());
    	pwVO.setId(vo.getId());
    	pwVO.setPassword(enpassword);
    	pwVO.setUserSe(vo.getUserSe());
    	loginDAO.updatePassword(pwVO);

    	// 4. 임시 비밀번호를 이메일 발송한다.(메일연동솔루션 활용)
    	SndngMailVO sndngMailVO = new SndngMailVO();
    	sndngMailVO.setDsptchPerson("webmaster");
    	sndngMailVO.setRecptnPerson(vo.getEmail());
    	sndngMailVO.setSj("[MOPAS] 임시 비밀번호를 발송했습니다.");
    	sndngMailVO.setEmailCn("고객님의 임시 비밀번호는 " + newpassword + " 입니다.");
    	sndngMailVO.setAtchFileId("");

    	result = sndngMailRegistService.insertSndngMail(sndngMailVO);
    	
    	return result;
    }
    
    /**
	 * 관리자 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    @Override
	public LoginVO AdminactionLogin(LoginVO vo) throws Exception {

    	// 1. 입력한 비밀번호를 암호화한다.
    	String enpassword = EgovFileScrty.encryptPassword(vo.getPassword(), vo.getId());
    	vo.setPassword(enpassword);
    	// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	LoginVO loginVO = loginDAO.actionLogin(vo);

    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
    }

	@Override
	public void insertNvLink(LoginVO vo) throws Exception {


		loginDAO.insertNvLink(vo);
		 

	}

	@Override
	public LoginVO selectNvLink(LoginVO vo) throws Exception {
		LoginVO loginVO =loginDAO.selectNvLink(vo);
		 

		 return loginVO;
	}

    /**
	 * sns 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    @Override
	public LoginVO sns_Login(LoginVO vo) throws Exception {


    	// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	LoginVO loginVO = loginDAO.sns_Login(vo);
    	
    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}

    	return loginVO;
    }
    
    /**
	 * sns 로그인을 아이디 조회
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    @Override
	public LoginVO selectIdLink(LoginVO vo) throws Exception {
    	
    	LoginVO loginVO =loginDAO.selectIdLink(vo);
    	
    	return  loginVO;
    }
    
    
    /**
	 * sns 로그인을 아이디 삭제
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    @Override
	public LoginVO sns_link_del(LoginVO vo) throws Exception {
    	
    	LoginVO loginVO =loginDAO.sns_link_del(vo);
    	
    	return  loginVO;
    }
    
    
    /**
   	 * 관리자 페이지 권한 체크
   	 * @param vo LoginVO
   	 * @return LoginVO
   	 * @exception Exception
   	 */
       @Override
   		public LoginVO admin_chk(LoginVO vo) throws Exception {


       	// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
       	LoginVO loginVO = loginDAO.admin_chk(vo);
       	
       	// 3. 결과를 리턴한다.
       	if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals("")) {
       		return loginVO;
       	} else {
       		loginVO = new LoginVO();
       	}

       	return loginVO;
       }
       
       
       
       @Override
  		public LoginVO searchPass(LoginVO vo) throws Exception {


 
      	LoginVO loginVO = loginDAO.searchPass(vo);
      	
      	// 3. 결과를 리턴한다.
      	if (loginVO != null && !loginVO.getId().equals("")) {
      		return loginVO;
      	} else {
      		loginVO = new LoginVO();
      	}

      	return loginVO;
      }
    
    
    
}